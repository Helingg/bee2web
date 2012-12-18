


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />

        <title><g:message code="default.create.label" args="[entityName]" /></title>

    </head>
    <body>        
        <h1>Config Option</h1>
        <hr>


        <div class="container-fluid span10">
        <div class="row-fluid">
            <div class="span3">
                <div class="well sidebar-nav">
                    <ul class="nav nav-list">
                        <li class="nav-header">Option</li>
                        <li class="active"><g:link  action="list" controller="client"><i class="icon-edit"></i>Config Client</g:link></li>
                        <li class="active"><g:link  action="createRules" controller="mappingRule"><i class="icon-edit"></i>Config Rule</g:link></li>
                        <li class="active"><g:link  action="list" controller="bridge"><i class="icon-edit"></i>Config Bridge</g:link></li>
                    </ul>
                </div>
            </div>

        <div class="span9" >
              <g:if test="${flash.message}">
            <div class="message span9" style="color: red">${flash.message}</div>
        </g:if>



    </body>
</html>
