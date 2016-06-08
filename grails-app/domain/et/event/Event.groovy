package et.event

import et.participant.User
import et.resources.Catering
import et.resources.Venue

class Event {

    String title
    String description
    String category
    Date startDate
    Date endDate
    User owner
    String phone
    String email
    Venue venue
    Catering catering

    static hasMany = [partecipants: User]

    static constraints = {
        title blank: false
        description nullable: true
        phone nullable: true
        email nullable: true
        partecipants nullable: true
        catering nullable: true
    }
}
