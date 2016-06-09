package et.resources

import et.participant.User
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class VenueController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Venue.list(params), model:[venueInstanceCount: Venue.count()]
    }

    def show(Venue venueInstance) {
        respond venueInstance
    }

    def create() {
        def owners = User.executeQuery("select u from UserRole ur inner join ur.user u join ur.role r where r.authority = 'ROLE_RESOURCE_OWNER'")
        [venueInstance: new Venue(params), owners: owners]
    }

    @Transactional
    def save(Venue venueInstance) {
        if (venueInstance == null) {
            notFound()
            return
        }

        if (venueInstance.hasErrors()) {
            def owners = User.executeQuery("select u from UserRole ur inner join ur.user u join ur.role r where r.authority = 'ROLE_RESOURCE_OWNER'")
            respond venueInstance.errors, view:'create', model: [owners: owners]
            return
        }

        venueInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'venue.label', default: 'Venue'), venueInstance.id])
                redirect venueInstance
            }
            '*' { respond venueInstance, [status: CREATED] }
        }
    }

    def edit(Venue venueInstance) {
        respond venueInstance
    }

    @Transactional
    def update(Venue venueInstance) {
        if (venueInstance == null) {
            notFound()
            return
        }

        if (venueInstance.hasErrors()) {
            respond venueInstance.errors, view:'edit'
            return
        }

        venueInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Venue.label', default: 'Venue'), venueInstance.id])
                redirect venueInstance
            }
            '*'{ respond venueInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Venue venueInstance) {

        if (venueInstance == null) {
            notFound()
            return
        }

        venueInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Venue.label', default: 'Venue'), venueInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'venue.label', default: 'Venue'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
