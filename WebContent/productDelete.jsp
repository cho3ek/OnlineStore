<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>			
    <%@page import="entities.Product"%>				
<%@page import="entities.User"%>				
<%@page import="entities.Category"%>		
<%@ page import="java.util.*" %>
<jsp:useBean id="product"  scope="request" class="entities.Product" />
<jsp:useBean id="user"  scope="request" class="entities.User" />
<jsp:useBean id="category"  scope="request" class="entities.Category" />


<jsp:include page="header.jsp" />






<!--WE CAN ENTER ONLY IF WE ARE LOGGED IN AS ADMIN -->
<%try{
	if(session.getAttribute("loggedAdmin").toString().equals("yes")) { %>
	<p style="text-align:left;font-size:18px;">
	<% user = (User)session.getAttribute("user");%>
	<table>
	<tr><td><h3>Hello <%=user.getName() %> <%=user.getSurname() %>!</h3></td>
	<td>
	<form action="login" method="get" style="margin-left:30px;">
	<input type="submit" value="Go back to your account" class="admin-button" />
	</form></td>
	<%if(request.getParameter("id") != null){ %>
	<!-- IF WE'RE EDITING A PRODUCT -->
		<td>
		<form action="login" method="get" style="margin-left:30px;">
		<input type="hidden" name="action" value="productEdit"/>
		<input type="submit" value="Go back to list of products" class="admin-button" />
		</form></td>
	<%} %>
	<td>
	<form action="login" method="get" style="margin-left:30px;">
	<input type="hidden" name="action" value="logout"/>
	<input type="submit" value="Logout" class="admin-button" />
	</form></td></tr></table>
	
	
	<%if(product.getName() != null) {%>



<!--ELSE IF WE HAVE A PRODUCT CHOSEN WE EDIT IT
 -->
<br/>&nbsp;<br/>&nbsp;<br/>&nbsp;<br/>


<table style="padding:10px;background-color:#fafafa">
<tr><td style="width:230px"><img src="images/becareful.png" style="width:150px;" alt="" /></td><td>
<h3>ARE YOU SURE U WANT TO DELETE THIS PRODUCT?</h3>
<br/>

<table>
<tr>
<td><img src="<%=product.getImageUrl() %>" alt="" style="width:70px;"></td>
<td><span style="font-weight:300;text-transform:uppercase;"><%=product.getName() %><br/>
€ <%=product.getPrice() %>
</span><br/></td>
<td>
<form action="login?action=deletedProduct" method="post" id="deleteProduct" style="margin-left:30px;">
	<input type="hidden" name="actionPost" value="deleteProduct" />
	<input type="hidden" name="id" value="<%=product.getIdProduct() %>" />
	<input type="submit" class="admin-button" value="YES, delete it" />
	</form></td><td>
	<form action="login" method="get" id="deleteProduct" style="margin-left:30px;">
	<input type="hidden" name="action" value="editProduct" />
	<input type="submit" class="admin-button" value="NO, go back" />
	</form></td>
	</tr>
</table>
	
	</td></tr></table>
	

<%} %>	

</td></tr></table></p>

<% 	}}catch(Exception e){}%>


<jsp:include page="footer.jsp" />