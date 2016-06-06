import et.participant.Role
import et.participant.User
import et.participant.UserRole

class BootStrap {

    def init = { servletContext ->
		def adminRole = new Role('ROLE_ADMIN').save(flush: true, failOnError: true)
		def facilitatorRole = new Role('ROLE_FACILITATOR').save(flush: true, failOnError: true)
		def eventOwnerRole = new Role('ROLE_EVENT_OWNER').save(flush: true, failOnError: true)
		def resourceOwnerRole = new Role('ROLE_RESOURCE_OWNER').save(flush: true, failOnError: true)
		def userRole = new Role('ROLE_USER').save(flush: true, failOnError: true)
  
		def admin = new User('admin', 'admin').save(flush: true, failOnError: true)
		def nico = new User('nico', 'nico').save(flush: true, failOnError: true)
		def yonas = new User('yonas', 'yonas').save(flush: true, failOnError: true)
  
		UserRole.create admin, adminRole, true
		UserRole.create nico, userRole, true
		UserRole.create yonas, userRole, true
    }
    def destroy = {
    }
}
