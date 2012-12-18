package com.bssi

class Provider {
    String NPI = ""
    String NPI1 = ""
    String NPI2 = ""
    String firstName  = ""
    String lastName  = ""
    String middleName   = ""
    String prefix  = ""
    String suffix = ""
    String DOB   = ""
//    String MLN    = ""
    String status = ""
    String SSN   = ""
    String UPIN   = ""
    String DEA = ""
    String providerType = ""

    Date dateCreated
    static constraints = {
        NPI(size: 0..128)
        NPI1(size: 0..128)
        NPI2(size: 0..128)
        firstName(size: 0..128)
        lastName(size: 0..128)
        middleName(size: 0..128)
        prefix(size: 0..16)
        suffix(size: 0..16)
        status(size:0..32,inList: ['Status1','Status2','Status3','Status4'])
        DOB(size: 0..128)
//        MLN(size: 0..128)
        DEA(size: 0..128)
        SSN(size: 0..16)
        UPIN(size: 0..8)
        dateCreated(dispaly:false)
    }
    static mapping = {
        id column: 'provider_id'
        version false
    }

    String toString(){
        return  lastName+" "+firstName
    }
}
