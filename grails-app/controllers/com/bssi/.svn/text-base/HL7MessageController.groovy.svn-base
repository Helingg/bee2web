package com.bssi

import java.text.SimpleDateFormat
/**
 * Messsage Controller
 *
 * author: Wang Gang
 */
class HL7MessageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
		if(!params.max) params.max = 10
		if(!params.offset) params.offset = 0

        def str = "select h.id,c.name,h.msgCtrlId,h.type,h.event,h.remoteIp,h.dateCreated from HL7Message h ,Client c where h.client=c.id order by h.dateCreated desc "
		def HL7MessageDataList = HL7Message.executeQuery(str,[offset: params.offset,max: params.max])
        def HL7MessageDataList1 = HL7Message.executeQuery(str)
        [HL7MessageDataList: HL7MessageDataList, HL7MessageDataTotal: HL7MessageDataList1.size()]
    }

    def create = {
        def HL7MessageData = new HL7Message()
        HL7MessageData.properties = params
        flash.message = ""
        return [HL7MessageData: HL7MessageData]
    }

    def save = {
        def HL7MessageData = new HL7Message(params)
        if (HL7MessageData.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'HL7Message.label', default: 'HL7Message'), HL7MessageData.id])}"
            redirect(action: "show", id: HL7MessageData.id)
        }
        else {
            render(view: "create", model: [HL7MessageData: HL7MessageData])
        }
    }

    def show = {
        def HL7MessageData = HL7Message.get(params.id)
        if (!HL7MessageData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'HL7Message.label', default: 'HL7Message'), params.id])}"
            redirect(action: "list")
        }
        else {
            flash.message = ""
            [HL7MessageData: HL7MessageData]
        }
    }

    def edit = {
        def HL7MessageData = HL7Message.get(params.id)
        if (!HL7MessageData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'HL7Message.label', default: 'HL7Message'), params.id])}"
            redirect(action: "list")
        }
        else {
            flash.message = ""
            return [HL7MessageData: HL7MessageData]
        }
    }

    def update = {
        def HL7MessageData = HL7Message.get(params.id)
        if (HL7MessageData) {
            if (params.version) {
                def version = params.version.toLong()
                if (HL7MessageData.version > version) {
                    
                    HL7MessageData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'HL7Message.label', default: 'HL7Message')] as Object[], "Another user has updated this HL7Message while you were editing")
                    render(view: "edit", model: [HL7MessageData: HL7MessageData])
                    return
                }
            }
            HL7MessageData.properties = params
            if (!HL7MessageData.hasErrors() && HL7MessageData.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'HL7Message.label', default: 'HL7Message'), HL7MessageData.id])}"
                redirect(action: "show", id: HL7MessageData.id)
            }
            else {
                render(view: "edit", model: [HL7MessageData: HL7MessageData])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'HL7Message.label', default: 'HL7Message'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def HL7MessageData = HL7Message.get(params.id)
        if (HL7MessageData) {
            try {
                HL7MessageData.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'HL7Message.label', default: 'HL7Message'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'HL7Message.label', default: 'HL7Message'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'HL7Message.label', default: 'HL7Message'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def search = {
        if(!params.max)params.max=10
        if(!params.offset)params.offset=0

//        def lowDate
//        def highDate
//        def lowDateStr=""
//        def highDateStr=""
        SimpleDateFormat df =new  SimpleDateFormat("MM/dd/yyyy");
//
//        if (params.lowDate) {
//            lowDate = params.lowDate.split("/")
//            lowDateStr= lowDate[2]+"/"+ lowDate[0] +"/"+lowDate[1]
//        }
//        if (params.highDate) {
//            highDate = params.highDate.split("/")
//            highDateStr= highDate[2]+"/"+ highDate[0] +"/"+highDate[1]
//        }

        if (params.lowDate&&params.highDate&&df.parse(params.lowDate).after(df.parse(params.highDate))){
            flash.message = "${message(code: 'default.date.range.message')}"
            render(view:"list",model: [params: params,sendLogDataTotal:0])
            return
        }

        def str = "select h.id,c.name,h.msgCtrlId,h.type,h.event,h.remoteIp,h.dateCreated from HL7Message h ,Client c where h.client=c.id "
        if (params.client){
            str = str+" and c.name like '"+"%${params.client}%"+"'"
        }
        if (params.type){
            str = str+" and h.type like '%${params.type}%'"
        }
        if (params.event){
            str = str+" and h.event like '%${params.event}%'"
        }
        if (params.remoteIp){
            str = str+" and h.remoteIp like '%${params.remoteIp}%'"
        }
        if (params.lowDate){
            str = str +" and h.dateCreated >= STR_TO_DATE('${params.lowDate}', '%m/%d/%Y')"
        }
        if (params.highDate){
            str = str +" and h.dateCreated <= STR_TO_DATE('${params.highDate}', '%m/%d/%Y')"
        }
        
        str =  str+" order by h.dateCreated"
        def HL7MessageDataList = HL7Message.executeQuery(str,[offset:params.offset,max:params.max])
        def HL7MessageDataList1 = HL7Message.executeQuery(str)
        flash.message = "${message(code: 'default.sentmessage.number.message', args: [HL7MessageDataList1.size()])}"
        render(view: "list",model: [HL7MessageDataList:HL7MessageDataList,HL7MessageDataTotal: HL7MessageDataList1.size(),params: params])
    }
}
