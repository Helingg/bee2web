package com.bssi

import grails.converters.JSON

class TemplateController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [templateDataList: Template.list(params), templateDataTotal: Template.count()]
    }

    def create = {
        def templateData = new Template()
        templateData.properties = params
        return [templateData: templateData]
    }

    def save = {
        def templateData
        Template.withTransaction {status->
            if(params.hl7message){
                def hl7message = params.hl7message
                def segment = hl7message.split("\r\n")
                for (i in 0..segment.size()-1){
                    def fieldlist = segment[i].split("\\|") //field list
                    def segmentname = fieldlist[0].split('\\%\\%')[0]
                    for (j in 0..fieldlist.size()-1) {
                        def subfield =  fieldlist[j].toString().split("\\^")     //if a field has subfield
                        for (k in 0..subfield.size()-1){
                            def field = subfield[k].toString().split("\\%\\%")
                            def temp = field[1].toString().toCharArray()
                            def required = false        //required
                            def repeatable = false      //repeatable
                            if (temp[0]=='M')
                                required = true
                            if (temp[1]=='Y')
                                repeatable = true
                            templateData = new Template(params)
                            templateData.segment = segmentname      //segment name
                            templateData.segmentIndex = i+1
                            templateData.field = field[0]
                            templateData.fieldIndex = j+1
                            templateData.required = required
                            templateData.repeatable = repeatable
                            templateData.description = ""
                            if (subfield.size()==1){
                                templateData.subfieldIndex=0
                                templateData.subfield = ""
                            }else {
                                templateData.subfieldIndex = k+1
                                templateData.subfield = field[0]
                            }
                            if (!templateData.save(flush: true)){
                                log.debug(templateData.errors)
                                status.setRollbackOnly()
                            }
                        }
                    }
                }
                redirect(action: "list")
            } else{
                redirect(action: "list")
            }

        }

//        if(params.hl7message){
//            def templateData
//            String hl7message=params.hl7message
//            def count = 0
//            def temp = hl7message.split("\\|")
//            for (i in 0..temp.size()-1){
//                count++
//                templateData = new Template(params)
//                def temp1 = temp[i].split(',')
//                println(temp1.size())
//                templateData.segment = temp[0].split(',')[0]
//                templateData.displayOrder = count
//                templateData.messageIndex = i+1
//                templateData.length = temp1[1].toString().length()
//                def tempchar = temp1[2].toString().toCharArray()
//                if (tempchar[0]=='M')
//                    templateData.repeatable = true
//                if (tempchar[1]=='Y')
//                    templateData.mandatory = true
//                    templateData.description = temp1[0]
//                if (!templateData.save(flush: true)){
//                    log.debug(templateData.errors)
//                    render(view: "create")
//                    return
//                }
//            }
//            redirect(action: "show", id: templateData.id)
//        } else{
//            render(view: "create")
//        }
//        def templateData = new Template(params)
//        if (templateData.save(flush: true)) {
//            flash.message = "${message(code: 'default.created.message', args: [message(code: 'template.label', default: 'Template'), templateData.id])}"
//            redirect(action: "show", id: templateData.id)
//        }
//        else {
//            render(view: "create", model: [templateData: templateData])
//        }
    }

    def show = {
        def templateData = Template.get(params.id)
        if (!templateData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'template.label', default: 'Template'), params.id])}"
            redirect(action: "list")
        }
        else {
            [templateData: templateData]
        }
    }

    def edit = {
        def templateData = Template.get(params.id)
        if (!templateData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'template.label', default: 'Template'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [templateData: templateData]
        }
    }

    def update = {
        def templateData = Template.get(params.id)
        if (templateData) {
            if (params.version) {
                def version = params.version.toLong()
                if (templateData.version > version) {

                    templateData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'template.label', default: 'Template')] as Object[], "Another user has updated this Template while you were editing")
                    render(view: "edit", model: [templateData: templateData])
                    return
                }
            }
            templateData.properties = params
            if (!templateData.hasErrors() && templateData.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'template.label', default: 'Template'), templateData.id])}"
                redirect(action: "show", id: templateData.id)
            }
            else {
                render(view: "edit", model: [templateData: templateData])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'template.label', default: 'Template'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def templateData = Template.get(params.id)
        if (templateData) {
            try {
                templateData.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'template.label', default: 'Template'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'template.label', default: 'Template'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'template.label', default: 'Template'), params.id])}"
            redirect(action: "list")
        }
    }

    def test = {
        println(params.pc)

        println(123)
        def a  =  new Template()
        render a as JSON
    }
    def editTemplate = {
        def templateData = Template.get(params.id)
        if (!templateData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'template.label', default: 'Template'), params.id])}"
            redirect(action: "list")
        }
        else {
            render(view: 'edittemplate',model: [templateData: templateData,params: params])
        }
    }
    def updateTemplate={
        def templateData = Template.get(params.id)
        if (templateData) {
            if (params.version) {
                def version = params.version.toLong()
                if (templateData.version > version) {

                    templateData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'template.label', default: 'Template')] as Object[], "Another user has updated this Template while you were editing")
                    render(view: "edittemplate", model: [templateData: templateData,params: params])
                    return
                }
            }
            templateData.properties = params
            if (!templateData.hasErrors() && templateData.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'template.label', default: 'Template'), templateData.id])}"
                render(view: "edittemplate", model: [templateData: templateData,params: params])
            }
            else {
                render(view: "edit", model: [templateData: templateData,params: params])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'template.label', default: 'Template'), params.id])}"
            redirect(action: "list")
        }
    }

    def updateData = {
         if(params.pc){
             def temp = params.pc.split(",")
             def templateData = Template.get(Long.parseLong(temp[0]))
             if (templateData){
                 templateData.field=temp[4]
                 templateData.subfield=temp[6]
                 templateData.mandatory=Boolean.parseBoolean(temp[8])
                 templateData.repeatable=Boolean.parseBoolean(temp[9])
                 templateData.required=Boolean.parseBoolean(temp[10])
                 try{
                     templateData.length=Integer.parseInt(temp[11])
                 }catch(Exception e){
                     render e.printStackTrace()
                 }
                 if (templateData.save(flush: true)){
                     render templateData as JSON
                     return
                 }
             } else{
                 render ""
                 return
             }
         }else {
             render ""
             return
         }
    }

    def search = {
        if(!params.max) params.max =10
        if (!params.offset) params.offset = 0
        def searchTemplate = {
            if(params.type){
                eq('type',params.type)
            }
            if(params.hl7version){
                eq('hl7version',params.hl7version)
            }
            if (params.segment){
                like('segment',"%${params.segment}%")
            }
            if (params.segmentIndex){
                eq('segmentIndex',Integer.parseInt(params.segmentIndex))
            }
            if (params.field){
                like('field',"%${params.field}%")
            }
            if(params.fieldIndex){
                eq('fieldIndex',Integer.parseInt(params.fieldIndex))
            }
            if (params.subfield){
                like('subfield',"%${params.subfield}%")
            }
            if (params.subfieldIndex){
                eq('subfieldIndex',Integer.parseInt(params.subfieldIndex))
            }
            if (params.required){
                eq('required',Boolean.parseBoolean(params.required))
            }
            if (params.repeatable){
                eq('repeatable',Boolean.parseBoolean(params.repeatable))
            }
            if (params.mandatory){
                eq('mandatory',Boolean.parseBoolean(params.mandatory))
            }
        }

        def templateDataList = Template.createCriteria().list(params,searchTemplate)

        render(view: 'list',model: [params:params,templateDataList:templateDataList,templateDataTotal: templateDataList.totalCount])
    }

    def temp = {

//        log.debug("111111111111"+params.pages)
//        log.debug("111111111111"+params.rows)
//
//        int intPage = Integer.parseInt((params.page == null || params.page == "0") ? "1":params.page)
//        int number = Integer.parseInt((params.rows == null || params.rows == "0") ? "10":params.rows)
//        int start = 50;
        println(params.rows+'``````````````'+params.page+'`````````````````````'+params.total)
        def templateList = Template.list(max: 10,offset: 0)
//        templateList.add('tatal':Template.count())

        render templateList as JSON

    }


}
