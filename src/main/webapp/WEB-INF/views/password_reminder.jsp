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
            <div class="email-reminder" >

                <div class="email-message"><fmt:message key="users.password.link.message"/></div>
                <form class="form-form markus-email-form" action="/change_password" method="post" name="form" onsubmit="event.preventDefault(); validate();">
                    <div class="error-input">
                        <input
                                id="email-verification"
                                class="input"
                                type="text"
                                placeholder="Email"
                                name="username"
                        />
                        <div id="email-verification-error" class="error-message">Please enter correct email</div>
                    </div>


                    <div class="form-group form-group--buttons">
                        <button class="button-register"  type="submit"><fmt:message key="contact.send"/></button>
                    </div>


                </form>
            </div>
            <img src="/resources/pictures/porcelain.jpg" class="cover" alt="Moby">
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
