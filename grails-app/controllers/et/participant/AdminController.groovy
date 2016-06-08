package et.participant

import et.event.Event

class AdminController {

    def index() {}

    def registerParticipant() {
        render view: 'registerParticipant', model: [userInstance: new User(params),
                                                    availableEvents: Event.list()]
    }

    def saveRegistration(params) {
        println 'saving registration...'
        def eventId = params.remove('eventId') as long
        def event = Event.get(eventId)
        def sendEmail = Boolean.parseBoolean(params.remove('sendEmail'))
        def confirmPassword = params.remove('confirmPassword')
        if (confirmPassword != params.password) {
            println 'Passwords are different!'
        }
        def partecipant = new User(params)
        if (!partecipant.save(flush: true, failOnError: true)) {
            render view: 'registerParticipant', model: [userInstance: partecipant, sendEmail: sendEmail, eventId: event]
            return
        }
        UserRole.create partecipant, Role.findByAuthority('ROLE_USER'), true
        event.addToPartecipants(partecipant)
        event.save(flush: true, failOnError: true)
        if (sendEmail)
            println 'Sending email...'
        redirect controller: 'event', action: 'index'
    }
}