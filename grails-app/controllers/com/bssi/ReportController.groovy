package com.bssi

import groovy.sql.Sql
import java.text.SimpleDateFormat

/**
 * Report Controller
 *
 * author: Wang Gang
 */
class ReportController {
	
	def dataSource
	
	//static allowedMethods = [sent: "POST", receive: "POST"]

    def index = { }
	
	/**
	 * Sent Message report
	 */
	def sent = {

		if(!params.max) params.max = 10
		if(!params.offset) params.offset = 0

		def db = new Sql(dataSource)

//        def lowDate
//        def highDate
//        def lowDateStr=""
//        def highDateStr=""
        SimpleDateFormat df =new  SimpleDateFormat("MM/dd/yyyy");

//        if (params.lowDate) {
//            lowDate = params.lowDate.split("/")
//            lowDateStr= lowDate[2]+"/"+ lowDate[0] +"/"+lowDate[1]
//        }
//        if (params.highDate) {
//            highDate = params.highDate.split("/")
//            highDateStr= highDate[2]+"/"+ highDate[0] +"/"+highDate[1]
//        }


		// ----- summary ------------------
//		def search = {
//			projections {
//				groupProperty("client")
//				groupProperty()
//				sum("counter")
//			}
//		}
//		def criteria = HL7Message.createCriteria()
//		def list = criteria.list(params,search)
//        def str = "select c.name,sum(h.counter) from HL7Message h , Client c where h.client = c.id"
//        def list = HL7Message.executeQuery(str)
//
//        def  total = list.size();



		def list = db.rows("select c.name,count(*) " +
                           "from send_log h, client c where h.send_client_id=c.client_id " +
                           "group by h.send_client_id LIMIT ${params.offset},${params.max}")

		def total = db.firstRow('select count(*) from (select distinct send_client_id from send_log) xxx ')


        if (params.lowDate&&params.highDate&&df.parse(params.lowDate).after(df.parse(params.highDate))){
            flash.message = "${message(code: 'default.date.range.message')}"
            render(view:"sent",model: [params: params,detailTotal:0,list:list,total:list.size()])
            return
        }
		// ------ details ------------------
        def str = "select c.name,YEAR(h.date_created),MONTH(h.date_created),DAY(h.date_created),count(*) " +
                "from send_log h, client c where h.send_client_id=c.client_id "
        if (params.client){
            str = str+" and c.name like '%${params.client}%'"
        }
        if (params.lowDate){
            str = str +" and h.date_created >= STR_TO_DATE('${params.lowDate}', '%m/%d/%Y')"
        }
        if (params.highDate){
            str = str +" and h.date_created <= STR_TO_DATE('${params.highDate}', '%m/%d/%Y')"
        }
        str = str+" group by h.send_client_id,YEAR(date_created),MONTH(date_created),DAY(date_created)"

//		def str1 = "select c.name,h.dateCreated from HL7Message h ,Client c where h.clent=c.id"
//        if (params.client){
//            str1 = str1+" and c.name like '"+"%${params.client}%"+"'"
//        }
//        if (params.lowDate){
//            str1 = str1+" and h.dateCreated >= '"+lowDate1+"'"
//        }
//        if (params.highDate){
//            str1 = str1+" and h.dateCreated <= '"+highDate1+"'"
//        }
//        str1 = str1 +" order by h.id"
//
//        def detailList = HL7Message.executeQuery(str1)
        def detailTotal = db.firstRow("select count(*) from ("+str+") xxx ")
        str = str +"  LIMIT ${params.offset},${params.max}"
        def detailList = db.rows(str)

		if (detailTotal[0]>0){
            flash.message="${detailTotal[0]} Send Report(s) found"
        } else{
            flash.message="No data found"
        }
		[list:list,total:total[0],detailList:detailList,detailTotal:detailTotal[0],params: params]
	}
	
	/**
	 * Receive Message report
	 */
	def receive = {
		
		if(!params.max) params.max = 10
		if(!params.offset) params.offset = 0
		def db = new Sql(dataSource)
//        def lowDate
//        def highDate
//        def lowDateStr=""
//        def highDateStr=""
        SimpleDateFormat df =new  SimpleDateFormat("MM/dd/yyyy");

//        if (params.lowDate) {
//            lowDate = params.lowDate.split("/")
//            lowDateStr= lowDate[2]+"/"+ lowDate[0] +"/"+lowDate[1]
//        }
//        if (params.highDate) {
//            highDate = params.highDate.split("/")
//            highDateStr= highDate[2]+"/"+ highDate[0] +"/"+highDate[1]
//        }




		// ------- summary -----------------
		def list = db.rows( "select r.name,count(*) " +
                "from receive_log sl,client r where sl.receive_client_id=r.client_id " +
                "group by sl.receive_client_id LIMIT ${params.offset},${params.max}")
		def total = db.firstRow('select count(*) from (select distinct receive_client_id from send_log) xxx ')

        if (params.lowDate&&params.highDate&&df.parse(params.lowDate).after(df.parse(params.highDate))){
            flash.message = "${message(code: 'default.date.range.message')}"
            render(view:"receive",model: [params: params,detailTotal:0,list:list,total:list.size()])
            return
        }

		// ------ details ------------------
//		def detailList = db.rows("select c.name,YEAR(h.date_created),MONTH(h.date_created),DAY(h.date_created),count(*) " +
//                           "from hl7message h, CLIENT c where h.client_id=c.id " +
//                           "group by client_id,YEAR(date_created),MONTH(date_created),DAY(date_created)")
        def str = "select r.name,YEAR(sl.date_created),MONTH(sl.date_created),DAY(sl.date_created),count(*) " +
                " from receive_log sl,client r where sl.receive_client_id=r.client_id  "

        if (params.recipient){
            str = str+" and r.name like '%${params.recipient}%'"
        }
        if (params.lowDate){
            str = str +" and sl.date_created >= STR_TO_DATE('${params.lowDate}', '%m/%d/%Y')"
        }
        if (params.highDate){
            str = str +" and sl.date_created <= STR_TO_DATE('${params.highDate}', '%m/%d/%Y')"
        }
        str = str+" group by sl.receive_client_id,YEAR(date_created),MONTH(date_created),DAY(date_created) "

        def detailTotal = db.firstRow("select count(*) from ("+str+") xxx ")
        str = str +"  LIMIT ${params.offset},${params.max}"
        def detailList = db.rows(str)


        if (detailTotal[0]>0){
            flash.message="${detailTotal[0]} Receive Report(s) found"
        } else{
            flash.message="No data found"
        }
		
		[list:list,total:total[0],detailList:detailList,detailTotal:detailTotal[0],params: params]
	}
}
