package com.bssi

class ClientAddressController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        flash.message=""
        [clientAddressDataList: ClientAddress.list(sort: 'dateCreated',order: 'desc',max: 10,offset: 0), clientAddressDataTotal: ClientAddress.count()]
    }

    def listFlash = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        render(view: 'list',model:[clientAddressDataList: ClientAddress.list(sort: 'dateCreated',order: 'desc',max: 10,offset: 0), clientAddressDataTotal: ClientAddress.count()])
    }

    def create = {
        def clientAddressData = new ClientAddress()
        clientAddressData.properties = params
        flash.message = ""
        return [clientAddressData: clientAddressData]
    }

    def save = {
        def clientAddressData = new ClientAddress(params)
        def addressData = Address.get(Long.parseLong(params.address1))
        def luAddrTypData = AddressType.get(Long.parseLong(params.addressType1))
        def clientData = Client.get(Long.parseLong(params.client1))
        clientAddressData.addr=  addressData
        clientAddressData.addrType=  luAddrTypData
        clientAddressData.client = clientData
        if (clientAddressData.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'clientAddress.label', default: 'ClientAddress'), clientAddressData.id])}"
            redirect(action: "showFlash", id: clientAddressData.id)
        }
        else {
            flash.message = "Save failed"
            redirect(action: "listFlash")
            return
        }
    }

    def show = {
        def clientAddressData = ClientAddress.get(params.id)
        if (!clientAddressData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientAddress.label', default: 'ClientAddress'), params.id])}"
            redirect(action: "listFlash")
        }
        else {
            flash.message = ""
            [clientAddressData: clientAddressData]
        }
    }

    def showFlash = {
        def clientAddressData = ClientAddress.get(params.id)
        if (!clientAddressData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientAddress.label', default: 'ClientAddress'), params.id])}"
            redirect(action: "listFlash")
        }
        else {
            render(view: 'show',model:[clientAddressData: clientAddressData] )
        }
    }

    def edit = {
        def clientAddressData = ClientAddress.get(params.id)
        if (!clientAddressData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientAddress.label', default: 'ClientAddress'), params.id])}"
            redirect(action: "listFlash")
        }
        else {
            flash.message = ""
            return [clientAddressData: clientAddressData]
        }
    }

    def update = {
        def clientAddressData = ClientAddress.get(params.id)
        if (clientAddressData) {
            if (params.version) {
                def version = params.version.toLong()
                if (clientAddressData.version > version) {

                    clientAddressData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'clientAddress.label', default: 'ClientAddress')] as Object[], "Another user has updated this ClientAddress while you were editing")
                    render(view: "edit", model: [clientAddressData: clientAddressData])
                    return
                }
            }
            clientAddressData.properties = params
            def addressData = Address.get(Long.parseLong(params.address1))
            def luAddrTypData = AddressType.get(Long.parseLong(params.addressType1))
            def clientData = Client.get(Long.parseLong(params.client1))
            clientAddressData.addr=  addressData
            clientAddressData.addrType=  luAddrTypData
            clientAddressData.client = clientData
            if (!clientAddressData.hasErrors() && clientAddressData.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'clientAddress.label', default: 'ClientAddress'), clientAddressData.id])}"
                redirect(action: "showFlash", id: clientAddressData.id)
            }
            else {
                flash.message = "Update failed"
                redirect(action: "listFlash")
                return
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientAddress.label', default: 'ClientAddress'), params.id])}"
            redirect(action: "listFlash")
            return
        }
    }

    def delete = {
        def clientAddressData = ClientAddress.get(params.id)
        if (clientAddressData) {
            try {
                clientAddressData.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'clientAddress.label', default: 'ClientAddress'), params.id])}"
                redirect(action: "listFlash")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'clientAddress.label', default: 'ClientAddress'), params.id])}"
                redirect(action: "listFlash")
                return
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientAddress.label', default: 'ClientAddress'), params.id])}"
            redirect(action: "listFlash")
            return
        }
    }


    def search = {
        if(!params.max) params.max = 10
        if (!params.offset) params.offset = 0

        def searchClientAddress =  {
            if(params.activeInd){
                eq('activeInd',Boolean.parseBoolean(params.activeInd))
            }
            if (params.addr){
                addr{
                    or{
                        like('streetAddr',"%${params.addr}%")
                        like('streetNbr',"%${params.addr}%")
                        like('city',"%${params.addr}%")
                        like('state',"%${params.addr}%")
                        like('country',"%${params.addr}%")
                        like('streetPrefix',"%${params.addr}%")
                        like('streetSuffix',"%${params.addr}%")
                    }

                }
            }
            if (params.addrType){
                addrType{
                    like('addrType',"%${params.addrType}%")
                }
            }
            if (params.client){
                client{
                    like('name',"%${params.client}%")
                }
            }

            order("dateCreated","desc")
        }

        def clientAddressDataList = ClientAddress.createCriteria().list(params,searchClientAddress)

        if (clientAddressDataList){
            flash.message = "${clientAddressDataList.totalCount} Client Address(es) found!"
        }else{
            flash.message = "No data found!"
        }

        render(view: 'list',model: [params:params,clientAddressDataList:clientAddressDataList,clientAddressDataTotal: clientAddressDataList.totalCount])
    }
}
