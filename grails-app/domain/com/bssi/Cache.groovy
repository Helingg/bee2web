package com.bssi

/**
 * This domain will held all messages which no sender was found
 *
 * author: Wang Gang
 */
class Cache {
	
	String msgCtrlId
	
	String message
	
	String remoteIp
	
	Date dateCreated

    static constraints = {
		
		msgCtrlId size:0..20
		
		message size:0..128*1024
		
		remoteIp size:0..128
		
		dateCreated display:false
    }
	
	static mapping = {
		version false
		message type: 'text'
	}
}
