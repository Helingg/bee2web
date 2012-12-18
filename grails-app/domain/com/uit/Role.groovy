package com.uit

class Role {

	String authority



	static constraints = {

		authority blank: false, unique: true
	}

    static mapping = {
        table 'UIT_SYS_ROLE'
        cache true
    }
}
