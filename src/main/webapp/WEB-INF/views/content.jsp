<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<html>
<head>
    <link rel="stylesheet" href="<c:url value="/resources/style.css" />"/>
    <link rel="stylesheet" href="<c:url value="/resources/lightbox.min.css" />"/>

    <title>Vinyl Collection</title>
</head>
<body>
<!-- topbar start -->
<div class="topbar">
    <a href="<c:url value="/"/>" class="logo-title">
        <div>
            <div class="logo"><img src="<c:url value="/resources/pictures/logo.png" />"/></div>
            <div class="title">VINYL <br/>COLLECTION</div>
        </div>
    </a>
    <div>
        <button data-modal-target="#modal-about" class="list-user-button-small">
            <i class="fas fa-fw fa-table"></i>
            <span>About Us</span>
        </button>
    </div>
    <div>
        <button data-modal-target="#modal-contact" class="list-user-button-small">
            <i class="fas fa-fw fa-table"></i>
            <span>Contact</span>
        </button>
    </div>

    <div class="search-box">
        <form class="form" method="get" action="/">
            <input class="search" type="text" placeholder="Search for records" name="search"/>
            <button class="search-button"></button>
        </form>
    </div>

    <div class="custom-select">
        <select id="locales" class="select-box">
            <option value="" disabled selected hidden><fmt:message key="lang.change"/></option>
            <option value="en"><fmt:message key="lang.eng"/></option>
            <option value="pl"><fmt:message key="lang.pl"/></option>
        </select>
    </div>


    <div class="user" style="width: 250px">
        <sec:authorize access="isAnonymous()">
            <div>
                <button class="list-user-button ">
                    <a class="list-user-button" href="/login">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Login</span>
                    </a>

                </button>
            </div>
            <div>
                <button class="list-user-button ">
                    <a class="list-user-button " href="/register">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Register</span></a
                    >
                </button>
            </div>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">

            <button type="button" class="collapsible"><sec:authentication
                    property="principal.username"/></button>
            <div class="content" style="display: none">
                <ul style=" margin: 0;padding: 0; justify-content: right ">
                    <sec:authorize access="hasRole('ADMIN')">
                        <li>
                            <div class="list-element">
                                <a href="<c:url value="/users_index"/>" class="list-link"> Users</a>
                            </div>
                        </li>
                    </sec:authorize>
                    <li>
                        <div class="list-element">
                            <a href="<c:url value="/profile"/>" class="list-link"> My profile</a>
                        </div>
                    </li>

                    <li>
                        <div class="list-element">
                            <form action="<c:url value="/logout"/>" method="post">
                                <input class="input-logout" type="submit" class="list-link" style="margin-left: -3px"
                                       value="Logout" style="margin-right: 20px"/>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                        </div>
                    </li>
                </ul>
            </div>
        </sec:authorize>
    </div>
</div>
<div id="user-overlay"></div>
<sec:authorize access="isAuthenticated()">

<div class="menu">
    <div class="menu inner-menu">
        <div>
            <button class="menu-button">

                <a href="<c:url value="/albums"/>" class="menu-button-link">Albums</a>
            </button>

        </div>
        <div>
            <button class="menu-button">
                <a href="<c:url value="/songs"/>" class="menu-button-link">Songs</a>
            </button>
        </div>
        <div>
            <button class="menu-button add-remove">
                <a href="<c:url value="/playlists"/>" class="menu-button-link">Playlists</a>
            </button>
            <div class="add-remove-content" style="display: none">
                <button data-modal-target="#modal-addPlaylist" class="menu-button-link" title="Add new playlist">
                    <span>Add</span>
                </button>

            </div>
        </div>
        <div>
            <button class="menu-button add-remove">
                <a href="<c:url value="/boxes"/>" class="menu-button-link" style="margin-left: 7px">Boxes</a>
            </button>
            <div class="add-remove-content" style="display: none">
                <button data-modal-target="#modal-addBox" class="menu-button-link" title="Add new box">
                    <span>Add</span>
                </button>
            </div>
        </div>
    </div>
</div>
</sec:authorize>

<!-- topbar end -->

<!-- main container start-->
<div class="sidebar-main-content">


    <!-- pop up window js start -->
    <div class="" id="overlay"></div>


    <!-- contact start -->

    <div class="modal modal-contact" id="modal-contact">
        <div class="modal-header">
            <div class="form-title" style="text-decoration: none">Kontakt</div>
            <button data-close-button class="close-button">&times;</button>
        </div>
        <div class="modal-body">
            <div class="markus-contact">
                <h4>Zadzwoń lub napisz</h4>
                <h4>Vinyl Collection</h4>
                <h4>+48 781 037 897</h4>
                <h4>roszak89@gmail.com</h4>
                <a href="" class="google-link">
                    <button class="google">Gmail</button>
                </a>
                <hr/>
                <div class="markus-social">
                    <a href=""
                    ><img src="<c:url value="/resources/pictures/facebook.png" />" style="width: 30px; height: 30px"
                    /></a>
                    <a href=""
                    ><img src="<c:url value="/resources/pictures/instagram2.png" />" style="width: 30px; height: 30px"
                    /></a>
                    <a href=""
                    ><img src="<c:url value="/resources/pictures/twitter.png" />" style="width: 30px; height: 30px"
                    /></a>
                </div>
            </div>
        </div>
    </div>

    <!-- contact end -->
    <%--    add playlist--%>
    <div class="modal modal-addPlaylist" id="modal-addPlaylist">
        <div class="modal-header">
            <div class="form-title" style="text-decoration: none">New playlist</div>
            <button data-close-button class="close-button">&times;</button>
        </div>
        <div class="modal-body-addPlaylist">
            <img src="<c:url value="resources/pictures/playlist.png" />"
                 style="height: 300px;width: 300px;margin-top: 30px" class="cover" alt="Abbey Road">
            <form class="form-form markus-name-form" action="<c:url value="playlist_save"/>" method="get"
                  id="playlist-form"
                  onsubmit="event.preventDefault(); validatePlaylist();">
                <div class="error-input">
                    <input
                            id="playlistName"
                            class="input"
                            type="text"
                            placeholder="Playlist name"
                            name="name"
                    />
                    <div id="playlistError" class="error-message">Empty field</div>
                </div>
                <div class="form-group form-group--buttons">
                    <button class="button-register" type="submit"><fmt:message key="admin.table.add"/></button>
                </div>
            </form>
        </div>
    </div>

    <%--    add playlist end--%>

    <%--    add box--%>
    <div class="modal modal-addPlaylist" id="modal-addBox">
        <div class="modal-header">
            <div class="form-title" style="text-decoration: none">New box</div>
            <button data-close-button class="close-button">&times;</button>
        </div>
        <div class="modal-body-addPlaylist">
            <img src="<c:url value="resources/pictures/box.png" />"
                 style="height: 300px;width: 300px;margin-top: 30px" class="cover" alt="box">
            <form class="form-form markus-name-form" action="<c:url value="box_save"/>" method="get" id="box-form"
                  onsubmit="event.preventDefault(); validateBox();">
                <div class="error-input">
                    <input
                            id="box-input"
                            class="input input-name"
                            type="text"
                            placeholder="Box name"
                            name="name"
                    />
                    <div id="error-message" class="error-message">Empty field</div>
                </div>


                <div class="form-group form-group--buttons">
                    <button class="button-register" type="submit"><fmt:message key="admin.table.add"/></button>
                </div>


            </form>

        </div>
    </div>
    <%--    add box end--%>

    <%--    add to playlist--%>


    <%--    add to playlist end--%>


    <!-- about us -->

    <div class="modal modal-about" id="modal-about">
        <div class="modal-header">
            <div class="form-title" style="text-decoration: none">O Nas</div>
            <button data-close-button class="close-button">&times;</button>
        </div>
        <div class="modal-body">
            <div class="contact-description">
                <h5>
                    We are proud to offer you <br/>
                    a service that allow you <br/>
                    to catalog your beloved records.<br/>
                    Keep track of your albums, create playlists<br/>
                    and prepare boxes for your events.<br/>
                    As a programmer and vinyl enthusiast<br/>
                    I've decided to develop tool that with <br/>
                    support of new technology will help<br/>
                    you mange your record collection. <br/>
                    Enjoy! Don't hesitate to leave a comment<br/>
                    or contact us. <br/>KEEP IT OLD SCHOOL
                </h5>
                <div class="about-logo">
                    <img src="<c:url value="/resources/pictures/logo.png" />" style="width: 150px; height: 150px"/>
                </div>
            </div>
        </div>
    </div>

    <!-- about us -->

    <!-- pop up window js end -->