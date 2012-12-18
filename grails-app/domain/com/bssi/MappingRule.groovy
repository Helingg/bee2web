package com.bssi

class MappingRule {

    long groupId = 0

    String operator = ""

    String fromSegment = ""
    int fromIndex = 0
    int fromSubIndex = 0

    String toSegment = ""
    int toIndex = 0
    int toSubIndex = 0

    String value = "" // copy CPY
    String other = ""

    String scriptext = ""

    String comments = ""

    Date dateCreated

    int flag = 0  //

    static belongsTo = [mappingRuleGroup:MappingRuleGroup]

    static constraints = {
        groupId nullable:false
        operator nullable:false,size:0..16

        fromSegment nullable:true,size:0..3
        fromIndex min:0
        fromSubIndex min:0

        toSegment nullable:true,size:0..8
        toIndex min:0
        toSubIndex  min:0
        flag blank:false
        value nullable:true,size:0..256
        other nullable:true,size:0..1024
        comments nullable:true,size:0..256

        scriptext nullable:true,size:0..256

        dateCreated display:false
    }

    static mapping = {
        version false
    }

}
