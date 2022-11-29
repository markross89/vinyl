<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                <button data-modal-target="#modal-addToBox" class="songs-button-link"
                                        id="${e.id}" title="Add to playlist" onclick="ggg()">
                                    <span>Box it</span>
                                </button>
                            </div>
                            <div>
                                <a href="<c:url value="/delete/${e.id}" />" class="option delete" title="Delete from albums">Delete</a>
                            </div>
                        </div>
                    </div>

            </c:forEach>
        </div>
        <div class="modal modal-about" id="modal-addToBox" style="width: 400px">
            <div class="modal-header">
                <div class="form-title" style="text-decoration: none">Dodaj do...</div>
                <button data-close-button class="close-button">&times;</button>
            </div>
            <div class="modal-body">
                <div>
                    <form:form class="add-to-playlist-form" modelAttribute="album" method="post"
                               action="add_to_box">
                        <hr style="width: 98%;   margin-top: 10px ;
              border-top: 1px solid rgba(183,134,2,0.99);"/>


                        <div class="playlists-list">
                            <form:checkboxes class="checkboxes" items="${boxes}" path="boxes" itemLabel="name"
                                             delimiter="<br/>"/>
                            <input id="song-id" type="hidden" name="id">
                            <br/>

                        </div>
                        <hr style=" width: 98%;   margin: 5px 5px 20px; border-top: 1px solid rgba(183,134,2,0.99);  "/>


                        <input class="input" type="text" name="name" placeholder="Add new box">

                        <div class="form-group form-group--buttons">
                            <button class="button-add" type="submit"><fmt:message key="admin.table.add"/></button>
                        </div>
                    </form:form>

                </div>

            </div>
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
