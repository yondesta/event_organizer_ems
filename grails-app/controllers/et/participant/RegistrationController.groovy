package et.participant

import et.event.Event
import et.event.UserEvent
import et.registration.Registration
import grails.transaction.Transactional

class RegistrationController {

    def grailsApplication
    def springSecurityService
    def registrationService

    def create() {
        [eventInstance: Event.load(params.eventInstanceId as long)]
    }

    @Transactional
    def save() {
        def event = Event.get(params.eventId as long)
        def participant = new User(params.user)
        def password = registrationService.generatePassword()
        participant.password = password
        def model = [
                userInstance: participant,
                eventInstance: event,
                availableEvents: Event.list()
        ]
        if (!participant.validate()) {
            log.warn 'Error saving new participant'
            render view: 'registerParticipant', model: model
            return
        }
        participant.save(flush: true, failOnError: true)
        log.info "User ${participant.username} created."
        event.save(flush: true, failOnError: true)
        participant.save(flush: true, failOnError: true)
        String token = registrationService.generateToken()
        new Registration(
                token: token,
                user: participant,
                event: event
        ).save(flush: true, failOnError: true)
        log.info "Sending email to $participant.email with password $password and url: ${grailsApplication.config.grails.serverURL}/registration/confirmRegistration?token=${token}"
        flash.message = "Registration successful! An email will be sent to $participant.email, follow the link to complete registration."
        redirect controller: 'event', action: 'index'
    }

    @Transactional
    def confirmRegistration(String token) {
        log.trace "Confirming registration with token $token..."
        def registration = Registration.findByToken(token)
        def user = registration.user
        if (!registration) {  // If user has confirmed registration, registration war already deleted
            log.info "...no registration token found."
            flash.message = "Invalid registration token. Please contact the system administrator"
            flash.messageType = 'alert-warning'
            redirect uri: '/'
            return
        }
        if (registration.expired) {
            log.info "...registration ${registration.id} expired."
            registration.delete(flush: true)
            if(!user.confirmed) // This control avoids deleting a user that re-clicks on his confirmation link after a successful registration
                user.delete(flush: true)
            flash.message = "Registration token has expired. Please contact the system administrator"
            flash.messageType = 'alert-warning'
            redirect uri: '/'
            return
        }
        registration.delete(flush: true)
        user.confirmed = true
        user.save(flush: true, failOnError: true)
        UserRole.create registration.user, Role.findByAuthority('ROLE_USER'), true
        flash.message = "Registration successfull! Welcome to EMS Event Organizer."
        flash.messageType = 'alert-success'
        log.info "...redirecting to change password."
        render view: 'changePassword', model: [user: registration.user, event: registration.event]
    }

    @Transactional
    def updatePassword(PasswordCommad cmd) {
        if (springSecurityService.passwordEncoder.isPasswordValid(cmd.user.getPassword(), cmd.oldPassword, null)) {
            if (cmd.newPassword == cmd.confirmNewPassword) {
                cmd.user.password = cmd.newPassword
                cmd.user.save(flush:true, failOnError: true)
                springSecurityService.reauthenticate(cmd.user.username, User.load(cmd.user.id).password)
                if (cmd.event)
                    UserEvent.create cmd.user, cmd.event, true
                flash.message = "Welcome $cmd.user, you successfully signed up to EMS!"
                redirect controller: 'user', action: 'home'
                return
            }
            log.warn "New passwords not matching!"
            flash.message = "New Password not matching."
            flash.messageType = "alert-error"
            render view: 'changePassword', model: [user: cmd.user]
            return
        }
        log.warn "Incorrect old password."
        flash.message = "Incorrect old password."
        flash.messageType = "alert-error"
        render view: 'changePassword', model: [user: cmd.user]
    }
}

class PasswordCommad {
    String oldPassword
    String newPassword
    String confirmNewPassword
    User user
    Event event
}
