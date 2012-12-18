package com.bssi

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class ProviderTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        flash.message = ""
        [providerTypeDataList: ProviderType.list(params), providerTypeDataTotal: ProviderType.count()]
    }
    def listFlash() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        render (view:'list',model:[providerTypeDataList: ProviderType.list(params), providerTypeDataTotal: ProviderType.count()])
    }

    def create() {
        [providerTypeData: new ProviderType(params)]
    }

    def save() {
        def provderTypeExist = ProviderType.findByType(params.type)
        if(provderTypeExist){
            flash.message = "The Provder Type ${params.type} is already exist"
            redirect(action: "listFlash")
            return
        }
        def providerTypeData = new ProviderType(params)
//        println(providerTypeData)
        if (!providerTypeData.save(flush: true)) {
            flash.message = "Save failed"
            render(view: "create", model: [providerTypeData: providerTypeData])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'providerType.label', default: 'ProviderType'), providerTypeData.id])
        redirect(action: "showFlash", id: providerTypeData.id)
    }

    def show() {
        def providerTypeData = ProviderType.get(params.id)
        if (!providerTypeData) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'providerType.label', default: 'ProviderType'), params.id])
            redirect(action: "listFlash")
            return
        }
        flash.message=  ""
        [providerTypeData: providerTypeData]
    }

    def showFlash() {
        def providerTypeData = ProviderType.get(params.id)
        if (!providerTypeData) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'providerType.label', default: 'ProviderType'), params.id])
            redirect(action: "listFlash")
            return
        }

        render (view: 'show',model:[providerTypeData: providerTypeData])
    }

    def edit() {
        def providerTypeData = ProviderType.get(params.id)
        if (!providerTypeData) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'providerType.label', default: 'ProviderType'), params.id])
            redirect(action: "listFlash")
            return
        }

        [providerTypeData: providerTypeData]
    }

    def update() {
        def providerTypeData = ProviderType.get(params.id)
        if (!providerTypeData) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'providerType.label', default: 'ProviderType'), params.id])
            redirect(action: "listFlash")
            return
        }
        def provderTypeExist = ProviderType.findByType(params.type)
        if(provderTypeExist&&provderTypeExist.id!=providerTypeData.id){
            flash.message = "The Provder Type ${params.type} is already exist"
            redirect(action: "listFlash")
            return
        }
        if (params.version) {
            def version = params.version.toLong()
            if (providerTypeData.version > version) {
                providerTypeData.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'providerType.label', default: 'ProviderType')] as Object[],
                        "Another user has updated this ProviderType while you were editing")
                render(view: "edit", model: [providerTypeData: providerTypeData])
                return
            }
        }

        providerTypeData.properties = params

        if (!providerTypeData.save(flush: true)) {
            flash.message = "Update failed"
            redirect(action: "listFlash")
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'providerType.label', default: 'ProviderType'), providerTypeData.id])
        redirect(action: "showFlash", id: providerTypeData.id)
    }

    def delete() {
        def providerTypeData = ProviderType.get(params.id)
        if (!providerTypeData) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'providerType.label', default: 'ProviderType'), params.id])
            redirect(action: "listFlash")
            return
        }

        try {
            providerTypeData.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'providerType.label', default: 'ProviderType'), params.id])
            redirect(action: "listFlash")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'providerType.label', default: 'ProviderType'), params.id])
            redirect(action: "showFlash", id: params.id)
        }
    }

    def search () {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if(!params.offset) params.offset = 0

        def searchProvderType = {
            if(params.type){
                like('type',"%${params.type}%")
            }
            if(params.conmments){
                like('conmments',"%${params.conmments}%")
            }
        }

        def providerTypeDataList = ProviderType.createCriteria().list(params,searchProvderType)

        if(providerTypeDataList) {
            flash.message = "${providerTypeDataList.totalCount} Provider Type(s) found"
        } else{
            flash.message = "No data found"
        }

        render (view: 'list',model: [providerTypeDataList:providerTypeDataList,providerTypeDataTotal:providerTypeDataList.totalCount])
    }

    def treeTest = {
        def listArray1 = new ArrayList()
        def listArray2 = new ArrayList()
        int n = 0

        for(int i=0;i<10;i++){
            def map = new HashMap()
            map.put('code',1+"0"+i+1)
                map.put('segment','MSH')
                map.put('field','Field'+i+2)
                map.put('subfield','subField'+i+2)
            listArray1.add(map)
        }
        def mapsegment = new HashMap()
        mapsegment.put('code',1)
        mapsegment.put('segment','MSH')
        mapsegment.put('field','Field'+1)
        mapsegment.put('subfield','subField'+1)
        mapsegment.put('children',listArray1)

        for(int i=0;i<10;i++){
            def map = new HashMap()
            map.put('code',2+"0"+i+1)
            map.put('segment','PID')
            map.put('field','Field'+i)
            map.put('subfield','subField'+i)
            listArray2.add(map)
        }

        def mapsegment2 = new HashMap()
        mapsegment2.put('code',2)
        mapsegment2.put('segment','MSH')
        mapsegment2.put('field','Field'+1)
        mapsegment2.put('subfield','subField'+1)
        mapsegment2.put('children',listArray2)


        def list12 = new ArrayList()
        list12.add(mapsegment)
        list12.add(mapsegment2)
        def  jsonMap = new HashMap()
        jsonMap.put('total',50)
        jsonMap.put('rows',list12)
        render jsonMap as JSON
    }

}
