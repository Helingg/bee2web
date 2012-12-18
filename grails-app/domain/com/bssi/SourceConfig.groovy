package com.bssi

class SourceConfig {
    String ip = ""
    String name =""
    String user =""
    String password=""
    int port = 0
    String type  = ""
    String other = ""
    Long ack = 0

    Date dateCreated
//    boolean activeInd = false

    static belongsTo=[recipientClient:Client,bridge:Bridge]
    static constraints = {
        ip(size: 0..128,blank:false)
        name(size: 0..128)
        other(size: 0..128)
        user(size:0..128)
        password(size: 0..128)
        port(size:0..64,blank:false,unique: true)
        type(size: 0..16,inList: ['TCP','SFTP','FILE'])
    }

    static mapping = {
        id column: 'recipient_config_id'
        version false
    }
}
