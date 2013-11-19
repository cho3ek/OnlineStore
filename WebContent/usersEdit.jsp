<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>					
<%@page import="entities.User"%>			
<%@ page import="java.util.*" %>
<jsp:useBean id="user"  scope="request" class="entities.User" />


<jsp:include page="header.jsp" />






<!-- IF WE ARE LOGGED IN AS ADMIN -->
<%try{
	if(session.getAttribute("loggedAdmin").toString().equals("yes")) { %>
	<p style="text-align:left;font-size:18px;">
	<% user = (User)session.getAttribute("user");%>
	<table>
	<tr><td><h3>Hello <%=user.getName() %> <%=user.getSurname() %>!</h3></td>
	<td><form action="login" method="get" style="margin-left:30px;">
	<input type="submit" value="Go back to your account" class="admin-button" />
	</form></td>
	<td>
	<form action="login" method="get" style="margin-left:30px;">
	<input type="hidden" name="action" value="logout"/>
	<input type="submit" value="Logout" class="admin-button" />
	</form></td></tr></table>
	
	
	<!--  WE SHOW THE TABLE WITH ALL USERS  -->

<br/>&nbsp;<br/>


<h4>You can only delete selected users.<br/>
You cannot modify their data.</h4><br/>&nbsp;<br/>
<table class="categories">
<tr style="background-color:#dadada;"><td>
<b>EMAIL ADDRESS</b>
</td><td>
<b>NAME AND SURNAME</b>
</td><td>
<b>PHONE NUMBER AND ADDRESS</b>
</td><td></td></tr>
<% Object us = request.getAttribute("users");
						for(Object current: (List)us){
							user = (User)current;%>
								
						
							<tr style="height:80px;"><td style="width:270px;vertical-align:middle;"><%=user.getEmail() %></td>
							<td style="width:270px;vertical-align:middle;">
							<h3 style="color:#777;font-size:15px;padding-left: 20px;">
								<%=user.getName() %> <%=user.getSurname()%></b>
							</h3></td><td style="vertical-align:middle;width:500px;"><%=user.getPhone() %><br/><%=user.getAddress() %></td>
							
							
							<td style="vertical-align:middle;">
							<form action="login" method="get">
							<input type="hidden" name="action" value="userDelete" />	
							<input type="hidden" name="id" value="<%=user.getIdUser()%>" />	
							<input type="submit" value="Delete" class="admin-button" style="padding: 9px;line-height: 10px;height: auto;"/>
							</form>
							</td></tr>
						
		<%} %>	
</table>





    
	</p>
<% }	}catch(Exception e){}%>


<jsp:include page="footer.jsp" />