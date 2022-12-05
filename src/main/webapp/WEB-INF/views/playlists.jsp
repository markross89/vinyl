<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="content.jsp"/>

<!-- main content start -->
<div class="main-content">
    <div class="content-content">
        <div class="content-title">My playlists :</div>

        <jsp:include page="playlistPagination.jsp"/>

        <hr
                style="
              width: 95%;
              margin-right: 50px;
              border-top: 1px solid rgba(239,175,0,0.8);
            "
        />
        <div class="content-elements">


            <c:forEach items="${playlists.content}" var="e">

                <div class="card">
                    <a href="<c:url value="/playlist_details?id=${e.id}"/>" style="text-decoration: none"
                    >
                        <div class="title-pic" title="${e.name} - ${e.date}">
                            <div class="card-title">
                                    ${e.name} <br/> ${e.date}
                            </div>
                            <div class="cover-pic">
                                <img src="<c:url value="/resources/pictures/playlist.png" />"
                                     style="width: 160px; height: 160px"/>
                            </div>
                        </div>
                    </a>
                    <div class="card-options">
                        <div>
                            <button data-modal-target="#modal-boxIt" class="songs-button-link"
                                    id="${e.id}" title="Create a box from albums linked to this playlist"
                                    onclick="ggg()">
                                <span>Box it</span>
                            </button>
                        </div>
                        <div>
                            <a href="<c:url value="/playlist_delete/${e.id}" />" class="option delete"
                               title="Delete playlist">Delete</a>
                        </div>

                    </div>
                </div>


            </c:forEach>


        </div>
        <div class="modal modal-addPlaylist" id="modal-boxIt">
            <div class="modal-header">
                <div class="form-title" style="text-decoration: none">New box</div>
                <button data-close-button class="close-button">&times;</button>
            </div>
            <div class="modal-body-addPlaylist">
                <img src="<c:url value="resources/pictures/box.png" />"
                     style="height: 300px;width: 300px;margin-top: 30px" class="cover" alt="box">
                <form class="form-form markus-name-form" action="<c:url value="playlist_to_box"/>" method="get"
                      id="box-form-other"
                      onsubmit="event.preventDefault(); validateOtherBox();">
                    <div class="error-input">
                        <input
                                id="box-input-other"
                                class="input input-name"
                                type="text"
                                placeholder="Box name"
                                name="name"
                        />
                        <input class="song-id" type="hidden" name="id">
                        <div id="error-message-other" class="error-message">Empty field</div>
                    </div>


                    <div class="form-group form-group--buttons">
                        <button class="button-register" type="submit"><fmt:message
                                key="admin.table.add"/></button>
                    </div>


                </form>

            </div>
        </div>
        <hr
                style="
              width: 95%;
              margin-right: 50px;
              border-top: 1px solid rgba(239,175,0,0.8);
            "
        />
        <jsp:include page="playlistPagination.jsp"/>
    </div>
</div>

<!-- main content end -->

<!-- main container end -->
</div>
<jsp:include page="footer.jsp"/>
