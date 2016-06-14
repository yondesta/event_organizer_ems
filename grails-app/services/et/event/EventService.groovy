package et.event

import et.participant.User
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.transaction.Transactional

@Transactional
class EventService {

    def springSecurityService

    boolean isRegistrationOpen(Event e) {
        e.isOpen &&
                !UserEvent.findByParticipantAndEvent(springSecurityService.currentUser, e) &&
                new Date() <= e.registrationDeadline &&
                !isFull(e)
    }

    boolean isFull(Event e) {
        e.maxParticipants != 0 && e.maxParticipants == UserEvent.countByEvent(e)
    }

    boolean isEventOwner(Event e) {
        SpringSecurityUtils.ifAllGranted("ROLE_EVENT_OWNER") && e.owner == springSecurityService.currentUser
    }

    boolean canSendNotification(Event e) {
        SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN, ROLE_FACILITATOR') ||
                (
                        SpringSecurityUtils.ifAllGranted('ROLE_EVENT_OWNER') &&
                        e.owner == springSecurityService.currentUser
                )
    }

    boolean isVisible(Event e) {
        !e.isExpired &&
                (
                        e.isOpen ||
                                UserEvent.findByParticipantAndEvent(springSecurityService.currentUser, e) ||
                                SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN, ROLE_FACILITATOR')
                )
    }

    boolean canAddLiveUpdates(Event e) {
        e.isLive &&
                (
                        SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN, ROLE_FACILITATOR') ||
                                (
                                        SpringSecurityUtils.ifAllGranted('ROLE_EVENT_OWNER') &&
                                                springSecurityService.currentUser == e.owner
                                )
                )
    }
}
