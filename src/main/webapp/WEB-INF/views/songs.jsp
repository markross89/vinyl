<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<jsp:include page="content.jsp"/>

<!-- main content start -->

<div class="main-content">
    <div class="content-content">
        <div class="content-title">Songs:</div>
        <jsp:include page="songPagination.jsp"/>
        <hr
                style="
              width: 95%;
              margin-right: 35px;
              border-top: 1px solid rgba(239,175,0,0.8);
            "
        />


        <div class="tracks">
            <div class="album-details-title">My songs:</div>
            <table class="tracklist-table">
                <thead>
                <tr>

                    <th>Nr</th>
                    <th><a href="<c:url value="songs?field=title&direction=${direction}"/>" class="album-link">Title</a></th>
                    <th><a href="<c:url value="songs?field=album.title&direction=${direction}"/>" class="album-link">Album</a></th>
                    <th><a href="<c:url value="songs?field=album.artists.name&direction=${direction}"/>" class="album-link">Artist</a></th>
                    <th><a href="<c:url value="songs?field=position&direction=${direction}"/>" class="album-link">Position</a></th>
                    <th><a href="<c:url value="songs?field=duration&direction=${direction}"/>" class="album-link">Duration</a></th>
                    <th>Option</th>
                </tr>
                </thead>
                <c:forEach items="${songs.content}" var="s">
                    <c:set var="counter" value="${counter + 1}" scope="request"/>
                    <tr style="border: #2196F3 solid 1px">
                        <td>${counter}</td>
                        <td>${s.title}</td>
                        <td><a href="<c:url value="/details/${s.album.id}"/>" class="album-link">${s.album.title}</a>
                        </td>
                        <td>${s.album.artists_sort}</td>
                        <td>${s.position}</td>
                        <td>${s.duration}</td>
                        <td>  <button data-modal-target="#modal-addToPlaylist" class="songs-button-link" title="Add to playlist">
                            <span>Add</span>
                        </button></td>
                    </tr>
                    <div class="modal modal-about" id="modal-addToPlaylist" style="width: 400px">
                        <div class="modal-header">
                            <div class="form-title" style="text-decoration: none">Dodaj do...</div>
                            <button data-close-button class="close-button">&times;</button>
                        </div>
                        <div class="modal-body" >
                            <div>
                                <form:form class="add-to-playlist-form" modelAttribute="track" method="post" action="add_to_playlist/${s.id}">
                                    <%--                <form method="get" action="<c:url value="add_to_playlist" />" class="add-to-playlist-form">--%>
                                    <%--                    <div class="add-to-playlist">--%>
                                    <form:checkboxes items="${playlists}" path="playlists" itemLabel="name"  delimiter="<br/>"/>
                                    <%--                <c:forEach items="${songlists}" var="p">--%>
                                    <%--                <form:checkbox  path="playlists" itemLabel="${p.name}" itemValue="${p.id}" delimiter="<br/>"/>--%>
                                    <%--                </c:forEach>--%>

                                    <%--                        <c:forEach items="${songlists}" var="p">--%>
                                    <%--                            <label class="container-for-checkbox">${p.name}--%>
                                    <%--                                <input type="checkbox" value="${p.id}" id="${p.name}" name="playlist">--%>
                                    <%--                                <span class="checkmark-for-checkbox"></span>--%>
                                    <%--                            </label>--%>
                                    <%--                        </c:forEach>--%>
                                    <%--                    </div>--%>
                                    <%--                    <input type="text" class="input input-checkmark" name="playlist" placeholder="Add new playlist"/>--%>
                                    <%--                    <div class="form-group form-group--buttons">--%>
                                    <%--                        <button class="button-add" type="submit"><fmt:message key="admin.table.add"/></button>--%>
                                    <%--                    </div>--%>
                                    <%--               --%>
                                    <%--                </form>--%>
                                    <div class="form-group form-group--buttons">
                                        <button class="button-register" type="submit"><fmt:message key="users.add"/></button>
                                    </div>
                                </form:form>

                            </div>

                        </div>
                    </div>

                </c:forEach>
            </table>

        </div>


        <hr
                style="
              width: 95%;
              margin-right: 40px;
              margin-bottom: 10px;
              border-top: 1px solid rgba(239,175,0,0.8);
            "
        />
        <jsp:include page="songPagination.jsp"/>
    </div>
</div>

<!-- main content end -->

<!-- main container end -->
</div>
<jsp:include page="footer.jsp"/>