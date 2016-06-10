import et.event.Category
import et.event.Event
import et.event.Notification
import et.event.UserEvent
import et.participant.Role
import et.participant.User
import et.participant.UserRole
import et.resources.Catering
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

		// Admin user has all permissions
		UserRole.create admin, adminRole, true
		UserRole.create admin, facilitatorRole, true
		UserRole.create admin, eventOwnerRole, true
		UserRole.create admin, resourceOwnerRole, true
		// Nico is a facilitator
		UserRole.create nico, facilitatorRole, true
		// Yonas is an event and resource owner
		UserRole.create yonas, eventOwnerRole, true
		UserRole.create yonas, resourceOwnerRole, true
		// Guble is a resource owner
		UserRole.create guble, userRole, true

		def femaleNames = ['Alemitu', 'Bekelu', 'Bayese', 'Chalitu', 'Abedu', 'Nedi', 'Lakech', 'Mulunsh', 'Jifare', 'Gelane']
		def maleNames = ['Direba', 'Achala', 'Terefe', 'Direbsa', 'Desalegn', 'Dabesa', 'Desu', 'Feyera', 'Worku', 'Tereda']
		def lastNames = ['Angasu', 'Gudeta', 'Demise', 'Bayesa', 'Sada', 'Beyera', 'Gebera', 'Melese', 'Abakoro', 'Tolera']

		Random rnd = new Random()

		List<User> participants = []
		(1..50).each {
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
		def panelClassList = ['panel-primary', 'panel-green', 'panel-yellow', 'panel-red', 'panel-default']
		def buttonClassList = ['btn-primary', 'btn-success', 'btn-warning', 'btn-danger', 'btn-default']
		(1..5).each {
			categories << new Category(
					name: "Category $it",
					icon: icons[it - 1],
					panelClass: panelClassList[it - 1],
					buttonClass: buttonClassList[it - 1]
			).save(flush: true, failOnError: true)
		}
		def caterings = []
		(1..3).each {
			caterings << new Catering(
					name: "Catering $it",
					phone: "0912345678$it",
					email: "cat$it@ems.et",
					lunchPrice: 60,
					teaBreakPrice: 30,
					snackPrice: 15
			).save(flush: true, failOnError: true)
		}
		def pictureList = [
		        'venue1.jpg',
		        'venue2.jpg',
		        'venue3.jpg'
		]

		List<Venue> venues = []
		(1..3).each {
			def seatsNumber = (rnd.nextInt(30) + 10) * 10
			venues << new Venue(
					name: "Venue $it",
					location: locations[it - 1],
					seatsNumber: seatsNumber,
					pricePerDay: rnd.nextInt(30) * 100,
					owner: eventOwners[it % 2],
					categoring: caterings[it - 1],
					picture: pictureList[it - 1]
			).save(flush: true, failOnError: true)
		}
		(1..50).each {
			def eventStartMonth = it % 12
			def eventStartDay = it % 29
			def venue = venues[it % 3]
			def event = new Event(
					title: "Event $it",
					description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.",
					category: categories[it % 5],
					maxParticipants: venue.seatsNumber,
					owner: eventOwners[it % 2],
					startDate: new Date(2016 - 1900, eventStartMonth, eventStartDay),
					endDate: new Date(2016 - 1900, eventStartMonth, eventStartDay + it % 3),
					venue: venue,
					phone: '09123456',
					email: "event$it@ems.et"
			)
			(1..it % 4).each { idx ->
				event.addToNotifications(new Notification(
						title: "Notification $idx",
						message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan."
				))
			}
			event.save flush: true, failOnError: true
			if (it % 20 == 0) {
				UserEvent.create guble, event, true
			}
			(0..rnd.nextInt(venue.seatsNumber)).each { idx ->
				UserEvent.create participants[rnd.nextInt(participants.size() - 1)], event, true
			}
		}
    }
    def destroy = {
    }
}
