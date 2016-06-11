package et.registration

import et.participant.User

class Registration {

    Date dateCreated
    String token
    boolean expired = false
    User user

    static constraints = {
    }
}
