<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="content.jsp"/>

<!-- main content start -->
<div class="main-content">
    <div class="content-content">
        <div class="content-title">${user.firstName} ${user.lastName}:</div>


        <hr
                style="
              width: 95%;
              margin-right: 50px;
              border-top: 1px solid rgba(239,175,0,0.8);
            "
        />
        <div class="content-elements">


            <section class="login-page">

                <form:form modelAttribute="user" method="post" action="/edit_credentials">
                    <form:hidden path="id" value="${user.id}"/>
                    <form:hidden path="firstName" value="${user.firstName}"/>
                    <form:hidden path="lastName" value="${user.lastName}"/>
                    <form:hidden path="username" value="${user.username}"/>
                    <form:hidden path="password" value="${user.password}"/>
                    <form:hidden path="passwordRepeat" value="${user.passwordRepeat}"/>

                <h1 class="markus-inline"><fmt:message key="admin.credentials.message"/>:</h1>
                <div class="markus-inline">

                    <c:forEach items="${roles}" var="i">
                        <div class="markus-inline">
                            <label class=" container">
                                <form:checkbox path="roles" value="${i}" title="${i.name}"/>
                                <span class="checkmark"></span>

                                <div class="title">${i.name}</div>

                            </label>

                        </div>
                    </c:forEach>
                    <form:errors path="roles" Class="markus-error" element="div"/>
                </div>
                <div class="markus-inline">
                    <div class="markus-inline">
                    <label class="container">
                        <form:radiobutton path="enabled" value="1"/>
                        <span class="checkmark"></span>
                        <div class="title"><fmt:message key="admin.credentials.on"/></div>
                    </label>

                </div>

                <div class="markus-inline">
                    <label class="container">
                        <form:radiobutton path="enabled" value="0"/>
                        <span class="checkmark"></span>
                        <div class="title"><fmt:message key="admin.credentials.off"/></div>
                    </label>
                </div>
        </div>


        <div class="markus-inline">
            <button class="button-register" type="submit"><fmt:message key="admin.credentials.message"/></button>
            <button class="button-register" onclick="history.back()"><fmt:message key="donation.button.back"/></button>
        </div>
        </form:form>
        </section>
        <img src="/resources/pictures/users.png" style="opacity: 0.7" class="users-pic" alt="users">

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
