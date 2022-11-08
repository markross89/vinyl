<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<jsp:include page="content.jsp"/>
<!-- main content start -->
<div class="main-content">
    <div class="content-content">
        <div class="content-title">${album.artists_sort} - ${album.title}:</div>
        <hr
                style="
              width: 95%;
              margin-right: 50px;
              border-top: 1px solid rgba(239,175,0,0.8);
            "
        />
        <div class="markus-info-pic">
            <div class="markus-info-pic">
                <div class="pictures">
                    <a href="<c:url value=""/>"><img src="${album.thumb}" alt="${album.thumb}" width="170" height="170"></a>
                </div>

                <div class="album-details">
                    <div class="album-details-title">Details:</div>

                    <div class="details-element">id: ${album.id}</div>
                    <div class="details-element">year: ${album.year}</div>
                    <div class="details-element">genres:
                        <c:forEach items="${album.genres}" var="g">
                            ${g}
                        </c:forEach>
                    </div>
                    <div class="details-element">labels:
                        <c:forEach items="${album.labels}" var="l">
                            ${l.name}(${l.catno})
                        </c:forEach>
                    </div>
                    <div class="details-element"><a href="<c:url value="${album.uri}" />">see on discogs</a></div>
                </div>
            </div>
            <div class="album-options">
                <a href="" class="butt add-button">Add</a>
                <a href="" class="butt delete-button">Delete</a>


            </div>
        </div>
        <div class="tracks">
            <div class="album-details-title">Tracks:</div>
            <table class="tracklist-table">
                <c:forEach items="${album.tracklist}" var="t">

                    <tr style="border: #2196F3 solid 1px">
                        <td>${t.position}</td>
                        <td>${t.title}</td>
                        <td>${t.duration}</td>
                    </tr>

                </c:forEach>
            </table>

        </div>


        <hr
                style="
              width: 95%;
              margin-right: 50px;
              border-top: 1px solid rgba(239,175,0,0.8);
            "
        />
    </div>
</div>

<!-- main content end -->

<!-- main container end -->
</div>
<jsp:include page="footer.jsp"/>