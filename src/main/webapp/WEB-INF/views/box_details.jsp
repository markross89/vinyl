<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="content.jsp"/>

<!-- main content start -->
<div class="main-content">
    <div class="content-content">
        <div class="content-title">Box details :</div>

        <jsp:include page="box_detailsPagination.jsp"/>

        <hr
                style="
              width: 95%;
              margin-right: 50px;
              border-top: 1px solid rgba(239,175,0,0.8);
            "
        />
        <div class="content-elements">


            <c:forEach items="${albums.content}" var="e">

                    <div class="card">
                        <a href="<c:url value="/details/${e.id}"/>" style="text-decoration: none"
                        >
                        <div class="title-pic" title="${e.artists_sort} - ${e.title}">
                            <div class="card-title">
                                    ${e.artists_sort} - ${e.title}
                            </div>
                            <div class="cover-pic">
                                <img src="${e.images[0].resource_url}"
                                     style="width: 160px; height: 160px" alt="${e.images[0].resource_url}"/>
                            </div>
                        </div>
                        </a>
                        <div class="card-options">

                            <div>
                                <a href="<c:url value="/box_delete/${e.id}" />" class="option delete" title="Delete from albums">Delete</a>
                            </div>
                        </div>
                    </div>

            </c:forEach>
        </div>

        <hr
                style="
              width: 95%;
              margin-right: 50px;
              border-top: 1px solid rgba(239,175,0,0.8);
            "
        />
        <jsp:include page="box_detailsPagination.jsp"/>
    </div>
</div>

<!-- main content end -->

<!-- main container end -->
</div>
<jsp:include page="footer.jsp"/>
