<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<jsp:include page="content.jsp"/>

<!-- main content start -->

<div class="main-content">

    <div class="content-title"><fmt:message key="song.songs"/>:</div>
    <div class="pag-align">
    <jsp:include page="songPagination.jsp"/>
    </div>
    <hr

    />


    <div class="tracks">
        <table class="tracklist-table">
            <thead>
            <tr>

                <th>Nr</th>
                <th><a href="<c:url value="songs?field=title&direction=${direction}"/>" class="album-link"
                       title="<fmt:message key="sort.title"/>"> <fmt:message key="title"/> </a>
                    <c:if test="${field=='title'}">
                        <span class="arrow-span">
                        <c:choose>
                            <c:when test="${direction=='DESC'}">
                                ↑
                            </c:when>
                            <c:otherwise>
                                ↓
                            </c:otherwise>
                        </c:choose>
                        </span></c:if>
                </th>
                <th><a href="<c:url value="songs?field=album&direction=${direction}"/>" class="album-link"
                       title="<fmt:message key="sort.album"/>">Album</a>
                    <c:if test="${field=='album'}">
                        <span class="arrow-span">
                        <c:choose>
                            <c:when test="${direction=='DESC'}">
                                ↑
                            </c:when>
                            <c:otherwise>
                                ↓
                            </c:otherwise>
                        </c:choose>
                        </span></c:if>
                </th>
                <th><a href="<c:url value="songs?field=album.artists.name&direction=${direction}"/>"
                       class="album-link" title="<fmt:message key="sort.artist"/>"><fmt:message key="artist"/></a>
                    <c:if test="${field=='album.artists.name'}">
                        <span class="arrow-span">
                        <c:choose>
                            <c:when test="${direction=='DESC'}">
                                ↑
                            </c:when>
                            <c:otherwise>
                                ↓
                            </c:otherwise>
                        </c:choose>
                        </span></c:if>
                </th>
                <th><a href="<c:url value="songs?field=position&direction=${direction}"/>" class="album-link"
                       title="
"><fmt:message key="position"/></a>
                    <c:if test="${field=='position'}">
                        <span class="arrow-span">
                        <c:choose>
                            <c:when test="${direction=='DESC'}">
                                ↑
                            </c:when>
                            <c:otherwise>
                                ↓
                            </c:otherwise>
                        </c:choose>
                        </span></c:if>
                </th>
                <th><a href="<c:url value="songs?field=duration&direction=${direction}"/>" class="album-link"
                       title="<fmt:message key="duration"/>"><fmt:message key="duration"/></a>
                    <c:if test="${field=='duration'}">
                        <span class="arrow-span">
                        <c:choose>
                            <c:when test="${direction=='DESC'}">
                                ↑
                            </c:when>
                            <c:otherwise>
                                ↓
                            </c:otherwise>
                        </c:choose>
                        </span></c:if>
                </th>
                <th><fmt:message key="options"/></th>
            </tr>
            </thead>
            <c:forEach items="${songs.content}" var="s">
                <c:set var="counter" value="${counter + 1}" scope="request"/>
                <tr style="border: #2196F3 solid 1px">
                    <td>${counter}</td>
                    <td>${s.title}</td>
                    <td><a href="<c:url value="/details/${s.album.id}"/>" class="album-link"
                           title="See details">${s.album.title}</a>
                    </td>
                    <td>${s.album.artists_sort}</td>
                    <td>${s.position}</td>
                    <td>${s.duration}</td>
                    <td>
                        <button data-modal-target="#modal-addToPlaylist-${s.id}" class="songs-button-link"
                                id="${s.id}" title="Add to playlist" onclick="ggg()">
                            <span>Add</span>
                        </button>
                    </td>
                </tr>
                <div class="modal modal-about" id="modal-addToPlaylist-${s.id}" style="width: 400px">
                    <div class="modal-header">
                        <div class="form-title" style="text-decoration: none"><fmt:message
                                key="add.or.delete"/></div>
                        <button data-close-button class="close-button">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div>
                            <form:form class="add-to-playlist-form" modelAttribute="track" method="post"
                                       action="add_to_playlist">
                                <hr
                                        style="
              width: 98%;
            margin-top: 10px ;
              border-top: 1px solid rgba(183,134,2,0.99);
            "
                                />
                                <div class="playlists-list">
                                    <c:set target="${track}" property="playlists" value="${s.playlists}"/>
                                    <form:checkboxes class="checkboxes" items="${playlists}" path="playlists"
                                                     itemLabel="name"
                                                     delimiter="<br/>"/>
                                    <input class="song-id" type="hidden" name="id">
                                    <br/>

                                </div>
                                <hr
                                        style="
              width: 98%;
            margin: 5px 5px 20px;
              border-top: 1px solid rgba(183,134,2,0.99);
            "
                                />
                                <input class="input-album-song" type="text" name="name" placeholder="Add new playlist">

                                <div class="form-group form-group--buttons">
                                    <button class="button-add" type="submit"><fmt:message
                                            key="admin.table.add"/></button>
                                </div>
                            </form:form>

                        </div>

                    </div>
                </div>

            </c:forEach>
        </table>

    </div>


    <hr

    />
    <div class="pag-align">
    <jsp:include page="songPagination.jsp"/>
    </div>
</div>


<!-- main content end -->

<!-- main container end -->
</div>
<jsp:include page="footer.jsp"/>