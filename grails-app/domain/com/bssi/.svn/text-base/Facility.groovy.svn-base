package com.bssi
/**
 * This class connect among client
 *
 * auther:hlg
 *
 * date 3/26/2012
 *
 */

class Facility {

    String name
    String comment
    boolean activeInd
    Date dateCreated

    static belongsTo = [client: Client]
    static constraints = {
        name(size: 0..128,blank: false)
        comment(size: 0..128)
        activeInd(boolean:true)
    }

    static mapping = {
        version false
    }

    String toString (){
        return name
    }

}
