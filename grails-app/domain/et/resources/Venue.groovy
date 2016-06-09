package et.resources

import et.participant.User

class Venue {

    String name
    String description
    String location
    Integer seatsNumber
    boolean ushersAvailable = false
    boolean speakersAvailable = false
    boolean projectorAvailable = false
    BigDecimal pricePerDay
    String email
    String phone
    User owner
    Catering catering
    String picture

    static hasMany = [availabilities: Availability]

    static constraints = {
        description nullable: true, blank: true
        email nullable: true, email: true
        phone nullable: true
        catering nullable: true
        seatsNumber min: 0
        pricePerDay min: new BigDecimal(0)
        picture: nullable: true
    }

    String toString() {
        name
    }
}
