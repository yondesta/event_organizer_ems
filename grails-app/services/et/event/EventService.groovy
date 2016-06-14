package et.event

import et.participant.Role
import et.participant.User
import grails.transaction.Transactional

@Transactional
class EventService {

    boolean isRegistrationOpen(User u, Event e) {
        boolean isOpen
        if (!u) {
            isOpen = e.isOpen && new Date() < e.registrationDeadline && !isFull(e)
        } else {
            def userEvent = UserEvent.findByParticipantAndEvent(u, e)
            isOpen = u && !userEvent && new Date() < e.registrationDeadline && !isFull(e)
        }
        isOpen
    }

    boolean isFull(Event e) {
        e.maxParticipants != 0 && e.maxParticipants == UserEvent.countByEvent(e)
    }

    boolean isEventOwner(User u, Event e) {
        u?.getAuthorities()?.contains(Role.findByAuthority("ROLE_EVENT_OWNER")) &&
                e.owner == u
    }
}
