<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<jsp:include page="content.jsp"/>
    <!-- main content start -->
    <div class="main-content">
        <div class="content-content">
            <div class="content-title"><fmt:message key="register.register"/>:</div>
            <hr
                    style="
              width: 95%;
              margin-right: 50px;
              border-top: 1px solid rgba(239,175,0,0.8);
            "
            />
            <div class="register-box">

                <form:form class="form-form" modelAttribute="user" method="post">
                    <div class="error-input">
                        <spring:message code="placeholder.name" var="namePlaceholder"/>
                        <form:input class="input-album-song" path="firstName"
                                    placeholder="${namePlaceholder}"/>

                        <form:errors path="firstName" Class="markus-error"/>
                    </div>
                    <div class="error-input">
                        <spring:message code="placeholder.surname" var="lastNamePlaceholder"/>
                        <form:input path="lastName"
                                    class="input-album-song" placeholder="${lastNamePlaceholder}"/>

                        <form:errors path="lastName" Class="markus-error"/>
                    </div>
                    <div class="error-input">
                        <spring:message code="placeholder.email" var="emailPlaceholder"/>
                        <form:input path="username"
                                    class="input-album-song" placeholder="${emailPlaceholder}"/>

                        <form:errors path="username" Class="markus-error"/>
                    </div>
                    <div class="error-input">
                        <spring:message code="placeholder.password" var="passwordPlaceholder"/>
                        <form:password path="password"
                                       class="input-album-song" placeholder="${passwordPlaceholder}"/>

                        <form:errors path="password" Class="markus-error"/>
                    </div>
                    <div class="error-input">
                        <spring:message code="placeholder.password.repeat" var="passwordRepeatPlaceholder"/>
                        <form:password path="passwordRepeat"
                                       class="input-album-song"
                                       placeholder="${passwordRepeatPlaceholder}"/>

                        <form:errors path="passwordRepeat" Class="markus-error"/>

                    </div>

                    <div class="form-group form-group--buttons">
                        <button class="button-register" type="submit"><fmt:message key="users.add"/></button>
                    </div>

                </form:form>
                <img src="/resources/pictures/pinkFloyd.jpg"  style="opacity: 0.7" class="cover" alt="Abbey Road">
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