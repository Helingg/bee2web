<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.bssi.MappingRule" %>
<html>
<head>
    <title>Scripting</title>
    <link type="text/css" href="${request.contextPath}/js/scripting/languages/java.css" rel="stylesheet" id="cp-lang-style" />
    <script type="text/javascript" src="${request.contextPath}/js/scripting/codepress.js">

    </script>
    <script type="text/javascript">
        function setScriptTextInfo(){
            var scriptText = codepress2.getCode();
            var process = document.getElementsByName('process');
            var processValue = 0;
            for(var i= 0;i<process.length;i++){
                  if(process[i].checked){
                      processValue = process[i].value;
                  }
            }
            parent.window.opener.setScriptText(scriptText,processValue);
            top.close();
        }
        function closePage(){
            top.close();
        }
    </script>
</head>
<body id="ffedt">
<h1>BEE Scripting Editor</h1>
 <hr>
<div style="margin: 0 0 0 20px;">
    <div style="font-size: 15px;margin: 10px 0 10px 0;color: #279745">Please input the program scripting here!</div>
    <g:radioGroup name="process" values="[1,0]" labels="['Preprocessing','Postprocessing']" value="${mappingRuleData?mappingRuleData.fromIndex:0}" >
        ${it.radio} <g:message code="${it.label}" />
    </g:radioGroup>
    <g:textArea name="codepress2" rows="400" cols="400"  value="${mappingRuleData?.scriptext}" class="codepress java linenumbers-on" style="width:700px;height:200px;" wrap="off" >
    </g:textArea>

    <p>
        <button class="actions" onclick="setScriptTextInfo();">OK</button>
        <button class="actions" onclick="closePage();">Cancel</button>
        <button class="actions" onclick="codepress2.toggleLineNumbers()">show/hide line numbers</button>
    </p>
</div>

</body>
</html>