<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>			
<%@page import="entities.User"%>	
<%@ page import="java.util.*" %>
<jsp:useBean id="user" scope="request" class="entities.User" />


<jsp:include page="header.jsp" />



<!-- DISPLAY MESSAGES -->
<%if(request.getAttribute("message") != null && request.getAttribute("message").equals("wrongData")){%>
	<p style="text-align:center;color:red;font-size:16px;">Wrong data! Try again!</p>
<%} %>
<%if(request.getParameter("action") != null){
	if(request.getParameter("action").equals("loggedout")){%>
	<p style="text-align:center;color:green;font-size:16px;">You have been logged out!</p>
<%} }%>

<%if(request.getParameter("action") != null){
	if(request.getParameter("action").equals("newUser")){ %>
	<p style="text-align:center;color:green;font-size:16px;">Thank you! Your account has been created, please log in now!</p>

<%}} %>



<!-- IF WE ARE LOGGED IN (ATTRIBUTE LOGGED IN SESSION) DISPLAY ALL THE USER DATA -->
<%try{
	if(session.getAttribute("logged").toString().equals("yes")) { %>
	<p style="text-align:left;font-size:18px;">
	<% user = (User)session.getAttribute("user");%>
	<%if(request.getParameter("action") != null){
		if(request.getParameter("action").equals("save")){%>
		<p style="color:green;font-size:16px;">Your new data has been saved!</p>
	<%} }%>


	<table>
	<tr><td><h3>Hello <%=user.getName() %> <%=user.getSurname() %>!</h3></td>
	
	<td><form action="login" method="get" style="margin-left:30px;">
	<input type="hidden" name="action" value="edit"/>
	<input type="submit" value="Edit my data" class="admin-button" />
	</form></td><td>
	<form action="login" method="get" style="margin-left:30px;">
	<input type="hidden" name="action" value="logout"/>
	<input type="submit" value="Logout" class="admin-button" />
	</form></td></tr></table>
	<br/>&nbsp;<br/>
	
	<u>Your private data:</u><br/>&nbsp;<br/>
	<table>
	<tr><td style="width:150px;"><b>Name:</b></td><td><%=user.getName() %></td></tr>
	<tr><td><b>Surname:</b></td><td><%=user.getSurname() %></td></tr>
	<tr><td><b>Email:</b></td><td><%=user.getEmail() %></td></tr>
	<tr><td><b>Password:</b></td> <td>********<br/></td></tr>
	<tr><td><b>Phone number:</b></td> <td><%=user.getPhone() %></td></tr>
	<tr><td><b>Address:</b></td> <td><%=user.getAddress() %><br/></td></tr>
	</table>
	
	<br/>&nbsp;<br/>
	<u>Your list of favourites products:</u>
	</p>
<% 	}}catch(Exception e){}%>




<!-- IF WE DON'T HAVE AN USER, DISPLAY LOGIN FORM -->
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