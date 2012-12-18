package com.bssi

import java.text.SimpleDateFormat

/**
 * Bridge Controller
 *
 * author: Wang Gang
 */
class BridgeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if (!params.offset)params.offset=0
//        def str = "select b.id,c.name,r.name,ru.name,ru.type,b.dateCreated,b.bridgeName from Bridge b,Client c,Recipient r,RuleGroup ru where b.client=c.id and "+
//                " b.recipient=r.id and b.ruleGroup = ru.id order by b.dateCreated desc "
//        def  bridgeDataList= Bridge.executeQuery(str,[offset:params.offset,max:params.max])
//        def  bridgeDataList1=Bridge.executeQuery(str)
        flash.message=""
        [bridgeDataList: Bridge.list(sort: 'dateCreated',order: 'desc',max: 10,offset: 0), bridgeDataTotal: Bridge.count()]
    }

    def listFlash = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if (!params.offset)params.offset=0
//        def str = "select b.id,c.name,r.name,ru.name,ru.type,b.dateCreated,b.bridgeName from Bridge b,Client c,Recipient r,RuleGroup ru where b.client=c.id and "+
//                " b.recipient=r.id and b.ruleGroup = ru.id order by b.dateCreated desc "
//        def  bridgeDataList= Bridge.executeQuery(str,[offset:params.offset,max:params.max])
//        def  bridgeDataList1=Bridge.executeQuery(str)
        render(view: 'list',model:[bridgeDataList: Bridge.list(sort: 'dateCreated',order: 'desc',max: 10,offset: 0), bridgeDataTotal: Bridge.count()])
    }

    def create = {
        def bridgeData = new Bridge()
        flash.message = ""
        bridgeData.properties = params
        return [bridgeData: bridgeData]
    }

    def save = {
        Bridge.withTransaction{status->
            if(params.bridgeName){
                def bridgeExist = Bridge.findByBridgeName(params.bridgeName)
                if (bridgeExist){
                    flash.message="Bridge Name is already exist!"
                    redirect(action: "listFlash")
                    return
                }
            }else{
                flash.message="Bridge Name is null!"
                redirect(action: "listFlash")
                return
            }
            def sendInfoNum = Integer.parseInt(params.sendInfoNum)
            def receiveInfoNum =Integer.parseInt(params.receiveInfoNum)
            def receiveInfoInstance = new  SourceConfig()
            def bridgeData = new Bridge(params)
            SimpleDateFormat sf = new SimpleDateFormat('MM-dd-yyyy HH:mm')
            bridgeData.dateStarted = sf.parse(params.dateStarted1)
            bridgeData.dateEnded = sf.parse(params.dateEnded1)
            if(!bridgeData.save(flush:true)){
                flash.message="Save failed!"
                redirect(action: "listFlash")
                return
            }

            if(params.rtype&&receiveInfoNum==1){
                def recipientClient
                if(params.rrecipientClientId){
                    recipientClient = Client.get(Long.parseLong(params.rrecipientClientId))
                    if(!recipientClient){
                        flash.message="Recipient Client is not exist!"
                        redirect(action: "listFlash")
                        return
                    }
                }else{
                    flash.message="Recipient Client is null!"
                    redirect(action: "listFlash")
                    return
                }

                def sourceConfigExist = SourceConfig.findByPort(Integer.parseInt(params.rport))
                if(sourceConfigExist){
                    status.setRollbackOnly()
                    flash.message="Source Port is already exist !"
                    redirect(action: "listFlash")
                    return
                }
                receiveInfoInstance.type=params.rtype
                receiveInfoInstance.ip = params.rip
                receiveInfoInstance.port = Integer.parseInt(params.rport)
                receiveInfoInstance.user = params.ruser
                receiveInfoInstance.password = params.rpassword
                receiveInfoInstance.name = params.rname
                receiveInfoInstance.other = params.rother
                receiveInfoInstance.recipientClient = recipientClient
                receiveInfoInstance.bridge = bridgeData
                if(params.ack=="Yes"&&params.ackClient){
                    receiveInfoInstance.ack=Long.parseLong(params.ackClient)
                }
                if (!receiveInfoInstance.save(flush: true)){
                    log.debug(receiveInfoInstance.errors)
                    status.setRollbackOnly()
                    flash.message="Source Save failed!"
                    redirect(action: "listFlash")
                    return
                }
            }
            if(params.stype&&sendInfoNum==1){
                def mappingRuleGroupData
                if(params.sruleGroupId){
                    mappingRuleGroupData = MappingRuleGroup.get(Long.parseLong(params.sruleGroupId))
                    if(!mappingRuleGroupData){
                        flash.message="Mapping Rule Group is not exist!"
                        status.setRollbackOnly()
                        redirect(action: "listFlash")
                        return
                    }
                }else{
                    flash.message="Mapping Rule Group ID is null!"
                    status.setRollbackOnly()
                    redirect(action: "listFlash")
                    return
                }
                def sendInfoInstance = new  DestinationConfig()

                if(params.ssenderClientId){
                    def senderClient
                    senderClient = Client.get(Long.parseLong(params.ssenderClientId))
                    if(!senderClient){
                        flash.message="Sender Client is not exist!"
                        redirect(action: "listFlash")
                        return
                    }
                    sendInfoInstance.type=params.stype
                    sendInfoInstance.ip = params.sip
                    sendInfoInstance.port = Integer.parseInt(params.sport)
                    sendInfoInstance.user = params.suser
                    sendInfoInstance.password = params.spassword
                    sendInfoInstance.name = params.sname
                    sendInfoInstance.other = params.sother
                    sendInfoInstance.senderClient = senderClient
                    sendInfoInstance.mappingRuleGroup = mappingRuleGroupData
                    sendInfoInstance.bridge = bridgeData

//                    if(params.sactiveInd=="on"){
//                        sendInfoInstance.activeInd =true
//                    }else{
//                        sendInfoInstance.activeInd =false
//                    }
                    if (!sendInfoInstance.save(flush: true)){
                        status.setRollbackOnly()
                        flash.message="Save Failed!"
                        redirect(action: "listFlash")
                        return
                    }
                }else{
                    flash.message="Sender Client ID is null!"
                    redirect(action: "listFlash")
                    return
                }



            }   else if (params.stype&&sendInfoNum>1){
                for (i in 0..sendInfoNum-1){
                    def mappingRuleGroupData
                    if(params.sruleGroupId[i]){
                        mappingRuleGroupData = MappingRuleGroup.get(Long.parseLong(params.sruleGroupId[i]))
                        if(!mappingRuleGroupData){
                            flash.message="Mapping Rule Group is not exist!"
                            status.setRollbackOnly()
                            redirect(action: "listFlash")
                            return
                        }
                    }else{
                        flash.message="Mapping Rule Group ID is null!"
                        status.setRollbackOnly()
                        redirect(action: "listFlash")
                        return
                    }
                    def sendInfoInstance = new DestinationConfig()
                    if(params.ssenderClientId[i]){
                        def senderClient
                        senderClient = Client.get(Long.parseLong(params.ssenderClientId[i]))
                        if(!senderClient){
                            flash.message="Sender Client is not exist!"
                            status.setRollbackOnly()
                            redirect(action: "listFlash")
                            return
                        }
                        sendInfoInstance.type=params.stype[i]
                        sendInfoInstance.ip = params.sip[i]
                        sendInfoInstance.port = Integer.parseInt(params.sport[i])
                        sendInfoInstance.user = params.suser[i]
                        sendInfoInstance.password = params.spassword[i]
                        sendInfoInstance.name = params.sname[i]
                        sendInfoInstance.other = params.sother[i]
                        sendInfoInstance.senderClient = senderClient
                        sendInfoInstance.mappingRuleGroup = mappingRuleGroupData
                        sendInfoInstance.bridge = bridgeData
//                        if(params.sactiveInd[i]=="on"){
//                            sendInfoInstance.activeInd =true
//                        }else{
//                            sendInfoInstance.activeInd =false
//                        }

                        if (!sendInfoInstance.save(flush: true)){
                            status.setRollbackOnly()
                            flash.message="Save Failed!"
                            redirect(action: "listFlash")
                            return
                        }
                    }else{
                        flash.message="Sender Client ID is null!"
                        redirect(action: "listFlash")
                        return
                    }
                }
            }
            flash.message = "Bridge ${bridgeData.id} Created"
            redirect(action: "showFlash",id:bridgeData.id )
        }
    }

    def show = {
        def bridgeData = Bridge.get(params.id)

        if (!bridgeData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bridge.label', default: 'Bridge'), params.id])}"
            redirect(action: "list")
        }else {

            def sendInfoInstanceList = DestinationConfig.findAllByBridge(bridgeData)
            def receiveInfoInstanceList = SourceConfig.findByBridge(bridgeData)
            flash.message = ""
            render(view: 'show',model: [bridgeData: bridgeData,sendInfoInstanceList:sendInfoInstanceList,receiveInfoInstanceList:receiveInfoInstanceList,senderInfoInstanceTotal:sendInfoInstanceList.size()] )
        }
    }

    def showFlash = {
        def bridgeData = Bridge.get(params.id)

        if (!bridgeData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bridge.label', default: 'Bridge'), params.id])}"
            redirect(action: "list")
        }else {
            def sendInfoInstanceList = DestinationConfig.findAllByBridge(bridgeData)
            def receiveInfoInstanceList = SourceConfig.findByBridge(bridgeData)
            render(view: 'show',model: [bridgeData: bridgeData,sendInfoInstanceList:sendInfoInstanceList,receiveInfoInstanceList:receiveInfoInstanceList,senderInfoInstanceTotal:sendInfoInstanceList.size()] )
        }
    }

    def edit = {
        def bridgeData = Bridge.get(params.id)

        if (!bridgeData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bridge.label', default: 'Bridge'), params.id])}"
            redirect(action: "listFlash")
            return
        }else {

            def sendInfoInstanceList = DestinationConfig.findAllByBridge(bridgeData)
            def receiveInfoInstanceList = SourceConfig.findByBridge(bridgeData)
            flash.message = ""
            render(view: 'edit',model: [bridgeData: bridgeData,sendInfoInstanceList:sendInfoInstanceList,receiveInfoInstanceList:receiveInfoInstanceList,senderInfoInstanceTotal:sendInfoInstanceList.size()] )
        }
    }

    def update = {
        Bridge.withTransaction{status->
            def sendInfoNum = Integer.parseInt(params.sendInfoNum)
            def receiveData

            def bridgeData = Bridge.get(Long.parseLong(params.id))
            if(bridgeData){
                if(params.bridgeName){
                    def bridgeExist = Bridge.findByBridgeName(params.bridgeName)
                    if (bridgeExist&&bridgeExist.id!=bridgeData.id){
                        flash.message="Bridge Name is already exist!"
                        redirect(action: "listFlash")
                        return
                    }
                }else{
                    flash.message="Bridge Name is null!"
                    redirect(action: "listFlash")
                    return
                }
                bridgeData.bridgeName = params.bridgeName
                def dateTemps = params.dateStarted1.split(" ")
                def dates = dateTemps[0].split("-")
                if(dates[0].size()==4){
                    SimpleDateFormat sf = new SimpleDateFormat('yyyy-MM-dd HH:mm')
                    bridgeData.dateStarted = sf.parse(params.dateStarted1)
                }else{
                    SimpleDateFormat sf = new SimpleDateFormat('MM-dd-yyyy HH:mm')
                    bridgeData.dateStarted = sf.parse(params.dateStarted1)
                }
                def dateTempe = params.dateEnded1.split(" ")
                def datee = dateTemps[0].split("-")
                if(datee[0].size()==4){
                    SimpleDateFormat sf = new SimpleDateFormat('yyyy-MM-dd HH:mm')
                    bridgeData.dateEnded = sf.parse(params.dateEnded1)
                } else{
                    SimpleDateFormat sf = new SimpleDateFormat('MM-dd-yyyy HH:mm')
                    bridgeData.dateEnded = sf.parse(params.dateEnded1)
                }
                if (!bridgeData.save(flush: true)){
                    status.setRollbackOnly()
                    flash.message = "Save failed!"
                    redirect(action: "listFalsh")
                    return
                }
            } else{
                status.setRollbackOnly()
                flash.message = "Data not found!"
                redirect(action: "listFlash")
                return
            }

            if (params.delReceiveInfo){    //如果里面有值 证明receiver 被删除了，我们需要把旧的用用新的替换即可
                def temp = params.delReceiveInfo.split(",")
                for (i in 0..temp.size()-1){
                    receiveData = SourceConfig.get(Long.parseLong(temp[i]))
                    if(receiveData){
                        def recipientClient
                        if(params.rrecipientClientId){
                            recipientClient = Client.get(Long.parseLong(params.rrecipientClientId))
                            if(!recipientClient){
                                flash.message="Recipient Client is not exist!"
                                redirect(action: "listFlash")
                                return
                            }
                        }else{
                            flash.message="Recipient Client is null!"
                            status.setRollbackOnly()
                            redirect(action: "listFlash")
                            return
                        }
                        receiveData.type=params.rtype
                        receiveData.ip = params.rip
                        receiveData.port = Integer.parseInt(params.rport)
                        receiveData.user = params.ruser
                        receiveData.password = params.rpassword
                        receiveData.name = params.rname
                        receiveData.other = params.rother
                        receiveData.bridge = bridgeData
                        receiveData.recipientClient = recipientClient
                        if(params.ack=="Yes"&&params.ackClient){
                            receiveData.ack = Long.parseLong(params.ackClient)
                        }
                        if (!receiveData.save(flush: true)){
                            log.debug(receiveData.errors)
                            status.setRollbackOnly()
                            flash.message = "Save failed!"
                            redirect(action: "listFlash")
                            return
                        }
                    }
                }
            }else{
                if(params.rid){
                    receiveData = SourceConfig.get(Long.parseLong(params.rid))
                    if(receiveData){
                        def recipientClient
                        if(params.rrecipientClientId){
                            recipientClient = Client.get(Long.parseLong(params.rrecipientClientId))
                            if(!recipientClient){
                                flash.message="Recipient Client is not exist!"
                                redirect(action: "listFlash")
                                return
                            }
                        }else{
                            flash.message="Recipient Client is null!"
                            status.setRollbackOnly()
                            redirect(action: "listFlash")
                            return
                        }
                        receiveData.type=params.rtype
                        receiveData.ip = params.rip
                        receiveData.port = Integer.parseInt(params.rport)
                        receiveData.user = params.ruser
                        receiveData.password = params.rpassword
                        receiveData.name = params.rname
                        receiveData.other = params.rother
                        receiveData.bridge = bridgeData
                        if(params.ack=="Yes"&&params.ackClient){
                            receiveData.ack = Long.parseLong(params.ackClient)
                        }
                        receiveData.recipientClient = recipientClient
                        if (!receiveData.save(flush: true)){
                            log.debug(receiveData.errors)
                            status.setRollbackOnly()
                            flash.message = "Save failed!"
                            redirect(action: "listFlash")
                            return
                        }
                    }
                }else{
                    status.setRollbackOnly()
                    flash.message = "Data not found!"
                    redirect(action: "listFlash")
                    return
                }

            }
            if (params.delSendInfo){     //如果里面有值 证明send被删除 我们也需要把想对应的bridge也进行删除
                def temp = params.delSendInfo.split(",")
                for (i in 0..temp.size()-1){
                    def sendInfoData = DestinationConfig.get(Long.parseLong(temp[i]))
                    if (sendInfoData){
                        try{
                            sendInfoData.delete(flush: true)
                        }catch(Exception e){
                            flash.message="Save Failed!"
                            status.setRollbackOnly()
                            redirect(action: "listFlash")
                            return
                        }
                    }
                }
            }
            if(params.stype&&sendInfoNum==1){
                if (params.sid){                  //如果有值 证明是 一条已经存在的记录要对他进行编辑
                    def sendInfoInstance =DestinationConfig.get(Long.parseLong(params.sid))
                    if (sendInfoInstance){   //如果没有值 编辑错误返回
                        def mappingRuleGroupData
                        if(params.sruleGroupId){
                            mappingRuleGroupData = MappingRuleGroup.get(Long.parseLong(params.sruleGroupId))
                            if(!mappingRuleGroupData){
                                status.setRollbackOnly()
                                flash.message = "Data not found!"
                                redirect(action: "list")
                            }
                        }else{
                            flash.message="Mapping Rule Group is not exist!"
                            status.setRollbackOnly()
                            redirect(action: "list")
                        }
                        def senderClient
                        if(params.ssenderClientId){
                            senderClient = Client.get(Long.parseLong(params.ssenderClientId))
                            if(!senderClient){
                                flash.message="Sender Client is not exist!"
                                redirect(action: "listFlash")
                                return
                            }
                        }else{
                            flash.message="Sender Client ID is null!"
                            status.setRollbackOnly()
                            redirect(action: "listFlash")
                            return
                        }

                        sendInfoInstance.type=params.stype
                        sendInfoInstance.ip = params.sip
                        sendInfoInstance.port = Integer.parseInt(params.sport)
                        sendInfoInstance.user = params.suser
                        sendInfoInstance.password = params.spassword
                        sendInfoInstance.name = params.sname
                        sendInfoInstance.other = params.sother
                        sendInfoInstance.mappingRuleGroup = mappingRuleGroupData
                        sendInfoInstance.bridge = bridgeData
                        sendInfoInstance.senderClient = senderClient
//                        if(params.sactiveInd=="on"){
//                            sendInfoInstance.activeInd =true
//                        }else{
//                            sendInfoInstance.activeInd =false
//                        }
                        if (!sendInfoInstance.save(flush: true)){
                            status.setRollbackOnly()
                            flash.message="Sender Information save failed!"
                            status.setRollbackOnly()
                            redirect(action: "listFlash")
                            return
                        }
                    } else {
                        flash.message="Sender Information is not found!"
                        status.setRollbackOnly()
                        redirect(action: "listFlash")
                        return
                    }
                } else{      //if there is no send information to update and there is a new information to save to do this
                    def mappingRuleGroupData
                    if(params.sruleGroupId){
                        mappingRuleGroupData = MappingRuleGroup.get(Long.parseLong(params.sruleGroupId))
                        if(!mappingRuleGroupData){
                            status.setRollbackOnly()
                            flash.message = "Data not found!"
                            redirect(action: "listFlash")
                            return
                        }
                    }else{
                        flash.message="Mapping Rule Group is not exist!"
                        status.setRollbackOnly()
                        redirect(action: "listFlash")
                        return
                    }
                    def senderClient
                    if(params.ssenderClientId){
                        senderClient = Client.get(Long.parseLong(params.ssenderClientId))
                        if(!senderClient){
                            flash.message="Sender Client is not exist!"
                            redirect(action: "listFlash")
                            return
                        }
                    }else{
                        flash.message="Sender Client ID is null!"
                        status.setRollbackOnly()
                        redirect(action: "listFlash")
                        return
                    }
                    def sendInfoInstance = new  DestinationConfig()
                    sendInfoInstance.type=params.stype
                    sendInfoInstance.ip = params.sip
                    sendInfoInstance.port = Integer.parseInt(params.sport)
                    sendInfoInstance.user = params.suser
                    sendInfoInstance.password = params.spassword
                    sendInfoInstance.name = params.sname
                    sendInfoInstance.other = params.sother
                    sendInfoInstance.bridge = bridgeData
                    sendInfoInstance.senderClient = senderClient
                    sendInfoInstance.mappingRuleGroup = mappingRuleGroupData
//                    if(params.sactiveInd=="on"){
//                        sendInfoInstance.activeInd =true
//                    }else{
//                        sendInfoInstance.activeInd =false
//                    }

                    if (!sendInfoInstance.save(flush: true)){
                        status.setRollbackOnly()
                        flash.message = "Sender Information save failed!"
                        redirect(action: "listFlash")
                        return
                    }

                }

            }   else if (params.stype&&sendInfoNum>1){
                for (i in 0..sendInfoNum-1){
                    if (params.sid[i]){         //update many send informations
                        def mappingRuleGroupData
                        if(params.sruleGroupId[i]){
                            mappingRuleGroupData = MappingRuleGroup.get(Long.parseLong(params.sruleGroupId[i]))
                            if(!mappingRuleGroupData){
                                status.setRollbackOnly()
                                flash.message = "Data not found!"
                                redirect(action: "listFlash")
                                return
                            }
                        }else{
                            flash.message="Mapping Rule Group is not exist!"
                            status.setRollbackOnly()
                            redirect(action: "listFlash")
                            return
                        }
                        def senderClient
                        if(params.ssenderClientId[i]){
                            senderClient = Client.get(Long.parseLong(params.ssenderClientId[i]))
                            if(!senderClient){
                                flash.message="Sender Client is not exist!"
                                redirect(action: "listFlash")
                                return
                            }
                        }else{
                            flash.message="Sender Client ID is null!"
                            status.setRollbackOnly()
                            redirect(action: "listFlash")
                            return
                        }
                        def sendInfoInstance =DestinationConfig.get(Long.parseLong(params.sid[i]))
                        if (sendInfoInstance){
                            sendInfoInstance.type=params.stype[i]
                            sendInfoInstance.ip = params.sip[i]
                            sendInfoInstance.port = Integer.parseInt(params.sport[i])
                            sendInfoInstance.user = params.suser[i]
                            sendInfoInstance.password = params.spassword[i]
                            sendInfoInstance.name = params.sname[i]
                            sendInfoInstance.other = params.sother[i]
                            sendInfoInstance.bridge = bridgeData
                            sendInfoInstance.senderClient = senderClient
                            sendInfoInstance.mappingRuleGroup = mappingRuleGroupData
//                            if(params.sactiveInd[i]=="on"){
//                                sendInfoInstance.activeInd =true
//                            }else{
//                                sendInfoInstance.activeInd =false
//                            }
                            if (!sendInfoInstance.save(flush: true)){
                                status.setRollbackOnly()
                                flash.message = "Save failed!"
                                redirect(action: "listFlash")
                                return
                            }
                        }
                    } else{              //save many new send informations
                        def mappingRuleGroupData
                        if(params.sruleGroupId[i]){
                            mappingRuleGroupData = MappingRuleGroup.get(Long.parseLong(params.sruleGroupId[i]))
                            if(!mappingRuleGroupData){
                                status.setRollbackOnly()
                                flash.message = "Data not found!"
                                redirect(action: "listFlash")
                                return
                            }
                        }else{
                            flash.message="Mapping Rule Group is not exist!"
                            status.setRollbackOnly()
                            redirect(action: "listFlash")
                            return
                        }
                        def senderClient
                        if(params.ssenderClientId[i]){
                            senderClient = Client.get(Long.parseLong(params.ssenderClientId[i]))
                            if(!senderClient){
                                flash.message="Sender Client is not exist!"
                                redirect(action: "listFlash")
                                return
                            }
                        }else{
                            flash.message="Sender Client ID is null!"
                            status.setRollbackOnly()
                            redirect(action: "listFlash")
                            return
                        }

                        def sendInfoInstance = new DestinationConfig()
                        sendInfoInstance.type=params.stype[i]
                        sendInfoInstance.ip = params.sip[i]
                        sendInfoInstance.port = Integer.parseInt(params.sport[i])
                        sendInfoInstance.user = params.suser[i]
                        sendInfoInstance.password = params.spassword[i]
                        sendInfoInstance.name = params.sname[i]
                        sendInfoInstance.other = params.sother[i]
                        sendInfoInstance.bridge = bridgeData
                        sendInfoInstance.senderClient = senderClient
                        sendInfoInstance.mappingRuleGroup = mappingRuleGroupData
//                        if(params.sactiveInd[i]=="on"){
//                            sendInfoInstance.activeInd =true
//                        }else{
//                            sendInfoInstance.activeInd =false
//                        }
                        if (!sendInfoInstance.save(flush: true)){
                            status.setRollbackOnly()
                            flash.message = "Save failed!"
                            redirect(action: "listFlash")
                            return
                        }
                    }
                }
            }
            flash.message="Bridge ${bridgeData.id} Updated"
            redirect(action: "showFlash",id:bridgeData.id )
            return
        }

    }

    def delete = {
        Bridge.withTransaction{status->
            if(!params.id){
                flash.message = "Bridge Id is null"
                redirect(action: "listFlash")
                return
            }
            def bridgeData = Bridge.get(params.id)
            if (bridgeData) {
                def receiverData
                def senderData
                try {
                    senderData = DestinationConfig.findAllByBridge(bridgeData)
                    receiverData = SourceConfig.findByBridge(bridgeData)
                    if(!senderData||!receiverData){
                        flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bridge.label', default: 'Bridge'), params.id])}"
                        redirect(view: "listFlash")
                        return
                    }else{
                        senderData.each{
                            try{
                                it.delete(flush: true)
                            }catch(Exception e){
                                status.setRollbackOnly()
                                flash.message="Sender information delete failed!"
                                redirect(action: "listFlash")
                                return
                            }
                        }
                    }
                    receiverData.delete(flush: true)
                    bridgeData.delete(flush: true)
                }
                catch (org.springframework.dao.DataIntegrityViolationException e) {
                    status.setRollbackOnly()
                    flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'bridge.label', default: 'Bridge'), params.id])}"
                    redirect(action: "listFlash")
                    return
                }
            }else {
                flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bridge.label', default: 'Bridge'), params.id])}"
                redirect(action: "listFlash")
            }
        }
        flash.message=flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'bridge.label', default: 'Bridge'), params.id])}"
        redirect(action: "listFlash")

    }
    def search = {
        if(!params.max)params.max=10
        if(!params.offset)params.offset=0
//         println(params.bridgeName)
        def search = {
            if(params.bridgeName){
                like('bridgeName',"%${params.bridgeName}%")
            }
            if(params.sender){
                sender{
                    like('name',"%${params.sender}%")
                }
            }
            if (params.reveiver){
                reveiver{
                    like('name',"%${params.reveiver}%")
                }
            }
            if (params.mappingRuleGroup){
                mappingRuleGroup{
                    or{
                        like('name',"%${params.mappingRuleGroup}%")
                        like('type',"%${params.mappingRuleGroup}%")
                    }
                }
            }
            order('dateCreated','desc')
        }

        def  bridgeDataList = Bridge.createCriteria().list(params,search)
        if(bridgeDataList){
            flash.message = "${bridgeDataList.totalCount} Bridge(s) found!"
        }else{
            flash.message = "No data found!"
        }


        render(view: "list",model: [bridgeDataList:bridgeDataList,bridgeDataTotal: bridgeDataList.totalCount,params: params])
        
    }

    def selectMappingRuleGroup = {
        if(!params.max)params.max=10
        if(!params.offset)params.offset=0

        def searchMappingRuleGroup={
            if(params.name){
                like("name","%${params.name}%")
            }
            if (params.type){
                eq("type",params.type)
            }
//            if (params.application){
//                or{
//                    like("fromApplication","%${params.application}%")
//                    like("toApplication","%${params.application}%")
//                }
//            }
            order("dateCreated","desc")
        }


        def mappingRuleGroupDataList = MappingRuleGroup.createCriteria().list(params,searchMappingRuleGroup)

        if(mappingRuleGroupDataList){
            flash.message = "${mappingRuleGroupDataList.totalCount} Mapping Rule Group(s) found!"
        }else{
            flash.message = "No data found!"
        }
        render(view: 'selectMappingRuleGroup',model: [mappingRuleGroupDataList:mappingRuleGroupDataList,mappingRuleGroupDataTotal: mappingRuleGroupDataList.totalCount,params: params])
    }

    def checkPortRepeat = {
         if(params.port){
             def sourceExistData = SourceConfig.findByPort(Integer.parseInt(params.port))
             if(sourceExistData){
                 render "Source Port ${params.port} is already exist"
                 return
             } else{
                 render ""
                 return
             }
         }
        render ""
        return
    }

    def checkBridgeNameRepeat = {
        if(params.name){
            def bridgeData = Bridge.findByBridgeName(params.name)
            if (bridgeData){
                if(params.id){
                    if (bridgeData.id==Long.parseLong(params.id)){
                        render ""
                        return
                    }else{
                        render "Bridge Name ${params.name} is already exist"
                        return
                    }

                }else{
                    render "Bridge Name ${params.name} is already exist"
                    return
                }

            }else{
                render ""
                return
            }
        }
        render ""
        return
    }
}
