package com.bssi

class Address {

    String streetNbr = ""
    String streetPrefix = ""
    String streetAddr = ""
    String streetSuffix =""
    String city = ""
    String state = ""
    String zipCode = ""
    String country = ""

    Date dateCreated

    static constraints = {
        streetNbr(size: 0..128)
        streetPrefix(size: 0..128)
        streetPrefix(size: 0..128)
        streetSuffix(size: 0..16)
        state(size: 0..2,inList: ['AL','AK','AR', 'AZ', 'CA', 'CO', 'CT' ,'DE' ,'FL', 'GA', 'HI', 'LA' ,'ID', 'IL' ,'IN', 'KS', 'KY', 'LA', 'MA', 'ME' ,'MD', 'MI', 'MN' ,'MO', 'MS', 'MT',
                'NE', 'NC','ND', 'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX','UT', 'VT', 'VA', 'WA', 'DC', 'WV','WI','WY'])
        city(size: 0..128)
        zipCode(size: 0..16)
        country(size: 0..128)
    }

    static mapping = {
        version false

        id column: 'addr_id'

    }

    String toString(){
        return  streetAddr
    }
}
