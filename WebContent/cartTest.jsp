<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>			
<%@page import="entities.User"%>		
<%@page import="entities.Product"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="user" scope="request" class="entities.User" />
<jsp:useBean id="product" scope="request" class="entities.Product" />

<jsp:include page="header.jsp" />

<h1>Shopping Cart</h1>
<hr>
<br><br>


		
		
<table id="products-admin" style="border-collapse:collapse;width:100%;">
<tr><th style="text-align:left;padding-bottom:20px;">PRODUCT NAME</th>
<th style="text-align:left;padding-bottom:20px;">PRICE</th>
<th style="text-align:left;padding-bottom:20px;">QUANTITY</th></tr>
<% if(request.getAttribute("productsInCart") != null){
 	Object c = request.getAttribute("productsInCart");
	int i=0;
	for(Object actual: (List)c){ product = (Product)actual;%>
	<tr<%if(i%2==0){%> style="background-color:#f5f5f5;"<%}i++;%>>
		<td style="width:400px;vertical-align:middle;" class="small-image">
			<a style="font-size:21px;" href="/OnlineStore/product?id=<%=product.getIdProduct() %>">
				<img src="<%=product.getImageUrl() %>" style="width:80px;float:left;padding:5px;padding-right:25px;" />
				<br/>&nbsp;<%=product.getName() %>
			</a>
		</td>
		<td><span class="price">€ <%=product.getPrice() %></span></td>
		<td><span class="price"><%=product.getStock() %></span></td>
		<td><form action="cart" method="get" style="margin-left:30px;">
				<input type="hidden" name="action" value="delete"/>
				<input type="hidden" name="id" value="<%=product.getIdProduct()%>"/>
				<input type="submit" value="Delete from cart" class="admin-button" />
				</form></td>
	</tr>	
		<%} } %>
		
		
		
	<!-- 	
	<tr>
		<td><img src="images/kids/pantsb1.jpg" width="94" height="65" alt="" /></td>
		<td>Kids T-shirt 1: </td><td><strong>$13.00</strong></td>
		<td class="tdbutton"><input type="submit" class="admin-button" value="Remove" /></td>
	</tr>-->
	
</table>
<br>
<p><strong>Total: <h2>$108.00</h2></strong></p>
<input onclick="document.location='checkout.jsp';return false;" class="admin-button" value="Proceed to checkout" />
<jsp:include page="footer.jsp" />
