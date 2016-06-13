package et.event

import et.participant.User

class NotificationController {

    def renderNotifications(long userId) {
        User user = User.load(userId)
        def userAuthorities = user.getAuthorities()
        def notifications = []
        if (userAuthorities.authority.contains('ROLE_ADMIN') || userAuthorities.contains('ROLE_FACILITATOR')) {
            notifications = Notification.list([sort: 'dateCreated', order: 'desc', limit: '50'])
        } else if (userAuthorities.authority.contains('ROLE_EVENT_OWNER')) {
            def userEvents = Event.findAllByOwnerAndStartDateGreaterThan(user, new Date())
            userEvents.each { event ->
                notifications << event.notifications
            }
            notifications = notifications.flatten().sort {
                a,b-> b.dateCreated <=> a.dateCreated
            }
        } else {
            def userEvents = Event.executeQuery(
                    """select e from UserEvent ue inner join ue.event e
                where ue.participant = :userInstance and
                e.endDate >= :date order by e.startDate asc""",
                    [userInstance: user, date: new Date()]
            )
            userEvents.each { event ->
                notifications << event.notifications
            }
            notifications = notifications.flatten().sort {
                a,b-> b.dateCreated <=> a.dateCreated
            }
        }
        render template: 'notificationList', model: [notifications: notifications]
    }

    def sendNotification() {
        Notification notification = new Notification(params)
        if (!notification.validate()) {
            flash.message = 'Error sending notification'
            flash.messageType = 'alert-error'
        } else {
            notification.save(flush:true, failOnError: true)
            flash.message = 'Notification sent successfully.'
        }
        redirect notification.event
    }
}
