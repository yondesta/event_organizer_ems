package et.event

import et.participant.User

class UserEvent {

    User participant
    Event event

    static constraints = {
    }

    static UserEvent create(User participant, Event event, boolean flush = false) {
        def instance = new UserEvent(participant: participant, event: event)
        instance.save(flush: flush, insert: true)
        instance
    }

    static boolean remove(User p, Event e, boolean flush = false) {
        if (p == null || e == null)
            return false
        int rowCount = UserEvent.where { participant == p && event == e }.deleteAll()
        if (flush) { UserEvent.withSession { it.flush() } }
        rowCount
    }
}
