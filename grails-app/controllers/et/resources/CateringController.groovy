package et.resources


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CateringController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Catering.list(params), model: [cateringInstanceCount: Catering.count()]
    }

    def show(Catering cateringInstance) {
        respond cateringInstance
    }

    def create() {
        respond new Catering(params)
    }

    @Transactional
    def save(Catering cateringInstance) {
        if (cateringInstance == null) {
            notFound()
            return
        }

        if (cateringInstance.hasErrors()) {
            respond cateringInstance.errors, view: 'create'
            return
        }

        cateringInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'catering.label', default: 'Catering'), cateringInstance.id])
                redirect cateringInstance
            }
            '*' { respond cateringInstance, [status: CREATED] }
        }
    }

    def edit(Catering cateringInstance) {
        respond cateringInstance
    }

    @Transactional
    def update(Catering cateringInstance) {
        if (cateringInstance == null) {
            notFound()
            return
        }

        if (cateringInstance.hasErrors()) {
            respond cateringInstance.errors, view: 'edit'
            return
        }

        cateringInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Catering.label', default: 'Catering'), cateringInstance.id])
                redirect cateringInstance
            }
            '*' { respond cateringInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Catering cateringInstance) {

        if (cateringInstance == null) {
            notFound()
            return
        }

        cateringInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Catering.label', default: 'Catering'), cateringInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'catering.label', default: 'Catering'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
