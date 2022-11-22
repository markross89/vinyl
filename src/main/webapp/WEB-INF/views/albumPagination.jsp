<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="pagination">
    <div class="pagInfo">results: ${albums.totalElements}</div>
    <div class="pagButtons">
        <c:choose>
            <c:when test="${albums.number==0}">
                <a href="" class="pagButtonDisabled" style="font-size: small; margin-top: 2px"
                   type="button">First</a>
                <a href="" class="pagButtonDisabled" type="button"> << </a>
            </c:when>
            <c:otherwise>
                <a href="<c:url value="albums?page=0&size=${albums.pageable.pageSize}"/>"
                   class="pagButton"
                   style="font-size: small; margin-top: 2px" type="button">First</a>
                <a href="<c:url value="albums?page=${albums.number-1}&size=${albums.pageable.pageSize}"/>"
                   class="pagButton" type="button"> << </a>
            </c:otherwise>
        </c:choose>


        <div class="pageInfo">page ${albums.number+1} of ${albums.totalPages}</div>

        <c:choose>
            <c:when test="${albums.number==albums.totalPages-1}">
                <a href="" class="pagButtonDisabled" type="button"> >> </a>
                <a href="" class="pagButtonDisabled" style="font-size: small; margin-top: 2px" type="button">Last</a>
            </c:when>
            <c:otherwise>
                <a href="<c:url value="albums?page=${albums.number+1}&size=${albums.pageable.pageSize}"/>"
                   class="pagButton" type="button"> >> </a>
                <a href="<c:url value="albums?page=${albums.totalPages-1}&size=${albums.pageable.pageSize}"/>"
                   class="pagButton" style="font-size: small; margin-top: 2px" type="button">Last</a>
            </c:otherwise>
        </c:choose>

    </div>
    <div class="pagSelect">
        <form action="albums" method="get">
            <select class="pagSelect" name="size" onchange="this.form.submit()">
                <option value="" disabled selected hidden>${albums.pageable.pageSize}</option>
                <option value="24">24</option>
                <option value="48">48</option>
                <option value="96">96</option>
            </select>
        </form>
    </div>
</div>