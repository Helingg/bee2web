package com.bssi

class ClientAddress {
    String phone = ""
    String fax = ""
    String billingContactName = ""
    String billingContactEmail = ""
    String billingContactPhone = ""

    Date dateCreated

    boolean activeInd = false

    static belongsTo  = [client:Client,addr:Address,addrType:AddressType]
    static constraints = {
        fax(size:0..128)
        billingContactName(size:0..128)
        billingContactEmail(size:0..128)
        billingContactPhone(size:0..128)
        activeInd(boolean:true)
    }

    static mapping = {
        version false
    }
}
