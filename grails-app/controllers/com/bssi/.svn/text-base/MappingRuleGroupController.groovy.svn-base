package com.bssi

class MappingRuleGroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') :  10, 100)
        flash.message=""
        [mappingRuleGroupDataList: MappingRuleGroup.list(order: 'desc',sort: 'dateCreated',max: 10,offset: 0), mappingRuleGroupDataTotal: MappingRuleGroup.count()]
    }
    def listFlash = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        render(view: 'list',model: [mappingRuleGroupDataList: MappingRuleGroup.list(order: 'desc',sort: 'dateCreated',max: 10,offset: 0), mappingRuleGroupDataTotal: MappingRuleGroup.count()])
    }

    def create = {
        def mappingRuleGroupData = new MappingRuleGroup()
        mappingRuleGroupData.properties = params
        flash.message = ""
        return [mappingRuleGroupData: mappingRuleGroupData]
    }

    def save = {
        def mappingRuleGroupData = new MappingRuleGroup(params)
        def fromApplication = Application.get(Long.parseLong(params.fromApplication1))
        def toApplication = Application.get(Long.parseLong(params.toApplication1))
        mappingRuleGroupData.fromApplication =  fromApplication
        mappingRuleGroupData.toApplication =  toApplication
        if (mappingRuleGroupData.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'mappingRuleGroup.label', default: 'MappingRuleGroup'), mappingRuleGroupData.name])}"
            redirect(action: "showFlash", id: mappingRuleGroupData.id)
        }
        else {
            render(view: "create", model: [mappingRuleGroupData: mappingRuleGroupData])
        }
    }

    def show = {
        def mappingRuleGroupData = MappingRuleGroup.get(params.id)
        if (!mappingRuleGroupData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mappingRuleGroup.label', default: 'MappingRuleGroup'), params.id])}"
            redirect(action: "listFlash")
        }
        else {
            flash.message = ""
            return [mappingRuleGroupData: mappingRuleGroupData]
        }
    }

    def showFlash = {
        def mappingRuleGroupData = MappingRuleGroup.get(params.id)
        if (!mappingRuleGroupData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mappingRuleGroup.label', default: 'MappingRuleGroup'), params.id])}"
            redirect(action: "listFlash")
        }
        else {
            render(view: 'show',model:  [mappingRuleGroupData: mappingRuleGroupData])
        }
    }

    def edit = {
        def mappingRuleGroupData = MappingRuleGroup.get(params.id)
        if (!mappingRuleGroupData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mappingRuleGroup.label', default: 'MappingRuleGroup'), params.id])}"
            redirect(action: "listFlash")
        }
        else {
            flash.message = ""
            return [mappingRuleGroupData: mappingRuleGroupData]

        }
    }

    def update = {
        def mappingRuleGroupData = MappingRuleGroup.get(params.id)
        def fromApplication = Application.get(Long.parseLong(params.fromApplication1))
        def toApplication = Application.get(Long.parseLong(params.toApplication1))
        mappingRuleGroupData.fromApplication =  fromApplication
        mappingRuleGroupData.toApplication =  toApplication
        if (mappingRuleGroupData) {
            if (params.version) {
                def version = params.version.toLong()
                if (mappingRuleGroupData.version > version) {

                    mappingRuleGroupData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'mappingRuleGroup.label', default: 'MappingRuleGroup')] as Object[], "Another user has updated this MappingRuleGroup while you were editing")
                    render(view: "edit", model: [mappingRuleGroupData: mappingRuleGroupData])
                    return
                }
            }

            def ruleExist = MappingRule.findByMappingRuleGroup(mappingRuleGroupData)
            def senderConfigExist = DestinationConfig.findByMappingRuleGroup(mappingRuleGroupData)

            if(ruleExist||senderConfigExist){
                if (params.activeInd!="on"&&mappingRuleGroupData.activeInd==true){
                    if(senderConfigExist){
                        flash.message = "The Rule Group ${mappingRuleGroupData.id} in Bridge ${senderConfigExist.bridge} of the Sender ${senderConfigExist.id} has been used the parameter 'Enabled' cannot be updated for the false"
                    }
                    if(ruleExist){
                        flash.message = "The Rule Group ${mappingRuleGroupData.id} in Rule ${ruleExist.id}  has been used the parameter 'Enabled' cannot be updated for the false"
                    }
                    redirect(action: "listFlash")
                    return
                }else{
                    params.activeInd="on"
                }
            }

            mappingRuleGroupData.properties = params
            if (!mappingRuleGroupData.hasErrors() && mappingRuleGroupData.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'mappingRuleGroup.label', default: 'MappingRuleGroup'), mappingRuleGroupData.id])}"
                redirect(action: "showFlash", id: mappingRuleGroupData.id)
                return
            }
            else {
                flash.message = "Update failed"
                redirect(action: "listFlash", [mappingRuleGroupData: mappingRuleGroupData])
                return
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mappingRuleGroup.label', default: 'MappingRuleGroup'), params.id])}"
            redirect(action: "listFlash")
            return
        }
    }

    def delete = {
        def mappingRuleGroupData = MappingRuleGroup.get(params.id)
        if (mappingRuleGroupData) {
            def ruleExist = MappingRule.findByMappingRuleGroup(mappingRuleGroupData)
            def senderConfigExist = DestinationConfig.findByMappingRuleGroup(mappingRuleGroupData)
            if(ruleExist||senderConfigExist){
                if (ruleExist){
                    flash.message = "The Mapping Rule Group ${mappingRuleGroupData.name} in Rule ${ruleExist.id} has been used cannot be deleted"
                    redirect(action: 'listFlash')
                    return
                }
                if(senderConfigExist){
                    flash.message = "The Mapping Rule Group ${mappingRuleGroupData.name} in Bridge ${senderConfigExist.bridge} of the Sender ${senderConfigExist.name} has been used cannot be deleted"
                    redirect(action: 'listFlash')
                    return
                }
            }
            try {
                mappingRuleGroupData.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'mappingRuleGroup.label', default: 'MappingRuleGroup'), params.id])}"
                redirect(action: "listFlash")
                return
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'mappingRuleGroup.label', default: 'MappingRuleGroup'), params.id])}"
                redirect(action: "listFlash")
                return
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mappingRuleGroup.label', default: 'MappingRuleGroup'), params.id])}"
            redirect(action: "listFlash")
            return
        }
    }

    def search = {
        if(!params.max)params.max=10
        if(!params.offset)params.offset=0
        def searchMappingRuleGroup={
            if(params.name){
                like("name","%${params.name}%")
            }
            if (params.type){
                eq("type",params.type)
            }
            if (params.application){
                toApplication{
                    like("name","%${params.application}%")
                }
            }
            order("dateCreated","desc")
        }
        def mappingRuleGroupDataList = MappingRuleGroup.createCriteria().list(params,searchMappingRuleGroup)
        if(mappingRuleGroupDataList){
            flash.message = "${mappingRuleGroupDataList.totalCount} Mapping Rule Group(s) found!"
        } else{
            flash.message = "No data found!"
        }

        render(view: 'list',model: [mappingRuleGroupDataList:mappingRuleGroupDataList,mappingRuleGroupDataTotal: mappingRuleGroupDataList.totalCount,params: params])
    }

    def selectApplication = {
        if(!params.max) params.max =10
        if (!params.offset) params.offset = 0
        def searchApplication ={
            if(params.name){
                like('name',"%${params.name}%")
            }
            if(params.applicationVsersion){
                like('name',"%${params.applicationVsersion}%")
            }
            if(params.servicePack){
                like('name',"%${params.servicePack}%")
            }
//            if(params.type){
//                eq('type',Boolean.parseBoolean(params.type))
//            }

            order('dateCreated','desc')
        }

        def applicationDataList = Application.createCriteria().list(params,searchApplication)
        if(!applicationDataList){
            flash.message = "No data found!"
        }else{
            flash.message = "${applicationDataList.totalCount} Application(s) found!"
        }


        render (view: 'selectApplication',model: [applicationDataList:applicationDataList,applicationDataTotal:applicationDataList.totalCount,params: params])
    }
}
