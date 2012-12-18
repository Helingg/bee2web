package com.bssi

class Application {
    String name = ""
    String applicationVersion = ""
//    String servicePack = ""
//    boolean type = true //true is from application

    Date dateCreated



    static constraints = {
        name(nullable: false,size: 0..128)
        applicationVersion(nullable: false,size: 0..64)
//        servicePack(size: 0..128)
//        type(boolean:true)
    }

    static mapping = {
        version:false
        id column: 'application_id'
    }

    String toString (){
        return name+"-"+applicationVersion
    }
}
