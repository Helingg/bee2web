package com.bssi

class DestinationConfig {
    String ip=""
    String name=""
    String user=""
    String password=""
    int port = 0
    String type=""
    String other = ""

    Date dateCreated
//    boolean activeInd = false

//    static belongsTo = [client:Client]

    static constraints = {
        ip(size: 0..128,blank:false)
        name(size: 0..128)
        other(size: 0..128)
        user(size:0..128)
        password(size: 0..128)
        port(size:0..64,blank:false)
        type(size: 0..16,inList: ['TCP','SFTP','LOCAL'])
//        activeInd(boolean:true)
    }
    static belongsTo=[mappingRuleGroup:MappingRuleGroup,senderClient:Client,bridge:Bridge]
    static mapping = {
        version false
        id column:'sender_config_id'
    }
}
