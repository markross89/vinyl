<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="pagination">
    <div class="pagInfo">results: ${songs.totalElements}</div>
    <div class="pagButtons">
        <c:choose>
            <c:when test="${songs.number==0}">
                <a href="" class="pagButtonDisabled" style="font-size: small; margin-top: 2px"
                   type="button">First</a>
                <a href="" class="pagButtonDisabled" type="button"> << </a>
            </c:when>
            <c:otherwise>
                <a href="<c:url value="songs?page=0&size=${songs.numberOfElements}"/>"
                   class="pagButton"
                   style="font-size: small; margin-top: 2px" type="button">First</a>
                <a href="<c:url value="songs?page=${songs.number-1}&size=${songs.numberOfElements}"/>"
                   class="pagButton" type="button"> << </a>
            </c:otherwise>
        </c:choose>


        <div class="pageInfo">page ${songs.number+1} of ${songs.totalPages}</div>

        <c:choose>
            <c:when test="${songs.number==songs.totalPages-1}">
                <a href="" class="pagButtonDisabled" type="button"> >> </a>
                <a href="" class="pagButtonDisabled" style="font-size: small; margin-top: 2px" type="button">Last</a>
            </c:when>
            <c:otherwise>
                <a href="<c:url value="songs?page=${songs.number+1}&size=${songs.numberOfElements}"/>"
                   class="pagButton" type="button"> >> </a>
                <a href="<c:url value="songs?page=${songs.totalPages-1}&size=${songs.numberOfElements}"/>"
                   class="pagButton" style="font-size: small; margin-top: 2px" type="button">Last</a>
            </c:otherwise>
        </c:choose>

    </div>
    <div class="pagSelect">
        <form action="songs" method="get">
            <select class="pagSelect" name="size" onchange="this.form.submit()">
                <option value="" disabled selected hidden>${songs.numberOfElements}</option>
                <option value="24">24</option>
                <option value="48">48</option>
                <option value="96">96</option>
            </select>
        </form>
    </div>
</div>
