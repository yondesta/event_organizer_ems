package et.event

import groovy.time.TimeCategory
import groovy.time.TimeDuration

class Notification {

    String title
    String message
    Date dateCreated
    String elapsedTime

    static belongsTo = [event: Event]

    static constraints = {
    }

    static transients = ['elapsedTime']

    String getElapsedTime() {
        TimeDuration elapsedTime = TimeCategory.minus(new Date(), dateCreated)
        "${elapsedTime.getDays()}d ${elapsedTime.getHours()}h ${elapsedTime.getMinutes()}m"
    }
}
