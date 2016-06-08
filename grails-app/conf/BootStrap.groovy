import et.event.Category
import et.event.Event
import et.participant.Role
import et.participant.User
import et.participant.UserRole
import et.resources.Venue

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
		def david = new User(username: 'david', password: 'david', firstName: 'David', lastName: 'Abba', email: 'david@ems.et', gender: 'M').save(flush: true, failOnError: true)
		def cleethus = new User(username: 'cleethus', password: 'cleethus', firstName: 'Cleethus', lastName: 'Abba', email: 'cleethus@ems.et', gender: 'M').save(flush: true, failOnError: true)
		def guble = new User(username: 'guble', password: 'guble', firstName: 'Guble', lastName: 'Driver', email: 'guble@ems.et', gender: 'M').save(flush: true, failOnError: true)

		UserRole.create admin, adminRole, true
		UserRole.create nico, facilitatorRole, true
		UserRole.create yonas, facilitatorRole, true
		UserRole.create david, eventOwnerRole, true
		UserRole.create cleethus, eventOwnerRole, true
		UserRole.create guble, resourceOwnerRole, true

		def femaleNames = ['Alemitu', 'Bekelu', 'Bayese', 'Chalitu', 'Abedu', 'Nedi', 'Lakech', 'Mulunsh', 'Jifare', 'Gelane']
		def maleNames = ['Direba', 'Achala', 'Terefe', 'Direbsa', 'Desalegn', 'Dabesa', 'Desu', 'Feyera', 'Worku', 'Tereda']
		def lastNames = ['Angasu', 'Gudeta', 'Demise', 'Bayesa', 'Sada', 'Beyera', 'Gebera', 'Melese', 'Abakoro', 'Tolera']

		Random rnd = new Random()

		List<User> participants = []
		(1..100).each {
			def gender = it % 2 == 0 ? 'M' : 'F'
			def lastName = lastNames[rnd.nextInt(9)]
			def firstName = gender == 'M' ? maleNames[rnd.nextInt(9)] : femaleNames[rnd.nextInt(9)]
			participants << new User(
					username: "${firstName.toLowerCase()}${it}",
					password: firstName.toLowerCase(),
					firstName: firstName,
					lastName: lastName,
					email: "${firstName.toLowerCase()}@ems.et",
					gender: gender
			).save(flush: true, failOnError: true)
		}

		def locations = ["Wolisso", "Addis Ababa", "Arba Minch"]
		def eventOwners = [david, cleethus]
		def categories = []
		def icons = ['fa-tag', 'fa-h-square', 'fa-cutlery', 'fa-lightbulb-o', 'fa-dollar']
		def colors = ['panel-primary', 'panel-green', 'panel-yellow', 'panel-red', 'panel-default']
		(1..5).each {
			categories << new Category(
					name: "Category $it",
					icon: icons[it - 1],
					color: colors[it - 1]
			).save(flush: true, failOnError: true)
		}
		(1..100).each {
			def eventStartMonth = it % 12
			def eventStartDay = it % 29
			def seatsNumber = (rnd.nextInt(30) + 10) * 10
			def venue = new Venue(
					name: locations,
					location: 'Wolisso',
					seatsNumber: seatsNumber,
					pricePerDay: rnd.nextInt(30) * 100,
					owner: eventOwners[it % 2]
			)
			venue.save(flush: true, failOnError: true)
			def event = new Event(
					title: "Event $it",
					category: categories[it % 5],
					maxParticipants: seatsNumber,
					owner: eventOwners[it % 2],
					startDate: new Date(2016 - 1900, eventStartMonth, eventStartDay),
					endDate: new Date(2016 - 1900, eventStartMonth, eventStartDay + it % 3),
					venue: venue
			)
			(0..rnd.nextInt(seatsNumber)).each { idx ->
				event.addToPartecipants participants[rnd.nextInt(participants.size() - 1)]
			}
			event.save flush: true, failOnError: true
		}
    }
    def destroy = {
    }
}
