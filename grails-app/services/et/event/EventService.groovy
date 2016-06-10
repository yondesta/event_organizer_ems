package et.event

import et.participant.User
import grails.transaction.Transactional

@Transactional
class EventService {

    def isRegistrationOpen(User u, Event e) {
        def userEvent = UserEvent.findByParticipant(u)
        userEvent && userEvent.event != e && e.registrationDeadline >= new Date()
    }
}
