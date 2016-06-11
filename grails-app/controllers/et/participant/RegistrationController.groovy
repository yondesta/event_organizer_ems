package et.participant

import et.registration.Registration

class RegistrationController {

    def grailsApplication
    def springSecurityService

    def confirmRegistration(String token) {
        log.trace "Confirming registration with token $token..."
        def registration = Registration.findByToken(token)
        if (!registration) {
            log.info "...no registration token found."
            flash.message = "Invalid registration token. Please contact the system administrator"
            flash.messageType = 'alert-warning'
            redirect uri: '/'
            return
        }
        if (new Date().time - registration.dateCreated.time > grailsApplication.config.registration.expired.ms) {
            log.info "...token expired."
            registration.expired = true
            registration.save(flush: true, failOnError: true)
            flash.message = "Registration token has expired. Please contact the system administrator"
            flash.messageType = 'alert-warning'
            redirect uri: '/'
            return
        }
        if (registration.expired) {
            log.info "...registration expired."
            flash.message = "Registration token has expired. Please contact the system administrator"
            flash.messageType = 'alert-warning'
            redirect uri: '/'
            return
        }
        registration.expired = true
        registration.save(flush: true, failOnError: true)
        flash.message = "Registration successfull! Welcome to EMS Event Organizer."
        flash.messageType = 'alert-success'
        log.info "...redirecting to change password."
        render view: 'changePassword', model: [user: registration.user]
    }

    def updatePassword(PasswordCommad cmd) {
        if (springSecurityService.passwordEncoder.isPasswordValid(cmd.user.getPassword(), cmd.oldPassword, null)) {
            if (cmd.newPassword == cmd.confirmNewPassword) {
                cmd.user.password = cmd.newPassword
                cmd.user.save(flush:true, failOnError: true)
                springSecurityService.reauthenticate(cmd.user.username, User.load(cmd.user.id).password)
                redirect uri: '/'
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
}
