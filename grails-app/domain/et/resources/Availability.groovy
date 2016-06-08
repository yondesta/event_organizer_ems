package et.resources

class Availability {

    Date dateFrom
    Date dateTo

    static constraints = {
        dateTo nullable: true
    }
}
