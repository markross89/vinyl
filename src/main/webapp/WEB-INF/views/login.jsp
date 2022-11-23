<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="content.jsp"/>

<!-- main content start -->
<div class="main-content">
    <div class="content-content">
        <div class="content-title">Logowanie:</div>
        <hr
                style="
              width: 95%;
              margin-right: 50px;
              border-top: 1px solid rgba(239,175,0,0.8);
            "
        />
        <div class="register-box">

            <form class="form-form markus-form" action="/login" method="post" name="form">
                <div class="error-input">
                    <input
                            id="email"
                            class="input"
                            type="text"
                            placeholder="Email"
                            name="username"
                    />
                    <div id="email_error" class="error-message">Please enter correct email</div>
                </div>
                <div class="error-input">
                    <input
                            id="password"
                            class="input"
                            type="password"
                            placeholder="Password"
                            name="password"

                    />
                    <div id="password_error" class="error-message">Please enter correct password</div>

                </div>


                <div class="form-group form-group--buttons">
                    <button class="button-register" type="submit"><fmt:message key="login.login"/></button>
                </div>

                <a href="<c:url value="/password_reminder" />" class="pass-forgot">Zapomniałem hasła</a>
            </form>
            <img src="<c:url value="/resources/pictures/beatles.jpg" />" style="opacity: 0.7" class="cover" alt="Abbey Road">
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
