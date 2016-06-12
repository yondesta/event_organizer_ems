package et.registration

import et.event.Event
import et.participant.User

class Registration {

    Date dateCreated
    String token
    boolean expired = false
    User user
    Event event

    static constraints = {
        event nullable: true
    }
}
