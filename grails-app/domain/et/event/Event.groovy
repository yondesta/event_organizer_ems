package et.event

import et.participant.User
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
    Integer maxParticipants = 0

    static hasMany = [participants: User]

    static constraints = {
        title blank: false
        description nullable: true
        phone nullable: true
        email nullable: true
        participants nullable: true
        maxParticipants min: 0
    }
}
