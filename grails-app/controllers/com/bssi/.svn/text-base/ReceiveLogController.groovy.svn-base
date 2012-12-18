package com.bssi

import java.text.SimpleDateFormat
/**
 * Received Message Log Controller
 *
 * author: Wang Gang
 */
class ReceiveLogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 15, 100)
        flash.message=""
        [receiveLogDataList: ReceiveLog.list(sort: "dateCreated",order: "desc",max: 10,offset: 0), receiveLogDataTotal: ReceiveLog.count()]
    }

    def listFlash = {
        params.max = Math.min(params.max ? params.int('max') : 15, 100)
        render (view: 'list',model:[receiveLogDataList: ReceiveLog.list(sort: "dateCreated",order: "desc",max: 10,offset: 0), receiveLogDataTotal: ReceiveLog.count()] )
    }

    def create = {
        def receiveLogData = new ReceiveLog()
        receiveLogData.properties = params
        flash.message = ""
        return [receiveLogData: receiveLogData]
    }

    def save = {
        def receiveLogData = new ReceiveLog(params)
        if (receiveLogData.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'receiveLog.label', default: 'ReceiveLog'), receiveLogData.id])}"
            redirect(action: "show", id: receiveLogData.id)
        }
        else {
            render(view: "create", model: [receiveLogData: receiveLogData])
        }
    }

    def show = {
        def receiveLogData = ReceiveLog.get(params.id)
        if (!receiveLogData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'receiveLog.label', default: 'ReceiveLog'), params.id])}"
            redirect(action: "list")
        }
        else {
            flash.message = ""
            [receiveLogData: receiveLogData]
        }
    }

    def edit = {
        def receiveLogData = ReceiveLog.get(params.id)
        if (!receiveLogData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'receiveLog.label', default: 'ReceiveLog'), params.id])}"
            redirect(action: "list")
        }
        else {
            flash.message = ""
            return [receiveLogData: receiveLogData]
        }
    }

    def update = {
        def receiveLogData = ReceiveLog.get(params.id)
        if (receiveLogData) {
            if (params.version) {
                def version = params.version.toLong()
                if (receiveLogData.version > version) {
                    
                    receiveLogData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'receiveLog.label', default: 'ReceiveLog')] as Object[], "Another user has updated this ReceiveLog while you were editing")
                    render(view: "edit", model: [receiveLogData: receiveLogData])
                    return
                }
            }
            receiveLogData.properties = params
            if (!receiveLogData.hasErrors() && receiveLogData.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'receiveLog.label', default: 'ReceiveLog'), receiveLogData.id])}"
                redirect(action: "show", id: receiveLogData.id)
            }
            else {
                render(view: "edit", model: [receiveLogData: receiveLogData])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'receiveLog.label', default: 'ReceiveLog'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def receiveLogData = ReceiveLog.get(params.id)
        if (receiveLogData) {
            try {
                receiveLogData.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'receiveLog.label', default: 'ReceiveLog'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'receiveLog.label', default: 'ReceiveLog'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'receiveLog.label', default: 'ReceiveLog'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def search = {
        if(!params.max)params.max=10
        if(!params.offset)params.offset=0

        def lowDate = params.lowDate
        def highDate = params.highDate
        SimpleDateFormat df =new  SimpleDateFormat("MM/dd/yyyy");
        def lowDate1
        def highDate1
        if(params.lowDate){
            lowDate1 = df.parse(lowDate)
        }
        if(params.highDate){
            highDate1= df.parse(highDate)
        }

        if (params.lowDate&&params.highDate&&lowDate1.after(highDate1)){
            println lowDate1.after(highDate1)
            flash.message = "${message(code: 'default.date.range.message')}"
            render(view:"list",model: [params: params,receiveLogDataTotal:0])
            return
        }


        def search = {
            if(params.remoteIp){
                like("remoteIp","%${params.remoteIp}%")
            }
            if(params.lowDate){
               ge("receiveTime",lowDate1)
            }
            if(params.highDate){
               le("receiveTime",highDate1)
            }
            order("dateCreated","desc")
        }

        def receiveLogDataList = ReceiveLog.createCriteria().list(params,search)

        if(receiveLogDataList) {
            flash.message = "${receiveLogDataList.totalCount} Receive Log(s) found"
        } else{
            flash.message = "No data found"
        }
        render(view: "list",model: [receiveLogDataList:receiveLogDataList,receiveLogDataTotal: receiveLogDataList.totalCount,params: params])
    }
}
