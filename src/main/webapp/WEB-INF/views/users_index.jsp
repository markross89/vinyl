<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="content.jsp"/>

<!-- main content start -->
<div class="main-content">
    <div class="content-content">
        <div class="content-title"><fmt:message key="user.users"/> :</div>



        <hr

        />
        <div class="content-elements">


            <div class="card-body">

                <table class="table " id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>No</th>
                        <th>id</th>
                        <th><fmt:message key="first.name"/></th>
                        <th><fmt:message key="last.name"/></th>
                        <th><fmt:message key="username.email"/></th>
                        <th><fmt:message key="enabled"/></th>
                        <th><fmt:message key="role"/></th>
                        <th><fmt:message key="options"/></th>
                    </tr>
                    </thead>
                    <tbody>


                    <c:forEach items="${users}" var="u" varStatus="status">

                        <c:set var="counter" value="${counter + 1}" scope="request"/>
                        <tr>

                            <td>${counter}</td>
                            <td>${u.id}</td>
                            <td>${u.firstName}</td>
                            <td>${u.lastName}</td>
                            <td>${u.username}</td>
                            <td>${u.enabled}</td>
                            <td style="font-size: small"><c:forEach items="${u.roles}" var="r">
                                    ${r.name} &nbsp &nbsp
                                </c:forEach></td>
                            <td><a href="<c:url value="/edit_credentials/${u.id}" />" style="color: orange"><fmt:message key="admin.table.edit"/></a><td>

                        </tr>

                    </c:forEach>
                    </tbody>
                </table>

            </div>


        </div>
        <hr

        />

    </div>
</div>

<!-- main content end -->

<!-- main container end -->
</div>
<jsp:include page="footer.jsp"/>
