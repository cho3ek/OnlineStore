<jsp:include page="header.jsp" />
<div align="center">
    <form align="right" id="loginForm" style="width: 230px;">
        <strong>Email: </strong><input type="email" name="email" value="">
        <br><br>
        <strong>Password: </strong><input type="password" name="password" value="">
        <a href="#" style="margin-right:14px">Forgot password?</a>
        <br>&nbsp;<br/>
        <input style="margin-right:51px;" type="submit" class="admin-button" value="Submit" onclick="document.location='usersAdminView.jsp';return false;">
    </form>
</div>
<jsp:include page="footer.jsp" />