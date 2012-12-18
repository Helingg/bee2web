package com.bssi

/**
 * This domain will log all incoming messages include msg id and time.
 *
 * author: Wang Gang
 */
class ReceiveLog {
	
	String msgCtrlId
	String remoteIp
    String sendAck
	Date receiveTime
	
	Date dateCreated
	
	static belongsTo = [sendClient:Client,receiveClient:Client,hl7message:HL7Message]
	static constraints = {
		msgCtrlId(size:0..20)
		remoteIp(size:0..128)
        sendAck (nullable: true, size: 0..2048)
		receiveTime()
		
		dateCreated(display:false)
	}
	
	static mapping = {
		version false
        id column: 'receive_log_id'
	}
}

