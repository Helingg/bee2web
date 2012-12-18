package com.bssi

class SegmentTemplate {

    String segment = ""
    String field = ""
    String dataType = ""
    String description = ""
    String hl7Vsersion = ""
    int fieldIndex = 0
    boolean repeatable = false
    boolean required = false


    static constraints = {
        segment(nullable: false,size: 0..5)
        field(size: 0..256)
        dataType(size: 0..16)
        required(boolean:true)
        repeatable(boolean:true)
        hl7Vsersion(size: 0..16)
    }
}
