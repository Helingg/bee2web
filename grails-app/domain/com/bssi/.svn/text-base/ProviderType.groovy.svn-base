package com.bssi

class ProviderType {

    String type = ""
    String conmments = ""

   Date dateCreated

//    static belongsTo = [provider:Provider]
    static constraints = {
        type(nullable:false,size: 1..16,unique: true)
        conmments(size: 1..128)

    }

    static mapping = {
//        id column: 'provider_id'
        version false
    }

    String toString(){
        return type
    }
}
