package com.bssi

class ClientProvider {

    String  status = ""

    boolean  activeInd = true

    String clientProvider = ""

    Date dateCreated


    static belongsTo = [client:Client,provider:Provider]
    static constraints = {
        status(size: 0..16)
        clientProvider(nullable: false,size: 0..128)
        activeInd(boolean:true)

    }

    static mapping = {
        version false

        id column: 'client_provider_id'
    }

}
