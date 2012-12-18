package com.bssi
/**
 *  auther hlg
 *
 *  4/1/2012
 */
class Patient {
    String firstName
    String lastName
    String middleName
    boolean enabled
    Date dateCreated

    static constraints = {
        firstName(size: 0..128,blank:false)
        lastName(size: 0..128,blank: false)
        middleName(size: 0..128)
        enabled(boolean:true)

    }

    static mapping = {
        version false
    }

    String toString (){
        return firstName +" "+ lastName
    }
}
