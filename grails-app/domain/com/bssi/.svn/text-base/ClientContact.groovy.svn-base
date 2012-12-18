package com.bssi

class ClientContact {
    String firstName = ""
    String lastName  = ""
    String middleName = ""
    String phoneNbr  = ""
    String emailAddr  = ""

    static belongsTo=[client:Client,contactType:ContactType,addr:Address]
    static constraints = {
        firstName(size: 0..128,blank: false)
        lastName(size: 0..128,blank: false)
        middleName(size: 0..128)
        phoneNbr(size: 0..128)
        emailAddr(size: 0..128)
    }

    static mapping = {
        version false
    }
}
