package com.bssi
/**
 *  auther hlg
 *
 *  4/1/2012
 */

class SendReceiveLog {
    String logType
    String msgCtrlId

    String remoteIp
    String mappedOutboundMessage

    Date sendTime
    Date receiveTime

    Date dateCreated

    static belongsTo = [hl7message:HL7Message,sendClient:Client,receiveClient:Client]

    static constraints = {
        logType(size: 0..16,inList: ['Send','Receive'])
        msgCtrlId(size: 0..128,blank:false)
        remoteIp(size: 0..128)
        mappedOutboundMessage()
        sendTime()
        receiveTime()
    }

    static mapping = {
        version false
    }
}
