<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <link rel="stylesheet" href="<c:url value="/resources/style.css" />" />
    <title>Vinyl Collection</title>
  </head>
  <body>
    <!-- topbar start -->
    <div class="topbar">
      <a href="" class="logo-title">
        <div>
          <div class="logo"><img src="<c:url value="/resources/pictures/logo.png" />" /></div>
          <div class="title">VINYL <br />COLLECTION</div>
        </div>
      </a>

      <div class="search-box">
        <form class="form">
          <input class="search" type="text" placeholder="Search for records" />
          <button class="search-button"></button>
        </form>
      </div>
      <div class="user">
        <button type="button" class="collapsible">Username</button>
        <div class="content" style="display: none">
          <ul>
            <li><a href="" class="list-user">option 1</a></li>
            <li><a href="" class="list-user">option 2</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div id="user-overlay"></div>

    <!-- topbar end -->

    <!-- main container start-->
    <div class="sidebar-main-content">
      <!-- sidebar start -->
      <div class="sidebar">
        <div class="sidebar-menu">
          <div style="margin-left: 50px; font-size: small">Menu</div>

          <ul>
            <hr style="margin-top: 2px" />
            <li class="nav-item">
              <a class="nav-link" href="">
                <i class="fas fa-fw fa-table"></i>
                <span>Albums</span></a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" href="">
                <i class="fas fa-fw fa-table"></i>
                <span>Songs</span></a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" href="">
                <i class="fas fa-fw fa-table"></i>
                <span>Tracklists</span></a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" href="">
                <i class="fas fa-fw fa-table"></i>
                <span>boxes</span></a
              >
            </li>

            <hr />

            <li class="nav-item">
              <button data-modal-target="#modal-about" class="sidebar-link">
                <i class="fas fa-fw fa-table"></i>
                <span>About Us</span>
              </button>
            </li>
            <li class="nav-item">
              <button data-modal-target="#modal-contact" class="sidebar-link">
                <i class="fas fa-fw fa-table"></i>
                <span>Contact</span>
              </button>
            </li>
            <li class="nav-item">
              <button data-modal-target="#modal-login" class="sidebar-link">
                <i class="fas fa-fw fa-table"></i>
                <span>Login</span>
              </button>
            </li>
            <li class="nav-item">
              <button data-modal-target="#modal" class="sidebar-link">
                <i class="fas fa-fw fa-table"></i>
                <span>Register</span>
              </button>
            </li>
          </ul>
        </div>
      </div>
      <!-- sidebar end -->

      <!-- pop up window js start -->

      <div class="active" id="overlay"></div>

      <!-- login start -->

      <div class="modal modal-login active" id="modal-login">
        <div class="modal-header">
          <div class="form-title" style="text-decoration: none">Logowanie</div>
          <button data-close-button class="close-button">&times;</button>
        </div>
        <div class="modal-body">
          <div class="form-login">
            <form class="form-form">
              <input
                class="input"
                type="email"
                id="username"
                placeholder="Email"
                name="username"
              />
              <input
                class="input"
                type="password"
                id="password"
                placeholder="Password"
                name="password"
              />
              <button class="button-register" type="submit">Zaloguj</button>
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
            <hr />
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
              We are proud to offer you <br />
              a service that allow you <br />
              to catalog your beloved records.<br />
              Keep track of your albums, create playlists<br />
              and prepare boxes for your events.<br />
              As a programmer and vinyl enthusiast<br />
              I've decided to develop tool that with <br />
              support of new technology will help<br />
              you mange your record collection. <br />
              Enjoy! Don't hesitate to leave a comment<br />
              or contact us. <br />KEEP IT OLD SCHOOL
            </h5>
            <div class="about-logo">
              <img src="<c:url value="/resources/pictures/logo.png" />" style="width: 150px; height: 150px" />
            </div>
          </div>
        </div>
      </div>

      <!-- about us -->

      <!-- pop up window js end -->

      <!-- main content start -->
      <div class="main-content">
        <div class="content-content">
          <div class="content-title">Najnowsze Albumy :</div>
          <hr
            style="
              width: 95%;
              margin-right: 50px;
              border-top: 1px solid rgb(216, 216, 216);
            "
          />
          <div class="content-elements">
            <a href="" style="text-decoration: none"
              ><div class="card">
                <div class="title-pic">
                  <div class="card-title">
                    <p>jgfjhgkjgkjb</p>
                  </div>
                  <div class="cover-pic">
                    <img src="<c:url value="/resources/pictures/vinyl2.png" />" style="width: 160px; height: 160px" />
                  </div>
                </div>
                <div class="card-options">
                  <div>
                    <a href="" class="option add">Add</a>
                  </div>
                  <div>
                    <a href="" class="option delete">Delete</a>
                  </div>
                </div>
              </div>
            </a>
            <a href="" style="text-decoration: none"
              ><div class="card">
                <div class="title-pic">
                  <div class="card-title">
                    <p>jgfjhgkjgkjb</p>
                  </div>
                  <div class="cover-pic">
                    <img src="<c:url value="/resources/pictures/vinyl2.png" />" style="width: 160px; height: 160px" />
                  </div>
                </div>
                <div class="card-options">
                  <div>
                    <a href="" class="option add">Add</a>
                  </div>
                  <div>
                    <a href="" class="option delete">Delete</a>
                  </div>
                </div>
              </div>
            </a>

            <a href="" style="text-decoration: none"
              ><div class="card">
                <div class="title-pic">
                  <div class="card-title">
                    <p>jgfjhgkjgkjb</p>
                  </div>
                  <div class="cover-pic">
                    <img src="<c:url value="/resources/pictures/vinyl2.png" />" style="width: 160px; height: 160px" />
                  </div>
                </div>
                <div class="card-options">
                  <div>
                    <a href="" class="option add">Add</a>
                  </div>
                  <div>
                    <a href="" class="option delete">Delete</a>
                  </div>
                </div>
              </div>
            </a>
            <a href="" style="text-decoration: none"
              ><div class="card">
                <div class="title-pic">
                  <div class="card-title">
                    <p>jgfjhgkjgkjb</p>
                  </div>
                  <div class="cover-pic">
                    <img src="<c:url value="/resources/pictures/vinyl2.png" />" style="width: 160px; height: 160px" />
                  </div>
                </div>
                <div class="card-options">
                  <div>
                    <a href="" class="option add">Add</a>
                  </div>
                  <div>
                    <a href="" class="option delete">Delete</a>
                  </div>
                </div>
              </div>
            </a>
            <a href="" style="text-decoration: none"
              ><div class="card">
                <div class="title-pic">
                  <div class="card-title">
                    <p>jgfjhgkjgkjb</p>
                  </div>
                  <div class="cover-pic">
                    <img src="<c:url value="/resources/pictures/vinyl2.png" />" style="width: 160px; height: 160px" />
                  </div>
                </div>
                <div class="card-options">
                  <div>
                    <a href="" class="option add">Add</a>
                  </div>
                  <div>
                    <a href="" class="option delete">Delete</a>
                  </div>
                </div>
              </div>
            </a>
            <a href="" style="text-decoration: none"
              ><div class="card">
                <div class="title-pic">
                  <div class="card-title">
                    <p>jgfjhgkjgkjb</p>
                  </div>
                  <div class="cover-pic">
                    <img src="<c:url value="/resources/pictures/vinyl2.png" />" style="width: 160px; height: 160px" />
                  </div>
                </div>
                <div class="card-options">
                  <div>
                    <a href="" class="option add">Add</a>
                  </div>
                  <div>
                    <a href="" class="option delete">Delete</a>
                  </div>
                </div>
              </div>
            </a>
            <a href="" style="text-decoration: none"
              ><div class="card">
                <div class="title-pic">
                  <div class="card-title">
                    <p>jgfjhgkjgkjb</p>
                  </div>
                  <div class="cover-pic">
                    <img src="<c:url value="/resources/pictures/vinyl2.png" />" style="width: 160px; height: 160px" />
                  </div>
                </div>
                <div class="card-options">
                  <div>
                    <a href="" class="option add">Add</a>
                  </div>
                  <div>
                    <a href="" class="option delete">Delete</a>
                  </div>
                </div>
              </div>
            </a>
            <a href="" style="text-decoration: none"
              ><div class="card">
                <div class="title-pic">
                  <div class="card-title">
                    <p>jgfjhgkjgkjb</p>
                  </div>
                  <div class="cover-pic">
                    <img src="<c:url value="/resources/pictures/vinyl2.png" />" style="width: 160px; height: 160px" />
                  </div>
                </div>
                <div class="card-options">
                  <div>
                    <a href="" class="option add">Add</a>
                  </div>
                  <div>
                    <a href="" class="option delete">Delete</a>
                  </div>
                </div>
              </div>
            </a>
            <a href="" style="text-decoration: none"
              ><div class="card">
                <div class="title-pic">
                  <div class="card-title">
                    <p>jgfjhgkjgkjb</p>
                  </div>
                  <div class="cover-pic">
                    <img src="<c:url value="/resources/pictures/vinyl2.png" />" style="width: 160px; height: 160px" />
                  </div>
                </div>
                <div class="card-options">
                  <div>
                    <a href="" class="option add">Add</a>
                  </div>
                  <div>
                    <a href="" class="option delete">Delete</a>
                  </div>
                </div>
              </div>
            </a>
            <a href="" style="text-decoration: none"
              ><div class="card">
                <div class="title-pic">
                  <div class="card-title">
                    <p>jgfjhgkjgkjb</p>
                  </div>
                  <div class="cover-pic">
                    <img src="<c:url value="/resources/pictures/vinyl2.png" />" style="width: 160px; height: 160px" />
                  </div>
                </div>
                <div class="card-options">
                  <div>
                    <a href="" class="option add">Add</a>
                  </div>
                  <div>
                    <a href="" class="option delete">Delete</a>
                  </div>
                </div>
              </div>
            </a>

            <a href="" style="text-decoration: none"
              ><div class="card">
                <div class="title-pic">
                  <div class="card-title">
                    <p>jgfjhgkjgkjb</p>
                  </div>
                  <div class="cover-pic">
                    <img src="<c:url value="/resources/pictures/vinyl2.png" />" style="width: 160px; height: 160px" />
                  </div>
                </div>
                <div class="card-options">
                  <div>
                    <a href="" class="option add">Add</a>
                  </div>
                  <div>
                    <a href="" class="option delete">Delete</a>
                  </div>
                </div>
              </div>
            </a>
            <a href="" style="text-decoration: none"
              ><div class="card">
                <div class="title-pic">
                  <div class="card-title">
                    <p>jgfjhgkjgkjb</p>
                  </div>
                  <div class="cover-pic">
                    <img src="<c:url value="/resources/pictures/vinyl2.png" />" style="width: 160px; height: 160px" />
                  </div>
                </div>
                <div class="card-options">
                  <div>
                    <a href="" class="option add">Add</a>
                  </div>
                  <div>
                    <a href="" class="option delete">Delete</a>
                  </div>
                </div>
              </div>
            </a>
            <a href="" style="text-decoration: none"
              ><div class="card">
                <div class="title-pic">
                  <div class="card-title">
                    <p>jgfjhgkjgkjb</p>
                  </div>
                  <div class="cover-pic">
                    <img src="<c:url value="/resources/pictures/vinyl2.png" />" style="width: 160px; height: 160px" />
                  </div>
                </div>
                <div class="card-options">
                  <div>
                    <a href="" class="option add">Add</a>
                  </div>
                  <div>
                    <a href="" class="option delete">Delete</a>
                  </div>
                </div>
              </div>
            </a>
            <a href="" style="text-decoration: none"
              ><div class="card">
                <div class="title-pic">
                  <div class="card-title">
                    <p>jgfjhgkjgkjb</p>
                  </div>
                  <div class="cover-pic">
                    <img src="<c:url value="/resources/pictures/vinyl2.png" />" style="width: 160px; height: 160px" />
                  </div>
                </div>
                <div class="card-options">
                  <div>
                    <a href="" class="option add">Add</a>
                  </div>
                  <div>
                    <a href="" class="option delete">Delete</a>
                  </div>
                </div>
              </div>
            </a>
            <a href="" style="text-decoration: none"
              ><div class="card">
                <div class="title-pic">
                  <div class="card-title">
                    <p>jgfjhgkjgkjb</p>
                  </div>
                  <div class="cover-pic">
                    <img src="<c:url value="/resources/pictures/vinyl2.png" />" style="width: 160px; height: 160px" />
                  </div>
                </div>
                <div class="card-options">
                  <div>
                    <a href="" class="option add">Add</a>
                  </div>
                  <div>
                    <a href="" class="option delete">Delete</a>
                  </div>
                </div>
              </div>
            </a>
            <a href="" style="text-decoration: none"
              ><div class="card">
                <div class="title-pic">
                  <div class="card-title">
                    <p>jgfjhgkjgkjb</p>
                  </div>
                  <div class="cover-pic">
                    <img src="<c:url value="/resources/pictures/vinyl2.png" />" style="width: 160px; height: 160px" />
                  </div>
                </div>
                <div class="card-options">
                  <div>
                    <a href="" class="option add">Add</a>
                  </div>
                  <div>
                    <a href="" class="option delete">Delete</a>
                  </div>
                </div>
              </div>
            </a>
          </div>
          <hr
            style="
              width: 95%;
              margin-right: 50px;
              border-top: 1px solid rgb(216, 216, 216);
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
