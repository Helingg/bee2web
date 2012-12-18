package com.bssi

import grails.converters.JSON
/**
 * Client Controller
 *
 * author: Wang Gang
 */
class ClientController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }
    def list = {
       if (!params.max) params.max=10
        if (!params.offset)params.offset=0
        flash.message=""
        [clientDataList: Client.list(sort: "dateCreated",order: "desc",max: 10,offset: 0), clientDataTotal: Client.count()]
    }
    def listFlash = {
        if (!params.max) params.max=10
        if (!params.offset)params.offset=0
        render(view: 'list',model:[clientDataList: Client.list(sort: "dateCreated",order: "desc",max: 10,offset: 0), clientDataTotal: Client.count()])
    }

    def create = {
        def clientData = new Client()
        clientData.properties = params
        flash.message = ""
        return [clientData: clientData,providerDataList:Provider.list(),providerDataTotal:Provider.count()]
    }
    def saveMany = {
        def clientData = new Client(params)
        Client.withTransaction{ status->
            if (!clientData.hasErrors()&&clientData.save(flush: true)) {
                def providerNum = Integer.parseInt(params.providerNum)
                if (params.provider&&providerNum==1){
                    def clientProviderInstance = new ClientProvider()
                    def providerInstance = Provider.get(Long.parseLong(params.provider))
                    clientProviderInstance.client = clientData
                    clientProviderInstance.provider = providerInstance
                    clientProviderInstance.clientProvider = params.clientProvider
                    if (!clientProviderInstance.save(flush: true)){
                        log.debug(clientProviderInstance.errors)
                        status.setRollbackOnly()
                    }
                } else if (params.provider&&providerNum>1){
                    for (i in 0..providerNum-1){
                        def clientProviderInstance = new ClientProvider()
                        def providerInstance = Provider.get(Long.parseLong(params.provider[i]))
                        clientProviderInstance.client = clientData
                        clientProviderInstance.provider = providerInstance
                        clientProviderInstance.clientProvider = params.clientProvider[i]
                        if (!clientProviderInstance.save(flush: true)){
                            log.debug(clientProviderInstance.errors)
                            status.setRollbackOnly()
                        }
                    }

                }

                flash.message = "${message(code: 'default.created.message', args: [message(code: 'client.label', default: 'Client'), clientData.name])}"
                redirect(action: "show", id: clientData.id)
            }
            else {
                status.status.setRollbackOnly()
                render(view: "create", model: [clientData: clientData])
            }

        }
    }
    def save = {
        if(params.name){
            def clientExist = Client.findByName(params.name)
            if (clientExist) {
                flash.message="Client Name ${params.name} is already exist!"
                redirect(action: listFlash)
                return
            }
        } else{
            flash.message="Client Name is null"
            redirect(action: listFlash)
            return
        }
        def clientData = new Client(params)
        Client.withTransaction{ status->
            if (!clientData.hasErrors()&&clientData.save(flush: true)) {
                def providerNum = Integer.parseInt(params.providerNum)
                if (params.provider&&providerNum==1){
                    def clientProviderInstance = new ClientProvider()
                    def providerInstance = Provider.get(Long.parseLong(params.provider))
                    clientProviderInstance.client = clientData
                    clientProviderInstance.provider = providerInstance
                    clientProviderInstance.clientProvider = params.clientProvider
                    clientProviderInstance.status = params.pstatus
                    if(params.pactiveInd=="true"){
                        clientProviderInstance.activeInd = true
                    }else{
                        clientProviderInstance.activeInd = false
                    }
                    if (!clientProviderInstance.save(flush: true)){
                        log.debug(clientProviderInstance.errors)
                        status.setRollbackOnly()
                        flash.message="Save failed!"
                        redirect(action: listFlash)
                        return
                    }
                } else if (params.provider&&providerNum>1){
                    for (i in 0..providerNum-1){
                        def clientProviderInstance = new ClientProvider()
                        def providerInstance = Provider.get(Long.parseLong(params.provider[i]))
                        clientProviderInstance.client = clientData
                        clientProviderInstance.provider = providerInstance
                        clientProviderInstance.clientProvider = params.clientProvider[i]
                        clientProviderInstance.status = params.pstatus[i]
                        if(params.pactiveInd[i]=="true"){
                            clientProviderInstance.activeInd = true
                        }else{
                            clientProviderInstance.activeInd = false
                        }
                        if (!clientProviderInstance.save(flush: true)){
                            log.debug(clientProviderInstance.errors)
                            status.setRollbackOnly()
                            flash.message="Save failed!"
                            redirect(action: listFlash)
                            return
                        }
                    }

                }
                def addressData
                def luAddrTypData
                if(params.addressType1) {
                    addressData = new Address(params)
                    if(!addressData.save(flush: true)){
                        flash.message="Address save failed!"
                        redirect(action: listFlash)
                        return
                    }
                    luAddrTypData = AddressType.get(Long.parseLong(params.addressType1))
                    def clientAddressData = new ClientAddress()
                    clientAddressData.addr = addressData
                    clientAddressData.client = clientData
                    clientAddressData.addrType = luAddrTypData
                    if(!clientAddressData.save(flush: true)){
                        flash.message="Address save failed!"
                        redirect(action: listFlash)
                        return
                    }
                }

                if(params.contactType1) {
                    def clientContactData = new ClientContact(params)
                    def contactTypeData = ContactType.get(Long.parseLong(params.contactType1))
                    def addressData1 = Address.get(Long.parseLong(params.address1))
                    clientContactData.contactType =  contactTypeData
                    clientContactData.addr =  addressData1
                    clientContactData.client =  clientData
                    if(!clientContactData.save(flush: true)){
                        flash.message="Contact save failed!"
                        redirect(action: listFlash)
                        return
                    }
                }

                flash.message = "${message(code: 'default.created.message', args: [message(code: 'client.label', default: 'Client'), clientData.name])}"
                redirect(action: "showFlash",id:clientData.id)
                return
            }else {
                status.status.setRollbackOnly()
                flash.message="Save failed!"
                redirect(action: "listFlash")
                return
            }

        }

    }

    def show = {
        def clientData = Client.get(params.id)
        if (!clientData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.name])}"
            redirect(action: "listFlash")
        }
        else {

            def searchProviderStr = "select p.id,p.NPI,p.firstName,p.lastName,p.middleName,cp.clientProvider,cp.status,cp.activeInd  from Provider p,ClientProvider cp where p.id in (select cp.provider from ClientProvider cp where cp.client = ${clientData.id}) and p.id = cp.provider and cp.client = ${clientData.id}"
            def clientAddressData = ClientAddress.findByClient(clientData)
            def clientContactData = ClientContact.findByClient(clientData)
            def providerInstanceList = Provider.executeQuery(searchProviderStr)
            flash.message=""
            [clientData: clientData,providerInstanceList:providerInstanceList,providerInstanceTotal: providerInstanceList.size(),clientContactData:clientContactData,clientAddressData:clientAddressData]
        }
    }

    def showFlash = {
        def clientData = Client.get(params.id)
        if (!clientData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.name])}"
            redirect(action: "listFlash")
        }
        else {

            def searchProviderStr = "select p.id,p.NPI,p.firstName,p.lastName,p.middleName,cp.clientProvider,cp.status,cp.activeInd  from Provider p,ClientProvider cp where p.id in (select cp.provider from ClientProvider cp where cp.client = ${clientData.id}) and p.id = cp.provider and cp.client = ${clientData.id}"
            def providerInstanceList = Provider.executeQuery(searchProviderStr)
            def clientAddressData = ClientAddress.findByClient(clientData)
            def clientContactData = ClientContact.findByClient(clientData)
            render(view: 'show',model:[clientData: clientData,providerInstanceList:providerInstanceList,providerInstanceTotal: providerInstanceList.size(),clientAddressData:clientAddressData,clientContactData:clientContactData])
        }
    }

    def edit = {
        if(!params.max) params.max = 10
        if (!params.offset) params.offset =0

        def clientData = Client.get(params.id)
        if (!clientData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.name])}"
            redirect(action: "listFlash")
        }
        else {
            def searchProviderStr = "select p.id,p.NPI,p.firstName,p.lastName,p.middleName,cp.clientProvider,cp.status,cp.activeInd from Provider p,ClientProvider cp where p.id in (select cp1.provider from ClientProvider cp1 where cp1.client = ${clientData.id}) and cp.provider = p.id and cp.client = ${clientData.id}"
            def providerInstanceList = Provider.executeQuery(searchProviderStr)
            def clientAddressData = ClientAddress.findByClient(clientData)
            def clientContactData = ClientContact.findByClient(clientData)
            flash.message = ""
            render (view: "edit", model: [clientData: clientData,providerInstanceList:providerInstanceList,providerInstanceTotal:providerInstanceList.size(),clientAddressData:clientAddressData,clientContactData:clientContactData] )
        }
    }

    def update = {
        def clientData = Client.get(params.id)
        if (clientData) {
            if(params.name){
                def clientExist = Client.findByName(params.name)
                if (clientExist&&clientExist.id!=clientData.id) {
                    flash.message="Save failed,Client Name ${params.name} is already exist!"
                    redirect(action: listFlash)
                    return
                }
            } else{
                flash.message="Client Name is null"
                redirect(action: listFlash)
                return
            }
            if (params.version) {
                def version = params.version.toLong()
                if (clientData.version > version) {
                    clientData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'client.label', default: 'Client')] as Object[], "Another user has updated this Client while you were editing")
                    render(view: "edit", model: [clientData: clientData])
                    return
                }
            }
            def clientProvider = ClientProvider.findByClient(clientData)
            def sendLogData1 = SendLog.findBySendClient(clientData)
            def sendLogData2 = SendLog.findByReceiveClient(clientData)
            def receivLogData1 = ReceiveLog.findBySendClient(clientData)
            def receivLogData2 = ReceiveLog.findByReceiveClient(clientData)
            def facilityData = Facility.findByClient(clientData)
            def clientAddress  = ClientAddress.findByClient(clientData)
            def clientContact  = ClientContact.findByClient(clientData)
            if (clientProvider||sendLogData1||sendLogData2||receivLogData1||receivLogData2||facilityData||clientAddress||clientContact){
                clientData.activeInd = true
                if(params.activeInd !='on'){
                    flash.message = "Client ${clientData.name} has already been used the parameter Active cannot be updated for Inactive"
                    redirect(action: "listFlash")
                    return
                }

            }
            Client.withTransaction {status ->
                if(params.name){
                    def clientExist = Client.findByName(params.name)
                    if(clientExist&&clientExist.id!=clientData.id){
                        flash.message="Client name ${params.name} is already exist"
                        redirect(action: listFlash)
                        return
                    }
                }else{
                    flash.message="Client name is null"
                    redirect(action: listFlash)
                    return
                }

                clientData.properties = params
                if (!clientData.hasErrors() && clientData.save(flush: true)) {
                    def providerNum = Integer.parseInt(params.providerNum)
                    if (params.provider&&providerNum==1){
                        def providerData = Provider.get(Long.parseLong(params.provider))
                        if (providerData){
                            def clientProviderInstance = ClientProvider.findByClientAndProvider(clientData,providerData)
                            if(!clientProviderInstance) {
                                clientProviderInstance = new ClientProvider()
                                clientProviderInstance.client = clientData
                                clientProviderInstance.provider = providerData
                                clientProviderInstance.clientProvider = params.clientProvider
                                clientProviderInstance.status = params.pstatus
                                println(clientProviderInstance.status)
                                if(params.pactiveInd=="true"){
                                    clientProviderInstance.activeInd = true
                                }else{
                                    clientProviderInstance.activeInd = false
                                }
                                if (!clientProviderInstance.save(flush: true)){
                                    log.debug(clientProviderInstance.errors)
                                    status.setRollbackOnly()
                                    flash.message="Save failed"
                                    redirect(action: listFlash)
                                    return
                                }
                            }else{
                                clientProviderInstance.clientProvider = params.clientProvider
                                clientProviderInstance.status = params.pstatus
                                println(clientProviderInstance.status)
                                if(params.pactiveInd=="true"){
                                    clientProviderInstance.activeInd = true
                                }else{
                                    clientProviderInstance.activeInd = false
                                }
                                if (!clientProviderInstance.save(flush: true)){
                                    log.debug(clientProviderInstance.errors)
                                    status.setRollbackOnly()
                                    flash.message="Save failed"
                                    redirect(action: listFlash)
                                    return
                                }
                            }
                        }
                    } else if (params.provider&&providerNum>1){
                        for (i in 0..providerNum-1){
                            def providerData = Provider.get(Long.parseLong(params.provider[i]))
                            if (providerData){
                                def clientProviderInstance = ClientProvider.findByClientAndProvider(clientData,providerData)
                                if(!clientProviderInstance) {
                                    clientProviderInstance = new ClientProvider()
                                    clientProviderInstance.client = clientData
                                    clientProviderInstance.provider = providerData
                                    clientProviderInstance.clientProvider = params.clientProvider[i]
                                    clientProviderInstance.status = params.pstatus[i]
                                    if(params.pactiveInd[i]=="true"){
                                        clientProviderInstance.activeInd = true
                                    }else{
                                        clientProviderInstance.activeInd = false
                                    }
                                    if (!clientProviderInstance.save(flush: true)){
                                        log.debug(clientProviderInstance.errors)
                                        status.setRollbackOnly()
                                        flash.message="Save failed"
                                        redirect(action: listFlash)
                                        return
                                    }
                                }else{
                                    clientProviderInstance.clientProvider = params.clientProvider[i]
                                    clientProviderInstance.status = params.pstatus[i]
                                    println(clientProviderInstance.status)
                                    if(params.pactiveInd[i]=="true"){
                                        clientProviderInstance.activeInd = true
                                    }else{
                                        clientProviderInstance.activeInd = false
                                    }
                                    if (!clientProviderInstance.save(flush: true)){
                                        log.debug(clientProviderInstance.errors)
                                        status.setRollbackOnly()
                                        flash.message="Save failed"
                                        redirect(action: listFlash)
                                        return
                                    }
                                }
                            }
                        }

                    }
                    def luAddrTypData
                    def clientAddressData
                    if(params.addressType1) {
                        luAddrTypData = AddressType.get(Long.parseLong(params.addressType1))
                        clientAddressData = ClientAddress.findByClient(clientData)
                        if(clientAddressData){
                            clientAddressData.client = clientData
                            clientAddressData.addrType = luAddrTypData
                            def addressData =  Address.get(clientAddressData.addr.id)
                            addressData.properties = params
                            if(!addressData.save(flush: true)){
                                flash.message="Address save failed!"
                                redirect(action: listFlash)
                                return
                            }
                            if(!clientAddressData.save(flush:true)) {
                                flash.message="Address save failed!"
                                redirect(action: listFlash)
                                return
                            }
                        } else{
                            def addressData =  new Address()
                            addressData.properties = params
                            if(!addressData.save(flush: true)){
                                flash.message="Address save failed!"
                                redirect(action: listFlash)
                                return
                            }
                            clientAddressData = new ClientAddress()
                            clientAddressData.addr = addressData
                            clientAddressData.client = clientData
                            clientAddressData.addrType = luAddrTypData
                        }
                        if(!clientAddressData.save(flush: true)){
                            flash.message="Address save failed!"
                            redirect(action: listFlash)
                            return
                        }
                    }

                    if(params.contactType1){
                        def clientContactData = ClientContact.findByClient(clientData)
                        def contactTypeData = ContactType.get(Long.parseLong(params.contactType1))
                        def addressData1 = Address.get(Long.parseLong(params.address1))
                        if (clientContactData){
                            clientContactData.properties = params
                            clientContactData.contactType =  contactTypeData
                            clientContactData.addr =  addressData1
                            clientContactData.client = clientData
                        } else{
                            clientContactData = new ClientContact(params)
                            clientContactData.contactType =  contactTypeData
                            clientContactData.addr =  addressData1
                            clientContactData.client = clientData
                        }

                        if(!clientContactData.save(flush: true)){
                            flash.message="Contact save failed!"
                            redirect(action: listFlash)
                            return
                        }
                    }

                    flash.message = "${message(code: 'default.updated.message', args: [message(code: 'client.label', default: 'Client'), clientData.name])}"
                    redirect(action: "showFlash", id: clientData.id)
                    return
                }
                else {
                    flash.message="Update failed"
                    redirect(action: listFlash)
                }
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.name])}"
            redirect(action: "list")
        }
    }

    def delete = {
        Client.withTransaction{status->
            def clientData = Client.get(params.id)

            if (clientData) {
                def clientProvider = ClientProvider.findByClient(clientData)
                def sendLogData1 = SendLog.findBySendClient(clientData)
                def sendLogData2 = SendLog.findByReceiveClient(clientData)
                def receivLogData1 = ReceiveLog.findBySendClient(clientData)
                def receivLogData2 = ReceiveLog.findByReceiveClient(clientData)
                def facilityData = Facility.findByClient(clientData)
                def clientAddress  = ClientAddress.findByClient(clientData)
                def clientContact  = ClientContact.findByClient(clientData)
                if (clientProvider||sendLogData1||sendLogData2||receivLogData1||receivLogData2||facilityData||clientAddress||clientContact){

                    flash.message = "Client ${clientData.name} has already been used cannot be deleted"
                    redirect(action: "listFlash")
                    return
                }
                try {
                    try{
                        clientData.delete(flush: true)
                    }catch(Exception e){
                        status.setRollbackOnly()
                        println(e.stackTrace)
                        flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'client.label', default: 'Client'), params.id])}"
                        redirect(action: "listFlash")
                        return
                    }

                    flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'client.label', default: 'Client'), params.id])}"
                    redirect(action: "listFlash")
                    return
                }catch (org.springframework.dao.DataIntegrityViolationException e) {
                    flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'client.label', default: 'Client'), params.id])}"
                    redirect(action: "listFlash")
                    return
                }
            }
            else {
                flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.id])}"
                redirect(action: "listFlash")
                return
            }
        }

    }
    def search = {
        if(!params.max) params.max=10
        if (!params.offset) params.offset=0
        def searchc ={

            if(params.name){
                like("name","%${params.name}%")
            }
            if (params.activeInd=="true"){
                eq("activeInd",true)
            }else if(params.activeInd=="false"){
                eq("activeInd",false)
            }
            order("dateCreated","desc")
        }
        def clientList = Client.createCriteria().list(params,searchc)
        if(clientList){
            flash.message = "${clientList.totalCount} Client(s) found!"
        }else{
            flash.message = "No data found!"
        }

        render(view: "list",model:[clientDataList:clientList,clientDataTotal:clientList.totalCount,params: params])
    }

    def  selectProvider = {
        if(!params.max) params.max=10
        if (!params.offset) params.offset=0
//        println(params.clientid)
        def search = {
            if (params.NPI1){
                like("NPI","%${params.NPI1}%")
            }
            if (params.firstName1){
                like("firstName","%${params.firstName1}%")
            }
            if (params.middleName1){
                like("middleName","%${params.middleName1}%")
            }
            if (params.lastName1){
                like("lastName","%${params.lastName1}%")
            }
        }

        def   providerDataList = Provider.createCriteria().list(params,search)
        if(providerDataList) {
            flash.message="${providerDataList.totalCount} Provider(s) found!"
        }else{
            flash.message="No data found!"
        }
        render(view: "selectProvider",model: [providerDataList: providerDataList,providerDataTotal: providerDataList.totalCount])
    }

    def  selectSendInfo = {
        render(view: "selectSendInfo")
    }

    def  selectReceiveInfo = {
        render(view: "selectReceiveInfo")
    }

    def selectProviderSingle = {
        if(!params.max) params.max=10
        if (!params.offset) params.offset=0
//        println(params.clientid)
        def search = {
            if (params.NPI1){
                like("NPI","%${params.NPI1}%")
            }
            if (params.firstName1){
                like("firstName","%${params.firstName1}%")
            }
            if (params.middleName1){
                like("middleName","%${params.middleName1}%")
            }
            if (params.lastName1){
                like("lastName","%${params.lastName1}%")
            }
        }

        def   providerDataList = Provider.createCriteria().list(params,search)
        if (providerDataList) {
            flash.message="${providerDataList.totalCount} Provider(s) found!"
        }else{
            flash.message="No data found!"
        }
        render(view: "selectProviderSingle",model: [providerDataList: providerDataList,providerDataTotal: providerDataList.totalCount])

    }

    def deleteProvider = {
        if(params.client){
            def clientData = Client.get(Long.parseLong(params.client))
            if (clientData){
                if (params.provider){
                    def providerData = Provider.get(Long.parseLong(params.provider))
                    if (providerData){
                        def clientProviderData = ClientProvider.findByClientAndProvider(clientData,providerData)
                        log.debug(clientProviderData)
                        if (clientProviderData){
                            clientProviderData.delete(flush: true)
                            render "Delete success!"
                            return
                        }else{
                            render "Client And Provider dose not exist!"
                            return
                        }
                    }else{
                        render "Client dose not exist!"
                        return
                    }

                } else {
                    render "Provider Id is blank!"
                    return
                }
            }else{
                render "Client dose not exist!"
                return
            }
        } else{
            render "Client Id is blank!"
            return
        }
    }

    def saveProvider ={
        Provider.withTransaction { status->
            def providerData
            def providerMap = new HashMap()
            if(params.providerId){
                providerData = Provider.get(Long.parseLong(params.providerId))
                if(providerData){
                    providerData.properties = params
                    println(params.state)
                    if(providerData.save(flash:true)){
                        if(params.state){
                            def state = params.state.split(",")
                            def MLN = params.MLN.split(",")
                            def mlnProviderType = params.mlnProviderType.split(",")
                            for (int i=0;i<state.size();i++){
                                def statemln = new StateMLN()
                                statemln.mln = MLN[i]
                                statemln.state = state[i]
                                statemln.providerType = mlnProviderType[i]
                                statemln.provider = providerData
                                if(!statemln.save(flush: true)){
                                    providerMap.put("msg","MLN save failed")
                                    providerMap.put("provider","")
                                    status.setRollbackOnly()
                                    render   providerMap as JSON
                                    return
                                }
                            }
                        }
                        providerMap.put("msg","")
                        providerMap.put("provider",providerData)
                        render   providerMap as JSON
                        return
                    } else{
                        providerMap.put("msg","Provider save failed")
                        providerMap.put("provider","")
                        render   providerMap as JSON
                        return
                    }
                }else{
                    providerMap.put("msg","Provider is not found")
                    providerMap.put("provider","")
                    render   providerMap as JSON
                    return
                }
            }else{
                providerData = new Provider()
                providerData.properties = params

                if(providerData.save(flash:true)){
                    if(params.state){
                        def state = params.state.split(",")
                        def MLN = params.MLN.split(",")
                        for (int i=0;i<state.size();i++){
                            def statemln = new StateMLN()
                            statemln.mln = MLN[i]
                            statemln.state = state[i]
                            statemln.provider = providerData
                            if(!statemln.save(flush: true)){
                                providerMap.put("msg","MLN save failed")
                                providerMap.put("provider","")
                                status.setRollbackOnly()
                                render   providerMap as JSON
                                return
                            }
                        }
                    }
                    providerMap.put("msg","")
                    providerMap.put("provider",providerData)
                    render   providerMap as JSON
                    return
                } else{
                    providerMap.put("msg","Provider save failed")
                    providerMap.put("provider","")
                    render   providerMap as JSON
                    return
                }
            }
            providerMap.put("msg","Unkown error")
            providerMap.put("provider","")
            render   providerMap as JSON
            return
        }

    }

    def  checkClientName = {
         if(params.name){
             def clientData = Client.findByName(params.name)
             if(clientData){
                 if(params.id){
                     if (clientData.id==Long.parseLong(params.id)){
                         render ""
                         return
                     }else{
                         render "Client Name ${params.name} is already exist"
                         return
                     }
                 }else{
                     render "Client Name ${params.name} is already exist"
                     return
                 }
             } else{
                 render ""
                 return
             }
         }
        render ""
        return
    }
}
