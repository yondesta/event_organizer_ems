package et.event

import et.participant.User
import grails.transaction.Transactional

@Transactional
class EventService {

    def isRegistrationOpen(User u, Event e) {
        def userEvent = UserEvent.findByParticipantAndEvent(u, e)
        !userEvent && e.registrationDeadline >= new Date()
    }
}
