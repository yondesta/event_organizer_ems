package et.participant

import et.event.Event
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class UserController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def home() {
        User userInstance = springSecurityService.currentUser
        def userEvents
        if (SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN, ROLE_FACILITATOR')) {
            userEvents = Event.list([sort: 'startDate', order: 'asc'])
        } else if (SpringSecurityUtils.ifAllGranted('ROLE_EVENT_OWNER')) {
            log.info 'Event owner logged in...'
            userEvents = Event.findAllByOwnerAndStartDateGreaterThan(userInstance, new Date())
        } else if (SpringSecurityUtils.ifAllGranted('ROLE_USER')) {
            log.info 'User logged in...'
            userEvents = Event.executeQuery(
                    """select e from UserEvent ue inner join ue.event e
                where ue.participant = :userInstance and
                e.endDate >= :date order by e.startDate asc""",
                    [userInstance: userInstance, date: new Date()]
            )
        } else {
            redirect uri: '/'
            return
        }
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
}
