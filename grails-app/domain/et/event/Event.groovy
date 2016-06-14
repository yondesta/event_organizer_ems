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
    Date registrationDeadline
    BigDecimal registrationFee = 0
    boolean isOpen = true
    boolean isLive = false
    boolean isExpired = false

    static hasMany = [notifications: Notification]

    static constraints = {
        title blank: false
        description nullable: true
        phone nullable: true
        email nullable: true
        maxParticipants min: 0
        registrationFee min: new BigDecimal(0)
        notifications nullable: true
    }

    static transients = ['isLive', 'isExpired']

    boolean getIsLive() {
        def now = new Date()
        now > startDate && now < endDate
    }

    boolean getIsExpired() {
        def now = new Date()
        now > endDate
    }

    def beforeValidate() {
        if(!registrationDeadline)
            registrationDeadline = startDate - 1
    }

//    def beforeUpdate() {
//        if(!registrationDeadline)
//            registrationDeadline = startDate - 1
//    }
}
