<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="content.jsp"/>

<!-- main content start -->
<div class="main-content">

    <div class="content-title"><fmt:message key="my.albums"/> :</div>
    <div class="pag-align">
    <jsp:include page="albumPagination.jsp"/>
    </div>
    <hr

    />
    <div class="content-elements">
        <c:forEach items="${albums.content}" var="e">
            <div class="card">
                <a href="<c:url value="details/${e.id}"/>" style="text-decoration: none">
                    <div class="title-pic" title="${e.artists_sort} - ${e.title}">
                        <div class="card-title">
                                ${e.artists_sort} - ${e.title}
                        </div>
                        <div class="cover-pic">
                            <img src="${e.images[0].resource_url}" style="width: 160px; height: 160px"
                                 alt="${e.images[0].resource_url}"/>
                        </div>
                    </div>
                </a>
                <div class="card-options">
                    <div>
                        <button data-modal-target="#modal-addToBox-${e.id}" class="songs-button-link"
                                id="${e.id}" title="<fmt:message key="add.to.box"/>" onclick="ggg()">
                            <span><fmt:message key="box.it"/></span>
                        </button>
                    </div>
                    <div>
                        <button data-modal-target="#modal-warning-${e.id}" class="songs-button-link-delete"
                                title="<fmt:message key="delete.from.albums"/>">
                            <span><fmt:message key="delete"/></span>
                        </button>
                    </div>

                </div>
            </div>

            <%--    warning message--%>
            <div class="modal modal-warning" id="modal-warning-${e.id}">
                <div class="modal-header">
                    <div class="form-title"><fmt:message key="warning"/></div>
                    <button data-close-button class="close-button">&times;</button>
                </div>
                <div class="modal-body-addPlaylist">

                    <div class="warning-description">
                        <h5><fmt:message key="album.delete.message"/>
                            <br/>

                        </h5>
                        <div>
                            <form method="get" action="/delete">
                                <div class="form-group form-group--buttons">
                                    <button class="button-add" type="submit"><fmt:message
                                            key="button.continue.form"/></button>
                                    <input type="hidden" name="id" value="${e.id}">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <%--    warning message end--%>

            <%--js add form--%>
            <div class="modal modal-about" id="modal-addToBox-${e.id}" style="width: 400px">
                <div class="modal-header">
                    <div class="form-title" style="text-decoration: none"><fmt:message
                            key="add.or.delete"/></div>
                    <button data-close-button class="close-button">&times;</button>
                </div>
                <div class="modal-body">
                    <div>
                        <form:form class="add-to-playlist-form" modelAttribute="album" method="post"
                                   action="add_to_box">
                            <hr style="width: 98%;   margin-top: 10px ;
              border-top: 1px solid rgba(183,134,2,0.99);"/>
                            <div class="playlists-list">
                                <c:set target="${album}" property="boxes" value="${e.boxes}"/>
                                <form:checkboxes class="checkboxes" items="${boxes}" path="boxes" itemLabel="name"
                                                 delimiter="<br/>"/>
                                <input class="song-id" type="hidden" name="id">
                                <br/>
                            </div>
                            <hr style=" width: 98%;   margin: 5px 5px 20px; border-top: 1px solid rgba(183,134,2,0.99);  "/>
                            <input class="input-album-song" type="text" name="name" placeholder="Add new box">
                            <div class="form-group form-group--buttons">
                                <button class="button-add" type="submit"><fmt:message
                                        key="admin.table.add"/></button>
                            </div>
                        </form:form>
                    </div>
                </div>
                    <%-- js add form end--%>
            </div>
        </c:forEach>
    </div>
    <hr

    />
    <div class="pag-align">
    <jsp:include page="albumPagination.jsp"/>
    </div>
</div>


<!-- main content end -->

</div>
<jsp:include page="footer.jsp"/>
