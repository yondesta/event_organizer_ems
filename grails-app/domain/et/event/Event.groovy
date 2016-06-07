package et.event

import et.participant.User

class Event {

    String title
    String description
    String category
    Date startDate
    Date endDate
    User owner
    String phone
    String email

    static hasMany = [partecipants: User]

    static constraints = {
        title blank: false
        description nullable: true
        phone nullable: true
        email nullable: true
        partecipants nullable: true
    }
}
