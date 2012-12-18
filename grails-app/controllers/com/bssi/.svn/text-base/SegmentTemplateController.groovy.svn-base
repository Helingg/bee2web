package com.bssi

import org.dom4j.Document
import org.dom4j.DocumentException
import org.dom4j.Element
import org.dom4j.io.SAXReader
import org.springframework.dao.DataIntegrityViolationException

class SegmentTemplateController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [SegmentTemplateDataList: SegmentTemplate.list(params), SegmentTemplateDataTotal: SegmentTemplate.count()]
    }

    def create() {
        [SegmentTemplateData: new SegmentTemplate(params)]
    }

    def save() {
        def SegmentTemplateData = new SegmentTemplate(params)
        if (!SegmentTemplateData.save(flush: true)) {
            render(view: "create", model: [SegmentTemplateData: SegmentTemplateData])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'SegmentTemplate.label', default: 'SegmentTemplate'), SegmentTemplateData.id])
        redirect(action: "show", id: SegmentTemplateData.id)
    }

    def show() {
        def SegmentTemplateData = SegmentTemplate.get(params.id)
        if (!SegmentTemplateData) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'SegmentTemplate.label', default: 'SegmentTemplate'), params.id])
            redirect(action: "list")
            return
        }

        [SegmentTemplateData: SegmentTemplateData]
    }

    def edit() {
        def SegmentTemplateData = SegmentTemplate.get(params.id)
        if (!SegmentTemplateData) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'SegmentTemplate.label', default: 'SegmentTemplate'), params.id])
            redirect(action: "list")
            return
        }

        [SegmentTemplateData: SegmentTemplateData]
    }

    def update() {
        def SegmentTemplateData = SegmentTemplate.get(params.id)
        if (!SegmentTemplateData) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'SegmentTemplate.label', default: 'SegmentTemplate'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (SegmentTemplateData.version > version) {
                SegmentTemplateData.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'SegmentTemplate.label', default: 'SegmentTemplate')] as Object[],
                        "Another user has updated this SegmentTemplate while you were editing")
                render(view: "edit", model: [SegmentTemplateData: SegmentTemplateData])
                return
            }
        }

        SegmentTemplateData.properties = params

        if (!SegmentTemplateData.save(flush: true)) {
            render(view: "edit", model: [SegmentTemplateData: SegmentTemplateData])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'SegmentTemplate.label', default: 'SegmentTemplate'), SegmentTemplateData.id])
        redirect(action: "show", id: SegmentTemplateData.id)
    }

    def delete() {
        def SegmentTemplateData = SegmentTemplate.get(params.id)
        if (!SegmentTemplateData) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'SegmentTemplate.label', default: 'SegmentTemplate'), params.id])
            redirect(action: "list")
            return
        }

        try {
            SegmentTemplateData.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'SegmentTemplate.label', default: 'SegmentTemplate'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'SegmentTemplate.label', default: 'SegmentTemplate'), params.id])
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
        def segment = null
        //产生一个解析器对象
        SAXReader reader = new SAXReader();
        //将xml文档转换为Document的对象
        Document document = parse2Document(xmlFileName);
        //获取文档的根元素
        Element root = document.getRootElement();
        //定义个保存输出xml数据的缓冲字符串对象
//        StringBuffer sb = new StringBuffer();

        //遍历当前元素(在此是根元素)的子元素
        for (Iterator i_pe = root.elementIterator(); i_pe.hasNext();) {
            Element e_pe = (Element) i_pe.next();
            //获取当前元素的名字
            String person = e_pe.getName();
            if(person=="name"){
                segment = e_pe.getText()
                def templateExist = SegmentTemplate.findWhere(
                        segment: segment,
                        hl7Vsersion: '2.4'
                )
                if (templateExist){

                    return -1
                }
            }
            int count=0
            if (person=="elements") {
                println(e_pe.elementIterator().size())
                for (Iterator i_fileds = e_pe.elementIterator(); i_fileds.hasNext();){
                    count++
                    Element e_filed = (Element) i_fileds.next();
                    println()
                    def templateData = new SegmentTemplate()
                    templateData.segment = segment
                    templateData.field = e_filed.element('description').getText()
                    templateData.fieldIndex = count
                    templateData.hl7Vsersion = "2.4"
                    templateData.dataType = e_filed.element('datatype').getText()

                    if (e_filed.attribute("minOccurs")&&e_filed.attribute("minOccurs").value=="0"){
                        templateData.required=false
                    } else{
                        templateData.required = true
                    }
                    if (e_filed.attribute("maxOccurs")&&e_filed.attribute("maxOccurs").value=="unbounded"){
                        templateData.repeatable=true
                    }else{
                        templateData.repeatable=false
                    }
                    if(!templateData.save(flash:true)){
                        println(count)
                    }

                }
                return 1
            }



//        if(person=="elements") {
//                String id = e_pe.elements("minOccurs");
//                String sex = e_pe.attributeValue("maxOccurs");
//                String name = e_pe.element("name").getText();
//                String age = e_pe.element("description").getText();
//                String datatype = e_pe.element("datatype").getText();
//                println(id+" ----  "+sex+"-----   "+ name +" -----  "+age+" -----  "+ datatype)
//            }
            //获取当前元素的id和sex属性的值并分别赋给id,sex变量
//
            //将数据存放到缓冲区字符串对象中
//            sb.append(person + ":\n");
//            sb.append("\tid=" + id + " sex=" + sex + "\n");
//            sb.append("\t" + "name=" + name + " age=" + age + "\n");

            //获取当前元素e_pe(在此是person元素)下的子元素adds
//            Element e_adds = e_pe.element("adds");
//            sb.append("\t" + e_adds.getName() + "\n");

            //遍历当前元素e_adds(在此是adds元素)的子元素
//            for (Iterator i_adds = e_adds.elementIterator(); i_adds.hasNext();) {
//                Element e_add = (Element) i_adds.next();
//                String code = e_add.attributeValue("code");
//                String add = e_add.getTextTrim();
//                sb.append("\t\t" + e_add.getName() + ":" + " code=" + code + " value=\"" + add + "\"\n");
//            }
//            sb.append("\n");
        }
//        sb.append("-----------------遍历end-----------------\n");
//        System.out.println(sb.toString());
//
//
//        System.out.println("---------通过XPath获取一个元素----------");
//        Node node1 = document.selectSingleNode("/doc/person");
//        System.out.println("输出节点:" +
//                "\t"+node1.asXML());
//
//        Node node2 = document.selectSingleNode("/doc/person/@sex");
//        System.out.println("输出节点:" +
//                "\t"+node2.asXML());
//
//        Node node3 = document.selectSingleNode("/doc/person[name=\"zhangsan\"]/age");
//        System.out.println("输出节点:" +
//                "\t"+node3.asXML());
//
//        System.out.println("\n---------XPath获取List节点测试------------");
//        List list = document.selectNodes("/doc/person[name=\"zhangsan\"]/adds/add");
//        for(Iterator it=list.iterator();it.hasNext();){
//            Node nodex=(Node)it.next();
//            System.out.println(nodex.asXML());
//        }
//
//        System.out.println("\n---------通过ID获取元素的测试----------");
//        System.out.println("陷阱：通过ID获取，元素ID属性名必须为“大写ID”，小写的“id”会认为是普通属性！");
//        String id22 = document.elementByID("22").asXML();
//        String id23 = document.elementByID("23").asXML();
//        String id24 = null;
//        if (document.elementByID("24") != null) {
//            id24 = document.elementByID("24").asXML();
//        } else {
//            id24 = "null";
//        }
//
//        System.out.println("id22=  " + id22);
//        System.out.println("id23=  " + id23);
//        System.out.println("id24=  " + id24);
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
        def searchSegment = {
            if(params.segment){
                like('segment',"%${params.segment}%")
            }
        }
        def SegmentTemplateDataList = SegmentTemplate.createCriteria().list(params,searchSegment)
        render (view: 'list' ,model:   [SegmentTemplateDataList: SegmentTemplateDataList, SegmentTemplateDataTotal: SegmentTemplateDataList.totalCount])
    }

}
