package et.event

import et.participant.User
import et.participant.UserRole
import grails.converters.JSON
import groovy.time.TimeCategory
import groovy.time.TimeDuration

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EventController {

    def springSecurityService
    def eventService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 12, 100)
        params.sort = 'startDate'
        params.order = 'asc'
        def events = Event.findAllByEndDateGreaterThanAndIsOpen(new Date(), true, params)
        [events: events, eventInstanceCount: Event.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 12, 100)
        params.sort = 'startDate'
        params.order = 'asc'
        def events = Event.findAllByEndDateGreaterThan(new Date(), params)
        render view: 'index', model: [events: events, eventInstanceCount: Event.count()]
    }

    def show(Event eventInstance) {
        if (!eventService.isVisible(eventInstance)) {
            flash.message = "Event not found"
            redirect uri: '/home'
            return
        }
        boolean isRegistrationOpen = eventService.isRegistrationOpen(eventInstance)
        boolean canSendNotification = eventService.canSendNotification(eventInstance)
        boolean canAddLiveUpdates = eventService.canAddLiveUpdates(eventInstance)
        [
                eventInstance: eventInstance,
                isRegistrationOpen: isRegistrationOpen,
                canSendNotification: canSendNotification,
                canAddLiveUpdates: canAddLiveUpdates
        ]
    }

    def create() {
        def owners = User.executeQuery("select u from UserRole ur inner join ur.user u join ur.role r where r.authority = 'ROLE_EVENT_OWNER'")
        [eventInstance: new Event(params), owners: owners]
    }

    @Transactional
    def save(Event eventInstance) {
        if (eventInstance == null) {
            notFound()
            return
        }

        if (eventInstance.hasErrors()) {
            def owners = User.executeQuery("select u from UserRole ur inner join ur.user u join ur.role r where r.authority = 'ROLE_EVENT_OWNER'")
            respond eventInstance.errors, view:'create', model: [owners: owners]
            return
        }

        eventInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'event.label', default: 'Event'), eventInstance.id])
                redirect eventInstance
            }
            '*' { respond eventInstance, [status: CREATED] }
        }
    }

    def edit(Event eventInstance) {
        def owners = User.executeQuery("select u from UserRole ur inner join ur.user u join ur.role r where r.authority = 'ROLE_EVENT_OWNER'")
        [eventInstance: eventInstance, owners: owners]
    }

    @Transactional
    def update(Event eventInstance) {
        if (eventInstance == null) {
            notFound()
            return
        }

        if (eventInstance.hasErrors()) {
            respond eventInstance.errors, view:'edit'
            return
        }

        eventInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Event.label', default: 'Event'), eventInstance.id])
                redirect eventInstance
            }
            '*'{ respond eventInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Event eventInstance) {

        if (eventInstance == null) {
            notFound()
            return
        }

        eventInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Event.label', default: 'Event'), eventInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'event.label', default: 'Event'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def registerUser(Event eventInstance) {
        def user = springSecurityService.getCurrentUser()
        if (!user) {
            // User sign up process is triggered
            log.info "Unregistered user tried to join event"
            redirect controller: 'login', action: 'auth'
            return
        }
        if (UserEvent.findByParticipant(user)?.event == eventInstance) {
            flash.message = "You are already registered to the event."
            flash.messageType = 'alert-warning'
        } else {
            eventInstance.save(flush: true, failOnError: true)
            UserEvent.create user, eventInstance, true
            flash.message = "You successfully registered to the event!"
        }
        redirect action: 'show', id: eventInstance.id
    }

    def getTimeToLive() {
        def outdata = [time: '']
        def event = Event.get(params.eventId as long)
        if (event) {
            TimeDuration elapsedTime = TimeCategory.minus(event.startDate, new Date())
            outdata.time = """${elapsedTime.getDays()} d ${elapsedTime.getHours()} h ${elapsedTime.getMinutes()} m ${elapsedTime.getSeconds()} s"""
        }
        render outdata as JSON
    }
}
