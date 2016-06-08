<%@ page import="et.participant.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
    <label for="username">
        <g:message code="user.username.label" default="Username" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="username" required="" value="${userInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
    <label for="password">
        <g:message code="user.password.label" default="Password" />
        <span class="required-indicator">*</span>
    </label>
    <g:passwordField name="password" datatype="password" required="" value="${userInstance?.password}"/>
</div>
<div class="fieldcontain required">
    <label for="confirmPassword">
        <g:message code="user.confirmPassword.label" default="Confirm Password" />
        <span class="required-indicator">*</span>
    </label>
    <g:passwordField name="confirmPassword" required="" datatype="password"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} required">
    <label for="firstName">
        <g:message code="user.firstName.label" default="First Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="firstName" required="" value="${userInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} required">
    <label for="lastName">
        <g:message code="user.lastName.label" default="Last Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="lastName" required="" value="${userInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
    <label for="email">
        <g:message code="user.email.label" default="Email" />
        <span class="required-indicator">*</span>
    </label>
    <g:field type="email" name="email" required="" value="${userInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'phone', 'error')} required">
    <label for="phone">
        <g:message code="user.phone.label" default="Phone" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="phone" required="" value="${userInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'address', 'error')} required">
    <label for="address">
        <g:message code="user.address.label" default="Address" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="address" required="" value="${userInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'birthDate', 'error')} ">
    <label for="birthDate">
        <g:message code="user.birthDate.label" default="Birth Date" />

    </label>
    <g:datePicker name="birthDate" precision="day"  value="${userInstance?.birthDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'gender', 'error')} required">
    <label for="gender">
        <g:message code="user.gender.label" default="Gender" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="gender" from="${userInstance.constraints.gender.inList}" required="" value="${userInstance?.gender}" valueMessagePrefix="user.gender"/>
</div>
<div class="fieldcontain">
    <label for="eventId">
        <g:message code="user.eventId.label" default="Available Events" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="eventId" from="${availableEvents}"  optionKey="id" optionValue="title" value="${eventInstance}"/>
</div>
<div class="fieldcontain">
    <label for="sendEmail">
        <g:message code="user.sendEmail.label" default="Send Email" />
    </label>
    <g:checkBox id="sendEmailCheckbox" name="sendEmailCheckbox" value="true"/>
</div>
<g:hiddenField id="sendEmail" name="sendEmail" value="true"/>
