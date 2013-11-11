<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>			
<%@page import="entities.User"%>	
<%@ page import="java.util.*" %>
<jsp:useBean id="user" scope="request" class="entities.User" />


<jsp:include page="header.jsp" />


<%if(request.getAttribute("message") != null && request.getAttribute("message").equals("wrongData")){%>
	<p style="text-align:center;color:red;font-size:16px;">Wrong data! Try again!</p>
<%} %>
<%if(request.getParameter("log") != null){%>
	<p style="text-align:center;color:green;font-size:16px;">You have been logged out!</p>
<%} %>


<%
try{
	if(session.getAttribute("logged").toString().equals("yes")) { %>
	<p style="text-align:left;font-size:18px;">
	<% user = (User)request.getSession().getAttribute("user");%>
	
	<table>
	<tr><td><h3>Hello <%=user.getName() %> <%=user.getSurname() %>!</h3></td>
	<td>
	<form action="login" method="get" style="margin-left:30px;">
	<input type="hidden" name="logout" value="logout"/>
	<input type="submit" value="Logout" class="admin-button" />
	</form></td></tr></table>
	
	
	<br/>&nbsp;<br/>
	<u>Your private data:</u>
	<table>
	<tr><td style="width:150px;"><b>Email:</b></td><td><%=user.getEmail() %></td></tr>
	<tr><td><b>Password:</b></td> <td>********<br/></td></tr>
	<tr><td><b>Phone number:</b></td> <td><%=user.getPhone() %></td></tr>
	<tr><td><b>Address:</b></td> <td><%=user.getAddress() %><br/></td></tr>
	</table>
	
	<br/>&nbsp;<br/>
	<u>Your list of favourites products:</u>
	</p>

<% 	} 
}
  catch(Exception e){}%>


<%if(user.getName() == null){%>
<div align="center">
    <form method="post" action="login" id="loginForm" style="width: 230px;">
        <table>
        <tr><td style="text-align:right;"><strong>Email: </strong></td><td><input type="text" name="mail" value=""></td></tr>
        <tr><td style="text-align:right;"><strong>Password: </strong></td><td><input type="password" name="password" value=""></td></tr>
        <tr><td> </td><td><br/>
        <input style="margin-right:51px;" type="submit" class="admin-button" value="Log in"></td></tr></table>
        <!--  <a href="#" style="margin-right:14px">Forgot password?</a>-->
    </form>
</div>
<%} %>


<jsp:include page="footer.jsp" />