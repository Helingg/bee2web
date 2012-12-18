package com.bssi

class AddressType {
    String addrType = ""
    String description = ""
    boolean activeInd = false
    static constraints = {
        addrType(size: 0..4,unique: true)
        description(size: 0..128)
        activeInd (boolean:true)
    }
    static mapping = {
        version false
    }

    String toString(){
        return addrType
    }

}
