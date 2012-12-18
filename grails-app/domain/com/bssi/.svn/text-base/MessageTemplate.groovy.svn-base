package com.bssi

class MessageTemplate {
    String type = ""
    String eventType = ""
    String description = ""
    String name = ""
    String segment = ""
    int segmentIndex = 0
    boolean repeatable = false
    boolean required = false
    static constraints = {
        type(size: 0..16)
        eventType(size: 0..16)
        description(size: 0..128)
        name(size: 0..16)
        segment(size: 0..16)
        required(boolean:true)
        repeatable(boolean:true)
    }
}
