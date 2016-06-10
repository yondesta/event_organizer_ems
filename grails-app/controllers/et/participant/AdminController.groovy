package et.participant

import et.event.Event
import et.event.UserEvent
import grails.transaction.Transactional

class AdminController {

    def index() {}

    def registerParticipant() {
        render view: 'registerParticipant', model: [userInstance: new User(params),
                                                    availableEvents: Event.list()]
    }

    @Transactional
    def saveRegistration(params) {
        def event = Event.get(params.eventId as long)
        def sendEmail = Boolean.parseBoolean(params.sendEmail)
        def participant = new User(params.user)
        def model = [
                userInstance: participant,
                sendEmail: sendEmail,
                eventInstance: event,
                availableEvents: Event.list()
        ]
        if (params.confirmPassword != params.user.password) {
            flash.message = 'Passwords not matching!'
            flash.messageType = 'alert-danger'
            log.warn 'Passwords not matching during participant registration'
            render view: 'registerParticipant', model: model
            return
        }
        if (!participant.validate()) {
            flash.message = 'Passwords not matching!'
            flash.messageType = 'alert-danger'
            log.warn 'Error saving new participant'
            render view: 'registerParticipant', model: model
            return
        }
        participant.save(flush: true, failOnError: true)
        UserRole.create participant, Role.findByAuthority('ROLE_USER'), true
        event.save(flush: true, failOnError: true)
        participant.save(flush: true, failOnError: true)
        UserEvent.create participant, event, true
        if (sendEmail)
            log.info "Sending registration email to $participant.email"
        flash.message = 'Registration successful!'
        redirect controller: 'event', action: 'index'
    }
}