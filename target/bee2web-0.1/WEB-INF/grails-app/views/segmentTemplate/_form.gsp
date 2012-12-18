<%@ page import="com.bssi.SegmentTemplate" %>



<div class="fieldcontain ${hasErrors(bean: templateDatabaseData, field: 'segment', 'error')} ">
	<label for="segment">
		<g:message code="templateDatabase.segment.label" default="Segment" />
		
	</label>
	<g:textField name="segment" maxlength="5" value="${templateDatabaseData?.segment}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: templateDatabaseData, field: 'field', 'error')} ">
	<label for="field">
		<g:message code="templateDatabase.field.label" default="Field" />
		
	</label>
	<g:textArea name="field" cols="40" rows="5" maxlength="256" value="${templateDatabaseData?.field}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: templateDatabaseData, field: 'dataType', 'error')} ">
	<label for="dataType">
		<g:message code="templateDatabase.dataType.label" default="Data Type" />
		
	</label>
	<g:textField name="dataType" maxlength="16" value="${templateDatabaseData?.dataType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: templateDatabaseData, field: 'required', 'error')} ">
	<label for="required">
		<g:message code="templateDatabase.required.label" default="Required" />
		
	</label>
	<g:checkBox name="required" value="${templateDatabaseData?.required}" />
</div>

<div class="fieldcontain ${hasErrors(bean: templateDatabaseData, field: 'repeatable', 'error')} ">
	<label for="repeatable">
		<g:message code="templateDatabase.repeatable.label" default="Repeatable" />
		
	</label>
	<g:checkBox name="repeatable" value="${templateDatabaseData?.repeatable}" />
</div>

<div class="fieldcontain ${hasErrors(bean: templateDatabaseData, field: 'fieldIndex', 'error')} required">
	<label for="fieldIndex">
		<g:message code="templateDatabase.fieldIndex.label" default="Field Index" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="fieldIndex" required="" value="${templateDatabaseData.fieldIndex}"/>
</div>

