<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<jsp:include page="content.jsp"/>

<!-- main content start -->

<div class="main-content">
    <div class="content-content">
        <div class="content-title"><fmt:message key="playlist.details"/>:</div>
        <jsp:include page="playlist_detailsPagination.jsp"/>
        <hr
                style="
              width: 95%;
              margin-right: 35px;
              border-top: 1px solid rgba(239,175,0,0.8);
            "
        />


        <div class="tracks">
            <div class="album-details-title">${playlist.name}:</div>
            <table class="tracklist-table">
                <thead>
                <tr>

                    <th>Nr</th>
                    <th><a href="<c:url value="playlist_details?id=${playlist.id}&field=title&direction=${direction}"/>" class="album-link" title="<fmt:message key="sort.title"/>"><fmt:message key="title"/></a>
                        <c:if test="${field=='title'}">
                        <span class="arrow-span" >
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
                    <th><a href="<c:url value="playlist_details?id=${playlist.id}&field=album.title&direction=${direction}"/>" class="album-link" title="<fmt:message key="sort.album"/>">Album</a>
                        <c:if test="${field=='album.title'}">
                        <span class="arrow-span" >
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
                    <th><a href="<c:url value="playlist_details?id=${playlist.id}&field=album.artists.name&direction=${direction}"/>"
                           class="album-link" title="<fmt:message key="sort.artist"/>"><fmt:message key="artist"/></a>
                        <c:if test="${field=='album.artists.name'}">
                        <span class="arrow-span" >
                        <c:choose>
                            <c:when test="${direction=='DESC'}">
                                ↑
                            </c:when>
                            <c:otherwise>
                                ↓
                            </c:otherwise>
                        </c:choose>
                        </span></c:if></th>
                    <th><a href="<c:url value="playlist_details?id=${playlist.id}&field=position&direction=${direction}"/>" class="album-link" title="<fmt:message key="sort.position"/>"><fmt:message key="position"/></a>
                        <c:if test="${field=='position'}">
                        <span class="arrow-span" >
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
                    <th><a href="<c:url value="playlist_details?id=${playlist.id}&field=duration&direction=${direction}"/>" class="album-link" title="<fmt:message key="sort.duration"/>"><fmt:message key="duration"/></a>
                        <c:if test="${field=='duration'}">
                        <span class="arrow-span" >
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
                    <th>Option</th>
                </tr>
                </thead>
                <c:forEach items="${songs.content}" var="s">
                    <c:set var="counter" value="${counter + 1}" scope="request"/>
                    <tr style="border: #2196F3 solid 1px">
                        <td>${counter}</td>
                        <td>${s.title}</td>
                        <td><a href="<c:url value="/details/${s.album.id}"/>" class="album-link" title="<fmt:message key="see.details"/>">${s.album.title}</a>
                        </td>
                        <td>${s.album.artists_sort}</td>
                        <td>${s.position}</td>
                        <td>${s.duration}</td>
                        <td>

                            <div>
                                <a href="<c:url value="/delete_from_playlist?song_id=${s.id}&playlist_id=${playlist.id}" />" class="songs-button-link-delete" title="<fmt:message key="delete.from.playlist"/>"><fmt:message key="delete"/></a>
                            </div>
                        </td>
                    </tr>


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
        <jsp:include page="playlist_detailsPagination.jsp"/>
    </div>
</div>

<!-- main content end -->

<!-- main container end -->
</div>
<jsp:include page="footer.jsp"/>