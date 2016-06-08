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

    static hasMany = [availabilities: Availability]

    static constraints = {
        description nullable: true, blank: true
        email nullable: true, email: true
        phone nullable: true
        catering nullable: true
    }

    String toString() {
        name
    }
}
