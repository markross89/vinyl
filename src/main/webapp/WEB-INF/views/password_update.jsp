<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="content.jsp"/>

<!-- main content start -->
<div class="main-content">
    <div class="content-content">
        <div class="content-title"><fmt:message key="login.login"/>:</div>
        <hr
                style="
              width: 95%;
              margin-right: 50px;
              border-top: 1px solid rgba(239,175,0,0.8);
            "
        />
        <div class="register-box">

            <div class="password-update">
                <div class="email-message">
                    <h3>${user.firstName} ${user.lastName}</h3>
                    <p style="font-size: medium"><fmt:message key="users.update.title"/>. <fmt:message
                            key="users.edit.message"/></p>
                </div>

                <form:form class="form-form " modelAttribute="user" method="post">
                    <form:hidden path="id" value="${user.id}"/>
                    <form:hidden path="firstName" value="${user.firstName}"/>
                    <form:hidden path="lastName" value="${user.lastName}"/>
                    <form:hidden path="username" value="${user.username}"/>
                    <form:hidden path="enabled" value="${user.enabled}"/>
                    <div class="error-input">
                        <spring:message code="placeholder.password" var="passwordPlaceholder"/>
                        <form:password path="password" class="input"
                                       placeholder="${passwordPlaceholder}"/>
                        <form:errors path="password" Class="markus-error"/>
                    </div>

                    <div class="error-input">
                        <spring:message code="placeholder.password.repeat" var="repeatPlaceholder"/>
                        <form:password path="passwordRepeat"
                                       class="input" placeholder="${repeatPlaceholder}"/>
                        <form:errors path="passwordRepeat" Class="markus-error"/>
                    </div>


                    <div class="form-group form-group--buttons">

                        <button class="button-register" type="submit"><fmt:message
                                key="admin.credentials.save"/></button>
                    </div>
                </form:form>
            </div>
            <img src="/resources/pictures/nirvana.jpeg" class="cover" alt="Abbey Road">
        </div>
        <hr
                style="
              width: 95%;
              margin-right: 50px;
              border-top: 1px solid rgba(239,175,0,0.8);
            "
        />
    </div>
</div>
<!-- main content end -->

<!-- main container end -->
</div>
<jsp:include page="footer.jsp"/>




