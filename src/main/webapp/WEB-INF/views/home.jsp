<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="content.jsp"/>

    <!-- main content start -->
    <div class="main-content">
        <div class="content-content">
            <div class="content-title">${search} :</div>

            <jsp:include page="pagination.jsp"/>

            <hr
                    style="
              width: 95%;
              margin-right: 50px;
              border-top: 1px solid rgba(239,175,0,0.8);
            "
            />
            <div class="content-elements">


                <c:forEach items="${thumbs.results}" var="e">
                    <a href="" style="text-decoration: none"
                    >
                        <div class="card">
                            <div class="title-pic" title="${e.title}">
                                <div class="card-title">
                                        ${e.title}
                                </div>
                                <div class="cover-pic">
                                    <img src="${e.cover_image}"
                                         style="width: 160px; height: 160px"/>
                                </div>
                            </div>
                            <div class="card-options">
                                <div>
                                    <a href="" class="option add">Add</a>
                                </div>
                                <div>
                                    <a href="" class="option delete">Delete</a>
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
            <jsp:include page="pagination.jsp"/>
        </div>
    </div>

    <!-- main content end -->

    <!-- main container end -->
</div>
<jsp:include page="footer.jsp"/>
