import et.event.Event
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
  
		def admin = new User(username: 'admin', password:'admin', firstName: 'Admin', lastName: 'Admin', email: 'admin@ems.et', gender: 'F').save(flush: true, failOnError: true)
		def nico = new User(username: 'nico', password:'nico', firstName: 'Nico', lastName: 'Salvato', email: 'nico@ems.et', gender: 'M').save(flush: true, failOnError: true)
		def yonas = new User(username: 'yonas', password:'yonas', firstName: 'Yonas', lastName: 'Desta', email: 'yonas@ems.et', gender: 'M').save(flush: true, failOnError: true)

		UserRole.create admin, adminRole, true
		UserRole.create nico, userRole, true
		UserRole.create yonas, userRole, true

		def ev1 = new Event(title: 'Event 1', category: 'CAT1', owner: admin, startDate: new Date(2016 - 1700, 8, 12), endDate: new Date(2016 - 1700, 8, 14))
		ev1.addToPartecipants(nico)
		ev1.addToPartecipants(yonas)
		ev1.save(flush: true, failOnError: true)

		def ev2 = new Event(title: 'Event 2', category: 'CAT2', owner: admin, startDate: new Date(2016 - 1700, 7, 2), endDate: new Date(2016 - 1700, 7, 2))
		ev2.addToPartecipants(yonas)
		ev2.save(flush: true, failOnError: true)
    }
    def destroy = {
    }
}
