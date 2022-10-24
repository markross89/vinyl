<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="<c:url value="/resources/style.css" />"/>
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
        <form class="form">
            <input class="search" type="text" placeholder="Search for records"/>
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
                <button data-modal-target="#modal-login" class="list-user-button">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Login</span>
                </button>
            </div>
            <div>
                <button data-modal-target="#modal" class="list-user-button">
                    <a class="list-user-button" href="/register">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Register</span></a
                    >
                </button>
            </div>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">

            <button type="button" class="collapsible" ><sec:authentication
                    property="principal.username"/></button>
            <div class="content" style="display: none">
                <ul>

                    <li>
                        <div>
                            <form action="<c:url value="/logout"/>" method="post">
                                <button class="list-user-button" type="submit">
                                    <span>Logout</span>
                                </button>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                        </div>
                    </li>


                    </a></li>
                    <sec:authorize access="hasRole('ADMIN')">
                        <li><a class="list-user" href=""> <span>Users</span></a></li>
                    </sec:authorize>

                </ul>
            </div>
        </sec:authorize>
    </div>
</div>
<div id="user-overlay"></div>
<sec:authorize access="isAuthenticated()">

    <div class="menu">
        <div class="menu inner-menu">
            <div >
                <button class="menu-button">
                    <a href="" class="menu-button-link">Albums</a>
                </button>
            </div>
            <div >
                <button class="menu-button">
                    <a href="" class="menu-button-link">Songs</a>
                </button>
            </div>
            <div >
                <button class="menu-button">
                    <a href="" class="menu-button-link">Track Lists</a>
                </button>
            </div>
            <div >
                <button class="menu-button">
                    <a href="" class="menu-button-link">Boxes</a>
                </button>
            </div>
        </div>
    </div>
</sec:authorize>

<!-- topbar end -->

<!-- main container start-->
<div class="sidebar-main-content">


    <!-- pop up window js start -->
    <div class="" id="overlay"></div>


    <!-- login start -->

    <div class="modal modal-login" id="modal-login">
        <div class="modal-header">
            <div class="form-title" style="text-decoration: none">Logowanie</div>
            <button data-close-button class="close-button">&times;</button>
        </div>
        <div class="modal-body">
            <div class="form-login">
                <form class="form-form" action="/login" method="post">
                    <input
                            class="input-login"
                            type="email"
                            placeholder="Email"
                            name="username"
                    />
                    <input
                            class="input-login"
                            type="password"
                            placeholder="Password"
                            name="password"
                    />
                    <button class="button-register button-login" type="submit">Zaloguj</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                </form>
            </div>
        </div>
    </div>

    <!-- login end -->

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

    <!-- main content start -->
    <div class="main-content">
        <div class="content-content">
            <div class="content-title">Rejestracja:</div>
            <hr
                    style="
              width: 95%;
              margin-right: 50px;
              border-top: 1px solid rgba(255,0,0,0.68);

            "
            />
            <div class="register-box">

                <form:form class="form-form" modelAttribute="user" method="post">
                    <div class="error-input">
                        <spring:message code="placeholder.name" var="namePlaceholder"/>
                        <form:input class="input" path="firstName"
                                    placeholder="${namePlaceholder}"/>

                        <form:errors path="firstName" Class="markus-error"/>
                    </div>
                    <div class="error-input">
                        <spring:message code="placeholder.surname" var="lastNamePlaceholder"/>
                        <form:input path="lastName"
                                    class="input" placeholder="${lastNamePlaceholder}"/>

                        <form:errors path="lastName" Class="markus-error"/>
                    </div>
                    <div class="error-input">
                        <spring:message code="placeholder.email" var="emailPlaceholder"/>
                        <form:input path="username"
                                    class="input" placeholder="${emailPlaceholder}"/>

                        <form:errors path="username" Class="markus-error"/>
                    </div>
                    <div class="error-input">
                        <spring:message code="placeholder.password" var="passwordPlaceholder"/>
                        <form:password path="password"
                                       class="input" placeholder="${passwordPlaceholder}"/>

                        <form:errors path="password" Class="markus-error"/>
                    </div>
                    <div class="error-input">
                        <spring:message code="placeholder.password.repeat" var="passwordRepeatPlaceholder"/>
                        <form:password path="passwordRepeat"
                                       class="input"
                                       placeholder="${passwordRepeatPlaceholder}"/>

                        <form:errors path="passwordRepeat" Class="markus-error"/>
                    </div>

                    <div class="form-group form-group--buttons">
                        <button class="button-register" type="submit"><fmt:message key="users.add"/></button>
                    </div>

                </form:form>
                <img src="/resources/pictures/abbeyroad.jpg" class="cover" alt="Abbey Road">
            </div>
            <hr
                    style="
              width: 95%;
              margin-right: 50px;
               border-top: 1px solid rgba(255,0,0,0.68);
            "
            />
        </div>
    </div>
    <!-- main content end -->

    <!-- main container end -->
</div>
<!-- footer start -->
<footer class="footer">
    <p><span>Copyright &copy; Vinyl Collection 2022</span></p>
</footer>
<!-- footer end -->
<script defer src="<c:url value="/resources/script.js" />"></script>
</body>
</html>
