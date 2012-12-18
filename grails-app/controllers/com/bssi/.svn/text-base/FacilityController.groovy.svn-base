package com.bssi

class FacilityController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        flash.message=""
        [facilityDataList: Facility.list(sort: 'dateCreated',order: 'desc',max: 10,offset: 0), facilityDataTotal: Facility.count()]
    }

    def listFlash = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        render(view: 'list',model: [facilityDataList: Facility.list(sort: 'dateCreated',order: 'desc',max: 10,offset: 0), facilityDataTotal: Facility.count()])
    }


    def create = {
        def facilityData = new Facility()
        facilityData.properties = params
        flash.message = ""
        return [facilityData: facilityData]
    }

    def save = {
        def facilityData = new Facility(params)
        def clientData = Client.get(Long.parseLong(params.client1))

        facilityData.client = clientData
        if (facilityData.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'facility.label', default: 'Facility'), facilityData.id])}"
            redirect(action: "showFlash",id:facilityData.id )
        }
        else {
            flash.message = "Save failed!"
            redirect(action: "listFlash")
        }
    }

    def show = {
        def facilityData = Facility.get(params.id)
        if (!facilityData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'facility.label', default: 'Facility'), params.id])}"
            redirect(action: "listFlash")
        }
        else {
            flash.message = ""
            [facilityData: facilityData]
        }
    }

    def showFlash = {
        def facilityData = Facility.get(params.id)
        if (!facilityData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'facility.label', default: 'Facility'), params.id])}"
            redirect(action: "listFlash")
        }
        else {
           render(view: 'show',model:[facilityData: facilityData])
        }
    }

    def edit = {
        def facilityData = Facility.get(params.id)
        if (!facilityData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'facility.label', default: 'Facility'), params.id])}"
            redirect(action: "list")
        }
        else {
            flash.message = ""
            return [facilityData: facilityData]
        }
    }

    def update = {
        def facilityData = Facility.get(params.id)
        if (facilityData) {
            if (params.version) {
                def version = params.version.toLong()
                if (facilityData.version > version) {

                    facilityData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'facility.label', default: 'Facility')] as Object[], "Another user has updated this Facility while you were editing")
                    redirect(action: "listFlash")
                    return
                }
            }

            def facilityAddress = FacilityAddress.findByFacility(facilityData)
            if(facilityAddress){
                if (params.activeInd!="on"&&facilityData.activeInd==true){
                    flash.message = "The Facility  ${facilityData.name} in Facility Address ${facilityAddress.id} has already been used the parameter 'Enabled' cannot be updated for the false"
                    redirect(action: "listFlash")
                    return
                }else{
                    params.activeInd="on"
                }

            }

            facilityData.properties = params
            def clientData = Client.get(Long.parseLong(params.client1))
            facilityData.client = clientData
            if (!facilityData.hasErrors() && facilityData.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'facility.label', default: 'Facility'), facilityData.id])}"
                redirect(action: "showFlash",id:facilityData.id)
                return
            }
            else {
                flash.message = "Facility ${params.id} update failed"
                redirect(action: "listFlash")
                return
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'facility.label', default: 'Facility'), params.id])}"
            redirect(action: "listFlash")
            return
        }
    }

    def delete = {
        def facilityData = Facility.get(params.id)
        if (facilityData) {
            def facilityAddressData = FacilityAddress.findByFacility(facilityData)
            if (facilityAddressData){
                flash.message = "The Facility ${facilityData.name} in Facility Address ${facilityAddressData.id} has already been used cannot be deleted"
                redirect(action: "listFlash")
                return
            }
            try {
                facilityData.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'facility.label', default: 'Facility'), params.id])}"
                redirect(action: "listFlash")
                return
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'facility.label', default: 'Facility'), params.id])}"
                redirect(action: "listFlash")
                return
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'facility.label', default: 'Facility'), params.id])}"
            redirect(action: "listFlash")
            return
        }
    }

    def search = {
        if(!params.max) params.max =10
        if (!params.offset) params.offset = 0

        def searchFacility = {
            if(params.name){
                like('name',"%${params.name}%")
            }
            if (params.client){
                client{
                    like('name',"%${params.client}%")
                }
            }
//            if (params.activeInd=='on'){
//                eq('activeInd',true)
//            }else{
//                eq('activeInd',false)
//            }
            order("dateCreated","desc")
        }

        def facilityDataList = Facility.createCriteria().list(params,searchFacility)
        if(facilityDataList) {
            flash.message = "${facilityDataList.totalCount} Facility(s) found!"
        }else{
            flash.message = "No data found!"
        }
        render(view: 'list',model: [facilityDataList:facilityDataList,facilityDataTotal: facilityDataList.totalCount,params: params])
    }

    def selectFacility = {
        if(!params.max) params.max =10
        if (!params.offset) params.offset = 0

        def searchFacility = {
            if(params.name){
                like('name',"%${params.name}%")
            }
            if (params.client){
                client{
                    like('name',"%${params.client}%")
                }
            }
//            if (params.activeInd=='on'){
//                eq('activeInd',true)
//            }else{
//                eq('activeInd',false)
//            }
            order("dateCreated","desc")
        }

        def facilityDataList = Facility.createCriteria().list(params,searchFacility)

        if(facilityDataList) {
            flash.message = "${facilityDataList.totalCount} Facility(s) found!"
        }else{
            flash.message = "No data found!"
        }
        render(view: 'selectFacility',model: [facilityDataList:facilityDataList,facilityDataTotal: facilityDataList.totalCount,params: params])
    }
}
