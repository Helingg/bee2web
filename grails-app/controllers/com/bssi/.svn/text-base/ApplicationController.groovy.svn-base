package com.bssi

class ApplicationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if (!params.offset) params.offset=0
        flash.message=""
        [applicationDataList: Application.list(max: params.max,offset: params.offset,order: 'desc',sort: 'dateCreated'), applicationDataTotal: Application.count()]
    }
    def listFlash = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if (!params.offset) params.offset=0
        render(view: 'list',model: [applicationDataList: Application.list(max: params.max,offset: params.offset,order: 'desc',sort: 'dateCreated'), applicationDataTotal: Application.count()])
    }

    def create = {
        flash.message = ""
        def applicationData = new Application()
        applicationData.properties = params
        return [applicationData: applicationData]
    }

    def save = {
        def applicationExist = Application.findByNameAndApplicationVersion(params.name,params.applicationVersion)
        if(applicationExist){
            flash.message = "The ${params.applicationVersion} version of the ${params.name} Application already exists"
            redirect(action: "listFlash")
            return
        }
        def applicationData = new Application(params)
        if (applicationData.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'application.label', default: 'Application'), applicationData.id])}"
            redirect(action: "showFlash", id: applicationData.id)
        }
        else {
            flash.message = "Save failed!"
            redirect(action: listFlash)
        }
    }

    def show = {
        def applicationData = Application.get(params.id)
        if (!applicationData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'application.label', default: 'Application'), params.id])}"
            redirect(action: "list")
        }
        else {
            flash.message = ""
            [applicationData: applicationData]
        }
    }

    def showFlash = {
        def applicationData = Application.get(params.id)
        if (!applicationData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'application.label', default: 'Application'), params.id])}"
            redirect(action: "listFlash")
        }
        else {
            render(view: 'show',model: [applicationData: applicationData])
        }
    }

    def edit = {
        def applicationData = Application.get(params.id)
        if (!applicationData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'application.label', default: 'Application'), params.id])}"
            redirect(action: "listFlash")
        }
        else {
            flash.message = ""
            return [applicationData: applicationData]
        }
    }

    def update = {

        def applicationData = Application.get(params.id)
        if (applicationData) {
            def applicationExist = Application.findByNameAndApplicationVersion(params.name,params.applicationVersion)
            if(applicationExist&&applicationExist.id!=applicationData.id){
                flash.message = "The ${params.applicationVersion} version of the ${params.name} Application already exists"
                redirect(action: "listFlash")
                return
            }
            if (params.version) {
                def version = params.version.toLong()
                if (applicationData.version > version) {
                    
                    applicationData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'application.label', default: 'Application')] as Object[], "Another user has updated this Application while you were editing")
                    render(view: "edit", model: [applicationData: applicationData])
                    return
                }
            }
            applicationData.properties = params
            if (!applicationData.hasErrors() && applicationData.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'application.label', default: 'Application'), applicationData.id])}"
                redirect(action: "showFlash", id: applicationData.id)
            }
            else {
                render(view: "edit", model: [applicationData: applicationData])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'application.label', default: 'Application'), params.id])}"
            redirect(action: "listFlash")
        }
    }

    def delete = {
        def applicationData = Application.get(params.id)
        if (applicationData) {
            def fromMappingRuleGroup = MappingRuleGroup.findByFromApplication(applicationData)
            def toMappingRuleGroup =MappingRuleGroup.findByToApplication(applicationData)
            if (fromMappingRuleGroup||toMappingRuleGroup){
                if(fromMappingRuleGroup) {
                    flash.message = "The Application ${applicationData.name} in Mapping Rule Group ${fromMappingRuleGroup.name} has been used cannot be deleted"
                }
                if(toMappingRuleGroup){
                    flash.message = "The Application ${applicationData.name} in Mapping Rule Group ${toMappingRuleGroup.name} has been used cannot be deleted"
                }
                redirect(action: "showFlash", id: params.id)
                return
            }
            try {
                applicationData.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'application.label', default: 'Application'), params.id])}"
                redirect(action: "listFlash")
                return
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'application.label', default: 'Application'), params.id])}"
                redirect(action: "listFlash")
                return
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'application.label', default: 'Application'), params.id])}"
            redirect(action: "listFlash")
            return
        }
    }

    def search = {
        if(!params.max) params.max =10
        if (!params.offset) params.offset = 0
        def searchApplication ={
            if(params.name){
                like('name',"%${params.name}%")
            }
            if(params.applicationVersion){
                like('applicationVersion',"%${params.applicationVersion}%")
            }
            if(params.servicePack){
                like('servicePack',"%${params.servicePack}%")
            }
//            if(params.type){
//                eq('type',Boolean.parseBoolean(params.type))
//            }

            order('dateCreated','desc')
        }

        def applicationDataList = Application.createCriteria().list(params,searchApplication)
        if(applicationDataList) {
            flash.message = "${applicationDataList.totalCount} Application(s) found!"
        }else{
            flash.message = "No data found!"
        }

        render (view: 'list',model: [applicationDataList:applicationDataList,applicationDataTotal:applicationDataList.totalCount,params: params])
    }
}
