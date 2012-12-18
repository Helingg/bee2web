package com.bssi

/**
 * This class connect among client, recipient and rule group
 *
 * auther: Wang Gang
 *
 * change by hlg
 *
 * date 3/26/2012
 *
 * static belongsTo=[client:Client,ruleGroup:RuleGroup] -> static belongsTo=[client:Client,receiveClient:Client,ruleGroup:RuleGroup]
 */
class Bridge {

    String bridgeName = ""
    String ack = ""
	Date dateCreated
	Date dateStarted
    Date dateEnded
    boolean activeInd = true

	static constraints = {
        bridgeName(size: 0..128,unique: true)
		dateCreated(display:false)
        ack(size: 0..32,inList: ['Yes','No','Bee Engine'])
        dateStarted()
        dateEnded()
	}
	
	static mapping = {
		version false
        id column: 'bridge_id'
	}
}