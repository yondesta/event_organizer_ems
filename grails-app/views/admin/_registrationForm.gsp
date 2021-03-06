<%@ page import="et.participant.Role; et.participant.User" %>
<div class="row">
    <div class="col-lg-4">
        <div class="form-group ${hasErrors(bean: userInstance, field: 'username', 'has-error')}">
            <label class="control-label" for="user.username">
                Username
                <span class="required-indicator">*</span>
            </label>
            <g:textField class="form-control" name="user.username" required="" value="${userInstance?.username}"/>
        </div>
        <div class="form-group ${hasErrors(bean: userInstance, field: 'firstName', 'has-error')}">
            <label class="control-label" for="user.firstName">
                First Name
                <span class="required-indicator">*</span>
            </label>
            <g:textField class="form-control" name="user.firstName" required="" value="${userInstance?.firstName}"/>
        </div>
        <div class="form-group ${hasErrors(bean: userInstance, field: 'email', 'has-error')}">
            <label class="control-label" for="user.email">
                Email
                <span class="required-indicator">*</span>
            </label>
            <g:field class="form-control" type="email" name="user.email" required="" value="${userInstance?.email}"/>
        </div>
        <div class="form-group ${hasErrors(bean: userInstance, field: 'birthDate', 'has-error')}">
            <label class="control-label" for="user.birthDate">
                Birth Date
                <span class="required-indicator">*</span>
            </label>
            <g:datePicker years="${(1930..2016)}" name="user.birthDate" precision="day"  value="${userInstance?.birthDate}" default="none" noSelection="['': '']" />
        </div>
    </div>
    <div class="col-lg-4">
        <div class="form-group ${hasErrors(bean: userInstance, field: 'lastName', 'has-error')}">
            <label class="control-label" for="user.lastName">
                Last Name
                <span class="required-indicator">*</span>
            </label>
            <g:textField class="form-control" name="user.lastName" required="" value="${userInstance?.lastName}"/>
        </div>
        <div class="form-group ${hasErrors(bean: userInstance, field: 'phone', 'has-error')}">
            <label class="control-label" for="user.phone">
                Phone
                <span class="required-indicator">*</span>
            </label>
            <g:textField class="form-control" name="user.phone" required="" value="${userInstance?.phone}"/>
        </div>
    </div>
    <div class="col-lg-4">
        <div class="form-group ${hasErrors(bean: userInstance, field: 'gender', 'has-error')}">
            <label class="control-label">
                Gender
                <span class="required-indicator">*</span>
            </label>
            <div class="radio">
                <label class="radio-inline">
                    <input id="genderM" name="user.gender" value="M" type="radio"/>M
                </label>
                <label class="radio-inline">
                    <input id="genderF" name="user.gender" value="F" type="radio"/>F
                </label>
            </div>
        </div>
        <div class="form-group ${hasErrors(bean: userInstance, field: 'address', 'has-error')}">
            <label class="control-label" for="user.address">
                Address
                <span class="required-indicator">*</span>
            </label>
            <g:textField class="form-control" name="user.address" required="" value="${userInstance?.address}"/>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-4">
        <div class="form-group">
            <label class="control-label" for="eventId">Event</label>
            <g:select class="form-control" name="eventId" from="${availableEvents}"  optionKey="id" optionValue="title" value="${eventInstance}" noSelection="['': '']"/>
        </div>
    </div>
    <div class="col-lg-4">
        <div class="form-group">
            <label>
                Select Role
                <span class="required-indicator">*</span>
            </label>
            <g:select class="form-control" name="roleId" from="${Role.list()}" optionKey="id" optionValue="authority" value="${Role.findByAuthority('ROLE_USER').id}"/>
        </div>
    </div>
</div>