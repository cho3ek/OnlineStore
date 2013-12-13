<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>			
<%@page import="entities.User"%>		
<%@page import="entities.Product"%>	
<%@page import="entities.Ordproduct"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="user" scope="request" class="entities.User" />
<jsp:useBean id="product" scope="request" class="entities.Product" />
<jsp:useBean id="ordproduct" scope="request" class="entities.Ordproduct" />

<jsp:include page="header.jsp" />


<% user = (User)session.getAttribute("user"); %>


	
	<%if(request.getParameter("action") != null && request.getParameter("action").equals("payment-confirmation")){%>
		<p style="color:green;font-size:16px;background-color: #f1f1f1;padding: 20px;">
			<img src="images/ok.png" style="float:left;padding-right: 20px;width: 25px;">
			We've got your payment!
		</p>
		<img src="images/delivery.jpg" style="float:left;padding-right:30px;" alt="" />
		<h3>Thank you!<br/>Your confirmation number: <b>ABCDE12345</b></h3><br/>
		<p>We will send you your products as soon as possible.<br/>
		Package will be sent to:</p>
		<div style="background-color:#efefef;padding:15px;width:50%;float:left;">
		<b><%=request.getParameter("name") %> <%=request.getParameter("surname") %></b><br/>
		<%=request.getParameter("address") %>
		</div>
	<%} else {%>


	<!-- IF CREDIT CARD ACCEPTED -->
		<p style="color:green;font-size:16px;background-color: #f1f1f1;padding: 20px;">
			<img src="images/ok.png" style="float:left;padding-right: 20px;width: 25px;">
			Your credit card has been accepted!
		</p>
		<form action="confirmation?action=payment-confirmation" method="post" id="checkout">
			<input type="hidden" name="actionPost" value="payment-confirmation" /> 
			<input type="hidden" name="userId" value="<%=user.getIdUser()%>" />
			<input type="hidden" name="name" value="<%=request.getParameter("name")%>" />
			<input type="hidden" name="surname" value="<%=request.getParameter("surname")%>" />
			<input type="hidden" name="address" value="<%=request.getParameter("address") %>" />
			<input type="hidden" name="email" value="<%=request.getParameter("email") %>" />
			<input type="hidden" name="phone" value="<%=request.getParameter("phone") %>" />
			<input type="submit" class="admin-button" value="Confirm a payment" />
		</form>
		<div style="clear:both;margin-top:110px;padding-bottom:50px;">THIS OR THIS WILL BE DISPLAYED</div>
		
		
	<!-- ELSE -->
			<p style="color:red;font-size:16px;background-color: #f1f1f1;padding: 20px;">
				<img src="images/becareful.png" style="float:left;padding-right: 20px;width: 25px;">
				Credit card numbers not valid!
			</p>
			<form action="checkout" method="get" id="checkout">
				<input type="submit" class="admin-button" value="Come back" />
			</form>
	

	<%} %>


	

<jsp:include page="footer.jsp"/>