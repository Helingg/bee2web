package com.bssi
/**
 * This domain
 *
 * author: hlg
 */

class Template {
    String type=''           //message type
//    String hl7version=''    //HL7 version
    String segment =''      //HL7 segment  name
    String field  =''        //Field content
    String subfield =''     //subField content
    int segmentIndex=0    //segement index
    int fieldIndex=0      //field index (begin from 1)
    int subfieldIndex=0  //subfield  index   (begin from 1)

    int loopTimes =0     //loop time for repeating

    boolean mandatory =false //mandatory
    boolean repeatable =false //segment repeat
    boolean required =false  //required
    int length=0          //field length
    String description =''  //description for this field
//    Long mappingRule = 0
    int sortNum = 0
    int flag = 0

    static belongsTo = [fromApplication:Application,toApplication:Application]

    static constraints = {
        type(size: 0..4,blank: false,inList:['ADT','MDM','ORM','ORU','SIU', 'VXU'])
//        hl7version(size: 0..16,blank:false,inList:['v2.1','v2.2','v2.3','v2.4','v2.5','v2.6','v2.7','v2.8','v2.9','v3.0'])
        segment(size: 0..4,blank: false)
//        displayOrder(blank:false)

        subfield(size: 0..128)
        field(size: 0..128)
        segmentIndex(min: 0)
        fieldIndex(min: 0)
        subfieldIndex(min: 0)
        loopTimes(min: 0)
        sortNum(min: 0)
        mandatory(blank:false,boolean:true)
        repeatable(blank:false,boolean:true)
        required(blank:false,boolean:true)
        flag(blank:false)
        length(blank:false)
        description(size: 0..256,blank: true)
//        mappingRule()
    }

    static mapping = {
        version false
    }
}
