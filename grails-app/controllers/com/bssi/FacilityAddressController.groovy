package com.bssi

class FacilityAddressController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        flash.message=""
        [facilityAddressDataList: FacilityAddress.list(params), facilityAddressDataTotal: FacilityAddress.count()]
    }

    def listFlash = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        render(view: 'list',model:[facilityAddressDataList: FacilityAddress.list(params), facilityAddressDataTotal: FacilityAddress.count()] )
    }

    def create = {
        def facilityAddressData = new FacilityAddress()
        facilityAddressData.properties = params
        flash.message = ""
        return [facilityAddressData: facilityAddressData]
    }

    def save = {
        def facilityAddressData = new FacilityAddress(params)
        def addressData = Address.get(Long.parseLong(params.address1))
        def luAddrTypData = LuAddrType.get(Long.parseLong(params.addressType1))
        def facilityData = Facility.get(Long.parseLong(params.facility1))
        facilityAddressData.addr=  addressData
        facilityAddressData.addrType=  luAddrTypData
        facilityAddressData.facility = facilityData
        if (facilityAddressData.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'facilityAddress.label', default: 'FacilityAddress'), facilityAddressData.id])}"
            redirect(action: "showFlash", id: facilityAddressData.id)
            return
        }
        else {
            flash.message ="Save Failed"
            redirect(action: "listFlash")
            return
        }
    }

    def show = {
        def facilityAddressData = FacilityAddress.get(params.id)
        if (!facilityAddressData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'facilityAddress.label', default: 'FacilityAddress'), params.id])}"
            redirect(action: "list")
        }
        else {
            flash.message = ""
            [facilityAddressData: facilityAddressData]
        }
    }

    def showFlash = {
        def facilityAddressData = FacilityAddress.get(params.id)
        if (!facilityAddressData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'facilityAddress.label', default: 'FacilityAddress'), params.id])}"
            redirect(action: "listFlash")
            return
        }
        else {
            render(view: 'show',model: [facilityAddressData: facilityAddressData] )
        }
    }

    def edit = {
        def facilityAddressData = FacilityAddress.get(params.id)
        if (!facilityAddressData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'facilityAddress.label', default: 'FacilityAddress'), params.id])}"
            redirect(action: "listFlash")
        }
        else {
            flash.message = ""
            return [facilityAddressData: facilityAddressData]
        }
    }

    def update = {
        def facilityAddressData = FacilityAddress.get(params.id)
        if (facilityAddressData) {
            if (params.version) {
                def version = params.version.toLong()
                if (facilityAddressData.version > version) {

                    facilityAddressData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'facilityAddress.label', default: 'FacilityAddress')] as Object[], "Another user has updated this FacilityAddress while you were editing")
                    render(view: "edit", model: [facilityAddressData: facilityAddressData])
                    return
                }
            }
            facilityAddressData.properties = params
            def addressData = Address.get(Long.parseLong(params.address1))
            def luAddrTypData = LuAddrType.get(Long.parseLong(params.addressType1))
            def facilityData = Facility.get(Long.parseLong(params.facility1))
            facilityAddressData.addr=  addressData
            facilityAddressData.addrType=  luAddrTypData
            facilityAddressData.facility = facilityData
            if (!facilityAddressData.hasErrors() && facilityAddressData.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'facilityAddress.label', default: 'FacilityAddress'), facilityAddressData.id])}"
                redirect(action: "showFlash", id: facilityAddressData.id)
            }
            else {
                flash.message ="Update Failed"
                redirect(action: "listFlash")
                return
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'facilityAddress.label', default: 'FacilityAddress'), params.id])}"
            redirect(action: "listFlash")
            return
        }
    }

    def delete = {
        def facilityAddressData = FacilityAddress.get(params.id)
        if (facilityAddressData) {
            try {
                facilityAddressData.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'facilityAddress.label', default: 'FacilityAddress'), params.id])}"
                redirect(action: "listFlash")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'facilityAddress.label', default: 'FacilityAddress'), params.id])}"
                redirect(action: "showFlash", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'facilityAddress.label', default: 'FacilityAddress'), params.id])}"
            redirect(action: "listFlash")
        }
    }


    def search = {
        if(!params.max) params.max =10
        if(!params.offset) params.offset = 0

        def searchFacilityAddress = {
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
            if (params.activeInd){
                eq('activeInd',Boolean.parseBoolean(params.activeInd))
            }
            if (params.addrType){
               addrType{
                   like("addrType","%${params.addrType}%")
               }
            }
            if (params.facility){
                facility{
                    like("name","%${params.facility}%")
                }
            }
            order("dateCreated","desc")
        }
        def  facilityAddressDataList   = FacilityAddress.createCriteria().list(params,searchFacilityAddress)

        if(facilityAddressDataList) {
            flash.message = "${facilityAddressDataList.totalCount} Facility Address(es) found!"
        }else{
            flash.message = "No date found"
        }

        render(view: 'list',model: [params:params,facilityAddressDataList:facilityAddressDataList,facilityAddressDataTotal: facilityAddressDataList.totalCount])
    }
}
