package com.bssi

class ClientProviderController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        flash.message=""
        [clientProviderDataList: ClientProvider.list(params), clientProviderDataTotal: ClientProvider.count()]
    }

    def listFlash = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        render(view:'list',model:[clientProviderDataList: ClientProvider.list(params), clientProviderDataTotal: ClientProvider.count()])
    }

    def create = {
        def clientProviderData = new ClientProvider()
        clientProviderData.properties = params
        flash.message = ""
        return [clientProviderData: clientProviderData]
    }

    def save = {
        ClientProvider.withTransaction {status->
            def providerNum = Integer.parseInt(params.providerNum)
            def clientProviderData
            if (params.provider&&params.client&&providerNum==1){
                def providerData = Provider.get(Long.parseLong(params.provider))
                def clientData = Client.get(Long.parseLong(params.client))
                if (clientData){
                    if (providerData) {
                        clientProviderData  = ClientProvider.findByClientAndProvider(clientData,providerData)
                        if (clientProviderData) {
                            flash.message = "The Client Provider is already exist!"
                            redirect(action: "listFlash")
                            return
                        }
                        if (!clientProviderData){
                            clientProviderData = new ClientProvider()
                            clientProviderData.client= clientData
                            clientProviderData.provider = providerData

                            if (params.status){
                                clientProviderData.status=params.status
                            }
                            clientProviderData.activeInd = params.activeInd
                            clientProviderData.clientProvider = params.clientProvider
                            if (!clientProviderData.save(flush: true)){
                                log.debug(clientProviderData.errors)
                                status.setRollbackOnly()
                                flash.message = "Client Provider save failed!"
                                redirect(action: "listFlash")
                                return
                            }else{
                                flash.message = "${message(code: 'default.created.message', args: [message(code: 'clientProvider.label', default: 'ClientProvider'), clientProviderData.id])}"
                                redirect(action: "showFlash",id:clientProviderData.id )
                                return
                            }
                        }else{
                            clientProviderData.clientProvider = params.clientProvider
                            if (!clientProviderData.save(flush: true)){
                                log.debug(clientProviderData.errors)
                                status.setRollbackOnly()
                                flash.message = "Client Provider save failed!"
                                redirect(action: "listFlash")
                                return
                            }else{
                                flash.message = "${message(code: 'default.created.message', args: [message(code: 'clientProvider.label', default: 'ClientProvider'), clientProviderData.id])}"
                                redirect(action: "showFlash",id:clientProviderData.id)
                                return
                            }
                        }
                    }
                }
            }  else if (params.provider&&params.client&&providerNum>1){
                for (i in 0..providerNum-1){
                    def clientData = Client.get(Long.parseLong(params.client))
                    if (clientData){
                        def  providerData = Provider.get(Long.parseLong(params.provider[i]))
                        if (providerData){
                            clientProviderData  = ClientProvider.findByClientAndProvider(clientData,providerData)
                            if (!clientProviderData){
                                clientProviderData  = new ClientProvider()
                                clientProviderData.client= clientData
                                clientProviderData.provider = providerData
                                if (params.status){
                                    clientProviderData.status=params.status
                                }
                                clientProviderData.activeInd = params.activeInd
                                clientProviderData.clientProvider = params.clientProvider[i]
                                if (!clientProviderData.save(flush: true)){
                                    log.debug(clientProviderData.errors)
                                    status.setRollbackOnly()
                                    flash.message = "Client Provider save failed!"
                                    redirect(action: "listFlash")
                                    return
                                }
                            }else{
                                clientProviderData.clientProvider = params.clientProvider[i]
                                if (!clientProviderData.save(flush: true)){
                                    log.debug(clientProviderData.errors)
                                    status.setRollbackOnly()
                                    flash.message = "Client Provider save failed!"
                                    redirect(action: "listFlash")
                                    return
                                }
                            }
                        }
                    }
                }
                flash.message = "${message(code: 'default.created.message', args: [message(code: 'clientProvider.label', default: 'ClientProvider'), clientProviderData.id])}"
                redirect(action: "showFlash",id: clientProviderData.id)
                return
            } else{
                flash.message = "Client Id or Provider Id is blank!"
                redirect(action: "listFlash")
                return
            }
        }
    }

    def show = {
        def clientProviderData = ClientProvider.get(params.id)
        if(!clientProviderData)  {
            flash.message="Data not found"
            redirect(action: listFlash)
            return
        }
        def clientData = Client.get(clientProviderData.client?.id)
        def searchProviderStr = "select p.id,p.NPI,p.firstName,p.lastName,p.middleName,cp.clientProvider from Provider p,ClientProvider cp where p.id=${clientProviderData.provider?.id} and  cp.provider = ${clientProviderData.provider?.id} and cp.client = ${clientProviderData.client?.id}"
        def providerInstanceList = Provider.executeQuery(searchProviderStr)
        if (!clientProviderData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientProvider.label', default: 'ClientProvider'), params.id])}"
            redirect(action: "list")
            return
        } else if (!clientData){
            flash.message = "Client not found!"
            redirect(action: "list")
            return
        }else if (providerInstanceList.size()==0) {
            flash.message = "Provider not found!"
            redirect(action: "list")
            return
        }
        else {
            flash.message = ""
            return [clientProviderData: clientProviderData,clientDataList:clientData,clientDataTotal:1,providerInstanceList:providerInstanceList,providerInstanceTotal:providerInstanceList.size()]
        }
    }

    def showFlash = {
        def clientProviderData = ClientProvider.get(params.id)
        if(!clientProviderData)  {
            flash.message="Data not found"
            redirect(action: listFlash)
            return
        }
        def clientData = Client.get(clientProviderData.client?.id)
        def searchProviderStr = "select p.id,p.NPI,p.firstName,p.lastName,p.middleName,cp.clientProvider from Provider p,ClientProvider cp where p.id=${clientProviderData.provider?.id} and  cp.provider = ${clientProviderData.provider?.id} and cp.client = ${clientProviderData.client?.id}"
        def providerInstanceList = Provider.executeQuery(searchProviderStr)
        if (!clientProviderData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientProvider.label', default: 'ClientProvider'), params.id])}"
            redirect(action: "listFlash")
            return
        } else if (!clientData){
            flash.message = "Client not found!"
            redirect(action: "listFlash")
            return
        }else if (providerInstanceList.size()==0) {
            flash.message = "Provider not found!"
            redirect(action: "listFlash")
            return
        }
        else {
            render(view: 'show',model:[clientProviderData: clientProviderData,clientDataList:clientData,clientDataTotal:1,providerInstanceList:providerInstanceList,providerInstanceTotal:providerInstanceList.size()])
        }
    }

    def edit = {
        def clientProviderData = ClientProvider.get(params.id)
        def clientData = Client.get(clientProviderData.client?.id)
        def searchProviderStr = "select p.id,p.NPI,p.firstName,p.lastName,p.middleName,cp.clientProvider from Provider p,ClientProvider cp where p.id=${clientProviderData.provider?.id} and  cp.provider = ${clientProviderData.provider?.id} and cp.client = ${clientProviderData.client?.id}"
        def providerInstanceList = Provider.executeQuery(searchProviderStr)
        if (!clientProviderData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientProvider.label', default: 'ClientProvider'), params.id])}"
            redirect(action: "list")
            return
        } else if (!clientData){
            flash.message = "Client not found!"
            redirect(action: "list")
            return
        }else if (providerInstanceList.size()==0) {
            flash.message = "Provider not found!"
            redirect(action: "list")
            return
        }
        else {
            flash.message = ""
            return [clientProviderData: clientProviderData,clientDataList:clientData,clientDataTotal:1,providerInstanceList:providerInstanceList,providerInstanceTotal:providerInstanceList.size()]
        }
    }

    def update = {
        ClientProvider.withTransaction {status->
            def clientProviderData = ClientProvider.get(params.id)
            def clientProviderDataOther
            def clientProviderDataNew
            def providerNum = Integer.parseInt(params.providerNum)
            if (clientProviderData) {
//                if (params.version) {
//                    def version = params.version.toLong()
//                    if (clientProviderData.version > version) {
//                        clientProviderData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'clientProvider.label', default: 'ClientProvider')] as Object[], "Another user has updated this ClientProvider while you were editing")
//                        render(view: "edit", model: [clientProviderData: clientProviderData])
//                        return
//                    }
//                }
                if (params.provider&&params.client&&providerNum==1){
                    def providerData = Provider.get(Long.parseLong(params.provider))
                    def clientData = Client.get(Long.parseLong(params.client))
                    if (clientData){
                        if (providerData) {
                            clientProviderDataOther  = ClientProvider.findByClientAndProvider(clientData,providerData)
                            if (!clientProviderDataOther){
                                clientProviderData.client= clientData
                                clientProviderData.provider = providerData
                                if (params.status){
                                    clientProviderData.status=params.status
                                }
                                clientProviderData.activeInd = params.activeInd
                                clientProviderData.clientProvider = params.clientProvider
                                if (!clientProviderData.save(flush: true)){
                                    log.debug(clientProviderData.errors)
                                    status.setRollbackOnly()
                                    flash.message = "Client Provider save failed!"
                                    redirect(action: "listFlash")
                                    return
                                }else{
                                    flash.message = "${message(code: 'default.updated.message', args: [message(code: 'clientProvider.label', default: 'ClientProvider'), clientProviderData.id])}"
                                    redirect(action: "showFlash",id:clientProviderData.id )
                                    return
                                }
                            }else{
                                if (clientProviderData.id!=clientProviderDataOther.id){
                                    clientProviderDataOther.delete(flush: true)
                                }
                                if (params.status){
                                    clientProviderData.status=params.status
                                }
                                clientProviderData.activeInd = params.activeInd
                                clientProviderData.clientProvider = params.clientProvider
                                if (!clientProviderData.save(flush: true)){
                                    log.debug(clientProviderData.errors)
                                    status.setRollbackOnly()
                                    flash.message = "Client Provider save failed!"
                                    redirect(action: "listFlash")
                                    return
                                }else{
                                    flash.message = "${message(code: 'default.updated.message', args: [message(code: 'clientProvider.label', default: 'ClientProvider'), clientProviderData.id])}"
                                    redirect(action: "showFlash",id: clientProviderData.id)
                                    return
                                }
                            }
                        }
                    }
                }  else if (params.provider&&params.client&&providerNum>1){
                    def existFlag = 0
                    for (i in 0..providerNum-1){
                        def clientData = Client.get(Long.parseLong(params.client))
                        if (clientData){
                            def  providerData = Provider.get(Long.parseLong(params.provider[i]))
                            if (providerData){
                                clientProviderDataOther  = ClientProvider.findByClientAndProvider(clientData,providerData)
                                if (!clientProviderDataOther){
                                    if (existFlag==0&&i==providerNum-1){
                                        clientProviderData.client= clientData
                                        clientProviderData.provider = providerData
                                        if (params.status){
                                            clientProviderData.status=params.status
                                        }
                                        clientProviderData.activeInd = params.activeInd
                                        clientProviderData.clientProvider = params.clientProvider[i]
                                        if (!clientProviderData.save(flush: true)){
                                            log.debug(clientProviderData.errors)
                                            status.setRollbackOnly()
                                            flash.message = "Client Provider save failed!"
                                            redirect(action: "listFlash")
                                            return
                                        }
                                    }else{
                                        clientProviderDataNew  = new ClientProvider()
                                        clientProviderDataNew.client= clientData
                                        clientProviderDataNew.provider = providerData
                                        if (params.status){
                                            clientProviderDataNew.status=params.status
                                        }
                                        clientProviderDataNew.activeInd = params.activeInd
                                        clientProviderDataNew.clientProvider = params.clientProvider[i]
                                        if (!clientProviderDataNew.save(flush: true)){
                                            log.debug(clientProviderDataNew.errors)
                                            status.setRollbackOnly()
                                            flash.message = "Client Provider save failed!"
                                            redirect(action: "listFlash")
                                            return
                                        }
                                    }
                                }else{
                                    existFlag++
                                    if (existFlag==1){
                                        if (clientProviderData.id!=clientProviderDataOther.id){
                                            clientProviderDataOther.delete(flush: true)
                                        }
                                        if (params.status){
                                            clientProviderData.status=params.status
                                        }
                                        clientProviderData.activeInd = params.activeInd
                                        clientProviderData.clientProvider = params.clientProvider[i]
                                        if (!clientProviderData.save(flush: true)){
                                            log.debug(clientProviderData.errors)
                                            status.setRollbackOnly()
                                            flash.message = "Client Provider save failed!"
                                            redirect(action: "listFlash")
                                            return
                                        }
                                    }else{
                                        if (params.status){
                                            clientProviderDataOther.status=params.status
                                        }
                                        clientProviderDataOther.activeInd = params.activeInd
                                        clientProviderDataOther.clientProvider = params.clientProvider[i]
                                        if (!clientProviderDataOther.save(flush: true)){
                                            log.debug(clientProviderDataOther.errors)
                                            status.setRollbackOnly()
                                            flash.message = "Client Provider save failed!"
                                            redirect(action: "listFlash")
                                            return
                                        }
                                    }
                                }
                            }
                        }
                    }
                    flash.message = "${message(code: 'default.updated.message', args: [message(code: 'clientProvider.label', default: 'ClientProvider'), clientProviderData.id])}"
                    redirect(action: "showFlash",id: clientProviderData.id)
                    return
                } else{
                    flash.message = "Client Id or Provider Id is blank!"
                    redirect(action: "listFlash")
                    return
                }
                clientProviderData.properties = params
                if (!clientProviderData.hasErrors() && clientProviderData.save(flush: true)) {
                    flash.message = "Save Failed!"
                    redirect(action: "listFlash")
                    return
                }
                else {
                    flash.message = "${message(code: 'default.updated.message', args: [message(code: 'clientProvider.label', default: 'ClientProvider'), clientProviderData.id])}"
                    redirect(action: "listFlash")
                    return
                }
            }
            else {
                flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientProvider.label', default: 'ClientProvider'), params.id])}"
                redirect(action: "listFlash")
                return
            }

        }
    }

    def delete = {
        def clientProviderData = ClientProvider.get(params.id)
        if (clientProviderData) {
            try {
                clientProviderData.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'clientProvider.label', default: 'ClientProvider'), params.id])}"
                redirect(action: "listFlash")
                return
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'clientProvider.label', default: 'ClientProvider'), params.id])}"
                redirect(action: "listFlash")
                return
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'clientProvider.label', default: 'ClientProvider'), params.id])}"
            redirect(action: "list")
            return
        }
    }

    def search = {
        if(!params.max)params.max =10
        if(!params.offset)params.offset=0

        def searchClientProvider = {
            if(params.client){
                client{
                    like("name","%${params.client}%")
                }
            }
            if (params.provider){
                provider{
                    or{
                        like("firstName","%${params.provider}%")
                        like("lastName","%${params.provider}%")
                    }

                }
            }
            if (params.activeInd){
                eq("activeInd",Boolean.parseBoolean(params.activeInd))
            }

            order("dateCreated","desc")
        }

        def clientProviderDataList = ClientProvider.createCriteria().list(params,searchClientProvider)
        if(clientProviderDataList){
            flash.message = "${clientProviderDataList.totalCount} Client Provider(s) found!"
        }else{
            flash.message = "No data found!"
        }


        render(view: 'list',model: [clientProviderDataList:clientProviderDataList,clientProviderDataTotal: clientProviderDataList.totalCount,params: params])
    }
}
