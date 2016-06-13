package et.registration

import et.event.Event
import et.participant.User

class Registration {

    def grailsApplication

    Date dateCreated
    String token
    boolean expired
    User user
    Event event

    static constraints = {
        event nullable: true
    }

    static transients = ['expired']

    boolean getExpired() {
        new Date().time - dateCreated.time > grailsApplication.config.registration.expired.ms
    }
}
