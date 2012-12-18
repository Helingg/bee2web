package com.bssi

class MappingRuleGroup {
    String name= ""
    String type = ""
//    String fromApplication = ""
//    String toApplication = ""
    String comments = ""
    boolean activeInd = true

    Date dateCreated

    static belongsTo = [fromApplication:Application,toApplication:Application]

    static constraints = {
        name(size: 0..128,blank: false)
        type(size: 0..16,blank: false,inList:['ADT','MDM','ORM','ORU','SIU', 'VXU'])
//        fromApplication(size: 0..128,blank: false)
//        toApplication(size: 0..128,blank: false)
        activeInd(boolean:true)
        comments(size: 0..256)
    }

    static mapping = {
        version false
        id column: 'mapping_rule_group_id'
    }

    String toString(){
        return name + ' - ' + type
    }
}
