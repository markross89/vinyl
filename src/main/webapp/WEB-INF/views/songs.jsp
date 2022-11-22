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
                        <td>option</td>
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
        <jsp:include page="songPagination.jsp"/>
    </div>
</div>

<!-- main content end -->

<!-- main container end -->
</div>
<jsp:include page="footer.jsp"/>