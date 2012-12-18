
<%@ page import="com.bssi.Recipient" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'recipient.label', default: 'Recipient')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:form action="search" method="post">
            <table  class="userForm">  
                  <tr class='prop'>  
                      <td valign='middle' style='text-align:left;' width='5%'>  
                          <label for='name'>Name:</label>  
                      </td>  
                      <td valign='top' style='text-align:left;' width='18%'>  
                          <input id="name" type='text' name='name' value='${params.name}' />
                      </td>  
					  <td valign='middle' style='text-align:left;' width='5%'>  
                          <label for='type'>Type:</label>  
                      </td>  
                      <td valign='top' style='text-align:left;' width='25%'>  
                      <g:if test="${params.type=='1'}">
                                    	<g:radio name="type" value="1" checked="checked"></g:radio>TCP  
                           				<g:radio name="type" value="2"></g:radio>FTP
                           				<g:radio name="type" value="3"></g:radio>SFTP
                           				<g:radio name="type" value="4"></g:radio>FS
                           			</g:if>
                           			<g:if test="${params.type=='2'}">
                           				<g:radio name="type" value="1"></g:radio>TCP  
                           				<g:radio name="type" value="2" checked="checked"></g:radio>FTP
                           				<g:radio name="type" value="3"></g:radio>SFTP
                           				<g:radio name="type" value="4"></g:radio>FS
                           			</g:if>
                           			<g:if test="${params.type=='3'}">
                           				<g:radio name="type" value="1"></g:radio>TCP  
                           				<g:radio name="type" value="2"></g:radio>FTP
                           				<g:radio name="type" value="3" checked="checked"></g:radio>SFTP
                           				<g:radio name="type" value="4"></g:radio>FS
                           			</g:if>
                           			<g:if test="${params.type=='4'}">
                           				<g:radio name="type" value="1"></g:radio>TCP  
                           				<g:radio name="type" value="2"></g:radio>FTP
                           				<g:radio name="type" value="3"></g:radio>SFTP
                           				<g:radio name="type" value="4" checked="checked"></g:radio>FS
                           			</g:if>
                      </td>    
                      <td valign='top' rowspan='2' width='70%' style='text-align:left;'><input type="submit" value="Search" style="height:20px"></input></td>                    
              </tr>
               </table>
            </g:form>
			<div class="nav">            
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
            <g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            </div>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'recipient.id.label', default: 'Id')}" />
                        <g:sortableColumn property="name" title="${message(code: 'recipient.name.label', default: 'Name')}" />
                            <g:sortableColumn property="ip" title="${message(code: 'recipient.ip.label', default: 'Ip')}" />
                        <g:sortableColumn property="port" title="${message(code: 'recipient.port.label', default: 'Port')}" />
                        
                            <g:sortableColumn property="type" title="${message(code: 'recipient.type.label', default: 'Type')}" />
                            <g:sortableColumn property="others" title="${message(code: 'recipient.others.label', default: 'Others')}" />
                            <g:sortableColumn property="dateCreated" title="${message(code: 'recipient.dateCreated.label', default: 'Date Created')}" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${recipientDataList}" status="i" var="recipientData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${recipientData.id}">${fieldValue(bean: recipientData, field: "id")}</g:link></td>
                        <td>${fieldValue(bean: recipientData, field: "name")}</td>
                            <td>${fieldValue(bean: recipientData, field: "ip")}</td>
                        <td>${fieldValue(bean: recipientData, field: "port")}</td>
                        
                            <td>
                            <g:if test="${recipientData.type=='1'}">TCP</g:if>
                            <g:if test="${recipientData.type=='2'}">FTP</g:if>
                            <g:if test="${recipientData.type=='3'}">SFTP</g:if>
                            <g:if test="${recipientData.type=='4'}">FS</g:if>
                            </td>
                            <td>${fieldValue(bean: recipientData, field: "others")}</td>
                            <td><g:formatDate date="${recipientData.dateCreated}" /></td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${recipientDataTotal}" params="${params}" />
            </div>
			<div class="nav">            
              <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </div>
        </div>
    </body>
</html>
