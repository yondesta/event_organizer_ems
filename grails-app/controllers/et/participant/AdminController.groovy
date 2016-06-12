package et.participant

import et.event.Event
import et.event.UserEvent
import et.registration.Registration
import grails.transaction.Transactional

class AdminController {

    def registrationService
    def grailsApplication

    def index() {}

    def registerParticipant() {
        render view: 'registerParticipant', model: [
                userInstance: new User(params),
                availableEvents: Event.list()
        ]
    }

    @Transactional
    def saveRegistration() {
        def event = Event.get(params.eventId as long)
        def sendEmail = Boolean.parseBoolean(params.sendEmail)
        def participant = new User(params.user)
        participant.password = registrationService.generatePassword()
        def model = [
                userInstance: participant,
                sendEmail: sendEmail,
                eventInstance: event,
                availableEvents: Event.list()
        ]
        if (!participant.validate()) {
            log.warn 'Error saving new participant'
            render view: 'registerParticipant', model: model
            return
        }
        participant.save(flush: true, failOnError: true)
        log.info "User ${participant.username} created."
        UserRole.create participant, Role.findByAuthority('ROLE_USER'), true
        event.save(flush: true, failOnError: true)
        participant.save(flush: true, failOnError: true)
        UserEvent.create participant, event, true
        String token = registrationService.generateToken()
        new Registration(
                token: token,
                user: participant
        ).save(flush: true, failOnError: true)
        log.info "Sending email to $participant.email with url: ${grailsApplication.config.grails.serverURL}/registration/confirmRegistration?token=${token}"
        flash.message = 'Registration successful! Waiting for user\'s confirmation'
        redirect controller: 'event', action: 'index'
    }
}