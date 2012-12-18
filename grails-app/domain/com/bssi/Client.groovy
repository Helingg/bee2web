package com.bssi

/**
 * This domain save all clients for BEE Engine v2.0
 *
 * author: Wang Gang
 *
 * date: 3/23/2012
 */
class Client {
	
	String name
	String alias
	boolean activeInd = true
	
	Date dateCreated
//	static hasMany = [provider:Provider]
	static constraints = {
		
		name(nullable:false,size:0..128,unique: true)
		alias(size:0..128)
        activeInd(boolean:true)
		dateCreated(display:false)
	}

    static mapping = {
		version false
        id column: 'client_id'
	}

	String toString(){
		return name
	}
}
