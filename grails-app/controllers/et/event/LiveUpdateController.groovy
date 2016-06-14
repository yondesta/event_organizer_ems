package et.event


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LiveUpdateController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LiveUpdate.list(params), model: [liveUpdateInstanceCount: LiveUpdate.count()]
    }

    def show(LiveUpdate liveUpdateInstance) {
        respond liveUpdateInstance
    }

    def create() {
        respond new LiveUpdate(params)
    }

    @Transactional
    def save(LiveUpdate liveUpdateInstance) {
        if (liveUpdateInstance == null) {
            notFound()
            return
        }

        if (liveUpdateInstance.hasErrors()) {
            respond liveUpdateInstance.errors, view: 'create'
            return
        }

        liveUpdateInstance.save flush: true
        redirect controller: 'event', action: 'show', id: liveUpdateInstance.event.id
    }

    def edit(LiveUpdate liveUpdateInstance) {
        respond liveUpdateInstance
    }

    @Transactional
    def update(LiveUpdate liveUpdateInstance) {
        if (liveUpdateInstance == null) {
            notFound()
            return
        }

        if (liveUpdateInstance.hasErrors()) {
            respond liveUpdateInstance.errors, view: 'edit'
            return
        }

        liveUpdateInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LiveUpdate.label', default: 'LiveUpdate'), liveUpdateInstance.id])
                redirect liveUpdateInstance
            }
            '*' { respond liveUpdateInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(LiveUpdate liveUpdateInstance) {

        if (liveUpdateInstance == null) {
            notFound()
            return
        }

        liveUpdateInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LiveUpdate.label', default: 'LiveUpdate'), liveUpdateInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'liveUpdate.label', default: 'LiveUpdate'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def renderLiveUpdates() {
        List<LiveUpdate> updates
        Event event = Event.get(params.eventId as long)
        if (event) {
            updates = LiveUpdate.findAllByEvent(event, [sort: 'dateCreated', order: 'desc', limit: 10])
        }
        render template: 'liveEventShow', model: [updates: updates]
    }
}
