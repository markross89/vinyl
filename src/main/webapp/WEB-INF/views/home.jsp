<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="content.jsp"/>

<!-- main content start -->
<div class="main-home">
    <div class="description-main">
        <div class="main-description">
            <div class="logo-logo">
                <a href="<c:url value="/"/>" class="logo-title">
                    <div><img style="width: 200px; height: 190px; "
                              src="<c:url value="/resources/pictures/logo.png" />"/></div>
                    <div class="title-main">VINYL <br/>COLLECTION</div>
                </a>
            </div>
            <hr
                    style="
              width: 95%;
                margin-top: 50px;
              border-top: 1px solid rgba(239,175,0,0.8);
            "
            />
            <div class="markus-paragraph">
                <h1><fmt:message key="welcome"/>!</h1>
                <p class="text-description"><fmt:message key="message.main"/></p>
            </div>
        </div>


        <div class="element-name"><h3><fmt:message key="fresh.albums"/></h3>

            <div class="content-element">


                <c:forEach items="${thumbs.results}" var="e" begin="1" end="12">
                    <a href="<c:url value="/details/${e.id}"/>" style="text-decoration: none"
                    >
                        <div class="card">
                            <div class="title-pic" title="${e.title}">
                                <div class="card-title">
                                        ${e.title}
                                </div>
                                <div class="cover-pic">
                                    <img src="${e.cover_image}"
                                         style="width: 160px; height: 160px" alt="${e.cover_image}"/>
                                </div>
                            </div>
                            <div class="card-options">

                                <div>
                                    <a href="<c:url value="/save/${e.id}" />" class="option add"
                                       title="Add to albums"><fmt:message key="admin.table.add"/></a>
                                </div>


                            </div>
                        </div>
                    </a>
                </c:forEach>


            </div>

        </div>

        <div class="element-name"><h3><fmt:message key="how.work"/></h3></div>
        <div class="description-album">


            <div class="paragraph">
                <h2><fmt:message key="album.albums"/></h2>
                <p><fmt:message key="album.message"/> </p>
            </div>
            <div class="img-box">
                <img
                        class="img-details"
                        src="<c:url value="/resources/pictures/albums.png" />"
                        alt=""
                ></div>
        </div>

        <div class="description-album">
            <div class="img-box">
                <img
                        class="img-details"
                        src="<c:url value="/resources/pictures/songs.png" />"
                        alt="">
            </div>
            <div class="paragraph">
                <h2><fmt:message key="song.songs"/></h2>
                <p><fmt:message key="songs.message"/> </p>
            </div>

        </div>

        <div class="description-album">

            <div class="paragraph">
                <h2><fmt:message key="playlist.playlists"/></h2>
                <p><fmt:message key="playlist.message"/> </p>
            </div>
            <div class="img-box">
                <img
                        class="img-details"
                        src="<c:url value="/resources/pictures/playlists.png" />"
                        alt=""
                ></div>
        </div>

        <div class="description-album">
            <div class="img-box">
                <img
                        class="img-details"
                        src="<c:url value="/resources/pictures/boxes.png" />"
                        alt=""
                >
            </div>
            <div class="paragraph">
                <h2><fmt:message key="box.boxes"/></h2>
                <p><fmt:message key="box.message"/> </p>
            </div>

        </div>

        <hr
                style="
              width: 95%;
                margin-top: 50px;
              border-top: 1px solid rgba(239,175,0,0.8);
            "
        />



        <div class="contact">

            <h2><fmt:message key="contact.message"/></h2>
            <form class="form--contact" method="get" id="markus-form" action="<c:url value="/send_email"/>" onsubmit="event.preventDefault(); validateMessage();">
                <div ><input id="name-input" class="markus-input" type="text" name="name"
                                                              placeholder="<fmt:message key="first.name"/>"/>


         <input id="surname-input" class="markus-input" type="text" name="surname"
                                                              placeholder="<fmt:message key="last.name"/>"/>

                </div>

                <div ><textarea id="message-input" name="message" class="markus-text"
                                                  placeholder="<fmt:message key="contact.field.message"/>"
                                                  rows="1"></textarea>
                    <div id="message-error" class="error-message"><fmt:message key="message.valid"/></div></div>

                <button class="button-register" type="submit" ><fmt:message key="contact.send"/></button>
            </form>
        </div>
    </div>

</div>

<!-- main content end -->

<!-- main container end -->
</div>
<jsp:include page="footer.jsp"/>
