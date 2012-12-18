package com.bssi

class StateMLN {

    String mln = ""
    String state = ""
    String providerType = ""

    static belongsTo = [provider:Provider]
    static constraints = {
        mln(nullable: false,size: 0..128)
        state(nullable: false,size: 0..16)
        providerType(size: 0..16)
    }

    static mapping = {
        table('mln_state')
    }
    String toString(){
        return  state+"-"+mln
    }
}
