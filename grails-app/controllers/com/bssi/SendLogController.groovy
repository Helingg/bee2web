package com.bssi

import java.text.SimpleDateFormat
/**
 * Sent Message Log Controller
 *
 * author: Wang Gang
 */

class SendLogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)

    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
//        def str = "select s.id,c.name,r.name,s.msgCtrlId,s.ack,s.sentTime from SendLog s,Client c,Recipient r where s.client=c.id and s.recipient=r.id  order by s.dateCreated desc "
//
//        def sendLogDataList = SendLog.executeQuery(str)
        flash.message=""
        [sendLogDataList:SendLog.list(sort:'dateCreated',order: 'desc',max: 10,offset: 0), sendLogDataTotal:SendLog.count()]
    }
    def listFlash = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
//        def str = "select s.id,c.name,r.name,s.msgCtrlId,s.ack,s.sentTime from SendLog s,Client c,Recipient r where s.client=c.id and s.recipient=r.id  order by s.dateCreated desc "
//
//        def sendLogDataList = SendLog.executeQuery(str)

        render (view: 'list',model: [sendLogDataList:SendLog.list(sort:'dateCreated',order: 'desc',max: 10,offset: 0), sendLogDataTotal:SendLog.count()] )
    }

    def create = {
        def sendLogData = new SendLog()
        sendLogData.properties = params
        return [sendLogData: sendLogData]
    }

    def save = {
        def sendLogData = new SendLog(params)
        if (sendLogData.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'sendLog.label', default: 'SendLog'), sendLogData.id])}"
            redirect(action: "show", id: sendLogData.id)
        }
        else {
            render(view: "create", model: [sendLogData: sendLogData])
        }
    }

    def show = {
        def sendLogData = SendLog.get(params.id)
        if (!sendLogData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sendLog.label', default: 'SendLog'), params.id])}"
            redirect(action: "list")
        }
        else {
            [sendLogData: sendLogData]
        }
    }

    def edit = {
        def sendLogData = SendLog.get(params.id)
        if (!sendLogData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sendLog.label', default: 'SendLog'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [sendLogData: sendLogData]
        }
    }

    def update = {
        def sendLogData = SendLog.get(params.id)
        if (sendLogData) {
            if (params.version) {
                def version = params.version.toLong()
                if (sendLogData.version > version) {
                    
                    sendLogData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'sendLog.label', default: 'SendLog')] as Object[], "Another user has updated this SendLog while you were editing")
                    render(view: "edit", model: [sendLogData: sendLogData])
                    return
                }
            }
            sendLogData.properties = params
            if (!sendLogData.hasErrors() && sendLogData.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'sendLog.label', default: 'SendLog'), sendLogData.id])}"
                redirect(action: "show", id: sendLogData.id)
            }
            else {
                render(view: "edit", model: [sendLogData: sendLogData])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sendLog.label', default: 'SendLog'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def sendLogData = SendLog.get(params.id)
        if (sendLogData) {
            try {
                sendLogData.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'sendLog.label', default: 'SendLog'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'sendLog.label', default: 'SendLog'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sendLog.label', default: 'SendLog'), params.id])}"
            redirect(action: "list")
        }
    }
    def search = {
        if(!params.max)params.max=10
        if (!params.offset)params.offset=0

        def lowDate
        def highDate
////        def lowDateStr=""
////        def highDateStr=""
        SimpleDateFormat df =new  SimpleDateFormat("MM/dd/yyyy");
        if (params.lowDate){
            lowDate = df.parse(params.lowDate)
        }
        if (params.highDate){
            highDate = df.parse(params.highDate)
        }
//        if (params.lowDate) {
//            lowDate = params.lowDate.split("/")
//            lowDateStr= lowDate[2]+"/"+ lowDate[0] +"/"+lowDate[1]
//        }
//        if (params.highDate) {
//            highDate = params.highDate.split("/")
//            highDateStr= highDate[2]+"/"+ highDate[0] +"/"+highDate[1]
//        }

//        if (params.lowDate&&params.highDate&&df.parse(params.lowDate).after(df.parse(params.highDate))){
//            flash.message = "${message(code: 'default.date.range.message')}"
//            render(view:"list",model: [params: params,sendLogDataTotal:0])
//            return
//        }
//
//        def str = "select s.id,c.name,r.name,s.msgCtrlId,s.ack,s.sentTime from SendLog s,Client c,Recipient r where s.client=c.id and s.recipient=r.id  "
//        if (params.client){
//            str =str +" and c.name like '%${params.client}%'"
//        }
//        if (params.recipient){
//            str = str+ " and r.name like '%${params.recipient}%'"
//        }
//        if (params.lowDate){
//            str = str +" and s.sentTime >= STR_TO_DATE('${params.lowDate}', '%m/%d/%Y')"
//        }
//        if (params.highDate){
//            str = str +" and s.sentTime <= STR_TO_DATE('${params.highDate}', '%m/%d/%Y')"
//        }
//
//        str =str +" order by dateCreated desc "
//
//        def sendLogDataList = SendLog.executeQuery(str,[offset:params.offset,max:params.max])
//        def sendLogDataList1 = SendLog.executeQuery(str)

        def search = {
            if(params.sendClient){
                sendClient{
                    like('name',"%${params.sendClient}%")
                }
            }
            if (params.receiveClient){
                receiveClient{
                    like('name',"%${params.receiveClient}%")
                }
            }
            if (params.lowDate){
                 ge('sentTime',lowDate)
            }
            if (params.highDate){
                 le('sentTime',highDate)
            }
            order('dateCreated','desc')
        }
        
        def sendLogDataList  = SendLog.createCriteria().list(params,search)



        if(sendLogDataList){
            flash.message = "${sendLogDataList.totalCount} Send Log(s) found"
        }else{
            flash.message = "No data found"
        }
        render(view: "list",model: [sendLogDataList:sendLogDataList,sendLogDataTotal: sendLogDataList.totalCount,params: params])

        }

}
