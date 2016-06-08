package et.event

import et.participant.User
import et.resources.Catering
import et.resources.Venue

class Event {

    String title
    String description
    Category category
    Date startDate
    Date endDate
    User owner
    String phone
    String email
    Venue venue
    Catering catering
    Integer maxParticipants = 0

    static hasMany = [partecipants: User]

    static constraints = {
        title blank: false
        description nullable: true
        phone nullable: true
        email nullable: true
        partecipants nullable: true
        catering nullable: true
        maxParticipants min: 0
    }
}
