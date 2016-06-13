package et.participant

import et.event.Event
import et.registration.Registration
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class UserController {

    def springSecurityService
    def registrationService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def home() {
        User userInstance = springSecurityService.currentUser
        def userEvents
        if (SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN, ROLE_FACILITATOR')) {
            userEvents = Event.findAllByEndDateGreaterThan(new Date(), [sort: 'startDate', order: 'asc'])
        } else if (SpringSecurityUtils.ifAllGranted('ROLE_EVENT_OWNER')) {
            userEvents = Event.findAllByOwnerAndStartDateGreaterThan(userInstance, new Date())
        } else if (SpringSecurityUtils.ifAllGranted('ROLE_USER')) {
            userEvents = Event.executeQuery(
                    """select e from UserEvent ue inner join ue.event e
                where ue.participant = :userInstance and
                e.endDate >= :date order by e.startDate asc""",
                    [userInstance: userInstance, date: new Date()]
            )
        } else {
            redirect controller: 'event', action: 'index'
            return
        }
        log.info "User ${userInstance} with roles ${userInstance.getAuthorities()?.authority?.join(', ')} logged in..."
        [userInstance : userInstance, userEvents: userEvents]
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    @Transactional
    def resetPassword() {
        def username = params.username
        def user = User.findByUsername(username)
        def newPassword = registrationService.generatePassword()
        user.password = newPassword
        user.save(flush: true, failOnError: true)
        String token = registrationService.generateToken()
        new Registration(
                token: token,
                user: user
        ).save(flush: true, failOnError: true)
        log.info "Sending email to $user.email with password $newPassword and url: ${grailsApplication.config.grails.serverURL}/registration/confirmRegistration?token=${token}"
        flash.message = "An email will be sent to $user.email, follow the link to reset password."
        redirect controller: 'event', action: 'index'
    }
}
