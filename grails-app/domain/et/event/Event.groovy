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

    static constraints = {
        title blank: false
        description nullable: true
        phone nullable: true
        email nullable: true
        maxParticipants min: 0
        registrationFee min: new BigDecimal(0)
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
