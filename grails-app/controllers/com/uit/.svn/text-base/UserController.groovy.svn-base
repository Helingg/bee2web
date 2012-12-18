package com.uit

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql

class UserController {
    def springSecurityService
    def dataSource
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        flash.message=""
        [userDataList: User.list(params), userDataTotal: User.count()]
    }

    def listFlash() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        render (view: 'list',model:[userDataList: User.list(params), userDataTotal: User.count()])
    }

    def create() {
        flash.message = ""
        [userData: new User(params)]
    }

    def save() {
        def userRepeat
        def userData = new User()
        User.withTransaction {status->
            userData.username=params.username
            userData.password=params.password
            userData.email = params.email
            if(params.passwordExpired=="on"){
                userData.passwordExpired=true
            }else{
                userData.passwordExpired=false
            }
            if(params.accountExpired=="on"){
                userData.accountExpired=true
            }else{
                userData.accountExpired=false
            }
            if(params.accountLocked=="on"){
                userData.accountLocked=true
            }else{
                userData.accountLocked=false
            }
            if(params.enabled=="on"){
                userData.enabled=true
            }else{
                userData.enabled=false
            }
            if(params.username){
                userRepeat = User.findByUsername(params.username)
            }
            if(userRepeat){
                flash.message = 'User Name is already exist'
                render(view: "create", model: [userData: userData,params: params])
                return
            }
            if (!userData.save(flush: true)) {
                status.setRollbackOnly()
                flash.message= "Save failed"
                render(view: "create", model: [userData: userData,params: params])
                return
            }

            if(params.roleId){
                def db = new Sql(dataSource)
                def repeatStr = "select 1 from uit_sys_userrole where role_id=${params.roleId} and user_id='${userData.id}'"
                def repeat = db.rows(repeatStr)
//                println(repeat)
                if(repeat.size()>0){
                    status.setRollbackOnly()
                    render(view: "create", model: [userData: userData,params: params])
                    return
                }
                db.execute("insert into  uit_sys_userrole values(${params.roleId},${userData.id})")
                db.commit();
            }
            flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userData.id])
            redirect(action: "showFlash", id: userData.id)
        }

    }

    def show() {
        def userData = User.get(params.id)
        if (!userData) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }
        def db = new Sql(dataSource)
        def rolesql = "select ur.role_id,r.authority from uit_sys_userrole ur,uit_sys_role r where  user_id='${userData.id}' and r.id=ur.role_id"
        def roleData = db.rows(rolesql)
        flash.message = ""
        [userData: userData,roleData:roleData]
    }

    def showFlash() {
        def userData = User.get(params.id)
        if (!userData) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "listFlash")
            return
        }
        def db = new Sql(dataSource)
        def rolesql = "select ur.role_id,r.authority from uit_sys_userrole ur,uit_sys_role r where  user_id='${userData.id}' and r.id=ur.role_id"
        def roleData = db.rows(rolesql)
        render (view: 'show',model:[userData: userData,roleData:roleData] )
    }

    def edit() {
        def userData = User.get(params.id)
        if (!userData) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "listFlash")
            return
        }
        def db = new Sql(dataSource)
        def rolesql = "select ur.role_id,r.authority from uit_sys_userrole ur,uit_sys_role r where  user_id='${userData.id}' and r.id=ur.role_id"
        def roleData = db.rows(rolesql)
        flash.message = ""
        [userData: userData,roleData:roleData]

    }

    def update() {
        User.withTransaction {status->
            def db = new Sql(dataSource)
            def userData = User.get(params.id)
            if (!userData) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect(action: "listFlash")
                return
            }

            if (params.version) {
                def version = params.version.toLong()
                if (userData.version > version) {
                    userData.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'user.label', default: 'User')] as Object[],
                            "Another user has updated this User while you were editing")
                    render(view: "edit", model: [userData: userData])
                    return
                }
            }

            userData.properties = params

            if (!userData.save(flush: true)) {
                status.setRollbackOnly()
                flash.message = "Update failed"
                redirect(action: "listFlash")
                return
            }
            if(params.roleId){
                def repeatStr = "select 1 from uit_sys_userrole where user_id='${userData.id}'"
                def repeat = db.rows(repeatStr)

                if(!repeat){ // 如果有值，不执行，没有值，插入一条
                    try{
                        db.execute("insert into  uit_sys_userrole values(${params.roleId},${userData.id})")
                        db.commit();
                    }catch(Exception e){
                        flash.message = 'Save failed'
                        status.setRollbackOnly()
                        redirect(action: "listFlash")
                        return
                    }
                }else{
                    try{
                        db.execute("delete from uit_sys_userrole where user_id=${userData.id}")   //有值直接删除
                        db.execute("insert into  uit_sys_userrole values(${params.roleId},${userData.id})")//插入新的
                        db.commit();
                    }catch(Exception e){
                        flash.message = 'Save failed'
                        status.setRollbackOnly()
                        redirect(action: "listFlash")
                        return
                    }
                }
            }else{
                def repeatStr = "select 1 from uit_sys_userrole where user_id=${userData.id}"
                def repeat = db.rows(repeatStr)
                if(repeat.size()>0){ //如果有值删除
                    try{
                        db.execute("delete from uit_sys_userrole where user_id=${userData.id}")
                        db.commit();
                    }catch(Exception e){
                        flash.message = 'Save failed'
                        status.setRollbackOnly()
                        redirect(action: "listFlash")
                        return
                    }

                }
            }
            flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userData.id])
            redirect(action: "showFlash", id: userData.id)
        }
    }

    def delete() {
        def userData = User.get(params.id)
        def db = new Sql(dataSource)
        User.withTransaction {status->
            if (!userData) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect(action: "listFlash")
                return
            }
            def repeatStr = "select 1 from uit_sys_userrole where user_id=${userData.id}"
            def repeat = db.rows(repeatStr)
            try {
                if(repeat.size()>0){
                    db.execute("delete from uit_sys_userrole where user_id=${userData.id}")
                    db.commit()
                }
                userData.delete(flush: true)
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect(action: "listFlash")
            }
            catch (DataIntegrityViolationException e) {
                status.setRollbackOnly()
                flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect(action: "showFlash", id: params.id)
            }
        }
    }
    def saveUser={
        if(params.id){
           def userData = User.get(Long.parseLong(params.id))
            if(userData){
                userData.properties = params
                if(!userData.save(flush: true)){
                    render "Save failed"
                    return
                }
            }else{
                render "User not found"
                return
            }
        }else{
            render "Id is null"
            return
        }
        render "Save success"
        return
    }
    def savePassword={
        if(params.id){
            def userData = User.get(Long.parseLong(params.id))
            if(userData){
                String password  = springSecurityService.encodePassword(params.originalPassword)
                if(password!=userData.password){
                    render "Original Password is wrong"
                    return
                }
                userData.password = params.newPassword
                if(!userData.save(flush: true)){
                    render "Save failed"
                    return
                }
            }else{
                render "User not found"
                return
            }
        }else{
            render "Id is null"
            return
        }
        render "Save success"
        return
    }
    def editUser = {
        def userData = User.findByUsername(springSecurityService.authentication.name)
        if(userData){
            flash.message = ""
            [userData:userData]
        }
    }
    def changePassword = {
        def userData = User.findByUsername(springSecurityService.authentication.name)
        if(userData){
            flash.message = ""
            [userData:userData]
        }
    }

    def searchUser = {
        if(!params.max){
            params.max=10
        }
        if(!params.offset){
            params.offset=0
        }
        def search = {
            if(params.username){
                like('username',"%${params.username}%")
            }
            if(params.enabled=="on"){
               eq("enabled",true)
            }else{
                eq("enabled",false)
            }
        }
        def userDataList = User.createCriteria().list(params,search)
        if(userDataList)  {
            flash.message="${userDataList.totalCount} User(s) found"

        }else{
            flash.message="No data found"
        }
        render (view: 'list',model: [userDataList:userDataList,userDataTotal:userDataList.totalCount])
    }

    def selectAuthority = {
        if(!params.max){
            params.max=10
        }
        if(!params.offset){
            params.offset=0
        }
        def db = new Sql(dataSource)
        def sqlStr = "select id,authority from uit_sys_role"
        if(params.authority){
            sqlStr= sqlStr+" where authority like '%${params.authority}%'"
        }
        def resultsTotal = db.rows(sqlStr)
        sqlStr = sqlStr + " LIMIT ${params.offset},${params.max}"
        def results = db.rows(sqlStr)
        if(resultsTotal.size()>0){
            flash.message = "${resultsTotal.size()} Authority(s) found"
        }else{
            flash.message = "No data found"
        }
        [roleDataList:results,roleDataTotal:resultsTotal]
    }
}
