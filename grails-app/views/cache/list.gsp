
<%@ page import="com.bssi.Cache" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cache.label', default: 'Message On Hold')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <g:javascript library="ui/jquery.ui.datepicker" />
        <script type="text/javascript">
            $(function() {
                $("#lowDate").datepicker();
                $("#highDate").datepicker();
            });
//            function checkForm(){
//                var str1=document.getElementById("lowDate");
//                var str2=document.getElementById("highDate");
//                var dt1=new Date(str1);
//                var dt2=new Date(str2);
//
//                alert(Date.parse(dt1).Date.parse(dt1));
//                if(dt1.getDate().after(dt2.getDate())){
//                    alert("The 'Date Created' range is wrong!");
//                    document.getElementById("lowDate").focus();
//                    return false;
//                }else{
//                    alert("fuck you !")
//                }
//                return false;
//            }
        </script>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:form method="post" >
                <g:hiddenField name="id" value="${cacheData?.id}" />
                <g:hiddenField name="version" value="${cacheData?.version}" />
                <div class="dialog">
                    <table class="table">
                        <tbody>
                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="message"><g:message code="cache.message.label" default="Message" /></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <g:textField name="message" cols="40" rows="5" value="${params.message}" />  &nbsp;&nbsp;
                                <label for="remoteIp"><g:message code="cache.remoteIp.label" default="Remote Ip" /></label> &nbsp;&nbsp;
                                <g:textField name="remoteIp" maxlength="128" value="${params.remoteIp}" />
                            </td>
                        </tr>


                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="dateCreated"><g:message code="sendLog.dateCreated.label" default="Date" /> &nbsp;&nbsp;From</label>&nbsp;&nbsp; &nbsp;&nbsp;
                                <g:textField name="lowDate" precision="day" value="${params.lowDate}"  /> &nbsp;&nbsp;
                                To &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <g:textField name="highDate" precision="day" value="${params.highDate}"  />
                            </td>
                        </tr>

                            <td>
                                <div class="buttons" style="width:90px">
                                    <span class="button"><g:actionSubmit class="save" action="search" value="${message(code: 'default.button.search.label', default: 'Search')}" /></span>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </g:form>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn params="[message:params.message,remoteIp:params.remoteIp,lowDate:params.lowDate,highDate:params.highDate]" property="id" title="${message(code: 'cache.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn params="[message:params.message,remoteIp:params.remoteIp,lowDate:params.lowDate,highDate:params.highDate]" property="msgCtrlId" title="${message(code: 'cache.msgCtrlId.label', default: 'Msg Ctrl Id')}" />
                        
                            <g:sortableColumn params="[message:params.message,remoteIp:params.remoteIp,lowDate:params.lowDate,highDate:params.highDate]" property="message" title="${message(code: 'cache.message.label', default: 'Message')}" />
                        
                            <g:sortableColumn params="[message:params.message,remoteIp:params.remoteIp,lowDate:params.lowDate,highDate:params.highDate]" property="remoteIp" title="${message(code: 'cache.remoteIp.label', default: 'Remote Ip')}" />
                        
                            <g:sortableColumn params="[message:params.message,remoteIp:params.remoteIp,lowDate:params.lowDate,highDate:params.highDate]" property="dateCreated" title="${message(code: 'cache.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${cacheDataList}" status="i" var="cacheData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${cacheData.id}">${fieldValue(bean: cacheData, field: "id")}</g:link></td>
                        
                            <td><g:link action="show" id="${cacheData.id}">${fieldValue(bean: cacheData, field: "msgCtrlId")}</g:link></td>
                        
                            <td><g:link action="show" id="${cacheData.id}">${cacheData.message}</g:link></td>
                        
                            <td>${fieldValue(bean: cacheData, field: "remoteIp")}</td>
                        
                            <td><g:formatDate  date="${cacheData.dateCreated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate action="search" params="[message:params.message,remoteIp:params.remoteIp,lowDate:params.lowDate,highDate:params.highDate]" total="${cacheDataTotal}" />
            </div>
        </div>
    </body>
</html>
