package et.event

class Notification {

    String title
    String message
    Date dateCreated

    static belongsTo = [event: Event]

    static constraints = {
    }
}
