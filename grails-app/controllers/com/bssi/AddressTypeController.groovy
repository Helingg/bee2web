package com.bssi

class AddressTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        flash.message = ""
        [luAddrTypeDataList: AddressType.list(params), luAddrTypeDataTotal: AddressType.count()]
    }
    def listFlash = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        render(view: 'list',model:[luAddrTypeDataList: AddressType.list(params), luAddrTypeDataTotal: AddressType.count()] )
    }

    def create = {
        def luAddrTypeData = new AddressType()
        luAddrTypeData.properties = params
        flash.message = ""
        return [luAddrTypeData: luAddrTypeData]
    }

    def save = {
        if(params.addrType){
            def addressTypeExist = AddressType.findByAddrType(params.addrType)
            if (addressTypeExist){
                flash.message ="Address Type ${params.addrType} is already exist"
                redirect(action: "listFlash")
                return
            }
        } else{
            flash.message ="Address Type is null"
            redirect(action: "listFlash")
            return
        }
        def luAddrTypeData = new AddressType(params)
        if (luAddrTypeData.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'luAddrType.label', default: 'LuAddrType'), luAddrTypeData.id])}"
            redirect(action: "showFlash", id: luAddrTypeData.id)
        }
        else {
            flash.message ="Save Failed"
            redirect(action: "listFlash")
            return
        }
    }

    def show = {
        def luAddrTypeData = AddressType.get(params.id)
        if (!luAddrTypeData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'luAddrType.label', default: 'LuAddrType'), params.id])}"
            redirect(action: "listFlash")
        }
        else {
            flash.message = ""
            [luAddrTypeData: luAddrTypeData]
        }
    }

    def showFlash = {
        def luAddrTypeData = AddressType.get(params.id)
        if (!luAddrTypeData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'luAddrType.label', default: 'LuAddrType'), params.id])}"
            redirect(action: "listFlash")
        }
        else {
            render(view: 'show',model:[luAddrTypeData: luAddrTypeData])
        }
    }

    def edit = {
        def luAddrTypeData = AddressType.get(params.id)
        if (!luAddrTypeData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'luAddrType.label', default: 'LuAddrType'), params.id])}"
            redirect(action: "listFlash")
        }
        else {
            flash.message = ""
            return [luAddrTypeData: luAddrTypeData]
        }
    }

    def update = {
        def luAddrTypeData = AddressType.get(params.id)
        if (luAddrTypeData) {
            if(params.addrType){
                def addressTypeExist = AddressType.findByAddrType(params.addrType)
                if (addressTypeExist&&addressTypeExist.id!=luAddrTypeData.id){
                    flash.message ="Address Type ${params.addrType} is already exist"
                    redirect(action: "listFlash")
                    return
                }
            } else{
                flash.message ="Address Type is null"
                redirect(action: "listFlash")
                return
            }
            if (params.version) {
                def version = params.version.toLong()
                if (luAddrTypeData.version > version) {
                    
                    luAddrTypeData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'luAddrType.label', default: 'LuAddrType')] as Object[], "Another user has updated this LuAddrType while you were editing")
                    redirect(action: "listFlash")
                    return
                }
            }
            def facilityAddressExist = FacilityAddress.findByAddrType(luAddrTypeData)
            def clientAddressExist = ClientAddress.findByAddrType(luAddrTypeData)
            if(facilityAddressExist||clientAddressExist) {
                if(params.activeInd!="on"&&luAddrTypeData.activeInd==true){
                    if(facilityAddressExist){
                        flash.message = "The Address Type  ${luAddrTypeData.id} in Facility Address ${facilityAddressExist.id} has been used the parameter 'Enabled' cannot be updated for the false"
                    }
                    if(clientAddressExist){
                        flash.message = "The Address Type  ${luAddrTypeData.id} in Client Address ${clientAddressExist.id} has been used the parameter 'Enabled' cannot be updated for the false"
                    }

                    redirect(action: "listFlash")
                    return
                }else{
                    params.activeInd="on"
                }
            }

            luAddrTypeData.properties = params
            if (!luAddrTypeData.hasErrors() && luAddrTypeData.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'luAddrType.label', default: 'LuAddrType'), luAddrTypeData.id])}"
                redirect(action: "showFlash", id: luAddrTypeData.id)
                return
            }
            else {
                flash.message = "Update failed"
                redirect(action: "listFlash")
                return
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'luAddrType.label', default: 'LuAddrType'), params.id])}"
            redirect(action: "listFlash")
            return
        }
    }

    def delete = {
        def luAddrTypeData = AddressType.get(params.id)
        if (luAddrTypeData) {
            def facilityAddressExist = FacilityAddress.findByAddrType(luAddrTypeData)
            def clientAddressExist = ClientAddress.findByAddrType(luAddrTypeData)
            if(facilityAddressExist||clientAddressExist) {
                if(facilityAddressExist){
                    flash.message = "The Address Type  ${luAddrTypeData.id} in Facility Address ${facilityAddressExist.id} has been used cannot be deleted"
                    redirect(action: "listFlash")
                    return
                }
                if(clientAddressExist){
                    flash.message = "The Address Type  ${luAddrTypeData.id} in Client Address ${clientAddressExist.id} has been used cannot be deleted"
                    redirect(action: "listFlash")
                    return
                }
            }

            try {
                luAddrTypeData.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'luAddrType.label', default: 'LuAddrType'), params.id])}"
                redirect(action: "listFlash")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'luAddrType.label', default: 'LuAddrType'), params.id])}"
                redirect(action: "showFlash", id: params.id)
                return
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'luAddrType.label', default: 'LuAddrType'), params.id])}"
            redirect(action: "listFlash")
            return
        }
    }

    def search = {
        if(!params.max)params.max = 10
        if (!params.offset) params.offset = 0

        def searchAddressType = {
            if(params.addrType){
                like('addrType',"%${params.addrType}%")
            }
            if (params.activeInd=="on"){
                eq("activeInd",true)
            }else{
                eq("activeInd",false)
            }
            if (params.description){
                like("description","%${params.description}%")
            }
        }

        def luAddrTypeDataList = AddressType.createCriteria().list(params,searchAddressType)


        if (luAddrTypeDataList) {
            flash.message = "${luAddrTypeDataList.totalCount} Address Type(s) found!"
        }else{
            flash.message = "No data found"
        }

        render(view: 'list',model:[luAddrTypeDataList:luAddrTypeDataList,luAddrTypeDataTotal: luAddrTypeDataList.totalCount,params: params])
    }

    def selectAddressType = {
        if(!params.max)params.max = 10
        if (!params.offset) params.offset = 0

        def searchAddressType = {
            if(params.addrType){
                like('addrType',"%${params.addrType}%")
            }
//            if (params.activeInd=="on"){
//                eq("activeInd",true)
//            } else{
//                eq("activeInd",false)
//            }
            if (params.description){
                like("description","%${params.description}%")
            }
        }

        def luAddrTypeDataList = AddressType.createCriteria().list(params,searchAddressType)

        if (luAddrTypeDataList) {
            flash.message = "${luAddrTypeDataList.totalCount} Address Type(s) found!"
        }else{
            flash.message = "No data found"
        }


        render(view: 'selectAddressType',model:[luAddrTypeDataList:luAddrTypeDataList,luAddrTypeDataTotal: luAddrTypeDataList.totalCount,params: params])
    }

    def saveAddressType = {
        if(params.addressType){
            def addressTypeExist = AddressType.findByAddrType(params.addressType)
            if(addressTypeExist) {
                render "Address Type ${params.addressType} is already exist"
                return
            }
            def addressTypeData = new AddressType()
            addressTypeData.addrType = params.addressType
            addressTypeData.description = params.description
            addressTypeData.activeInd = Boolean.parseBoolean(params.activeInd)
            if(!addressTypeData.save(flush: true)){
                render "Save failed"
                return
            }
            render ""
            return
        } else{
            render "Address Type is null"
            return
        }
    }
}
