package com.bssi

import grails.converters.JSON

class MappingRuleController {
    def  menuService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        saveFlag()
        flash.message=""
        [mappingRuleDataList: MappingRule.list(params), mappingRuleDataTotal: MappingRule.count()]
    }

    def create = {
        def mappingRuleData = new MappingRule()
        mappingRuleData.properties = params
        flash.message = ""
        return [mappingRuleData: mappingRuleData]
    }

    def save = {
        def mappingRuleData = new MappingRule(params)
        if (mappingRuleData.save(flush: true)){
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'mappingRuleGroup.label', default: 'MappingRuleGroup'), mappingRuleData.id])}"
            redirect(action: "show", id: mappingRuleData.id)
        }else{
            render(view: "create", model: [mappingRuleGroupData: mappingRuleData])
        }
    }

    def show = {
        def mappingRuleData = MappingRule.get(params.id)
        if (!mappingRuleData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mappingRule.label', default: 'MappingRule'), params.id])}"
            redirect(action: "list")
        }
        else {
            flash.message = ""
            [mappingRuleData: mappingRuleData]
        }
    }

    def edit = {
        def mappingRuleData = MappingRule.get(params.id)
        if (!mappingRuleData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mappingRule.label', default: 'MappingRule'), params.id])}"
            redirect(action: "list")
        }
        else {
            flash.message = ""
            return [mappingRuleData: mappingRuleData]
        }
    }

    def update = {
        def mappingRuleData = MappingRule.get(params.id)
        if (mappingRuleData) {
            if (params.version) {
                def version = params.version.toLong()
                if (mappingRuleData.version > version) {
                    mappingRuleData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'mappingRule.label', default: 'MappingRule')] as Object[], "Another user has updated this MappingRule while you were editing")
                    render(view: "edit", model: [mappingRuleData: mappingRuleData])
                    return
                }
            }
            mappingRuleData.properties = params
            def mappingRuleGroup = MappingRuleGroup.get(Long.parseLong(params.mappingRuleGroup1))
            mappingRuleData.mappingRuleGroup = mappingRuleGroup
            if (!mappingRuleData.hasErrors() && mappingRuleData.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'mappingRule.label', default: 'MappingRule'), mappingRuleData.id])}"
                redirect(action: "show", id: mappingRuleData.id)
            }
            else {
                render(view: "edit", model: [mappingRuleData: mappingRuleData])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mappingRule.label', default: 'MappingRule'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def mappingRuleData = MappingRule.get(params.id)
        if (mappingRuleData) {
            try {
                mappingRuleData.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'mappingRule.label', default: 'MappingRule'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'mappingRule.label', default: 'MappingRule'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mappingRule.label', default: 'MappingRule'), params.id])}"
            redirect(action: "list")
        }
    }

    def createRule = {

        return

    }
    def search = {

        if(!params.max) params.max =10
        if (!params.offset) params.offset = 0
        def searchTemplate = {

            if(params.type){
                eq('type',params.type)
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
        }

        def templateDataList = Template.createCriteria().list(params,searchTemplate)

        render(view: 'selectTemplate',model: [params:params,templateDataList:templateDataList,templateDataTotal: templateDataList.totalCount])
    }

    def selectTemplate = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [templateDataList: Template.list(params), templateDataTotal: Template.count()]
    }

    def searchMappingRule = {
        if(!params.max) params.max = 10
        if (!params.offset) params.offset = 0

        def searchRule = {
            if(params.mappingRuleGroup){
                mappingRuleGroup{
                    like('name',"%${params.mappingRuleGroup}%")
                }
            }

            if(params.operator){
                like("operator","%${params.operator}%")
            }

            if (params.fromSegment){
                like('fromSegment',"%${params.fromSegment}%")
            }

            if (params.fromIndex){
                eq('fromIndex',Integer.parseInt(params.fromIndex))
            }

            if (params.fromSubIndex){
                eq('fromSubIndex',Integer.parseInt(params.fromSubIndex))
            }

            if (params.toSegment){
                like('toSegment',"%${params.toSegment}%")
            }

            if (params.toIndex){
                eq('toIndex',Integer.parseInt(params.toIndex))
            }

            if (params.toSubIndex){
                eq('toSubIndex',Integer.parseInt(params.toSubIndex))
            }
        }

        def mappingRuleDataList  = MappingRule.createCriteria().list(params,searchRule)
        if(mappingRuleDataList){
            flash.message = "${mappingRuleDataList.totalCount} Rule(s) found!"
        }else{
            flash.message = "No data found!"
        }


        render(view: 'list',model: [params:params,mappingRuleDataList:mappingRuleDataList,mappingRuleDataTotal: mappingRuleDataList.totalCount])
    }

    def createTemplate = {
        return
    }

    def saveTemplate = {
        def templateData
        Template.withTransaction {status->
            def mappingRuleGroupData
            if(params.mappingRuleGroup){
                mappingRuleGroupData = MappingRuleGroup.get(Long.parseLong(params.mappingRuleGroup))
                if(!mappingRuleGroupData){
                    render"Mapping Rule Group is not found"
                    return
                }
            }
            def templateExist = Template.findAllWhere(
                    fromApplication: mappingRuleGroupData.fromApplication,
                    toApplication: mappingRuleGroupData.toApplication,
                    type:params.type
            )
            if(templateExist){
                render "The Template is already exist!"
                return
            }
            if(params.hl7message){
                def countTemplate = 0
                def hl7message = params.hl7message
                def segment = hl7message.split("\n")
                if(segment.size()<=1) {
                    render"The Template format is wrong!"
                    return
                }
                for (i in 0..segment.size()-1){
                    def fieldlist = segment[i].split("\\|") //field list
                    if(fieldlist.size()<=1){
                        render"The Template format is wrong!"
                        return
                    }
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
                            if(j==0){
                                templateData.field = ""
                            }else{
                                templateData.field = field[0]
                            }
                            templateData.fieldIndex = j
                            templateData.required = required
                            templateData.repeatable = repeatable
                            templateData.description = ""
                            if (subfield.size()==1){
                                templateData.subfieldIndex=0
                                templateData.subfield = ""
                            }else {
                                templateData.subfieldIndex = k+1
                                templateData.subfield = field[0]
                                templateData.field = ""
                                templateData.fieldIndex = j
                            }
                            templateData.toApplication = mappingRuleGroupData.toApplication
                            templateData.fromApplication = mappingRuleGroupData.fromApplication
                            templateData.sortNum = ++countTemplate

                            if (!templateData.save(flush: true)){
                                log.debug(templateData.errors)
                                status.setRollbackOnly()
                                render "Template Message save failed!"
                                return
                            }
                        }
                    }
                }
                render "Template Message saved success!"
                return
            } else{
                render "Template Message is null!"
                return
            }
        }
    }

    def createRules = {
        if(params.id){
            def mappingRuleData = MappingRule.get(Long.parseLong(params.id))
            if (mappingRuleData){
                def mappingRuleGroupData = mappingRuleData.mappingRuleGroup
                return [mappingRuleGroupData:mappingRuleGroupData]
            }
        }else{
            return
        }
    }
    def updateRule = {
        MappingRule.withTransaction {status->
            def mappingRuleData = null
            def mappingRuleDataSet = null
            String conditionsStr = null
            def toSegment = null
            def toIndex = null
            def toSubIndex = null
            def templateData = null
            def msg = 0
            if (params.required == '1'){
                params.required='true'
            }else if (params.reqired=='0'){
                params.reqired = 'false'
            }
            if (params.repeatable=='1'){
                params.repeatable ='true'
            }else if(params.repeatable=='0'){
                params.repeatable = 'false'
            }
            if(params.operator=='MOV'){
                toSegment = params.toSegment.toUpperCase()
                toIndex = Integer.parseInt(params.toIndex)
                toSubIndex = Integer.parseInt(params.toSubIndex)
            }else{
                toSegment = ""
                toIndex = 0
                toSubIndex = 0
            }
            if(!params.segmentIndex){
                params.segmentIndex = "FIRST"
            }
//            if(params.conditions){
//                conditionsStr = params.conditions
//            }
//            if (conditionsStr){
//                def tempStr = conditionsStr.split("\\|")
//                if(tempStr.length>=3){
//                    toSegment = tempStr[0].toUpperCase()
//                    toIndex = Integer.parseInt(tempStr[1])
//                    toSubIndex = Integer.parseInt(tempStr[2])
//                }
//            }
            if(params.operator=='SET'&&toSegment){      //make sure the input infomation right
                def templateExist = Template.findWhere(
                        segment: toSegment,
                        fieldIndex: toIndex,
                        subfieldIndex: toSubIndex,
                        flag:0
                )
                if(!templateExist){
                    render "You input the From Template does exist!"
                    return
                }
            }else if (params.operator&&toSegment){ //验证 输入的From Segment 在模版中是存在的
                def templateExist = Template.findWhere(
                        segment: toSegment,
                        fieldIndex: toIndex,
                        subfieldIndex: toSubIndex,
                        flag:0
                )
                if(!templateExist){
                    render "You input the From Template does exist!"
                    return
                }
            }
            if(params.id){                                             //update template  tempalte 有id

                templateData = Template.get(Long.parseLong(params.id))

                if (templateData){          //所选id 查询到所需要的值 一下为对tmeplate的更新操作
                    templateData.segment = params.segment
                    if(params.field) {
                        templateData.field = params.field
                    }else{
                        templateData.field = ""
                    }

                    if (params.subfield){
                        templateData.subfield = params.subfield
                    }
                    if (params.subfieldIndex&&params.subfieldIndex!='0') {
                        templateData.subfieldIndex = Integer.parseInt(params.subfieldIndex)
                    }
                    templateData.required = Boolean.parseBoolean(params.required)
                    templateData.repeatable = Boolean.parseBoolean(params.repeatable)

                    if(params.mappingRuleGroup){    //判断 传入的 MappingRuleGroup id 是否存在
                        def mappingRuleGroup = MappingRuleGroup.get(Long.parseLong(params.mappingRuleGroup))
                        if(mappingRuleGroup){
                            //判断 不能重复的 segment 和 field 不重复存储
                            def segmentExist = Template.findAllWhere(
                                    fromApplication: mappingRuleGroup.fromApplication,
                                    toApplication: mappingRuleGroup.toApplication,
                                    type:templateData.type,
                                    segment: params.segment,
                                    flag:0,
                                    repeatable: false,
                                    fieldIndex:0
                            )
                            if(segmentExist.size()>1){
                                render "The Segment is already exist!"
                                return
                            }
                            def fieldExist = Template.findAllWhere(
                                    fromApplication: mappingRuleGroup.fromApplication,
                                    toApplication: mappingRuleGroup.toApplication,
                                    segment: params.segment,
                                    type: templateData.type,
                                    field: params.field,
                                    subfield: params.subfiled,
                                    flag:0,
                                    repeatable: false
                            )
                            if(fieldExist.size()>1){
                                render "The Field is already exist!"
                                return
                            }
                            if (params.fieldIndex&&params.fieldIndex!='0'){  //
                                if(templateData.fieldIndex != Integer.parseInt(params.fieldIndex)){ //如果所选的fieldindex 被改变 则他后面的fieldIndex 也一次增长
                                    def search = {
                                        ge('sortNum',templateData.sortNum)
                                        eq('type',templateData.type)
                                        eq('fromApplication',mappingRuleGroup.fromApplication)
                                        eq('toApplication',mappingRuleGroup.toApplication)
                                        eq('segment',templateData.segment)
                                        order('sortNum','ASC')
                                    }
                                    def templateChangeIndexList = Template.createCriteria().list(search)
                                    templateData.fieldIndex = Integer.parseInt(params.fieldIndex)
                                    int countFieldIndexNum = 1
                                    templateChangeIndexList.each{
                                        if(countFieldIndexNum!=1){
                                            it.fieldIndex = templateData.fieldIndex + countFieldIndexNum-1
                                            if(!it.save(flush: true)){
                                                status.setRollbackOnly()
                                                render 'Template save failed!'
                                                return
                                            }
                                        }
                                        countFieldIndexNum++
                                    }
                                }
                            }
                            if (!templateData.save(flush: true)){   //保存 template
                                log.debug(templateData.errors)
                                status.setRollbackOnly()
                                render 'Template save failed!'
                                return
                            }

                            mappingRuleDataSet = MappingRule.findWhere(  //查找 所有 set 的rule 查找 set rules 根据 template 的书属性和 rule 的to 属性进行查找
                                    toIndex:templateData.fieldIndex,
                                    toSegment:templateData.segment,
                                    toSubIndex:templateData.subfieldIndex,
                                    mappingRuleGroup:mappingRuleGroup,
                                    operator: 'SET',

                            )

                            if(mappingRuleDataSet){
                                mappingRuleData = mappingRuleDataSet
                            } else{
                                mappingRuleData = MappingRule.findWhere(  //查找除了 operator is set 的 rule 根据 rule的 from 属性和 tempalte 属性进行查找
                                        fromIndex:templateData.fieldIndex,
                                        fromSegment:templateData.segment,
                                        fromSubIndex:templateData.subfieldIndex,
                                        mappingRuleGroup:mappingRuleGroup,

                                )
                            }
                            if (mappingRuleData){ //the rule is exist  update rule
                                if(params.operator){
                                     if(params.operator=='SET'){
                                        if(!toSegment&&!params.value){
                                            render "The operator SET does not have target or value"
                                            return
                                        }
                                        if (params.segment){
                                            mappingRuleData.toSegment = params.segment
                                        } else {
                                            mappingRuleData.toSegment=''
                                        }
                                        if (params.fieldIndex){
                                            mappingRuleData.toIndex = Integer.parseInt(params.fieldIndex)
                                        } else {
                                            mappingRuleData.toIndex=0
                                        }
                                        if (params.subfieldIndex){
                                            mappingRuleData.toSubIndex= Integer.parseInt(params.subfieldIndex)
                                        } else {
                                            mappingRuleData.toSubIndex=0
                                        }
                                        if (params.operator){
                                            mappingRuleData.operator = params.operator
                                        }  else {
                                            render"The operator is null"
                                            return
                                        }
                                        if (toSegment) {
                                            mappingRuleData.fromSegment = toSegment
                                        } else {
                                            mappingRuleData.fromSegment=''
                                        }
                                        if (toIndex) {
                                            mappingRuleData.fromIndex = toIndex
                                        } else {
                                            mappingRuleData.fromIndex=0
                                        }
                                        if (toSubIndex) {
                                            mappingRuleData.fromSubIndex = toSubIndex
                                        } else {
                                            mappingRuleData.fromSubIndex=0
                                        }
                                        if(params.scriptext){
                                            mappingRuleData.scriptext = params.scriptext
                                        }
                                        if(params.value){
                                            mappingRuleData.value=params.value
                                        } else{
                                            mappingRuleData.value=""
                                        }
                                        mappingRuleData.mappingRuleGroup =  mappingRuleGroup
                                        if (!mappingRuleData.save(flush: true)){
                                            log.debug(mappingRuleData.errors)
                                            status.setRollbackOnly()
                                            render 'The rule save failed!'
                                            return
                                        }
                                    }else if(params.operator=="MOV"){
                                        if (!toSegment){
                                            render "The operator MOV does not have target value"
                                            return
                                        }
                                        if (params.segment){
                                            mappingRuleData.fromSegment = params.segment
                                        } else {
                                            mappingRuleData.fromSegment=''
                                        }
                                        if (params.fieldIndex){
                                            mappingRuleData.fromIndex = Integer.parseInt(params.fieldIndex)
                                        } else {
                                            mappingRuleData.fromIndex=0
                                        }
                                        if (params.subfieldIndex){
                                            mappingRuleData.fromSubIndex = Integer.parseInt(params.subfieldIndex)
                                        } else {
                                            mappingRuleData.fromSubIndex=0
                                        }
                                        if (params.operator){
                                            mappingRuleData.operator = params.operator
                                        }  else {
                                            mappingRuleData.operator=''
                                        }
                                        if (toSegment) {
                                            mappingRuleData.toSegment = toSegment
                                        } else {
                                            mappingRuleData.toSegment=''
                                        }
                                        if (toIndex) {
                                            mappingRuleData.toIndex = toIndex
                                        } else {
                                            mappingRuleData.toIndex=0
                                        }
                                        if (toSubIndex) {
                                            mappingRuleData.toSubIndex = toSubIndex
                                        } else {
                                            mappingRuleData.toSubIndex=0
                                        }
                                        if(params.scriptext){
                                            mappingRuleData.scriptext = params.scriptext
                                        }
                                        if(params.operator=="MOV"&&params.copy=="true"){ //MOV 操作 分为 copy 和 blank params.coopy = true 为copy 在 rule 的 value 属性设置为 CPY 反之为空
                                            mappingRuleData.value="CPY"
                                        }else{
                                            mappingRuleData.value = ""
                                        }
                                        mappingRuleData.mappingRuleGroup =  mappingRuleGroup
                                        if (!mappingRuleData.save(flush: true)){
                                            log.debug(mappingRuleData.errors)
                                            status.setRollbackOnly()
                                            render 'The rule save failed!'
                                            return
                                        }
                                    } else if(params.operator=="BLK"){
                                         if (params.required=='true'){  // 如果 operator is BLK 的话 判断 required 属性 ，如果为真,将不能被删除 设 msg =1
                                             msg=1
                                         }else {
                                             if (params.segment){
                                                 mappingRuleData.fromSegment = params.segment
                                             } else {
                                                 mappingRuleData.fromSegment=''
                                             }
                                             if (params.fieldIndex){
                                                 mappingRuleData.fromIndex = Integer.parseInt(params.fieldIndex)
                                             } else {
                                                 mappingRuleData.fromIndex=0
                                             }
                                             if (params.subfieldIndex){
                                                 mappingRuleData.fromSubIndex = Integer.parseInt(params.subfieldIndex)
                                             } else {
                                                 mappingRuleData.fromSubIndex=0
                                             }
                                             if (params.operator){
                                                 mappingRuleData.operator = params.operator
                                             }  else {
                                                 mappingRuleData.operator=''
                                             }
                                             if (toSegment) {
                                                 mappingRuleData.toSegment = toSegment
                                             } else {
                                                 mappingRuleData.toSegment=''
                                             }
                                             if (toIndex) {
                                                 mappingRuleData.toIndex = toIndex
                                             } else {
                                                 mappingRuleData.toIndex=0
                                             }
                                             if (toSubIndex) {
                                                 mappingRuleData.toSubIndex = toSubIndex
                                             } else {
                                                 mappingRuleData.toSubIndex=0
                                             }
                                             if(params.segmentIndex){
                                                 mappingRuleData.value=params.segmentIndex
                                             }
                                             mappingRuleData.mappingRuleGroup =  mappingRuleGroup
                                             if (!mappingRuleData.save(flush: true)){
                                                 log.debug(mappingRuleData.errors)
                                                 status.setRollbackOnly()
                                                 render 'The rule save failed!'
                                                 return
                                             }
                                         }
                                     } else if(params.operator=="MAP"){
                                         if (params.segment){
                                             mappingRuleData.fromSegment = params.segment
                                         } else {
                                             mappingRuleData.fromSegment=''
                                         }
                                         if (params.fieldIndex){
                                             mappingRuleData.fromIndex = Integer.parseInt(params.fieldIndex)
                                         } else {
                                             mappingRuleData.fromIndex=0
                                         }
                                         if (params.subfieldIndex){
                                             mappingRuleData.fromSubIndex = Integer.parseInt(params.subfieldIndex)
                                         } else {
                                             mappingRuleData.fromSubIndex=0
                                         }
                                         if (params.operator){
                                             mappingRuleData.operator = params.operator
                                         }  else {
                                             mappingRuleData.operator=''
                                         }
                                         if (toSegment) {
                                             mappingRuleData.toSegment = toSegment
                                         } else {
                                             mappingRuleData.toSegment=''
                                         }
                                         if (toIndex) {
                                             mappingRuleData.toIndex = toIndex
                                         } else {
                                             mappingRuleData.toIndex=0
                                         }
                                         if (toSubIndex) {
                                             mappingRuleData.toSubIndex = toSubIndex
                                         } else {
                                             mappingRuleData.toSubIndex=0
                                         }
                                         if(params.segmentIndex){
                                             mappingRuleData.value=params.segmentIndex
                                         }
                                         mappingRuleData.other=params.mapValue
                                         mappingRuleData.scriptext=params.mappingRuleConditions
                                         mappingRuleData.value=params.conditionsValue
                                         mappingRuleData.mappingRuleGroup =  mappingRuleGroup
                                         if (!mappingRuleData.save(flush: true)){
                                             log.debug(mappingRuleData.errors)
                                             status.setRollbackOnly()
                                             render 'The rule save failed!'
                                             return
                                         }
                                     }
                                }
                            } else{ //rule dose not exist create a new one
                                mappingRuleData = new MappingRule()
                                if (params.operator){
                                    if(params.operator=='SET'){
                                        if(!toSegment&&!params.value){
                                            render "The operator SET does not have target or value"
                                            return
                                        }
                                        if (params.segment){
                                            mappingRuleData.toSegment = params.segment
                                        } else {
                                            mappingRuleData.toSegment=''
                                        }
                                        if (params.fieldIndex){
                                            mappingRuleData.toIndex = Integer.parseInt(params.fieldIndex)
                                        } else {
                                            mappingRuleData.toIndex=0
                                        }
                                        if (params.subfieldIndex){
                                            mappingRuleData.toSubIndex= Integer.parseInt(params.subfieldIndex)
                                        } else {
                                            mappingRuleData.toSubIndex=0
                                        }
                                        if (params.operator){
                                            mappingRuleData.operator = params.operator
                                        }  else {
                                            render"The operator is null"
                                            return
                                        }
                                        if (toSegment) {
                                            mappingRuleData.fromSegment = toSegment
                                        } else {
                                            mappingRuleData.fromSegment=''
                                        }
                                        if (toIndex) {
                                            mappingRuleData.fromIndex = toIndex
                                        } else {
                                            mappingRuleData.fromIndex=0
                                        }
                                        if (toSubIndex) {
                                            mappingRuleData.fromSubIndex = toSubIndex
                                        } else {
                                            mappingRuleData.fromSubIndex=0
                                        }
                                        if(params.scriptext){
                                            mappingRuleData.scriptext = params.scriptext
                                        }
                                        if(params.value){
                                            mappingRuleData.value=params.value
                                        } else{
                                            mappingRuleData.value=""
                                        }
                                        mappingRuleData.mappingRuleGroup =  mappingRuleGroup
                                        if (!mappingRuleData.save(flush: true)){
                                            log.debug(mappingRuleData.errors)
                                            status.setRollbackOnly()
                                            render 'The rule save failed!'
                                            return
                                        }
                                    }else if(params.operator=="MOV"){
                                        if (!toSegment){
                                            render "The operator MOV does not have target value"
                                            return
                                        }
                                        if (params.segment){
                                            mappingRuleData.fromSegment = params.segment
                                        } else {
                                            mappingRuleData.fromSegment=''
                                        }
                                        if (params.fieldIndex){
                                            mappingRuleData.fromIndex = Integer.parseInt(params.fieldIndex)
                                        } else {
                                            mappingRuleData.fromIndex=0
                                        }
                                        if (params.subfieldIndex){
                                            mappingRuleData.fromSubIndex = Integer.parseInt(params.subfieldIndex)
                                        } else {
                                            mappingRuleData.fromSubIndex=0
                                        }
                                        if (params.operator){
                                            mappingRuleData.operator = params.operator
                                        }  else {
                                            mappingRuleData.operator=''
                                        }
                                        if (toSegment) {
                                            mappingRuleData.toSegment = toSegment
                                        } else {
                                            mappingRuleData.toSegment=''
                                        }
                                        if (toIndex) {
                                            mappingRuleData.toIndex = toIndex
                                        } else {
                                            mappingRuleData.toIndex=0
                                        }
                                        if (toSubIndex) {
                                            mappingRuleData.toSubIndex = toSubIndex
                                        } else {
                                            mappingRuleData.toSubIndex=0
                                        }
                                        if(params.scriptext){
                                            mappingRuleData.scriptext = params.scriptext
                                        }
                                        if(params.operator=="MOV"&&params.copy=="true"){ //MOV 操作 分为 copy 和 blank params.coopy = true 为copy 在 rule 的 value 属性设置为 CPY 反之为空
                                            mappingRuleData.value="CPY"
                                        }else{
                                            mappingRuleData.value = ""
                                        }
                                        mappingRuleData.mappingRuleGroup =  mappingRuleGroup
                                        if (!mappingRuleData.save(flush: true)){
                                            log.debug(mappingRuleData.errors)
                                            status.setRollbackOnly()
                                            render 'The rule save failed!'
                                            return
                                        }
                                    } else if(params.operator=="BLK"){
                                        if (params.required=='true'){  // 如果 operator is BLK 的话 判断 required 属性 ，如果为真,将不能被删除 设 msg =1
                                            msg=1
                                        }else {
                                            if (params.segment){
                                                mappingRuleData.fromSegment = params.segment
                                            } else {
                                                mappingRuleData.fromSegment=''
                                            }
                                            if (params.fieldIndex){
                                                mappingRuleData.fromIndex = Integer.parseInt(params.fieldIndex)
                                            } else {
                                                mappingRuleData.fromIndex=0
                                            }
                                            if (params.subfieldIndex){
                                                mappingRuleData.fromSubIndex = Integer.parseInt(params.subfieldIndex)
                                            } else {
                                                mappingRuleData.fromSubIndex=0
                                            }
                                            if (params.operator){
                                                mappingRuleData.operator = params.operator
                                            }  else {
                                                mappingRuleData.operator=''
                                            }
                                            if (toSegment) {
                                                mappingRuleData.toSegment = toSegment
                                            } else {
                                                mappingRuleData.toSegment=''
                                            }
                                            if (toIndex) {
                                                mappingRuleData.toIndex = toIndex
                                            } else {
                                                mappingRuleData.toIndex=0
                                            }
                                            if (toSubIndex) {
                                                mappingRuleData.toSubIndex = toSubIndex
                                            } else {
                                                mappingRuleData.toSubIndex=0
                                            }
                                            if(params.segmentIndex){
                                                mappingRuleData.value=params.segmentIndex
                                            }
                                            mappingRuleData.mappingRuleGroup =  mappingRuleGroup
                                            if (!mappingRuleData.save(flush: true)){
                                                log.debug(mappingRuleData.errors)
                                                status.setRollbackOnly()
                                                render 'The rule save failed!'
                                                return
                                            }
                                        }
                                    } else if(params.operator=="MAP"){
                                        if (params.segment){
                                            mappingRuleData.fromSegment = params.segment
                                        } else {
                                            mappingRuleData.fromSegment=''
                                        }
                                        if (params.fieldIndex){
                                            mappingRuleData.fromIndex = Integer.parseInt(params.fieldIndex)
                                        } else {
                                            mappingRuleData.fromIndex=0
                                        }
                                        if (params.subfieldIndex){
                                            mappingRuleData.fromSubIndex = Integer.parseInt(params.subfieldIndex)
                                        } else {
                                            mappingRuleData.fromSubIndex=0
                                        }
                                        if (params.operator){
                                            mappingRuleData.operator = params.operator
                                        }  else {
                                            mappingRuleData.operator=''
                                        }
                                        if (toSegment) {
                                            mappingRuleData.toSegment = toSegment
                                        } else {
                                            mappingRuleData.toSegment=''
                                        }
                                        if (toIndex) {
                                            mappingRuleData.toIndex = toIndex
                                        } else {
                                            mappingRuleData.toIndex=0
                                        }
                                        if (toSubIndex) {
                                            mappingRuleData.toSubIndex = toSubIndex
                                        } else {
                                            mappingRuleData.toSubIndex=0
                                        }
                                        if(params.segmentIndex){
                                            mappingRuleData.value=params.segmentIndex
                                        }
                                        mappingRuleData.other=params.mapValue
                                        mappingRuleData.scriptext=params.mappingRuleConditions
                                        mappingRuleData.value=params.conditionsValue
                                        mappingRuleData.mappingRuleGroup =  mappingRuleGroup
                                        if (!mappingRuleData.save(flush: true)){
                                            log.debug(mappingRuleData.errors)
                                            status.setRollbackOnly()
                                            render 'The rule save failed!'
                                            return
                                        }
                                    }
                                }
                            }
                        }
                    }else{ //mapping rule group dose not exist
                        render "Please select a Mapping Rule Group!"
                        return
                    }
                    if (msg==1){
                        status.setRollbackOnly()
                        render "Save failed!The field is required the operator can not be 'BLANK'!"
                        return
                    }else{
                        render "Save success"
                        return
                    }
                    return
                } else{
                    render params.field+' dose not exist!'
                    return
                }
            }
        }
    }


    def temp = {
        def sqlStr1 = ""
        def sqlStrSet = ""
        def templateMappingRule1 = null
        def templateTotal = 0
        def templateMappingRule = null
        def templateList = null
        def templateMappingRuleNum = 0
        def templateMappingRuleNumSet = 0
        ArrayList tempArray = new ArrayList()
        Map jsonMap =new HashMap()
        def mappingRuleGroupData
        if(params.mappingRuleGroup){
            mappingRuleGroupData = MappingRuleGroup.get(Long.parseLong(params.mappingRuleGroup))
            if(!mappingRuleGroupData){
                render "Mapping Rule Group is not found"
                return
            }
        }

        if (params.mappingRuleGroup){
            sqlStr1 = "select  t.id,t.segment,t.field,t.fieldIndex,t.subfield,t.subfieldIndex,t.required,t.repeatable,m.operator,CONCAT(m.toSegment,'|',m.toIndex,'|',m.toSubIndex),m.scriptext,m.value,t.sortNum,m.id,m.other"+
                    " from Template t,MappingRule m "+
                    " where t.segment=m.fromSegment and t.fieldIndex=m.fromIndex and t.subfieldIndex=m.fromSubIndex and m.mappingRuleGroup = ${params.mappingRuleGroup} and t.fromApplication = '${mappingRuleGroupData.fromApplication.id}' and t.toApplication = '${mappingRuleGroupData.toApplication.id}' and m.operator !='SET' and t.flag=0 and m.flag=0 and t.type = '${params.type}' "

            sqlStrSet = "select  t.id,t.segment,t.field,t.fieldIndex,t.subfield,t.subfieldIndex,t.required,t.repeatable,m.operator,CONCAT(m.fromSegment,'|',m.fromIndex,'|',m.fromSubIndex),m.scriptext,m.value,t.sortNum,m.id,m.other"+
                    " from Template t,MappingRule m "+
                    " where t.segment=m.toSegment and t.fieldIndex=m.toIndex and t.subfieldIndex=m.toSubIndex and m.mappingRuleGroup = ${params.mappingRuleGroup} and t.fromApplication = '${mappingRuleGroupData.fromApplication.id}' and t.toApplication = '${mappingRuleGroupData.toApplication.id}' and m.operator ='SET' and t.flag=0 and m.flag=0 and t.type = '${params.type}' "

            if (params.segment){
                sqlStr1 = sqlStr1+" and t.segment = '${params.segment}' "
                sqlStrSet = sqlStrSet+" and t.segment = '${params.segment}' "
            }
            templateMappingRule = Template.executeQuery(sqlStr1)
            templateMappingRule1 = Template.executeQuery(sqlStrSet)
            templateMappingRuleNum = templateMappingRule.size()
            templateMappingRuleNumSet = templateMappingRule1.size()
//            if(params.rows && params.page){
                //def offset = Integer.parseInt(params.rows)*(Integer.parseInt(params.page)-1) //page
                //def offset = params.int('rows')*(params.int('page')-1)
//                params.offset = params.int('rows')*(params.int('page')-1)
//                params.max = params.int('rows')
//            }else{
            // offset and max by default
//                params.offset = 0
//                params.max = 50
//            }


            if(templateMappingRule&&templateMappingRuleNum>0){
                templateMappingRule.each {
                    Map tempMap =new HashMap()
                    tempMap.put('id',it[0])
                    tempMap.put('segment',it[1])
                    tempMap.put('field',it[2])
                    tempMap.put('fieldIndex',it[3])
                    tempMap.put('subfield',it[4])
                    tempMap.put('subfieldIndex',it[5])
                    tempMap.put('required',it[6])
                    tempMap.put('repeatable',it[7])
                    tempMap.put('operator',it[8])
                    if (it[8]=='BLK'||it[8]=='MAP'){
                        tempMap.put('conditions','')
                    }else{
                        tempMap.put('conditions',it[9])
                    }
                    tempMap.put('scriptext',it[10])
                    tempMap.put('value',it[11])
                    tempMap.put('sortNum',it[12])
                    tempMap.put('ruleId',it[13])
                    tempMap.put('other',it[14])
                    tempArray.add(tempMap)
                }
            }

            if(templateMappingRule1&&templateMappingRuleNumSet>0){
                templateMappingRule1.each {
                    Map tempMap =new HashMap()
                    tempMap.put('id',it[0])
                    tempMap.put('segment',it[1])
                    tempMap.put('field',it[2])
                    tempMap.put('fieldIndex',it[3])
                    tempMap.put('subfield',it[4])
                    tempMap.put('subfieldIndex',it[5])
                    tempMap.put('required',it[6])
                    tempMap.put('repeatable',it[7])
                    tempMap.put('operator',it[8])
                    if (it[11]==''){
                        tempMap.put('conditions',it[9])
                    }else{
                        tempMap.put('conditions','')
                    }
                    tempMap.put('value',it[11])
                    tempMap.put('scriptext',it[10])
                    tempMap.put('sortNum',it[12])
                    tempMap.put('ruleId',it[13])
                    tempMap.put('other',it[14])
                    tempArray.add(tempMap)
                }
            }
            def sqlStr2 = "select  t.id,t.segment,t.field,t.fieldIndex,t.subfield,t.subfieldIndex,t.required,t.repeatable,t.sortNum" +
                    " from Template t  " +
                    " where t.id not in (select t1.id from Template t1,MappingRule m1 where t1.segment=m1.fromSegment and t1.fieldIndex=m1.fromIndex and t1.subfieldIndex=m1.fromSubIndex and m1.mappingRuleGroup = ${params.mappingRuleGroup} and t1.fromApplication = '${mappingRuleGroupData.fromApplication.id}' and t1.toApplication = '${mappingRuleGroupData.toApplication.id}' and t1.type =  '${params.type}' and m1.operator!='SET' and m1.flag=0 and t1.flag=0 ) "+
                    " and t.id not in (select t2.id from Template t2,MappingRule m2 where t2.segment=m2.toSegment and t2.fieldIndex=m2.toIndex and t2.subfieldIndex=m2.toSubIndex and m2.mappingRuleGroup = ${params.mappingRuleGroup} and t2.fromApplication = '${mappingRuleGroupData.fromApplication.id}' and t2.toApplication = '${mappingRuleGroupData.toApplication.id}' and t2.type =  '${params.type}' and m2.operator='SET' and m2.flag=0 and t2.flag=0) and t.fromApplication = '${mappingRuleGroupData.fromApplication.id}' and t.toApplication = '${mappingRuleGroupData.toApplication.id}' and t.type = '${params.type}' and t.flag=0 "
            def sqlStr21 = "select t1.id from Template t1,MappingRule m1 where t1.segment=m1.fromSegment and t1.fieldIndex=m1.fromIndex and t1.subfieldIndex=m1.fromSubIndex and m1.mappingRuleGroup = ${params.mappingRuleGroup} and t1.fromApplication = '${mappingRuleGroupData.fromApplication.id}' and t1.toApplication = '${mappingRuleGroupData.toApplication.id}' and t1.type =  '${params.type}' and m1.operator!='SET'"
            def sqlStr22 = "select t1.id from Template t1,MappingRule m1 where t1.segment=m1.toSegment and t1.fieldIndex=m1.toIndex and t1.subfieldIndex=m1.toSubIndex and m1.mappingRuleGroup = ${params.mappingRuleGroup} and t1.fromApplication = '${mappingRuleGroupData.fromApplication.id}' and t1.toApplication = '${mappingRuleGroupData.toApplication.id}' and t1.type =  '${params.type}' and m1.operator='SET'  "
//            if(params.sortField){
//                if(params.sortField!="segment"){
//                    sqlStr2=sqlStr2+" order by segment , fieldIndex "
//                }
//            }
//            if (params.segment){
//                sqlStr2 = sqlStr2+" and t.segment = '${params.segment}' "
//            }
            //sort
//            if(params.sortField&&params.sortOrder){
//                sqlStr2 = sqlStr2+" order by sortNum ${params.sortOrder},${params.sortField} ${params.sortOrder} "
//            }else{
//                sqlStr2 = sqlStr2+" order by sortNum "
//            }
            templateList = Template.executeQuery(sqlStr2)
//            def templateList111 = Template.executeQuery(sqlStr21)
//            templateList111.each{
//                println(it)
//            }

//            def templateList2 = Template.executeQuery(sqlStr22)
//            templateList2.each{
//                println(it)
//            }
            templateTotal = Template.executeQuery(sqlStr2).size()
            templateList.each{
                Map tempMap =new HashMap()
                tempMap.put('id',it[0])
                tempMap.put('segment',it[1])
                tempMap.put('field',it[2])
                tempMap.put('fieldIndex',it[3])
                tempMap.put('subfield',it[4])
                tempMap.put('subfieldIndex',it[5])
                tempMap.put('required',it[6])
                tempMap.put('repeatable',it[7])
                tempMap.put('sortNum',it[8])
                tempArray.add(tempMap)
            }
        }
//        templateList.each{
//            if(it[1]=="SFT"){
//                println(it[1]+"   "+it[3])
//            }
//        }
        for (int i=0;i<tempArray.size();i++){
//            ArrayList sortTemp = new ArrayList()
            def stemp

            for (int j=i+1;j<tempArray.size();j++){
                stemp = tempArray[i]
                if(tempArray[i].sortNum>tempArray[j].sortNum) {
                    stemp = tempArray[i]
                    tempArray[i] = tempArray[j]
                    tempArray[j] = stemp
                }
            }
        }
        def segmentNum=0
        def segmentCheck
        def tempMap
        def tempChildren
        def tempSubChildren
        def fieldNum
        def subfieldNum
        def jsonArray = new ArrayList()
        for (int i=0;i<tempArray.size();i++){
//            println(tempArray[i].segment+"    "+i)
//            if(tempArray[i].segment=="PID"){
//                println(tempArray[i].segment+"   "+tempArray[i].fieldIndex)
//            }

            if(segmentCheck){
                if (tempArray[i].segment!= segmentCheck||i==tempArray.size()-1) {
                    tempMap.putAt("children",tempChildren)
                    jsonArray.add(tempMap)
                }
            }
            if(tempArray[i].fieldIndex == 0){
                segmentNum++
                segmentCheck = tempArray[i].segment
                tempArray[i].put('code',segmentCheck)
                tempMap = tempArray[i]
                tempChildren = new ArrayList()
                fieldNum=1
                subfieldNum = 1
            }else if(tempArray[i].segment==segmentCheck&&tempArray[i].fieldIndex != 0){
                tempArray[i].put('code',fieldNum)
                tempChildren.add(tempArray[i])
                fieldNum++
            }
        }
//        println(jsonArray)
        def num=templateTotal-templateMappingRuleNum-templateMappingRuleNumSet
        jsonMap.put('total',num)
        jsonMap.put('rows',jsonArray)
        render jsonMap as JSON
    }

    def deleteTemplateField = {
        Template.withTransaction{status->
            if (params.id){
                def templateData = Template.get(Long.parseLong(params.id))
                def mappingRuleGroupData  = MappingRuleGroup.get(Long.parseLong(params.mappingRuleGroup))
                if (templateData){
                    if(mappingRuleGroupData){
                        def mappingRuleData = MappingRule.findWhere(
                                fromIndex: templateData.fieldIndex,
                                fromSegment: templateData.segment,
                                fromSubIndex: templateData.subfieldIndex,
                                mappingRuleGroup: mappingRuleGroupData
                        )
                        def searchFieldIndex = {
                            eq('type',templateData.type)
                            eq('segment',templateData.segment)
                            ge('fieldIndex',templateData.fieldIndex)
                            eq('fromApplication',mappingRuleGroupData.fromApplication)
                            eq('toApplication',templateData.toApplication)
                            eq('flag',0)
                            order('sortNum',"asc")
                        }
                        def templateFieldList = Template.createCriteria().list(searchFieldIndex)
                        def countFiledIndex = 1
                        templateFieldList.each{
                            if(countFiledIndex!=1){
                                it.fieldIndex--
                                if(!it.save(flush: true)){
                                    status.setRollbackOnly()
                                    render "Delete Failed!"
                                    return
                                }
                            }
                            countFiledIndex++
                        }
                        templateData.flag=1
                        if (!templateData.save(flush: true)){
                            render 'Delete failed!'
                            return
                        }
                    } else{
                        render "Mapping Rule Group dose not exist!"
                        return
                    }
                } else{
                    render "Template dose not exist!"
                    return
                }
            }else{
                render"Template Id is null"
                return
            }
            render ""
            return
        }

    }

    def deleteSegment = {
        Template.withTransaction {status->
            if(params.id){
                def  templateData = Template.get(Long.parseLong(params.id))
                if (params.mappingRuleGroup){
                    def mappingRuleGroup = MappingRuleGroup.get(Long.parseLong(params.mappingRuleGroup))
                    if (mappingRuleGroup){
                        if (templateData) {
                            def templateList = Template.findAllWhere(
                                    fromApplication: mappingRuleGroup.fromApplication,
                                    toApplication: mappingRuleGroup.toApplication,
                                    type: params.type,
                                    segment: params.segment
                            )
                            def  mappingRuleData =  MappingRule.findAllWhere(
                                    fromSegment: params.segment,
                                    mappingRuleGroup:mappingRuleGroup
                            )
                            mappingRuleData.each{
                                it.flag=1
                                if(!it.save(flush: true)){
                                    render 'Delete failed'
                                    return
                                }
                            }
                            templateList.each{

                                it.flag=1
                                if(!it.save(flush: true)) {
                                    status.setRollbackOnly()
                                    render 'Delete failed'
                                    return
                                }
                            }
                        } else{
                            render 'The segment dose not exist!'
                            return
                        }
                    }else{
                        render "Mapping Rule Group dose not exist!"
                        return
                    }
                } else{
                    render "Mapping Rule Group is blank!"
                    return
                }

            }  else{
                render 'The segment dose not exist!'
                return
            }
            render 'Delete success!'
        }
    }

    def selectRuleGroup = {
        def mappingRuleGroupData = null
        if(params.id){
            mappingRuleGroupData=MappingRuleGroup.get(Long.parseLong(params.id))
            def arrayList = new ArrayList()
            arrayList.add(mappingRuleGroupData)
            arrayList.add(mappingRuleGroupData.fromApplication)
            arrayList.add(mappingRuleGroupData.toApplication)
            render arrayList as JSON
        }else{
            render ""
        }
    }

    /**
     * @param params.scriptText
     * @param params.mappingRuleGroup
     * @param params.processValue
     * save a script text to rule
     */
    def saveScriptText = {
        if(params.scriptText){
            if (params.mappingRuleGroup){
                def  mappingRuleGroupData = MappingRuleGroup.get(Long.parseLong(params.mappingRuleGroup))
                def mappingRuleData = MappingRule.findWhere(
                        mappingRuleGroup: mappingRuleGroupData,
                        operator: 'SCR'
                )
                if (mappingRuleGroupData){
                    if (mappingRuleData){
                        mappingRuleData.scriptext =params.scriptText
                        mappingRuleData.fromIndex = Integer.parseInt(params.processValue)
                        if (!mappingRuleData.save(flush: true)){
                            render "The Script save failed!"
                            return
                        }
                    }else{
                        mappingRuleData = new MappingRule()
                        mappingRuleData.scriptext = params.scriptText
                        mappingRuleData.mappingRuleGroup=  mappingRuleGroupData
                        mappingRuleData.toSubIndex = 0
                        mappingRuleData.fromIndex= Integer.parseInt(params.processValue)
                        mappingRuleData.fromSegment=""
                        mappingRuleData.fromSubIndex=0
                        mappingRuleData.operator="SCR"
                        mappingRuleData.other=""
                        mappingRuleData.toIndex=0
                        mappingRuleData.toSegment=""
                        mappingRuleData.toSubIndex=0
                        if (!mappingRuleData.save(flush: true)){
                            render "The Script save failed!"
                            return
                        }
                    }
                }else{
                    render "The ${params.mappingRuleGroup} dose not exist!"
                    return
                }
            }else{
                render"The ${params.mappingRuleGroup} dose not have rule!"
                return
            }
            render "Script Text save success!"
            return
        }else{
            render "Script Text is null!"
            return
        }
    }

   def scripting = {
       if(params.mappingRuleGroup){
           def  mappingRuleGroupData = MappingRuleGroup.get(Long.parseLong(params.mappingRuleGroup))
           if (mappingRuleGroupData){
               def mappingRuleData = MappingRule.findWhere(
                       mappingRuleGroup: mappingRuleGroupData,
                       operator: 'SCR'
               )
               if(mappingRuleData) {
                   return [mappingRuleData:mappingRuleData]
               }
           }
       }
       return
   }

    def deleteRule ={
        if (params.id){
            def mappingRuleData = MappingRule.get(Long.parseLong(params.id))
            if(mappingRuleData){
                mappingRuleData.flag = 1
                if (!mappingRuleData.save(flash:true)){
                    render "Delete failed"
                    return
                }
            }else{
                render "Rule is not found"
                return
            }
        }else{
            render "Rule id is null"
            return
        }
        render ''
        return
    }

    //--------------------------------------------------------save option-------------------------------------------
    def saveOption = {
        Template.withTransaction {status->
//            if(params.id){
//                def  templateData = Template.get(Long.parseLong(params.id))
//                if (params.mappingRuleGroup){
//                    def mappingRuleGroup = MappingRuleGroup.get(Long.parseLong(params.mappingRuleGroup))
//                    if (mappingRuleGroup){
//                        if (templateData) {
//
//                        } else{
//                            flash.message = "The segment dose not exist!"
//                            redirect (action:list )
//                            return
//                        }
//                    }else{
//                        flash.message = "Mapping Rule Group dose not exist!"
//                        redirect (action:list )
//                        return
//                    }
//                } else{
//                    flash.message = "Mapping Rule Group is blank!"
//                    redirect (action:list )
//                    return
//                }
//
//            }  else{
//                flash.message = "The segment dose not exist!"
//                redirect (action:list )
//                return
//            }
            def  mappingRuleGroupData = MappingRuleGroup.get(Long.parseLong(params.mappingRuleGroup))
            if(mappingRuleGroupData){
                def templateList = Template.findAllWhere(
                        fromApplication: mappingRuleGroupData.fromApplication,
                        toApplication: mappingRuleGroupData.toApplication,
                        type: params.type,
                        flag: 1
                )
                def mappingRuleDataList = MappingRule.findAllWhere(
                        mappingRuleGroup: mappingRuleGroupData,
                        flag:1
                )
                mappingRuleDataList.each{
                    if(it.flag==1){
                        try{
                            it.delete(flush:true)
                        }catch (Exception e){
                            status.setRollbackOnly()
                            render "Save failed!"
                            return
                        }
                    }
                }
                templateList.each{
                    if(it.flag==1){
                        try{
                            it.delete(flush:true)
                        }catch (Exception e){
                            status.setRollbackOnly()
                            render "Save failed!"
                            return
                        }
                    }
                }
                render "Save success!"
                return
            }else{
                render "Mapping Rule Group is not found!"
                return
            }


    }
    }

    def boolean saveFlag(){
        def templateList = Template.findAllByFlag(1)
        def mappingRuleList = MappingRule.findAllByFlag(1)
        int count = 0
        templateList.each{
            if(it.flag==1){
                count++
                it.flag=0
                it.save(flush: true)
            }
        }
        mappingRuleList.each{
            if(it.flag==1){
                count++
                it.flag=0
                it.save(flush: true)
            }
        }
        if (count==0){
            return false
        }
        return true
    }

    def recover = {
        def flag = saveFlag()
        if(!flag){
            render "No Information need to recover!"
            return
        }
        render ""
        return
    }
   //-----------------------------------insert Template segment------------------------------------------------------
    def insertSegment = {

        if(params.mappingRuleGroup){
            def templateId = Long.parseLong(params.templateId)
            //rulegroup 是否存在
            def mappingRuleGroupData = MappingRuleGroup.get(Long.parseLong(params.mappingRuleGroup))
            if(!mappingRuleGroupData){
                render "Mapping Rule Group is not found!"
                return
            }
            def templateNum = Template.get(templateId)
            def templateData = new Template()
            if(!templateNum){
               render"Insert failed"
               return
            }

            //判断模版是否存在
            def template = Template.findWhere(
                    fromApplication: mappingRuleGroupData.fromApplication,
                    toApplication: mappingRuleGroupData.toApplication,
                    type: params.type
            )
            if (!template){
                render "Template is not found!"
                return
            }
            //判断是否重复插入
            if (!params.field&&params.fieldIndex=="0"&&params.repeatable=="false"){
                def segmentExist = Template.findWhere(
                        fromApplication: mappingRuleGroupData.fromApplication,
                        toApplication: mappingRuleGroupData.toApplication,
                        type: params.type,
                        segment: params.segment,
                        fieldIndex: 0,
                        repeatable: false,
                        flag: 0
                )
                if (segmentExist){
                    render "The Segment "+params.segment+" is already exist!"
                    return
                }
            }

            if(params.field&&params.fieldIndex!="0"){
                def fieldExist = Template.findWhere(
                        fromApplication: mappingRuleGroupData.fromApplication,
                        toApplication: mappingRuleGroupData.toApplication,
                        type: params.type,
                        segment: params.segment,
                        fieldIndex: Integer.parseInt(params.fieldIndex),
                        field: params.field,
                        repeatable: false,
                        flag: 0
                )
                if (fieldExist){
                    render "The field "+params.field+" is already exist!"
                    return
                }
            }
            def templateSegment = SegmentTemplate.findAllBySegment(params.segment)
            def fieldSize =0
            if(templateSegment) {
                fieldSize = templateSegment.size()
            }
            templateData.sortNum = insertSegmentSortNum(mappingRuleGroupData,templateNum,params.type,params.field,Integer.parseInt(params.fieldIndex),fieldSize)
            if(templateData.sortNum ==0){
                render "Insert Failed"
                return
            }
            if(params.segment){
                templateData.segment = params.segment.toUpperCase()
            }

            if(params.field){
                templateData.field = params.field
            }
            if(params.fieldIndex){
                templateData.fieldIndex = Integer.parseInt(params.fieldIndex)
            }
            templateData.required = Boolean.parseBoolean(params.required)
            templateData.repeatable = Boolean.parseBoolean(params.repeatable)
            templateData.toApplication = mappingRuleGroupData.toApplication
            templateData.fromApplication = mappingRuleGroupData.fromApplication
            templateData.type = params.type
            if(!templateData.save(flush: true)){
                render "Save Failed!"
                return
            }


            def counts=1
            if(templateSegment){
                templateSegment.each{
                    def templateDataNew = new Template()
                    templateDataNew.segment = it.segment
                    templateDataNew.field = it.field
                    templateDataNew.fieldIndex = it.fieldIndex
                    templateDataNew.required = it.required
                    templateDataNew.repeatable = it.repeatable
                    templateDataNew.toApplication = mappingRuleGroupData.toApplication
                    templateDataNew.fromApplication = mappingRuleGroupData.fromApplication
                    templateDataNew.type = params.type
                    templateDataNew.sortNum = templateData.sortNum+counts
                    if(!templateDataNew.save(flush: true)){
                        render "Save Failed!"
                        return
                    }
                    counts++
                }
            }
            render ""
            return
        }else{
            render "Mapping Rule Group id is null!"
            return
        }
    }


    /**
     *
     * @param mappingRuleGroup 关联的mappingRuleGroup
     * @param Template  需要插入的节点
     * @param messageType  Template field
     * @param field  Template field
     * @return 需要插入的序列号就是 sortNum
     *
     */


    def int insertSegmentSortNum(MappingRuleGroup mappingRuleGroup,Template template,String messageType,String field,int fieldIndex,int fieldSize){
        Template.withTransaction{status->
            def search
            int returnNum
            def segment = template.segment
            if(field){
                search = {
                    ge('sortNum',template.sortNum)
                    eq('type',messageType)
                    eq('fromApplication',mappingRuleGroup.fromApplication)
                    eq('toApplication',mappingRuleGroup.toApplication)
                    order('sortNum','ASC')
                }
            } else{
                search = {
                    ge('sortNum',template.sortNum)
                    eq('type',messageType)
                    eq('fromApplication',mappingRuleGroup.fromApplication)
                    eq('toApplication',mappingRuleGroup.toApplication)
                    order('sortNum','ASC')
                }
            }
            def templateList = Template.createCriteria().list(search)

            int count = 0
            if(field){
                templateList.each{
                    count++
                    if(count==1){
                        returnNum=it.sortNum
                    }
                    if(count>=1){
                        it.sortNum ++
                        if(it.segment==segment){
                            it.fieldIndex = fieldIndex+count-1
                        }
                        if(!it.save(flush:true)){

                            status.setRollbackOnly()
                            return 0;
                        }
                    }
                }
            } else{
                if(templateList){
                    def lastSegmentNum = 0
                    templateList.each{
                        lastSegmentNum = it.sortNum
                        if(it.segment!=segment){
                            count++
                        }
                        if(count==1){
                            returnNum=it.sortNum
                        }
                        if(count>0){
                            it.sortNum = it.sortNum+fieldSize +1
                            if(!it.save(flush:true)){
                                status.setRollbackOnly()
                                return 0;
                            }
                        }
                    }
                    if(returnNum==0&&lastSegmentNum!=0){
                        returnNum = lastSegmentNum + 1
                    }
                }else{
                    return 0
                }
            }
            if(field){
                return returnNum+1
            }
            return returnNum
        }
    }

    def deleteAllTemplate = {
        Template.withTransaction{status->
            if(params.mappingRuleGroup){
                def mappingRuleGroupData = MappingRuleGroup.get(Long.parseLong(params.mappingRuleGroup))
                if(mappingRuleGroupData){
                    def templateList = Template.findAllWhere(
                            fromApplication: mappingRuleGroupData.fromApplication,
                            toApplication: mappingRuleGroupData.toApplication,
                            type: mappingRuleGroupData.type
                    )
                    templateList.each{
                        it.flag=1
                        if(!it.save(flush: true)){
                            status.setRollbackOnly()
                            render "Delete Failed!"
                            return
                        }
                    }
                }else{
                    render "Mapping Rule Group is not found!"
                    return
                }
            }else{
                render"Mapping Rule Group Id is null!"
                return
            }
            render""
            return
        }
    }

    def searchMappingRuleGroup = {
        if(!params.max)params.max=10
        if(!params.offset)params.offset=0
        def searchMappingRuleGroup={
            if(params.ruleGroupName){
                like("name","%${params.ruleGroupName}%")
            }
            if (params.type){
                like("type","%${params.type}%")
            }
            if (params.toApplication){
                toApplication{
                    like("name","%${params.toApplication}%")
                }
            }
            if (params.fromApplication){
                fromApplication{
                    like("name","%${params.fromApplication}%")
                }
            }

            if(params.enabled){
                eq("activeInd",Boolean.parseBoolean(params.enabled))
            }
            order("dateCreated","desc")
        }
        def mappingRuleGroupDataList = MappingRuleGroup.createCriteria().list(params,searchMappingRuleGroup)
        if(mappingRuleGroupDataList){
            flash.message = "${mappingRuleGroupDataList.totalCount} Mapping Rule Group(s) found!"
        } else{
            flash.message = "No data found!"
        }

        render(view: 'selectMappingRuleGroup',model: [mappingRuleGroupDataList:mappingRuleGroupDataList,mappingRuleGroupDataTotal: mappingRuleGroupDataList.totalCount,params: params])
    }

    def deleteSegmentRule = {
        if(params.ruleGroup){
            if(!params.segment){
                render "Segment Name si null"
                return
            }
            def  mappingRuleGroupData = MappingRuleGroup.get(Long.parseLong(params.ruleGroup))

            if (mappingRuleGroupData){
                def segmentNum = Template.findAllByToApplicationAndFromApplicationAndSegmentAndTypeAndFieldIndex(
                        mappingRuleGroupData.toApplication,
                        mappingRuleGroupData.fromApplication,
                        params.segment,
                        mappingRuleGroupData.type,
                        0
                )
                if (segmentNum){
                    def segmentNumSize = segmentNum.size()
                    if (segmentNumSize==1){
                        if (params.checkValue!='FIRST'&&params.checkValue!='ALL'){
                            render "Only a ${params.segment} segment "
                            return
                        }
                        def mappingRuleData = MappingRule.findByMappingRuleGroupAndFromSegmentAndOperator(mappingRuleGroupData,params.segment,'BLK')
                        if (mappingRuleData){
                            mappingRuleData.fromSegment=params.segment
                            if (params.index!='0'){
                                mappingRuleData.value=params.index
                            }else{
                                mappingRuleData.value = params.checkValue
                            }
                            mappingRuleData.operator = 'BLK'
                            if (!mappingRuleData.save(flush: true)){
                                render "Rule save faield"
                                return
                            }
                        }else{
                            mappingRuleData = new MappingRule()
                            mappingRuleData.toSegment=''
                            mappingRuleData.toIndex=0
                            mappingRuleData.toSubIndex=0
                            mappingRuleData.operator = 'BLK'
                            mappingRuleData.fromSegment = params.segment
                            mappingRuleData.fromIndex=0
                            mappingRuleData.fromSubIndex=0
                            mappingRuleData.scriptext = ''
                            if (params.index!='0'){
                                mappingRuleData.value=params.index
                            }else{
                                mappingRuleData.value = params.checkValue
                            }
                            mappingRuleData.mappingRuleGroup =  mappingRuleGroupData
                            if (!mappingRuleData.save(flush: true)){
                                log.debug(mappingRuleData.errors)
                                render 'The rule save failed!'
                                return
                            }
                        }
                    }else if (segmentNumSize>1){
                        if (params.checkValue!="ALL") {
                            def blankRuleAll = MappingRule.findByMappingRuleGroupAndFromSegmentAndOperatorAndValue(mappingRuleGroupData,params.segment,'BLK','ALL')
                            if (blankRuleAll){
                                render "The ${params.segment} has a rule delete all segment"
                                return
                            }
                        }

                        def mappingRuleData = MappingRule.findByMappingRuleGroupAndFromSegmentAndOperatorAndValue(mappingRuleGroupData,params.segment,'BLK',params.checkValue)
                        if(!mappingRuleData){
                            mappingRuleData = MappingRule.findByMappingRuleGroupAndFromSegmentAndOperatorAndValue(mappingRuleGroupData,params.segment,'BLK',params.index)
                        }
                        if (mappingRuleData){
                            mappingRuleData.fromSegment=params.segment
                            if (params.index!='0'){
                                mappingRuleData.value=params.index
                            }else{
                                mappingRuleData.value = params.checkValue
                            }
                            mappingRuleData.operator = 'BLK'
                            if (!mappingRuleData.save(flush: true)){
                                render "Rule save faield"
                                return
                            }
                        }else{
                            mappingRuleData = new MappingRule()
                            mappingRuleData.toSegment=''
                            mappingRuleData.toIndex=0
                            mappingRuleData.toSubIndex=0
                            mappingRuleData.operator = 'BLK'
                            mappingRuleData.fromSegment = params.segment
                            mappingRuleData.fromIndex=0
                            mappingRuleData.fromSubIndex=0
                            mappingRuleData.scriptext = ''
                            if (params.index!='0'){
                                mappingRuleData.value=params.index
                            }else{
                                mappingRuleData.value = params.checkValue
                            }
                            mappingRuleData.mappingRuleGroup =  mappingRuleGroupData
                            if (!mappingRuleData.save(flush: true)){
                                log.debug(mappingRuleData.errors)
                                render 'The rule save failed!'
                                return
                            }
                        }
                    }
                }else{
                    render "The Tamplate is not found"
                    return
                }
            }else{
                render "Mapping Rule Group is not found"
                return
            }
        }else{
            render "Mapping Rule Group is null"
            return
        }
        render""
    }

    def saveMappingRuleGroup = {
        def mappingRuleGroupMap = new HashMap()
        if(params.ruleGroupOption_id){
            def mappingRuleGroupData = MappingRuleGroup.get(Long.parseLong(params.ruleGroupOption_id))
            if(mappingRuleGroupData){
                def ruleExist = MappingRule.findByMappingRuleGroup(mappingRuleGroupData)
                def senderConfigExist = DestinationConfig.findByMappingRuleGroup(mappingRuleGroupData)

                if(ruleExist||senderConfigExist){
                    if (params.activeInd!="true"&&mappingRuleGroupData.activeInd==true){
                        if(senderConfigExist){
                            mappingRuleGroupMap.put('msg',"The Rule Group ${mappingRuleGroupData.id} in Bridge ${senderConfigExist.bridge.bridgeName} of the Sender ${senderConfigExist.id} has been used the parameter Active cannot be updated for the Inactive")
                            mappingRuleGroupMap.put('ruleGroup',"")
                            render mappingRuleGroupMap as JSON
                            return
                        }
                        if(ruleExist){
                            mappingRuleGroupMap.put('msg',"The Rule Group ${mappingRuleGroupData.id} in Rule ${ruleExist.id}  has been used the parameter Active cannot be updated for the Inactive")
                            mappingRuleGroupMap.put('ruleGroup',"")
                            render mappingRuleGroupMap as JSON
                            return
                        }
                        redirect(action: "listFlash")
                        return
                    }else{
                        params.activeInd="true"
                    }
                }
                if(params.fromApplication1&&params.toApplication1){
                    def fromApplication = Application.get(Long.parseLong(params.fromApplication1))
                    def toApplication = Application.get(Long.parseLong(params.toApplication1))
                    if(fromApplication&&toApplication) {
                        mappingRuleGroupData.fromApplication =  fromApplication
                        mappingRuleGroupData.toApplication =  toApplication
                        mappingRuleGroupData.comments =  params.comments
                        if(params.name){
                            mappingRuleGroupData.name =params.name
                        }else{
                            mappingRuleGroupMap.put('msg',"Mapping Rule Group is null")
                            mappingRuleGroupMap.put('ruleGroup',"")
                            render mappingRuleGroupMap as JSON
                            return
                        }

                        if (mappingRuleGroupData.save(flush: true)) {
                            mappingRuleGroupMap.put('msg',"")
                            mappingRuleGroupMap.put('ruleGroup',mappingRuleGroupData)
                            mappingRuleGroupMap.put('fromApplication',mappingRuleGroupData.fromApplication)
                            mappingRuleGroupMap.put('toApplication',mappingRuleGroupData.toApplication)

                            render mappingRuleGroupMap as JSON
                            return
                        }else {
                            mappingRuleGroupMap.put('msg',"Mapping Rule Group ${params.name} save failed")
                            mappingRuleGroupMap.put('ruleGroup',"")
                            render mappingRuleGroupMap as JSON
                            return
                        }
                    } else{
                        mappingRuleGroupMap.put('msg',"Application is not found")
                        mappingRuleGroupMap.put('ruleGroup',"")
                        render mappingRuleGroupMap as JSON
                        return
                    }
                }else{
                    mappingRuleGroupMap.put('msg',"Application Id is null")
                    mappingRuleGroupMap.put('ruleGroup',"")
                    render mappingRuleGroupMap as JSON
                    return
                }
            }else{
                mappingRuleGroupMap.put('msg',"Mapping Rule Group ${params.ruleGroupOption_id} is not found")
                mappingRuleGroupMap.put('ruleGroup',"")
                render mappingRuleGroupMap as JSON
                return
            }
        }else{
            def mappingRuleGroupData = new MappingRuleGroup(params)
            if(params.fromApplication1&&params.toApplication1){
                def fromApplication = Application.get(Long.parseLong(params.fromApplication1))
                def toApplication = Application.get(Long.parseLong(params.toApplication1))
                if(fromApplication&&toApplication) {
                    mappingRuleGroupData.fromApplication =  fromApplication
                    mappingRuleGroupData.toApplication =  toApplication
                    mappingRuleGroupData.comments =  params.comments
                    if(params.name){
                        mappingRuleGroupData.name =params.name
                    }else{
                        mappingRuleGroupMap.put('msg',"Mapping Rule Group is null")
                        mappingRuleGroupMap.put('ruleGroup',"")
                        render mappingRuleGroupMap as JSON
                        return
                    }
                    if (mappingRuleGroupData.save(flush: true)) {
                        mappingRuleGroupMap.put('msg',"")
                        mappingRuleGroupMap.put('ruleGroup',mappingRuleGroupData)
                        mappingRuleGroupMap.put('fromApplication',mappingRuleGroupData.fromApplication)
                        mappingRuleGroupMap.put('toApplication',mappingRuleGroupData.toApplication)
                        render mappingRuleGroupMap as JSON
                        return
                    }else {
                        mappingRuleGroupMap.put('msg',"Mapping Rule Group ${params.name} save failed")
                        mappingRuleGroupMap.put('ruleGroup',"")
                        render mappingRuleGroupMap as JSON
                        return
                    }
                } else{
                    mappingRuleGroupMap.put('msg',"Application is not found")
                    mappingRuleGroupMap.put('ruleGroup',"")
                    render mappingRuleGroupMap as JSON
                    return
                }
            }else{
                mappingRuleGroupMap.put('msg',"Application Id is null")
                mappingRuleGroupMap.put('ruleGroup',"")
                render mappingRuleGroupMap as JSON
                return
            }
        }
    }

    def saveApplication = {
         def applicationMap = new HashMap()
         if(params.id){
             def applicationData = Application.get(Long.parseLong(params.id))
             if(applicationData){
                 if(params.name){
                     def applicationExist = Application.findByNameAndApplicationVersion(params.name,params.version)
                     if (applicationExist&&applicationExist.id!=applicationData.id){
                         applicationMap.put('msg',"The Application ${params.name} is already exist")
                         applicationMap.put('application',applicationExist)
                         render applicationMap as JSON
                         return
                     }else{
                         applicationData.name = params.name
                         applicationData.applicationVersion = params.version
                         if(!applicationData.save(flush: true)){
                             applicationMap.put('msg',"Application save failed")
                             applicationMap.put('application','')
                             render applicationMap as JSON
                             return
                         }else{
                             applicationMap.put('msg',"")
                             applicationMap.put('application',applicationData)
                             render applicationMap as JSON
                             return
                         }
                     }
                 }
             }
         }else{
             if(params.name){
                 def applicationExist = Application.findByNameAndApplicationVersion(params.name,params.version)
                 if (applicationExist){
                     applicationMap.put('msg',"The Application ${params.name} is already exist")
                     applicationMap.put('application',applicationExist)
                     render applicationMap as JSON
                     return
                 }else{
                     def applicationData = new Application()
                     applicationData.name = params.name
                     applicationData.applicationVersion = params.version
                     if(!applicationData.save(flush: true)){
                         applicationMap.put('msg',"Application save failed")
                         applicationMap.put('application','')
                         render applicationMap as JSON
                         return
                     }else{
                         applicationMap.put('msg',"")
                         applicationMap.put('application',applicationData)
                         render applicationMap as JSON
                         return
                     }
                 }
             }
         }
        applicationMap.put('msg',"")
        applicationMap.put('application','')
        render applicationMap as JSON
        return
    }
}

