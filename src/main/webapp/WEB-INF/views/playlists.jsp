<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="content.jsp"/>

    <!-- main content start -->
    <div class="main-content">
        <div class="content-content">
            <div class="content-title">My albums :</div>

            <jsp:include page="albumPagination.jsp"/>

            <hr
                    style="
              width: 95%;
              margin-right: 50px;
              border-top: 1px solid rgba(239,175,0,0.8);
            "
            />
            <div class="content-elements">


                <c:forEach items="${playlists.content}" var="e">
                    <a href="<c:url value="/playlist_details/${e.id}"/>" style="text-decoration: none"
                    >
                        <div class="card">
                            <div class="title-pic" title="${e.name} - ${e.date}">
                                <div class="card-title">
                                        ${e.name} - ${e.date}
                                </div>
                                <div class="cover-pic">
                                    <img src="<c:url value="/resources/pictures/playlist.png" />"
                                         style="width: 160px; height: 160px"/>
                                </div>
                            </div>
                            <div class="card-options">
                                <div>
                                    <a href="<c:url value="/playlist_save/${e.id}" />" class="option add">Add</a>
                                </div>
                                <div>
                                    <a href="<c:url value="/playlist_delete/${e.id}" />" class="option delete">Delete</a>
                                </div>
                            </div>
                        </div>
                    </a>
                </c:forEach>


            </div>
            <hr
                    style="
              width: 95%;
              margin-right: 50px;
              border-top: 1px solid rgba(239,175,0,0.8);
            "
            />
            <jsp:include page="albumPagination.jsp"/>
        </div>
    </div>

    <!-- main content end -->

    <!-- main container end -->
</div>
<jsp:include page="footer.jsp"/>
