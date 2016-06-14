package et.event

import groovy.time.TimeCategory
import groovy.time.TimeDuration

class LiveUpdate {

    String title
    String message
    String color
    String icon
    Date dateCreated
    String elapsedTime

    static belongsTo = [event: Event]

    static constraints = {
        color nullable: true
        icon nullable: true
    }

    static transients = ['elapsedTime']

    String getElapsedTime() {
        TimeDuration elapsedTime = TimeCategory.minus(new Date(), dateCreated)
        "${elapsedTime.getHours()}h ${elapsedTime.getMinutes()}m ${elapsedTime.getSeconds()}s"
    }
}
