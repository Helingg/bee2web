class BootStrap {
	
    def springSecurityService
	
    def init = { servletContext ->
		// system administrator
		def adminRole = new com.uit.Role(authority: 'ROLE_SYSTEM').save(flush: true)
		def userRole = new com.uit.Role(authority: 'ROLE_USER').save(flush: true)
		
		String password = 'system'
		
		def systemUser = new com.uit.User(username: 'admin', enabled: true, password: password,alias:'Administrator',email:"wangg@user-it.com")
		systemUser.save(flush: true)
		com.uit.UserRole.create (systemUser, adminRole, true)
		
		def user = new com.uit.User(username:'justin',enabled:true,password:password,alias:'Justin',email:"justint@solutiontms.com")
		user.save(flush:true)
		com.uit.UserRole.create (user, userRole, true)
    }
	
	
    def destroy = {
		
    }
}
