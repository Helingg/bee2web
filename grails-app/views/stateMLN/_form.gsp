<%@ page import="com.bssi.StateMLN" %>



<div class="fieldcontain ${hasErrors(bean: stateMLNData, field: 'MLN', 'error')} ">
	<label for="MLN">
		<g:message code="stateMLN.MLN.label" default="MLN" />
		
	</label>
	<g:textField name="MLN" maxlength="128" value="${stateMLNData?.MLN}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stateMLNData, field: 'state', 'error')} ">
	<label for="state">
		<g:message code="stateMLN.state.label" default="State" />
		
	</label>
	<g:textField name="state" maxlength="16" value="${stateMLNData?.state}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stateMLNData, field: 'provider', 'error')} required">
	<label for="provider">
		<g:message code="stateMLN.provider.label" default="Provider" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="provider" name="provider.id" from="${com.bssi.Provider.list()}" optionKey="id" required="" value="${stateMLNData?.provider?.id}" class="many-to-one"/>
</div>

