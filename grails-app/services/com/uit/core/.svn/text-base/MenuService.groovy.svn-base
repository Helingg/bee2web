package com.uit.core

import groovy.sql.Sql
import java.lang.StringBuilder
/**
 * Create Framework data for Menu
 * 
 * author Wang Gang
 */
class MenuService {
	def dataSource
	def springSecurityService

	def dataProvider() {

		def menuList = []
		
		def user 
		try{
			user = springSecurityService.getPrincipal()?.getUsername()
		}catch(Exception e){
		   return
		}
		// db connection
		def db = new Sql(dataSource)
		// database view to hold the result
		//def results = db.rows("SELECT ID,display_name,link_controller,link_action,icon,parent_id,enabled FROM UIT_SYS_MENU WHERE visible=1 order by parent_id,display_order")
        // Add permission judgement
		def results = db.rows("SELECT m.ID,m.display_name,m.link_controller,m.link_action,m.icon,m.parent_id,m.enabled "
                             +"FROM UIT_SYS_USER u,UIT_SYS_USERROLE r,UIT_SYS_ROLEMENU rm,UIT_SYS_MENU m "
                             +"WHERE u.username=:userName and u.id=r.user_id and r.role_id=rm.role_id and rm.menu_id=m.id and  m.visible=1 "
                             +"ORDER BY m.parent_id,m.display_order",[userName:user])
		
		results.each { r ->
			def item = [id:r.ID, title: r.display_name, href:r.link_controller+'/'+ r.link_action,icon:r.icon,disabled: !r.enabled,parent: r.parent_id]
			menuList.add(item)
		}
		sb = new StringBuilder()
		dataMenu(menuList)

		return sb.toString()
	}

	StringBuilder sb = null;

	def dataMenu(data) {

		data.each { d ->
			if(!d.parent){
				sb.append("\n{")
				setValue(d.id,d.title,d.disabled,d.icon,d.href)
				sb.append("\nchildren:")
				sb.append("[")
				data.each{ d1 ->
					if(d1.parent == d.id) {
						sb.append("{")
						setValue(d1.id,d1.title,d1.disabled,d1.icon,d1.href)
						sb.append("\nchildren:")
						sb.append("[")
						data.each{ d2 ->
							if(d2.parent == d1.id) {
								sb.append("{")
								setValue(d2.id,d2.title,d2.disabled,d2.icon,d2.href)								
								sb.append("},\n")
							}
						}
						sb.append("]},\n")
					}
				}
				sb.append("]},\n")
			}
		}
		
	}


	def setValue(id,title,disabled,icon,href){
		sb.append("id:\"").append(id).append("\",")
		sb.append("title:\"").append(title).append("\",")
		if(disabled==true)
		sb.append("disabled:").append(disabled).append(",")
		if(icon)
		sb.append("icon:iconPath+\"").append(icon).append("\",")
		sb.append("href:\"").append(href).append("\",")
	}

}

