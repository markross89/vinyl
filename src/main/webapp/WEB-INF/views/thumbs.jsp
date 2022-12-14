<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="content.jsp"/>

<!-- main content start -->
<div class="main-content">

    <div class="content-title">${search} :</div>
    <div class="pag-align">
    <jsp:include page="pagination.jsp"/>
    </div>
    <hr

    />
    <div class="content-elements">


        <c:forEach items="${thumbs.results}" var="e">
            <a href="<c:url value="/details/${e.id}"/>" style="text-decoration: none"
            >
                <div class="card">
                    <div class="title-pic" title="${e.title}">
                        <div class="card-title">
                                ${e.title}
                        </div>
                        <div class="cover-pic">
                            <img src="${e.cover_image}"
                                 style="width: 160px; height: 160px" alt="${e.cover_image}"/>
                        </div>
                    </div>
                    <div class="card-options">

                        <div>
                            <a href="<c:url value="/save/${e.id}" />" class="option add"
                               title="Add to albums"><fmt:message key="admin.table.add"/></a>
                        </div>


                    </div>
                </div>
            </a>
        </c:forEach>


    </div>
    <hr

    />
    <div class="pag-align">
    <jsp:include page="pagination.jsp"/>
    </div>
</div>


<!-- main content end -->

<!-- main container end -->
</div>
<jsp:include page="footer.jsp"/>
