package com.bssi

import org.springframework.dao.DataIntegrityViolationException
import org.dom4j.Document
import org.dom4j.DocumentException
import org.dom4j.Element
import org.dom4j.io.SAXReader
class MessageTemplateController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [messageTemplateDataList: MessageTemplate.list(params), messageTemplateDataTotal: MessageTemplate.count()]
    }

    def create() {
        [messageTemplateData: new MessageTemplate(params)]
    }

    def save() {
        def messageTemplateData = new MessageTemplate(params)
        if (!messageTemplateData.save(flush: true)) {
            render(view: "create", model: [messageTemplateData: messageTemplateData])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'messageTemplate.label', default: 'MessageTemplate'), messageTemplateData.id])
        redirect(action: "show", id: messageTemplateData.id)
    }

    def show() {
        def messageTemplateData = MessageTemplate.get(params.id)
        if (!messageTemplateData) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'messageTemplate.label', default: 'MessageTemplate'), params.id])
            redirect(action: "list")
            return
        }

        [messageTemplateData: messageTemplateData]
    }

    def edit() {
        def messageTemplateData = MessageTemplate.get(params.id)
        if (!messageTemplateData) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'messageTemplate.label', default: 'MessageTemplate'), params.id])
            redirect(action: "list")
            return
        }

        [messageTemplateData: messageTemplateData]
    }

    def update() {
        def messageTemplateData = MessageTemplate.get(params.id)
        if (!messageTemplateData) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'messageTemplate.label', default: 'MessageTemplate'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (messageTemplateData.version > version) {
                messageTemplateData.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'messageTemplate.label', default: 'MessageTemplate')] as Object[],
                        "Another user has updated this MessageTemplate while you were editing")
                render(view: "edit", model: [messageTemplateData: messageTemplateData])
                return
            }
        }

        messageTemplateData.properties = params

        if (!messageTemplateData.save(flush: true)) {
            render(view: "edit", model: [messageTemplateData: messageTemplateData])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'messageTemplate.label', default: 'MessageTemplate'), messageTemplateData.id])
        redirect(action: "show", id: messageTemplateData.id)
    }

    def delete() {
        def messageTemplateData = MessageTemplate.get(params.id)
        if (!messageTemplateData) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'messageTemplate.label', default: 'MessageTemplate'), params.id])
            redirect(action: "list")
            return
        }

        try {
            messageTemplateData.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'messageTemplate.label', default: 'MessageTemplate'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'messageTemplate.label', default: 'MessageTemplate'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def Document parse2Document(String xmlFilePath) {
        SAXReader reader = new SAXReader();
        Document document = null;
        try {
            def xmlFile = request.getFile('fileh')
            def xmlFileIn = xmlFile.getInputStream()
            document = reader.read(xmlFileIn);
        } catch (DocumentException e) {
            System.out.println(e.getMessage());
            System.out.println("读取classpath下xmlFileName文件发生异常，请检查CLASSPATH和文件名是否存在！");
            e.printStackTrace();
        }
        return document;
    }

    def int testParseXMLData(String xmlFileName) {
        def messageName = null
        def messageDescription = null
        def type = null
        def eventType = null
        //产生一个解析器对象
        SAXReader reader = new SAXReader();
        //将xml文档转换为Document的对象
        Document document = parse2Document(xmlFileName);
        //获取文档的根元素
        Element root = document.getRootElement();
        //定义个保存输出xml数据的缓冲字符串对象
//        StringBuffer sb = new StringBuffer();

        //遍历当前元素(在此是根元素)的子元素
        int segmentCount=0
        for (Iterator i_pe = root.elementIterator(); i_pe.hasNext();) {

            Element e_pe = (Element) i_pe.next();
            //获取当前元素的名字
            String person = e_pe.getName();
            println(e_pe.getText());
            if(person=="name"){
                messageName = e_pe.getText()
                type =  messageName[0..2]
                eventType = messageName[3..5]
            }
            if(person=="description") {
                messageDescription =  e_pe.getText()
            }
            if(person=="segments"){
                for (Iterator i_segment = e_pe.elementIterator(); i_segment.hasNext();){
                    Element e_segment = (Element) i_segment.next();
                    if(e_segment.getName()=="segment"){
                        def messageTemplate = new MessageTemplate()
                        segmentCount++
                        messageTemplate.name = messageName
                        messageTemplate.description = messageDescription
                        messageTemplate.segment = e_segment.getText()
                        messageTemplate.type = type
                        messageTemplate.eventType = eventType
                        messageTemplate.segmentIndex = segmentCount
                        println(e_segment.getText())
                        if (e_segment.attribute("minOccurs")&&e_segment.attribute("minOccurs").value=="0"){
                            messageTemplate.required=false
                        } else{
                            messageTemplate.required = true
                        }
                        if (e_segment.attribute("maxOccurs")&&e_segment.attribute("maxOccurs").value=="unbounded"){
                            messageTemplate.repeatable=true
                        }else{
                            messageTemplate.repeatable=false
                        }
                        if(!messageTemplate.save(flash:true)){
                            return -1
                        }
                    }
                    if(e_segment.getName()=="group"){
                        for (Iterator i_group = e_segment.elementIterator(); i_group.hasNext();){
                            def messageTemplate = new MessageTemplate()
                            Element e_group = (Element) i_group.next();
                            segmentCount++
                            messageTemplate.name = messageName
                            messageTemplate.description = messageDescription
                            messageTemplate.segment = e_group.getText()
                            messageTemplate.type = type
                            messageTemplate.eventType = eventType
                            messageTemplate.segmentIndex = segmentCount
                            println(e_group.getText())
                            if (e_segment.attribute("minOccurs")&&e_segment.attribute("minOccurs").value=="0"){
                                messageTemplate.required=false
                            } else{
                                messageTemplate.required = true
                            }
                            if (e_segment.attribute("maxOccurs")&&e_segment.attribute("maxOccurs").value=="unbounded"){
                                messageTemplate.repeatable=true
                            }else{
                                messageTemplate.repeatable=false
                            }
                            if(!messageTemplate.save(flash:true)){
                                return -1
                            }
                        }
                    }
                }
            }
        }
        return 1
    }

    def parseXml = {
        def xmlFile = request.getFile('fileh')
        def result=testParseXMLData(xmlFile.getOriginalFilename())
        if(result<0){
            flash.message = "The segment is already exist"
        }else{
            flash.message = "Save success"
        }
        redirect(action: 'list')

    }
   def search = {

       def searchMessage = {
           if(params.type){
               like('type',"%${params.type}%")
           }
           if(params.eventType){
               like('eventType',"%${params.eventType}%")
           }
       }
       def  messageTemplateDataList = MessageTemplate.createCriteria().list(params,searchMessage)
       render (view: "list",model: [messageTemplateDataList:messageTemplateDataList, messageTemplateDataTotal: messageTemplateDataList.totalCount])

   }

}
