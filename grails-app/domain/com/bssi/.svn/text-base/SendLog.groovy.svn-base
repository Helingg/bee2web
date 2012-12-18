package com.bssi

/**
 * This domain log all the messages sent out
 *
 * author: Wang Gang
 *
 * change by hlg
 *
 * 3/26/2012
 *
 * static belongsTo=[client:Client,receiveClient:Client]
 */
class SendLog {
	
	String msgCtrlId
	String receivedAck
	String message
	Date sentTime
	
	Date dateCreated
	
	static belongsTo=[sendClient:Client,receiveClient:Client,hl7message:HL7Message]
	
	static constraints = {
		msgCtrlId(nullable:false,size:0..128)
        receivedAck(size:0..2048)
		message(size:0..128*1024)
		
		sentTime()			
		dateCreated(dispaly:false)
		
//		recipient()
	}
	
	static mapping = {
        id column: 'send_log_id'
		version false
	}
	
}
