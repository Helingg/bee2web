
<%@ page import="com.bssi.Client" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            
            <g:form action="search" method="post">
            <table  class="userForm">  
                  <tr class='prop'>  
                      <td valign='middle' style='text-align:left;' width='5%'>  
                          <label for='name'>Name:</label>  
                      </td>  
                      <td valign='top' style='text-align:left;' width='18%'>  
                          <input id="name" type='text' name='name' value='${params.name}' />
                      </td>  
                      
                 <%-- </tr>
                  <tr class='prop'>  
                      --%><td valign='middle' style='text-align:left;' width='5%'>  
                          <label for='type'>Type:</label>  
                      </td>  
                      <td valign='top' style='text-align:left;' width='15%'>  
                           <%--<g:select optionKey="queryBy" optionValue="queryShow" 
                           from="${[[queryBy:'0',queryShow:'please choice'],[queryBy:'1',queryShow:'Trial'],[queryBy:'2',queryShow:'Formal']]}"  
                           name="type" value="${params.type}" id="type"></g:select>
                           --%>
                           <g:if test="${params.type=='1'}"><g:radio name="type" value="1" checked="checked"></g:radio>Trial  
                           <g:radio name="type" value="2"></g:radio>Formal
                           </g:if>
                           <g:if test="${params.type=='2'}"><g:radio name="type" value="1"></g:radio>Trial  
                           <g:radio name="type" value="2" checked="checked"></g:radio>Formal
                           </g:if>
                      </td>    
                      <td valign='top' rowspan='2' width='80%' style='text-align:left;'><input type="submit" value="Search" style="height:20px"></input></td>                    
              </tr>
               </table>
               <%--<div class="buttons">  
                     <span class="formButton">  
                        <input type="submit" value="Search"></input>  
                     </span>  
               </div> 
			--%><div class="nav">            
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'client.id.label', default: 'Id')}" />
                        <g:sortableColumn property="name" title="${message(code: 'client.name.label', default: 'Name')}" />
                        <g:sortableColumn property="alias" title="${message(code: 'client.alias.label', default: 'Alias')}" />
                            <g:sortableColumn property="sendingApplication" title="${message(code: 'client.sendingApplication.label', default: 'Sending Application')}" />
                        
                            <g:sortableColumn property="sendingFacility" title="${message(code: 'client.sendingFacility.label', default: 'Sending Facility')}" />
                        
                            <g:sortableColumn property="receivingApplication" title="${message(code: 'client.receivingApplication.label', default: 'Receiving Application')}" />
                        
                            <g:sortableColumn property="receivingFacility" title="${message(code: 'client.receivingFacility.label', default: 'Receiving Facility')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'client.dateCreated.label', default: 'Date Created')}" />
                        
                            
                        
                            <g:sortableColumn property="enabled" title="${message(code: 'client.enabled.label', default: 'Enabled')}" />
                        
                            
                        
                            <g:sortableColumn property="type" title="${message(code: 'client.type.label', default: 'Type')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${clientDataList}" status="i" var="clientData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${clientData.id}">${fieldValue(bean: clientData, field: "id")}</g:link></td>
                        <td>${fieldValue(bean: clientData, field: "name")}</td>
                        <td>${fieldValue(bean: clientData, field: "alias")}</td>
                            <td>${fieldValue(bean: clientData, field: "sendingApplication")}</td>
                        
                            <td>${fieldValue(bean: clientData, field: "sendingFacility")}</td>
                        
                            <td>${fieldValue(bean: clientData, field: "receivingApplication")}</td>
                        
                            <td>${fieldValue(bean: clientData, field: "receivingFacility")}</td>
                        
                            <td><g:formatDate date="${clientData.dateCreated}" /></td>                      
                            
                        
                            <td><g:formatBoolean boolean="${clientData.enabled}" /></td>
                        
                            
                        
                            <td><g:if test="${clientData.type=='0'}"></g:if>
                            <g:if test="${clientData.type=='1'}">Trial</g:if>
                            <g:if test="${clientData.type=='2'}">Formal</g:if>
                            </td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${clientDataTotal}" params="${params}" />
            </div>
			<div class="nav">            
              <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </div>
            </g:form>
        </div>
    </body>
</html>
