package com.bssi

class FacilityAddress {
    Date dateCreated
    boolean activeInd

     static belongsTo = [facility:Facility,addrType:AddressType,addr:Address]
    static constraints = {
        activeInd(boolean:true)
    }

    static mapping = {
          version false
    }
}
