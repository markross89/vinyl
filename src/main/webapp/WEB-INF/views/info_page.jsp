<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="content.jsp"/>
<!-- main content start -->
<div class="main-content">
    <div class="content-content">

        <hr
                style="
              width: 95%;
              margin-right: 50px;
              margin-bottom: 40px;
              margin-top: 90px;
              border-top: 1px solid red;
            "
        />
        <div class="register-box" >
            <div class="error-info">${message}</div>
            <img src="/resources/pictures/beatles.jpg" style="opacity: 0.7; margin-top: 20px" class="cover" alt="Abbey Road">
        </div>
        <hr
                style="
              width: 95%;
              margin-right: 50px;
              margin-top: 75px;
              border-top: 1px solid red
            "
        />
    </div>
</div>

<!-- main content end -->

<!-- main container end -->
</div>
<jsp:include page="footer.jsp"/>