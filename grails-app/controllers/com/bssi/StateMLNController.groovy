package com.bssi

import org.springframework.dao.DataIntegrityViolationException

class StateMLNController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [stateMLNDataList: StateMLN.list(params), stateMLNDataTotal: StateMLN.count()]
    }

    def create() {
        [stateMLNData: new StateMLN(params)]
    }

    def save() {
        def stateMLNData = new StateMLN(params)
        if (!stateMLNData.save(flush: true)) {
            render(view: "create", model: [stateMLNData: stateMLNData])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'stateMLN.label', default: 'StateMLN'), stateMLNData.id])
        redirect(action: "show", id: stateMLNData.id)
    }

    def show() {
        def stateMLNData = StateMLN.get(params.id)
        if (!stateMLNData) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stateMLN.label', default: 'StateMLN'), params.id])
            redirect(action: "list")
            return
        }

        [stateMLNData: stateMLNData]
    }

    def edit() {
        def stateMLNData = StateMLN.get(params.id)
        if (!stateMLNData) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stateMLN.label', default: 'StateMLN'), params.id])
            redirect(action: "list")
            return
        }

        [stateMLNData: stateMLNData]
    }

    def update() {
        def stateMLNData = StateMLN.get(params.id)
        if (!stateMLNData) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stateMLN.label', default: 'StateMLN'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (stateMLNData.version > version) {
                stateMLNData.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'stateMLN.label', default: 'StateMLN')] as Object[],
                        "Another user has updated this StateMLN while you were editing")
                render(view: "edit", model: [stateMLNData: stateMLNData])
                return
            }
        }

        stateMLNData.properties = params

        if (!stateMLNData.save(flush: true)) {
            render(view: "edit", model: [stateMLNData: stateMLNData])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'stateMLN.label', default: 'StateMLN'), stateMLNData.id])
        redirect(action: "show", id: stateMLNData.id)
    }

    def delete() {
        def stateMLNData = StateMLN.get(params.id)
        if (!stateMLNData) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stateMLN.label', default: 'StateMLN'), params.id])
            redirect(action: "list")
            return
        }

        try {
            stateMLNData.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'stateMLN.label', default: 'StateMLN'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'stateMLN.label', default: 'StateMLN'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
