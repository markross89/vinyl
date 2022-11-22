<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="pagination">
    <div class="pagInfo">results: ${boxes.totalElements}</div>
    <div class="pagButtons">
        <c:choose>
            <c:when test="${boxes.number==0}">
                <a href="" class="pagButtonDisabled" style="font-size: small; margin-top: 2px"
                   type="button">First</a>
                <a href="" class="pagButtonDisabled" type="button"> << </a>
            </c:when>
            <c:otherwise>
                <a href="<c:url value="boxes?page=0&size=${boxes.pageable.pageSize}"/>"
                   class="pagButton"
                   style="font-size: small; margin-top: 2px" type="button">First</a>
                <a href="<c:url value="boxes?page=${boxes.number-1}&size=${boxes.pageable.pageSize}"/>"
                   class="pagButton" type="button"> << </a>
            </c:otherwise>
        </c:choose>


        <div class="pageInfo">page ${boxes.number+1} of ${boxes.totalPages+1}</div>

        <c:choose>
            <c:when test="${boxes.number==boxes.totalPages-1}">
                <a href="" class="pagButtonDisabled" type="button"> >> </a>
                <a href="" class="pagButtonDisabled" style="font-size: small; margin-top: 2px" type="button">Last</a>
            </c:when>
            <c:otherwise>
                <a href="<c:url value="boxes?page=${boxes.number+1}&size=${boxes.pageable.pageSize}"/>"
                   class="pagButton" type="button"> >> </a>
                <a href="<c:url value="boxes?page=${boxes.totalPages-1}&size=${boxes.pageable.pageSize}"/>"
                   class="pagButton" style="font-size: small; margin-top: 2px" type="button">Last</a>
            </c:otherwise>
        </c:choose>

    </div>
    <div class="pagSelect">
        <form method="get">
            <select class="pagSelect" name="size" onchange="this.form.submit()">
                <option value="" disabled selected hidden>${boxes.pageable.pageSize}</option>
                <option value="24">24</option>
                <option value="48">48</option>
                <option value="96">96</option>
            </select>
        </form>
    </div>
</div>