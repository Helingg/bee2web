package com.bssi

class ClientContactController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        flash.message=""
        [clientContactDataList: ClientContact.list(params), clientContactDataTotal: ClientContact.count()]
    }

    def listFlash = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        render(view: 'list',model: [clientContactDataList: ClientContact.list(params), clientContactDataTotal: ClientContact.count()])
    }

    def create = {
        def clientContactData = new ClientContact()
        clientContactData.properties = params
        flash.message = ""
        return [clientContactData: clientContactData]
    }

    def save = {
        def clientContactData = new ClientContact(params)
        def clientData = Client.get(Long.parseLong(params.client1))
        def addressData = Address.get(Long.parseLong(params.address1))
        def contactTypeData = ContactType.get(Long.parseLong(params.contactType1))
        clientContactData.client =  clientData
        clientContactData.addr=  addressData
        clientContactData.contactType= contactTypeData
        if (clientContactData.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'clientContact.label', default: 'ClientContact'), clientContactData.id])}"
            redirect(action: "showFlash", id: clientContactData.id)
            return
        }
        else {
            flash.message = "Save failed"
            redirect(action: "listFlash")
            return
        }
    }

    def show = {
        def clientContactData = ClientContact.get(params.id)
        if (!clientContactData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientContact.label', default: 'ClientContact'), params.id])}"
            redirect(action: "list")
        }
        else {
            flash.message = ""
            [clientContactData: clientContactData]
        }
    }

    def showFlash = {
        def clientContactData = ClientContact.get(params.id)
        if (!clientContactData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientContact.label', default: 'ClientContact'), params.id])}"
            redirect(action: "listFlash")
        }
        else {
           render(view:'show',model: [clientContactData: clientContactData])
        }
    }

    def edit = {
        def clientContactData = ClientContact.get(params.id)
        if (!clientContactData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientContact.label', default: 'ClientContact'), params.id])}"
            redirect(action: "listFlash")
        }
        else {
            flash.message = ""
            return [clientContactData: clientContactData]
        }
    }

    def update = {
        def clientContactData = ClientContact.get(params.id)
        if (clientContactData) {
            if (params.version) {
                def version = params.version.toLong()
                if (clientContactData.version > version) {

                    clientContactData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'clientContact.label', default: 'ClientContact')] as Object[], "Another user has updated this ClientContact while you were editing")
                    render(view: "edit", model: [clientContactData: clientContactData])
                    return
                }
            }
            clientContactData.properties = params
            def clientData = Client.get(Long.parseLong(params.client1))
            def addressData = Address.get(Long.parseLong(params.address1))
            def contactTypeData = ContactType.get(Long.parseLong(params.contactType1))
            clientContactData.client =  clientData
            clientContactData.addr=  addressData
            clientContactData.contactType= contactTypeData
            if (!clientContactData.hasErrors() && clientContactData.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'clientContact.label', default: 'ClientContact'), clientContactData.id])}"
                redirect(action: "showFlash", id: clientContactData.id)
                return
            }
            else {
                flash.message = "Update failed"
                redirect(action: "listFlash")
                return
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientContact.label', default: 'ClientContact'), params.id])}"
            redirect(action: "listFlash")
            return
        }
    }

    def delete = {
        def clientContactData = ClientContact.get(params.id)
        if (clientContactData) {
            try {
                clientContactData.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'clientContact.label', default: 'ClientContact'), params.id])}"
                redirect(action: "listFlash")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'clientContact.label', default: 'ClientContact'), params.id])}"
                redirect(action: "showFlash", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientContact.label', default: 'ClientContact'), params.id])}"
            redirect(action: "listFlash")
        }
    }

    def search = {
        if(!params.max) params.max =10
        if (!params.offset) params.offset = 0

        def searchClientContact = {

            if(params.firstName){
                like('firstName',"%${params.firstName}%")
            }
            if(params.lastName){
                like('lastName',"%${params.lastName}%")
            }
            if(params.middleName){
                like('middleName',"%${params.middleName}%")
            }
            if (params.phoneNbr){
                like('phoneNbr',"%${params.phoneNbr}%")
            }
            if (params.emailAddr){
                like('emailAddr',"%${params.emailAddr}%")
            }
//            if (params.addr) {
//                addr{
//                    like('addr',"%${params.addr}%")
//                }
//            }
            if(params.client){
                client{
                    like('name',"%${params.client}%")
                }
            }
            if (params.contactType){
                contactType{
                    like('contactType',"%${params.contactType}%")
                }
            }
        }

        def clientContactDataList = ClientContact.createCriteria().list(params,searchClientContact)



        if(clientContactDataList){
            flash.message = "${clientContactDataList.totalCount} Client Contact(s) found!"
        }  else{
            flash.message = "No data found!"
        }

        render(view: 'list',model: [params:params,clientContactDataList:clientContactDataList,clientContactDataTotal:clientContactDataList.totalCount])
    }
}
