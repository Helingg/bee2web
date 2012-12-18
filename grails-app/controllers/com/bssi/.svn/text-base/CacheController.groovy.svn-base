package com.bssi

import java.text.SimpleDateFormat
/**
 * Cache Controller
 *
 * author: Wang Gang
 */
class CacheController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		
        [cacheDataList: Cache.list(sort: "dateCreated",order: "desc",max: 10,offset: 0), cacheDataTotal: Cache.count()]
    }

    def create = {
        def cacheData = new Cache()
        cacheData.properties = params
        return [cacheData: cacheData]
    }

    def save = {
        def cacheData = new Cache(params)
        if (cacheData.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'cache.label', default: 'Cache'), cacheData.id])}"
            redirect(action: "show", id: cacheData.id)
        }
        else {
            render(view: "create", model: [cacheData: cacheData])
        }
    }

    def show = {
        def cacheData = Cache.get(params.id)
        if (!cacheData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cache.label', default: 'Cache'), params.id])}"
            redirect(action: "list")
        }
        else {
            [cacheData: cacheData]
        }
    }

    def edit = {
        def cacheData = Cache.get(params.id)
        if (!cacheData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cache.label', default: 'Cache'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [cacheData: cacheData]
        }
    }

    def update = {
        def cacheData = Cache.get(params.id)
        if (cacheData) {
            if (params.version) {
                def version = params.version.toLong()
                if (cacheData.version > version) {
                    
                    cacheData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'cache.label', default: 'Cache')] as Object[], "Another user has updated this Cache while you were editing")
                    render(view: "edit", model: [cacheData: cacheData])
                    return
                }
            }
            cacheData.properties = params
            if (!cacheData.hasErrors() && cacheData.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'cache.label', default: 'Cache'), cacheData.id])}"
                redirect(action: "show", id: cacheData.id)
            }
            else {
                render(view: "edit", model: [cacheData: cacheData])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cache.label', default: 'Cache'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def cacheData = Cache.get(params.id)
        if (cacheData) {
            try {
                cacheData.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'cache.label', default: 'Cache'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'cache.label', default: 'Cache'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cache.label', default: 'Cache'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def search = {
        if(!params.max)params.max=10
        if (!params.offset)params.offset=0

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
            flash.message = "${message(code: 'default.date.range.message')}"
            render(view:"list",model: [params: params,cacheDataTotal:0])
            return
        }
        
        def search = {
            if(params.message){
                like("message","%${params.message}%")
            }
            if (params.remoteIp){
                like("remoteIp","%${params.remoteIp}%")
            }
            if(params.lowDate){
                ge("dateCreated",lowDate1)
            }
            if(params.highDate){
                le("dateCreated",highDate1)
            }
            order("dateCreated","desc")
        }
        
        def cacheDataList = Cache.createCriteria().list(params,search)
        flash.message = "${message(code: 'default.data.number.message', args: [cacheDataList.totalCount])}"
        render(view:"list",model:[cacheDataList:cacheDataList,cacheDataTotal: cacheDataList.totalCount,params: params])
        
    }
}

