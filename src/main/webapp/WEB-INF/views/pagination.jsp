<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="pagination">
    <div class="pagInfo"><fmt:message key="results"/>: ${thumbs.pagination.items}</div>
    <div class="pagButtons">
        <c:choose>
            <c:when test="${thumbs.pagination.page==1}">
                <a href="" class="pagButtonDisabled" style="font-size: small; margin-top: 2px"
                   type="button"><fmt:message key="first"/></a>
                <a href="" class="pagButtonDisabled" type="button"> << </a>
            </c:when>
            <c:otherwise>
                <a href="<c:url value="/?page=1&size=${thumbs.pagination.per_page}&search=${search}"/>"
                   class="pagButton"
                   style="font-size: small; margin-top: 2px" type="button"><fmt:message key="first"/></a>
                <a href="<c:url value="/?page=${thumbs.pagination.page-1}&size=${thumbs.pagination.per_page}&search=${search}"/>"
                   class="pagButton" type="button"> << </a>
            </c:otherwise>
        </c:choose>


        <div class="pageInfo"><fmt:message key="page"/> ${thumbs.pagination.page} <fmt:message key="of"/> ${thumbs.pagination.pages}</div>

        <c:choose>
            <c:when test="${thumbs.pagination.page==thumbs.pagination.pages}">
                <a href="" class="pagButtonDisabled" type="button"> >> </a>
                <a href="" class="pagButtonDisabled" style="font-size: small; margin-top: 2px" type="button"><fmt:message key="last"/></a>
            </c:when>
            <c:otherwise>
                <a href="<c:url value="/?page=${thumbs.pagination.page+1}&size=${thumbs.pagination.per_page}&search=${search}"/>"
                   class="pagButton" type="button"> >> </a>
                <a href="<c:url value="/?page=${thumbs.pagination.pages}&size=${thumbs.pagination.per_page}&search=${search}"/>"
                   class="pagButton" style="font-size: small; margin-top: 2px" type="button"><fmt:message key="last"/></a>
            </c:otherwise>
        </c:choose>

    </div>
    <div class="pagSelect">
        <form action="/" method="get">
            <select class="pagSelect" name="size" onchange="this.form.submit()">
                <option value="" disabled selected hidden>${thumbs.pagination.per_page}</option>
                <option value="24">24</option>
                <option value="48">48</option>
                <option value="96">96</option>
            </select>
            <input type="hidden" name="search" value="${search}">
        </form>
    </div>
</div>