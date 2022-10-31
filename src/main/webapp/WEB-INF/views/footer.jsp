<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- footer start -->
<footer class="footer">
    <p><span>Copyright &copy; Vinyl Collection 2022</span></p>
</footer>
<!-- footer end -->
<script defer src="<c:url value="/resources/script.js" />"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#locales").change(function () {
            var selectedOption = $('#locales').val();
            if (selectedOption !==''){
                window.location.replace('?lang=' + selectedOption);
            }
        });
    });
</script>
</body>
</html>