package et.participant

import et.event.Event
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
            render view: 'registerParticipant', model: model
            log.warn 'Passwords not matching during participant registration'
            return
        }
        if (!participant.save(flush: true, failOnError: true)) {
            render view: 'registerParticipant', model: model
            log.warn 'Error saving new participant'
            return
        }
        UserRole.create participant, Role.findByAuthority('ROLE_USER'), true
        event.addToPartecipants(participant)
        event.save(flush: true, failOnError: true)
        if (sendEmail)
            log.info "Sending registration email to $participant.email"
        redirect controller: 'event', action: 'index'
    }
}