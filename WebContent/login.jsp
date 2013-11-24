<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>			
<%@page import="entities.User"%>	
<%@page import="entities.Favourite"%>	
<%@ page import="java.util.*" %>
<jsp:useBean id="favourite" scope="request" class="entities.Favourite" />
<jsp:useBean id="user" scope="request" class="entities.User" />


<jsp:include page="header.jsp" />



<!-- DISPLAY MESSAGES AT THE TOP FOR NOT LOGGED IN USERS -->
<%if(request.getAttribute("message") != null && request.getAttribute("message").equals("wrongData")){%>
	<p style="text-align:center;color:red;font-size:16px;">Wrong data! Try again!</p>
<%} %>
<%if(request.getAttribute("message") != null && request.getAttribute("message").equals("notLoggedToSeeCart")){%>
	<p style="text-align:center;color:green;font-size:16px;">You must be logged in to see your cart and add products there!<br/>
	If you don't have an account, please <a href="/OnlineStore/registration">register</a></p>
<%} %>
<%if(request.getParameter("action") != null){
	if(request.getParameter("action").equals("loggedout")){%>
	<p style="text-align:center;color:green;font-size:16px;">You have been logged out!</p>
<%} }%>

<%if(request.getParameter("action") != null){
	 if(request.getParameter("action").equals("newUser")){ 
		if(request.getAttribute("message") != null && !request.getAttribute("message").equals("duplicatedEmail")){ %>
			<p style="text-align:center;color:green;font-size:16px;">Thank you! Your account has been created, please log in now!</p>
		<%} else {%>
				<p style="text-align:center;color:red;font-size:16px;">Sorry!<br/><b>Your account WASN'T created</b><br/>This email already exists in database!</p>	
<%}}} %>



<!-- IF WE ARE LOGGED IN (ATTRIBUTE LOGGED IN SESSION) DISPLAY ALL THE USER DATA -->


<!-- FIRST AT THE TOP MESSAGES ABOUT EDITING ACTIONS FOR LOGGED IN USERS -->
<%try{
	if(session.getAttribute("logged").toString().equals("yes")) { %>
	<p style="text-align:left;font-size:18px;">
	<% user = (User)session.getAttribute("user");%>
	<%if(request.getParameter("action") != null){
		if(request.getParameter("action").equals("save")){%>
		<p style="color:green;font-size:16px;background-color: #f1f1f1;padding: 20px;">
			<img src="images/ok.png" style="float:left;padding-right: 20px;width: 25px;">
			<b>Your new data has been saved!</b>
		</p>
	<%} }%>
	<%if(request.getParameter("action") != null){
		if(request.getParameter("action").equals("productAdd")){%>
		<p style="color:green;font-size:16px;background-color: #f1f1f1;padding: 20px;">
			<img src="images/ok.png" style="float:left;padding-right: 20px;width: 25px;">
			<b>Product has been added!</b>
		</p>
	<%} }%>
	<%if(request.getParameter("action") != null){
		if(request.getParameter("action").equals("saveProduct")){%>
		<p style="color:green;font-size:16px;background-color: #f1f1f1;padding: 20px;">
			<img src="images/ok.png" style="float:left;padding-right: 20px;width: 25px;">
			<b>Product has been changed!</b>
		</p>
	<%} }%>
	<%if(request.getParameter("action") != null){
		if(request.getParameter("action").equals("deletedProduct")){%>
		<p style="color:green;font-size:16px;background-color: #f1f1f1;padding: 20px;">
			<img src="images/ok.png" style="float:left;padding-right: 20px;width: 25px;">
			<b>Product has been deleted!</b>
		</p>
	<%} }%>
	<%if(request.getParameter("action") != null){
		if(request.getParameter("action").equals("deletedCategory")){%>
		<p style="color:green;font-size:16px;background-color: #f1f1f1;padding: 20px;">
			<img src="images/ok.png" style="float:left;padding-right: 20px;width: 25px;">
			<b>Category has been deleted!</b>
		</p>
	<%} }%>
	<%if(request.getParameter("action") != null){
		if(request.getParameter("action").equals("categoryEdit")){%>
		<p style="color:green;font-size:16px;background-color: #f1f1f1;padding: 20px;">
			<img src="images/ok.png" style="float:left;padding-right: 20px;width: 25px;">
			<b>Category has been edited!</b>
		</p>
	<%} }%>
	<%if(request.getParameter("action") != null){
		if(request.getParameter("action").equals("categoryAdd")){%>
		<p style="color:green;font-size:16px;background-color: #f1f1f1;padding: 20px;">
			<img src="images/ok.png" style="float:left;padding-right: 20px;width: 25px;">
			<b>Category has been added!</b>
		</p>
	<%} }%>
	<%if(request.getParameter("action") != null){
		if(request.getParameter("action").equals("userDelete")){%>
		<p style="color:green;font-size:16px;background-color: #f1f1f1;padding: 20px;">
			<img src="images/ok.png" style="float:left;padding-right: 20px;width: 25px;">
			<b>User has been deleted!</b>
		</p>
	<%} }%>
	<%if(request.getParameter("action") != null){
		if(request.getParameter("action").equals("favouriteAdd") && !request.getAttribute("message").equals("favouriteMoreThan10") && !request.getAttribute("message").equals("productAlreadyExistsInFavouritesList")){%>
		<p style="color:green;font-size:16px;background-color: #f1f1f1;padding: 20px;">
			<img src="images/ok.png" style="float:left;padding-right: 20px;width: 25px;">
			<b>Product has been added to your favourites list!</b>
		</p>
	<%} }%>
	<%if(request.getParameter("action") != null){
		if(request.getParameter("action").equals("favouriteDeleted")){%>
		<p style="color:green;font-size:16px;background-color: #f1f1f1;padding: 20px;">
			<img src="images/ok.png" style="float:left;padding-right: 20px;width: 25px;">
			<b>Product has been deleted from your favourites list!</b>
		</p>
	<%} }%>
	<%if(request.getAttribute("message") != null && request.getAttribute("message").equals("favouriteMoreThan10")){%>
	<p style="color:red;font-size:16px;background-color: #f1f1f1;padding: 20px;">
			<img src="images/becareful.png" style="float:left;padding-right: 20px;width: 25px;">
			<b>Sorry, you can add only 10 products to favourites list.</b>
		</p>
	<%} %>
	<%if(request.getAttribute("message") != null && request.getAttribute("message").equals("productAlreadyExistsInFavouritesList")){%>
	<p style="color:red;font-size:16px;background-color: #f1f1f1;padding: 20px;">
			<img src="images/becareful.png" style="float:left;padding-right: 20px;width: 25px;">
			<b>Sorry, this product already exists in your list!</b>
		</p>
	<%} %>

<!-- USER DATA WITH FORM CONTAING USER ACTIONS TO DO DEPENDING ON IF USER IS ADMIN OR NOT -->
	<table>
	<tr><td><h3>Hello <%=user.getName() %> <%=user.getSurname() %>!</h3></td>
	
	<td><form action="login" method="get" style="margin-left:30px;">
	<input type="hidden" name="action" value="edit"/>
	<input type="submit" value="Edit my data" class="admin-button" />
	</form></td><td>
	
	
	<%	boolean adminRights = user.getAdminRights()!=0;
			if(adminRights){ %>
				<td><form action="login" method="get" style="margin-left:30px;">
				<input type="hidden" name="action" value="productEdit"/>
				<input type="submit" value="Edit products" class="admin-button" />
				</form></td><td>
				<td><form action="login" method="get" style="margin-left:30px;">
				<input type="hidden" name="action" value="categoryEdit"/>
				<input type="submit" value="Edit categories" class="admin-button" />
				</form></td><td><form action="login" method="get" style="margin-left:30px;">
				<input type="hidden" name="action" value="usersEdit"/>
				<input type="submit" value="Edit users" class="admin-button" />
				</form></td><td>
	<%} %>
	
	
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
	
	<table style="border-collapse:collapse;">
	<%if(request.getAttribute("favouritesList") != null){
		List favouritesList = (List)request.getAttribute("favouritesList");
		if(favouritesList.toString().equals("[]")){%>
			<p style="color:green;font-size:18px;">Your favourites list is empty. <b>Add something!</b></p>
		<%}else{
		int i=0;
		for(Object current: favouritesList){
		favourite = (Favourite)current; %>
		
	
	<tr<%if(i%2==0){%> style="background-color:#f3f3f3;"<%}else{%> style="background-color:#f9f9f9;"<%}i++;%>>
	<td style="vertical-align:middle;"><img src="<%=favourite.getProduct().getImageUrl() %>" alt="" style="width:60px;padding-right:20px;padding:10px;" /></td>
	<td style="vertical-align:middle;width:250px;font-size:12px;text-transform:uppercase;"><a href="/OnlineStore/product?id=<%=favourite.getProduct().getIdProduct() %>"><%=favourite.getProduct().getName() %></a></td>
	<td style="vertical-align:middle;width:180px;font-size:11px;text-transform:uppercase;color:#9a9a9a;"><%=favourite.getProduct().getCategory().getSection().getName() %> / <b><%=favourite.getProduct().getCategory().getName() %></b></td>
	<td style="vertical-align:middle;width:180px;">
			<form action="login?action=favouriteDeleted" method="post" style="margin-left:30px;">
				<input type="hidden" name="actionPost" value="deleteFavourite"/>
				<input type="hidden" name="id" value="<%=favourite.getIdFavourites()%>"/>
				<input type="submit" value="Delete from this list" class="admin-button" />
			</form>
				</td>
	</tr>
	
	<%}} %>
	</table>
	
	
	
<% 	}}}catch(Exception e){}%>




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