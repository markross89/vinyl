<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<jsp:include page="content.jsp"/>
<!-- main content start -->
<div class="main-content">
    <div class="content-content">
        <div class="content-title"><fmt:message
                key="details"/>:</div>
        <hr
                style="
              width: 95%;
              margin-right: 35px;
              border-top: 1px solid rgba(239,175,0,0.8);
            "
        />
        <div class="markus-info">
            <div class="markus-info-pic">
                <div class="pictures gallery">
                        <a href="<c:url value="${album.images[0].resource_url}" />" data-lightbox="mygallery" title="<fmt:message
                                            key="gallery"/>"><img src="${album.images[0].resource_url}" alt="${album.images[0].resource_url}" width="300" height="300"></a>
                    <c:forEach items="${album.images}" var="i">
                        <a href="<c:url value="${i.resource_url}"/>" data-lightbox="mygallery" ></a>
                    </c:forEach>
                </div>

                <div class="album-details">
                    <div class="details-element"><fmt:message
                            key="artist"/>: <div class="bold-description">${album.artists_sort}</div></div>
                    <div class="details-element"><fmt:message
                            key="title"/>: <div class="bold-description">${album.title}</div></div>
                    <div class="details-element">Id: <div class="bold-description">${album.id}</div></div>
                    <div class="details-element"><fmt:message
                            key="year"/>: <div class="bold-description">${album.year}</div></div>
                    <div class="details-element"><fmt:message
                            key="genres"/>:
                        <c:forEach items="${album.genres}" var="g">
                        <div class="bold-description">${g}</div>
                        </c:forEach>
                    </div>
                    <div class="details-element"><fmt:message
                            key="label"/>:
                        <c:forEach items="${album.labels}" var="l">
                        <div class="bold-description">${l.name}(${l.catno})</div>
                        </c:forEach>
                    </div>
                    <div class="details-element"><a href="<c:url value="${album.uri}" />"><fmt:message
                            key="see.on.discogs"/></a></div>
                </div>
            </div>

        </div>
        <div class="tracks">
            <div class="album-details-title"><fmt:message
                    key="track"/>:</div>
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
              margin-right: 40px;
              margin-bottom: 50px;
              border-top: 1px solid rgba(239,175,0,0.8);
            "
        />
    </div>
</div>

<!-- main content end -->

<!-- main container end -->
</div>
<jsp:include page="footer.jsp"/>