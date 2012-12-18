<%@ page import="com.bssi.MessageTemplate" %>



<div class="fieldcontain ${hasErrors(bean: messageTemplateData, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="messageTemplate.type.label" default="Type" />
		
	</label>
	<g:textField name="type" maxlength="16" value="${messageTemplateData?.type}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageTemplateData, field: 'eventType', 'error')} ">
	<label for="eventType">
		<g:message code="messageTemplate.eventType.label" default="Event Type" />
		
	</label>
	<g:textField name="eventType" maxlength="16" value="${messageTemplateData?.eventType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageTemplateData, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="messageTemplate.description.label" default="Description" />
		
	</label>
	<g:textField name="description" maxlength="128" value="${messageTemplateData?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageTemplateData, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="messageTemplate.name.label" default="Name" />
		
	</label>
	<g:textField name="name" maxlength="16" value="${messageTemplateData?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageTemplateData, field: 'segment', 'error')} ">
	<label for="segment">
		<g:message code="messageTemplate.segment.label" default="Segment" />
		
	</label>
	<g:textField name="segment" maxlength="16" value="${messageTemplateData?.segment}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageTemplateData, field: 'segmentIndex', 'error')} required">
	<label for="segmentIndex">
		<g:message code="messageTemplate.segmentIndex.label" default="Segment Index" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="segmentIndex" required="" value="${messageTemplateData.segmentIndex}"/>
</div>

