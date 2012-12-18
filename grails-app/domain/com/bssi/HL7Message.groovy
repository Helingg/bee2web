package com.bssi

/**
 * This domain will save all incoming messages
 *
 * author: Wang Gang
 */
class HL7Message {
	String msgCtrlId
	String type
	String event
	String message
	String remoteIp
	int counter = 0         // how many times to send
	boolean activeInd = true  // valid message by default
	Date dateCreated
	
//	static belongsTo=[client:Client]
	
	static constraints = {
		msgCtrlId(size:0..20)
		type(size:0..3)
		event(size:0..3)
		message(size:0..128*1024)
		//targetMsg(size:0..128*1024)
		remoteIp(size:0..128)
		counter(min:0)
        activeInd(boolean:true)
		dateCreated(display:false)
		
	}
	
	static mapping = {
		version false
		msgCtrlId index:'idx_hl7msg_id'
        id column: 'hl7message_id'
	}
	
	
}
