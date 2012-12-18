package com.bssi

class ProviderController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if(!params.offset)params.offset=0
        flash.message=""
        [providerDataList: Provider.list(sort:"dateCreated",order: "desc",max: 10,offset: 0), providerDataTotal: Provider.count()]
    }

    def listFlash = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if(!params.offset)params.offset=0
        render (view:'list',model:[providerDataList: Provider.list(sort:"dateCreated",order: "desc",max: 10,offset: 0), providerDataTotal: Provider.count()])
    }

    def create = {
        def providerData = new Provider()
        providerData.properties = params
        flash.message = ""
        return [providerData: providerData]
    }

    def save = {
        Provider.withTransaction {status->
            def mlnFlag = 0
            def providerData = new Provider(params)
            def clientNum = Integer.parseInt(params.clientNum)
            def MLNNum = Integer.parseInt(params.MLNNum)
            if (providerData.save(flush: true)) {
                if (params.client&&clientNum==1){
                    def clientData = Client.get(Long.parseLong(params.client))
                    if (clientData){
                        def clientProviderData =new ClientProvider()
                        clientProviderData.client=clientData
                        clientProviderData.provider = providerData
                        clientProviderData.clientProvider = params.clientProvider
                        clientProviderData.status = params.cstatus
                        if(params.cactiveInd=="true"){
                            clientProviderData.activeInd = true
                        }else{
                            clientProviderData.activeInd = false
                        }

                        if(!clientProviderData.save(flush:true)){
                            log.debug(clientProviderData.errors)
                            status.setRollbackOnly()
                            flash.message="Save failed"
                            redirect(action: 'listFlash')
                            return
                        }
                    }
                } else if (params.client&&clientNum>1){
                    for (i in 0..clientNum-1){
                        def clientData = Client.get(Long.parseLong(params.client[i]))
                        if (clientData){
                            def clientProviderData =new ClientProvider()
                            clientProviderData.client=clientData
                            clientProviderData.provider = providerData
                            clientProviderData.clientProvider = params.clientProvider[i]
                            clientProviderData.status = params.cstatus[i]
                            if(params.cactiveInd[i]=="true"){
                                clientProviderData.activeInd = true
                            }else{
                                clientProviderData.activeInd = false
                            }
                            if(!clientProviderData.save(flush:true)){
                                log.debug(clientProviderData.errors)
                                status.setRollbackOnly()
                                flash.message="Save failed"
                                redirect(action: 'listFlash')
                                return
                            }
                        }
                    }
                }

                //save state MLN information
                if (params.state&&MLNNum==1){
                    def stateMLNDate = new StateMLN()
                    stateMLNDate.state = params.state
                    if(!params.MLN){
                        status.setRollbackOnly()
                        flash.message="Medical Licence Number is null"
                        redirect(action: 'listFlash')
                        return
                    }
                    stateMLNDate.mln = params.MLN
                    stateMLNDate.providerType = params.mlnProviderType
                    def MLNexist = StateMLN.findByMlnAndState(
                            params.MLN,
                            params.state
                    )
                    if(MLNexist){
                        flash.message = "Medical Licence Number ${params.MLN} of ${params.state} is already exist "
                        mlnFlag =1
                    }else{
                        stateMLNDate.provider = providerData
                        if(!stateMLNDate.save(flush: true)){
                            status.setRollbackOnly()
                            flash.message="Medical Licence Number save failed"
                            redirect(action: 'listFlash')
                            return
                        }
                    }

                } else if(params.state&&MLNNum>1){
                     for (int i =0;i<MLNNum;i++){
                         def stateMLNDate = new StateMLN()

                         def MLNexist = StateMLN.findByMlnAndState(
                                 params.MLN[i],
                                 params.state[i]
                         )
                         if(MLNexist){
                             flash.message = "Medical Licence Number ${params.MLN[i]} of ${params.state[i]} is already exist"
                             mlnFlag =1
                         }else{
                             stateMLNDate.state = params.state[i]
                             if(!params.MLN[i]){
                                 status.setRollbackOnly()
                                 flash.message="Medical Licence Number is null"
                                 redirect(action: 'listFlash')
                                 return
                             }
                             stateMLNDate.mln = params.MLN[i]
                             stateMLNDate.providerType = params.mlnProviderType[i]
                             stateMLNDate.provider = providerData
                             if(!stateMLNDate.save(flush: true)){
                                 status.setRollbackOnly()
                                 flash.message="Medical Licence Number save failed"
                                 redirect(action: 'listFlash')
                                 return
                             }
                         }
                     }
                }
                if(mlnFlag ==0){
                    flash.message = "${message(code: 'default.created.message', args: [message(code: 'provider.label', default: 'Provider'), providerData.id])}"
                }
                redirect(action: "showFlash", id: providerData.id)
            }
            else {
                render(view: "create", model: [providerData: providerData])
            }
        }

    }

    def show = {
        def providerData = Provider.get(params.id)

        if (!providerData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'provider.label', default: 'Provider'), params.id])}"
            redirect(action: "listFlash")
        }
        else {
            def searchClientStr = "select c.id,c.name,c.alias,c.activeInd,cp.clientProvider,cp.status,cp.activeInd from Client c,ClientProvider cp where c.id in (select cp1.client from ClientProvider cp1 where cp1.provider = ${params.id} ) and cp.client = c.id and cp.provider = ${params.id}"
            def clientDataList = Client.executeQuery(searchClientStr)
            def stateMLNDataList = StateMLN.findAllByProvider(providerData)
            flash.message = ""
            [providerData: providerData,clientDataList:clientDataList,clientDataTotal:clientDataList.size(),stateMLNDataList:stateMLNDataList,stateMLNDataTotal: stateMLNDataList.size()]
        }
    }
    def showFlash = {
        def providerData = Provider.get(params.id)


        if (!providerData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'provider.label', default: 'Provider'), params.id])}"
            redirect(action: "listFlash")
        }

        else {
            def searchClientStr = "select c.id,c.name,c.alias,c.activeInd,cp.clientProvider,cp.status,cp.activeInd from Client c,ClientProvider cp where c.id in (select cp1.client from ClientProvider cp1 where cp1.provider = ${params.id} ) and cp.client = c.id and cp.provider = ${params.id}"
            def clientDataList = Client.executeQuery(searchClientStr)
            def stateMLNDataList = StateMLN.findAllByProvider(providerData)
            render(view: "show",model:[providerData: providerData,clientDataList:clientDataList,clientDataTotal:clientDataList.size(),stateMLNDataList:stateMLNDataList,stateMLNDataTotal: stateMLNDataList.size()])
        }
    }

    def edit = {
//        if(!params.max) params.max =10
//        if (!params.offset) params.offset = 0
        def providerData = Provider.get(params.id)
        if (!providerData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'provider.label', default: 'Provider'), params.id])}"
            redirect(action: "listFlash")
        }
        else {
            def searchClientStr = "select c.id,c.name,c.alias,c.activeInd,cp.clientProvider,cp.status,cp.activeInd from Client c,ClientProvider cp where c.id in (select cp1.client from ClientProvider cp1 where cp1.provider = ${params.id} ) and c.id = cp.client and cp.provider = ${params.id}  "
            def clientDataList = Client.executeQuery(searchClientStr)
            def stateMLNDataList = StateMLN.findAllByProvider(providerData)
            flash.message = ""
            return [providerData: providerData,clientDataList:clientDataList,clientDataTotal:clientDataList.size(),stateMLNDataList:stateMLNDataList,stateMLNDataTotal:stateMLNDataList.size()]
        }
    }

    def update = {
        println(params)
        Provider.withTransaction {status->
            def mlnFlag = 0;
            def clientNum = Integer.parseInt(params.clientNum)
            def MLNNum = Integer.parseInt(params.MLNNum)
            def providerData = Provider.get(params.id)
            if (providerData) {
                if (params.version) {
                    def version = params.version.toLong()
                    if (providerData.version > version) {

                        providerData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'provider.label', default: 'Provider')] as Object[], "Another user has updated this Provider while you were editing")
                        render(view: "edit", model: [providerData: providerData])
                        return
                    }
                } else{
                    providerData.properties=params
                }
                if (!providerData.hasErrors() && providerData.save(flush: true)) {
                    if(params.delMLN){
                        def mlnId =  params.delMLN.split(',')
                        if(mlnId.size()>0){
                            mlnId.each{
                                if(it){
                                    def stateMLN = StateMLN.get(Long.parseLong(it))
                                    if(stateMLN){
                                        try{
                                            stateMLN.delete(flash:true)
                                        }catch (Exception e){
                                            flash.message =  "State  Medical Licence Number delete failed"
                                            status.setRollbackOnly()
                                            redirect(action: 'edit',id: params.id)
                                            return
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if (params.client&&clientNum==1){
                        def clientData = Client.get(Long.parseLong(params.client))
                        if (clientData){
                            def clientProviderData = ClientProvider.findByClientAndProvider(clientData,providerData)
                            if (!clientProviderData){
                                clientProviderData = new  ClientProvider()
                                clientProviderData.client=clientData
                                clientProviderData.provider = providerData
                                clientProviderData.status = params.cstatus
                                if(params.cactiveInd=="true"){
                                    clientProviderData.activeInd = true
                                }else{
                                    clientProviderData.activeInd = false
                                }
                                if(!clientProviderData.save(flush:true)){
                                    log.debug(clientProviderData.errors)
                                    flash.message = "Save Failed"
                                    status.setRollbackOnly()
                                    redirect(action: listFlash)
                                    return
                                }
                            } else{
                                clientProviderData.clientProvider = params.clientProvider
                                clientProviderData.status = params.cstatus
                                if(params.cactiveInd=="true"){
                                    clientProviderData.activeInd = true
                                }else{
                                    clientProviderData.activeInd = false
                                }
                                if(!clientProviderData.save(flush:true)){
                                    log.debug(clientProviderData.errors)
                                    flash.message = "Save Failed"
                                    status.setRollbackOnly()
                                    redirect(action: listFlash)
                                    return
                                }
                            }
                        }
                    } else if (params.client&&clientNum>1){
                        for (i in 0..clientNum-1){
                            def clientData = Client.get(Long.parseLong(params.client[i]))
                            if (clientData){
                                def clientProviderData = ClientProvider.findByClientAndProvider(clientData,providerData)
                                if (!clientProviderData) {
                                    clientProviderData =new ClientProvider()
                                    clientProviderData.client=clientData
                                    clientProviderData.provider = providerData
                                    clientProviderData.clientProvider = params.clientProvider[i]
                                    clientProviderData.status = params.cstatus[i]
                                    if(params.cactiveInd[i]=="true"){
                                        clientProviderData.activeInd = true
                                    }else{
                                        clientProviderData.activeInd = false
                                    }
                                    if(!clientProviderData.save(flush:true)){
                                        log.debug(clientProviderData.errors)
                                        flash.message = "Save Failed"
                                        status.setRollbackOnly()
                                        redirect(action: listFlash)
                                        return
                                    }
                                }else{
                                    clientProviderData.clientProvider = params.clientProvider[i]
                                    clientProviderData.status = params.cstatus[i]
                                    if(params.cactiveInd[i]=="true"){
                                        clientProviderData.activeInd = true
                                    }else{
                                        clientProviderData.activeInd = false
                                    }
                                    if(!clientProviderData.save(flush:true)){
                                        log.debug(clientProviderData.errors)
                                        flash.message = "Save Failed"
                                        status.setRollbackOnly()
                                        redirect(action: listFlash)
                                        return
                                    }
                                }
                            }
                        }
                    }

                    //save state MLN information
                    if (params.state&&MLNNum==1){
                        def stateMLNDate
                        if(params.stateMLNDataId){
                            stateMLNDate = StateMLN.get(Long.parseLong(params.stateMLNDataId))
                            if(stateMLNDate){
                                if(stateMLNDate.state!=params.state||stateMLNDate.mln!=params.NLN){
                                    def MLNexist = StateMLN.findByMlnAndState(
                                            params.MLN,
                                            params.state
                                    )
                                    if(MLNexist&&MLNexist.id!=stateMLNDate.id){
                                        flash.message = "Medical Licence Number ${params.MLN} of ${params.state} is already exist"
                                        mlnFlag = 1
                                    }else{
                                        stateMLNDate.mln = params.MLN
                                        stateMLNDate.state = params.state
                                        stateMLNDate.providerType = params.mlnProviderType
                                        if(!stateMLNDate.save(flash:true)){
                                            flash.message = "Medical Licence Number save failed"
                                            status.setRollbackOnly()
                                            redirect(action: listFlash)
                                            return
                                        }
                                    }
                                }
                            } else{
                                flash.message = "Medical Licence Number is not found"
                                status.setRollbackOnly()
                                redirect(action: listFlash)
                                return
                            }
                        }else{

                            stateMLNDate = new StateMLN()
                            def MLNexist = StateMLN.findByMlnAndState(
                                    params.MLN,
                                    params.state
                            )
                            if(MLNexist){
                                flash.message = "Medical Licence Number ${params.MLN} of ${params.state} is already exist"
                                mlnFlag = 1
                            } else{
                                stateMLNDate.state = params.state
                                if(!params.MLN){
                                    status.setRollbackOnly()
                                    flash.message="Medical Licence Number is null"
                                    redirect(action: 'listFlash')
                                    return
                                }
                                stateMLNDate.mln = params.MLN
                                stateMLNDate.provider = providerData
                                stateMLNDate.providerType = params.mlnProviderType
                                if(!stateMLNDate.save(flush: true)){
                                    status.setRollbackOnly()
                                    flash.message="Medical Licence Number save failed"
                                    redirect(action: 'listFlash')
                                    return
                                }
                            }



                        }
                    } else if(params.state&&MLNNum>1){
                        for (int i =0;i<MLNNum;i++){
                            def stateMLNDate
                            if(params.stateMLNDataId[i]){
                                stateMLNDate = StateMLN.get(Long.parseLong(params.stateMLNDataId[i]))
                                if(stateMLNDate){
                                    if(stateMLNDate.state!=params.state||stateMLNDate.mln!=params.NLN){
                                        def MLNexist = StateMLN.findByMlnAndState(
                                                params.MLN[i],
                                                params.state[i]
                                        )
                                        if(MLNexist&&MLNexist.id!=stateMLNDate.id){
                                            flash.message = "Medical Licence Number ${params.MLN[i]} of ${params.state[i]} is already exist"
                                            mlnFlag = 1
                                        }else{
                                            stateMLNDate.mln = params.MLN[i]
                                            stateMLNDate.state = params.state[i]
                                            stateMLNDate.providerType = params.mlnProviderType[i]
                                            if(!stateMLNDate.save(flash:true)){
                                                flash.message = "Medical Licence Number save failed"
                                                status.setRollbackOnly()
                                                redirect(action: listFlash)
                                                return
                                            }
                                        }
                                    }
                                } else{
                                    flash.message = "Medical Licence Number is not found"
                                    status.setRollbackOnly()
                                    redirect(action: listFlash)
                                    return
                                }
                            }else{
                                stateMLNDate = new StateMLN()

                                def MLNexist = StateMLN.findByMlnAndState(
                                        params.MLN[i],
                                        params.state[i]
                                )
                                if(MLNexist){
                                    flash.message = "Medical Licence Number ${params.MLN[i]} of ${params.state[i]} is already exist"
                                    mlnFlag = 1
                                }else{
                                    stateMLNDate.state = params.state[i]
                                    if(!params.MLN[i]){
                                        status.setRollbackOnly()
                                        flash.message="Medical Licence Number is null"
                                        redirect(action: 'listFlash')
                                        return
                                    }
                                    stateMLNDate.mln = params.MLN[i]
                                    stateMLNDate.providerType = params.mlnProviderType[i]
                                    stateMLNDate.provider = providerData
                                    if(!stateMLNDate.save(flush: true)){
                                        status.setRollbackOnly()
                                        flash.message="Medical Licence Number save failed"
                                        redirect(action: 'listFlash')
                                        return
                                    }
                                }
                            }
                        }
                    }
                    if(mlnFlag==0){
                        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'provider.label', default: 'Provider'), providerData.id])}"
                    }
                    redirect(action: "showFlash", id: providerData.id)
                }
                else {
                    flash.message="Update failed"
                    redirect(action: "listFlash")
                    return
                }
            }
            else {
                flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'provider.label', default: 'Provider'), params.id])}"
                redirect(action: "listFlash")
                return
            }
        }
    }

    def delete = {
        Provider.withTransaction {status->
            def providerData = Provider.get(params.id)
            if (providerData.id) {
                try {
                    def clientProvider = ClientProvider.findByProvider(providerData)
                    if (clientProvider){
                        flash.message = "The Provider ${providerData.id} in Client ${clientProvider.client} has been used cannot be deleted"
                        redirect(action: "listFlash")
                        return
                    }
                    def mlnStateList = StateMLN.findAllByProvider(providerData)
                    mlnStateList.each{
                        it.delete(flush:true)
                    }
                    providerData.delete(flush: true)
                    flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'provider.label', default: 'Provider'), params.id])}"
                    redirect(action: "listFlash")
                }
                catch (org.springframework.dao.DataIntegrityViolationException e) {
                    status.setRollbackOnly()
                    flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'provider.label', default: 'Provider'), params.id])}"
                    redirect(action: "listFlash")
                    return
                }
            }
            else {
                flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'provider.label', default: 'Provider'), params.id])}"
                redirect(action: "listFlash")
            }
        }
    }
    def search = {
        if(!params.max)params.max=10
        if(!params.offset)params.offset=0

//        def str ="select p.id,p.NPI,c.name,p.firstName,p.lastName,p.middleName,p.dateCreated from Provider p,Client c where p.client=c.id "
//        if (params.NPI){
//            str = str + " and p.NPI like '%${params.NPI}%'"
//        }
//        if (params.client){
//            str = str + " and c.name like '%${params.client}%'"
//        }
//        if (params.firstName){
//            str = str + " and p.firstName like '%${params.firstName}%'"
//        }
//        if (params.lastName){
//            str = str + " and p.lastName like '%${params.lastName}%'"
//        }
//        str =str+ " order by p.dateCreated desc "
//        def providerDataList = Provider.executeQuery(str,[max:params.max,offset:params.offset])
//        def providerDataList1 = Provider.executeQuery(str)
        def searchProvider = {
            if(params.NPI){
                like("NPI","%${params.NPI}%")
            }
            if (params.firstName){
                like("firstName","%${params.firstName}%")
            }
            if(params.lastName){
                like("lastName","%${params.lastName}%")
            }

            if(params.middleName){
                like("middleName","%${params.middleName}%")
            }
            order('dateCreated',"desc")
        }

        def providerDataList = Provider.createCriteria().list(params,searchProvider)
        if (providerDataList) {
            flash.message = "${providerDataList.totalCount} Provider(s) found!"
        }else{
            flash.message="No data found!"
        }


        render(view: "list",model: [providerDataList:providerDataList,providerDataTotal:providerDataList.totalCount,params: params])

    }

    def  selectClient = {
//        println(params.activeInd)
        if(!params.max) params.max =10
        if (!params.offset) params.offset = 0

        def searchClient = {
            if(params.name){
                like('name',"%${params.name}%")
            }
            if (params.alias){
                like('name',"%${params.alias}%")
            }
            if (params.activeInd=="on"){
                eq('activeInd',true)
            }
            order('dateCreated',"desc")
        }

        def clientDataList = Client.createCriteria().list(params,searchClient)
        if (clientDataList) {
            flash.message="${clientDataList.totalCount} Client(s) found!"
        }else{
            flash.message="No data found!"
        }
        render(view: 'selectClient',model: [clientDataList:clientDataList,clientDataTotal:clientDataList.totalCount])
    }

    def deleteClient={
        if(params.provider){
            if(params.client){
                def providerData = Provider.get(Long.parseLong(params.provider))
                def clientData = Client.get(Long.parseLong(params.client))
                if (providerData){
                    if (clientData){
                        def clientProviderData = ClientProvider.findByClientAndProvider(clientData,providerData)
                        if(clientProviderData){
                            clientProviderData.delete(flush: true)
                            render ""
                            return
                        }else{
                            render "Client And Provider dose not exist!"
                            return
                        }
                    }else{
                        render "Client dose not exist!"
                        return
                    }
                }  else{
                    render"Provider dose not exist!"
                    return
                }
            } else{
                render "Client Id is blank!"
                return
            }
        }else {
            render "Provider Id is blank!"
            return
        }
    }

    def  selectClient1 = {
        if(!params.max) params.max =10
        if (!params.offset) params.offset = 0

        def searchClient = {
            if(params.name){
                like('name',"%${params.name}%")
            }
            if (params.alias){
                like('name',"%${params.alias}%")
            }
//            if (params.activeInd){
//                eq('activeInd',Boolean.parseBoolean(params.activeInd))
//            }
            order('dateCreated',"desc")
        }

        def clientDataList = Client.createCriteria().list(params,searchClient)
        if(clientDataList){
              flash.message="${clientDataList.totalCount} Client(s) found"
        }else{
            flash.message = "No data found"
        }
        render(view: 'selectClient1',model: [clientDataList:clientDataList,clientDataTotal:clientDataList.totalCount])
    }

    def selectProviderType = {
        if(!params.max) params.max =10
        if (!params.offset) params.offset = 0

        def searchProviderType = {
            if(params.type){
                like('type',"%${params.type}%")
            }
            if(params.conmments){
                like('conmments',"%${params.conmments}%")
            }
        }


        def providerTypeDataList = ProviderType.createCriteria().list(params,searchProviderType)

        if(providerTypeDataList){
            flash.message="${providerTypeDataList.totalCount} Provider Type(s) found"
        }else{
            flash.message = "No data found"
        }

        render(view: 'selectProviderType',model: [providerTypeDataList:providerTypeDataList,providerTypeDataTotal:providerTypeDataList.totalCount])
    }
}
