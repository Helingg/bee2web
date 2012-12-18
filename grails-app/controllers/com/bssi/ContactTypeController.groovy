package com.bssi

class ContactTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        flash.message = ""
        [luContactTypeDataList: ContactType.list(params), luContactTypeDataTotal: ContactType.count()]
    }

    def listFlash = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        render(view: 'list',model: [luContactTypeDataList: ContactType.list(params), luContactTypeDataTotal: ContactType.count()])
    }

    def create = {
        def luContactTypeData = new ContactType()
        luContactTypeData.properties = params
        flash.message = ""

        return [luContactTypeData: luContactTypeData]
    }

    def save = {
        if(params.contactType){
            def contactTypeExist = ContactType.findByContactType(params.contactType)
            if (contactTypeExist){
                flash.message ="Contact Type ${params.contactType} is already exist"
                redirect(action: "listFlash")
                return
            }
        } else{
            flash.message ="Contact Type is null"
            redirect(action: "listFlash")
            return
        }
        def luContactTypeData = new ContactType(params)
        if (luContactTypeData.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'luContactType.label', default: 'LuContactType'), luContactTypeData.id])}"
            redirect(action: "showFlash", id: luContactTypeData.id)
            return
        }
        else {
            flash.message = "Save failed"
            redirect(action: "listFlash")
            return
        }
    }

    def show = {
        def luContactTypeData = ContactType.get(params.id)
        if (!luContactTypeData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'luContactType.label', default: 'LuContactType'), params.id])}"
            redirect(action: "listFlash")
        }
        else {
            flash.message = ""
            [luContactTypeData: luContactTypeData]
        }
    }

    def showFlash = {
        def luContactTypeData = ContactType.get(params.id)
        if (!luContactTypeData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'luContactType.label', default: 'LuContactType'), params.id])}"
            redirect(action: "listFlash")
        }
        else {
            render(view:'show',model:[luContactTypeData: luContactTypeData])
        }
    }

    def edit = {
        def luContactTypeData = ContactType.get(params.id)
        if (!luContactTypeData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'luContactType.label', default: 'LuContactType'), params.id])}"
            redirect(action: "listFalsh")
        }
        else {
            flash.message = ""
            return [luContactTypeData: luContactTypeData]
        }
    }

    def update = {
        def luContactTypeData = ContactType.get(params.id)
        if (luContactTypeData) {
            if(params.contactType){
                def contactTypeExist = ContactType.findByContactType(params.contactType)
                if (contactTypeExist&&contactTypeExist.id!=luContactTypeData.id){
                    flash.message ="Contact Type ${params.contactType} is already exist"
                    redirect(action: "listFlash")
                    return
                }
            } else{
                flash.message ="Contact Type is null"
                redirect(action: "listFlash")
                return
            }
            if (params.version) {
                def version = params.version.toLong()
                if (luContactTypeData.version > version) {
                    
                    luContactTypeData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'luContactType.label', default: 'LuContactType')] as Object[], "Another user has updated this LuContactType while you were editing")
                    render(view: "edit", model: [luContactTypeData: luContactTypeData])
                    return
                }
            }
            def clientContactExist = ClientContact.findByContactType(luContactTypeData)
            if(clientContactExist){
                if (params.activeInd!="on"&&luContactTypeData.activeInd==true){
                    flash.message = "The Contact Type ${luContactTypeData.id} in Client Contact ${clientContactExist.id} has been used the parameter 'Enabled' cannot be updated for the false"
                    redirect(action: "listFlash")
                    return
                }else{
                    params.activeInd="on"
                }

            }
            luContactTypeData.properties = params
            if (!luContactTypeData.hasErrors() && luContactTypeData.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'luContactType.label', default: 'LuContactType'), luContactTypeData.id])}"
                redirect(action: "showFlash", id: luContactTypeData.id)
                return
            }
            else {
                flash.message = "Update Failed"
                redirect(action: "showFlash", id: luContactTypeData.id)
                return
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'luContactType.label', default: 'LuContactType'), params.id])}"
            redirect(action: "listFlash")
            return
        }
    }

    def delete = {
        def luContactTypeData = ContactType.get(params.id)

        if (luContactTypeData) {
            def clientContactData = ClientContact.findByContactType(luContactTypeData)
            if (clientContactData){
                flash.message = "The Contact Type ${luContactTypeData.id} in Client Contact ${clientContactData.id} has been used cannot be deleted"
                redirect(action: "listFlash")
                return
            }

            try {
                luContactTypeData.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'luContactType.label', default: 'LuContactType'), params.id])}"
                redirect(action: "listFlash")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'luContactType.label', default: 'LuContactType'), params.id])}"
                redirect(action: "showFlash", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'luContactType.label', default: 'LuContactType'), params.id])}"
            redirect(action: "listFlash")
        }
    }

    def search = {
        if(!params.max)params.max = 10
        if (!params.offset)params.offset = 0

        def searchContactType = {
            if(params.activeInd=="on"){
                eq("activeInd",true)
            }else{
                eq("activeInd",false)
            }
            if (params.contactType){
                like('contactType',"%${params.contactType}%")
            }
            if (params.description){
                like("description","%${params.description}%")
            }
        }

        def luContactTypeDataList = ContactType.createCriteria().list(params,searchContactType)


        if (luContactTypeDataList) {
            flash.message = "${luContactTypeDataList.totalCount} Contact Type(s) found"
        }else{
            flash.message = "No data found"
        }

        render (view: 'list',model: [luContactTypeDataList:luContactTypeDataList,luContactTypeDataTotal: luContactTypeDataList.totalCount,params: params])

    }

    def selectContactType = {

        if(!params.max)params.max = 10
        if (!params.offset)params.offset = 0

        def searchContactType = {
//            if(params.activeInd=="on"){
//                eq("activeInd",true)
//            }else{
//                eq("activeInd",false)
//            }
            if (params.contactType){
                like('contactType',"%${params.contactType}%")
            }
            if (params.description){
                like("description","%${params.description}%")
            }
        }

        def luContactTypeDataList = ContactType.createCriteria().list(params,searchContactType)
        if (luContactTypeDataList) {
            flash.message = "${luContactTypeDataList.totalCount} Contact Type(s) found"
        }else{
            flash.message = "No data found"
        }

        render (view: 'selectContactType',model: [luContactTypeDataList:luContactTypeDataList,luContactTypeDataTotal: luContactTypeDataList.totalCount,params: params])
    }

    def saveContactType = {
        if(params.contactType){
            def contactTypeExist =  ContactType.findByContactType(params.contactType)
            if(contactTypeExist) {
                render "Contact Type ${params.contactType} is already exist"
                return
            }
            def contactTypeData = new ContactType()
            contactTypeData.contactType = params.contactType
            contactTypeData.description = params.description
            contactTypeData.activeInd = Boolean.parseBoolean(params.activeInd)
            if(!contactTypeData.save(flush: true)){
                render "Save failed"
                return
            }
            render ""
            return
        }else{
            render "Contact Type is null"
            return
        }
    }
}
