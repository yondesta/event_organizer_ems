package et.event

import et.participant.Role
import et.participant.User
import grails.transaction.Transactional

@Transactional
class EventService {

    def isRegistrationOpen(User u, Event e) {
        boolean isOpen
        if (!u) {
            isOpen = e.isOpen && new Date() < e.registrationDeadline
        } else {
            def userEvent = UserEvent.findByParticipantAndEvent(u, e)
            isOpen = u && !userEvent && new Date() < e.registrationDeadline
        }
        isOpen
    }

    def isEventOwner(User u, Event e) {
        u?.getAuthorities()?.contains(Role.findByAuthority("ROLE_EVENT_OWNER")) &&
                e.owner == u
    }
}
