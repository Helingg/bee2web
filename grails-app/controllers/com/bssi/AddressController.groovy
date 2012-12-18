package com.bssi

class AddressController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        flash.message=""
        [addressDataList: Address.list(sort: 'dateCreated',order: 'desc',max: 10,offset: 0), addressDataTotal: Address.count()]
    }

    def listFlash = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
       render(view:'list',model:[addressDataList: Address.list(sort: 'dateCreated',order: 'desc',max: 10,offset: 0), addressDataTotal: Address.count()])
    }

    def create = {
        def addressData = new Address()
        flash.message = ""
        addressData.properties = params
        return [addressData: addressData]
    }

    def save = {
        def addressData = new Address(params)
        if (addressData.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'address.label', default: 'Address'), addressData.id])}"
            redirect(action: "showFlash", id: addressData.id)
            return
        }
        else {
            flash.message = "Save failed"
            redirect(action: "listFlash")
            return
        }
    }

    def show = {
        def addressData = Address.get(params.id)
        if (!addressData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
            redirect(action: "listFlash")
        }
        else {
            flash.message = ""
            [addressData: addressData]
        }
    }

    def showFlash = {
        def addressData = Address.get(params.id)
        if (!addressData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
            redirect(action: "listFlash")
        }
        else {
            render(view: 'show',model:[addressData: addressData])
            return
        }
    }

    def edit = {
        def addressData = Address.get(params.id)
        if (!addressData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
            redirect(action: "listFlash")
            return
        }
        else {
            flash.message = ""
            return [addressData: addressData]
        }
    }

    def update = {
        def addressData = Address.get(params.id)
        if (addressData) {
            if (params.version) {
                def version = params.version.toLong()
                if (addressData.version > version) {
                    
                    addressData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'address.label', default: 'Address')] as Object[], "Another user has updated this Address while you were editing")
                    render(view: "list", model: [addressData: addressData])
                    return
                }
            }


            addressData.properties = params
            if (!addressData.hasErrors() && addressData.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'address.label', default: 'Address'), addressData.id])}"
                redirect(action: "showFlash", id: addressData.id)
                return
            }
            else {
                flash.message ="Update Failed"
                redirect(action: "listFlash")
                return
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
            redirect(action: "listFlash")
            return
        }
    }

    def delete = {
        def addressData = Address.get(params.id)

        if (addressData) {
            def clientAddressData = ClientAddress.findByAddr(addressData)
            def facilityAddressData = FacilityAddress.findByAddr(addressData)
            def clientContactData = ClientContact.findByAddr(addressData)
            if (clientAddressData||facilityAddressData||clientContactData){
                if (clientAddressData){
                    flash.message = "The Address ${addressData.id} in Client Address ${clientAddressData.id} has been used cannot be deleted"
                }
                if (facilityAddressData){
                    flash.message = "The Address ${addressData.id} in Facility Address ${facilityAddressData.id} has been used cannot be deleted"
                }
                if (clientContactData){
                    flash.message = "The Address ${addressData.id} in Client Contact ${clientContactData.id} has been used cannot be deleted"
                }

                redirect(action: "listFlash")
                return
            }
            try {
                addressData.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
                redirect(action: "listFlash")
                return
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
                redirect(action: "listFlash")
                return
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
            redirect(action: "listFlash")
            return
        }
    }

    def search = {
        if(!params.max) params.max = 10
        if (!params.offset)params.offset=0

        def searchAddress = {
            if(params.streetNbr) {
                like('streetNbr',"%${params.streetNbr}%")
            }
            if(params.streetPrefix){
                like('streetPrefix',"%${params.streetPrefix}%")
            }
            if(params.streetSuffix){
                like('streetSuffix',"%${params.streetSuffix}%")
            }
            if(params.country){
                like('country',"%${params.country}%")
            }
            if(params.city){
                like('city',"%${params.city}%")
            }
            if(params.state){
                like('state',"%${params.state}%")
            }
            if(params.zipCode){
                like('zipCode',"%${params.zipCode}%")
            }
            if(params.streetAddr){
                like('streetAddr',"%${params.streetAddr}%")
            }
            order("dateCreated","desc")
        }

        def addressDataList = Address.createCriteria().list(params,searchAddress)


        if(addressDataList)  {
            flash.message = "${addressDataList.totalCount} Address(es) found!"
        }else{
            flash.message="No data found"
        }

        render(view: 'list',model: [addressDataList:addressDataList,addressDataTotal: addressDataList.totalCount,params: params])

    }

    def selectAddress = {
        if(!params.max) params.max = 10
        if (!params.offset)params.offset=0

        def searchAddress = {
            if(params.streetNbr) {
                like('streetNbr',"%${params.streetNbr}%")
            }
            if(params.streetAddr){
                like('streetAddr',"%${params.streetAddr}%")
            }
            if(params.streetPrefix){
                like('streetPrefix',"%${params.streetPrefix}%")
            }
            if(params.streetSuffix){
                like('streetSuffix',"%${params.streetSuffix}%")
            }
            if(params.country){
                like('country',"%${params.country}%")
            }
            if(params.city){
                like('city',"%${params.city}%")
            }
            if(params.state){
                like('state',"%${params.state}%")
            }
            if(params.zipCode){
                like('zipCode',"%${params.zipCode}%")
            }
            if(params.streetAddr){
                like('streetAddr',"%${params.streetAddr}%")
            }
            order("dateCreated","desc")
        }

        def addressDataList = Address.createCriteria().list(params,searchAddress)

        if(addressDataList)  {
            flash.message = "${addressDataList.totalCount} Address(es) found!"
        }else{
            flash.message="No data found"
        }

        render(view: 'selectAddress',model: [addressDataList:addressDataList,addressDataTotal: addressDataList.totalCount,params: params])
    }
}
