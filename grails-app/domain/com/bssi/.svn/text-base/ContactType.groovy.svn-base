package com.bssi

class ContactType {
    String contactType = ""
    String description = ""
    boolean activeInd = false

    static constraints = {
        contactType(size:0..4,unique: true)
        description(size: 0..128)

    }

    static mapping = {
        version false
    }

    String toString (){
        return contactType
    }
}
