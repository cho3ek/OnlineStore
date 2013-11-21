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

<h1>Shopping Cart</h1>
<hr><%if(request.getAttribute("message") != null && request.getAttribute("message").equals("productAlreadyExistsInCart")){%>
	<p style="text-align:left;color:red;font-size:16px;">This product is already in your cart!</p>
<%} %>
<br><br>


<% if(request.getAttribute("OrdproductsInCart") != null){
	Object c = request.getAttribute("OrdproductsInCart");
	System.out.println(c);
	System.out.println(c.toString());
	if(c.toString().equals("[]")){%>
	
<p style="color:green;font-size:18px;">Your cart is empty now. <b>Add something!</b></p>

<%}else{%>

<table id="products-admin" style="border-collapse:collapse;width:100%;">
<tr><th style="text-align:left;padding-bottom:20px;">PRODUCT NAME</th>
<th style="text-align:left;padding-bottom:20px;">PRICE</th>
<th style="text-align:left;padding-bottom:20px;padding-left: 32px;">QUANTITY</th></tr>

<%	int i=0;
	for(Object actual: (List)c){ ordproduct = (Ordproduct)actual;%>
	<tr<%if(i%2==0){%> style="background-color:#f3f3f3;"<%}else{%> style="background-color:#f9f9f9;"<%}i++;%>>
		<td style="width:400px;vertical-align:middle;" class="small-image">
			<a style="font-size:16px;" href="/OnlineStore/product?id=<%=ordproduct.getProduct().getIdProduct() %>">
				<img src="<%=ordproduct.getProduct().getImageUrl() %>" style="width:60px;float:left;padding:5px;padding-right:25px;" />
				<p style="margin-top:15px;margin-bottom:0px;">
					<%=ordproduct.getProduct().getName() %><br/>
					<span style="font-size:12px;color:#bababa;"><%=ordproduct.getProduct().getCategory().getSection().getName() %> / <%=ordproduct.getProduct().getCategory().getName() %></span>
				</p>
			</a>
		</td>
		<td><span class="price">€ <%=ordproduct.getProduct().getPrice() %></span></td>
		<td>
		
		<span class="quantity-box"><form action="cart" method="post" style="margin-left:30px;">
				<input type="hidden" name="actionPost" value="editQuantity"/>
				<input type="hidden" name="id" value="<%=ordproduct.getIdOrdproduct()%>"/>
				<input type="number" min="1" max="<%=ordproduct.getProduct().getStock()%>" name="quantity" onblur="check(this);" value="<%=ordproduct.getQuantity() %>" style="width:65px;">
				<input type="submit" value="Save" class="admin-button" style="padding:5px;height:26px;line-height:10px;"/>
				</form>
			</span>						
		</td>
		
		<td><form action="cart" method="post" style="margin-left:30px;">
				<input type="hidden" name="actionPost" value="delete"/>
				<input type="hidden" name="id" value="<%=ordproduct.getIdOrdproduct()%>"/>
				<input type="submit" value="Delete from cart" class="admin-button" />
				</form></td>
	</tr>	
		<%} %>
		
		
	
	
</table>
<br>
<div style="float:left;margin-left:480px;">
	<strong>Total: <h2>€ <%=request.getAttribute("totalPriceOfProductsInCart") %></h2></strong><br/>
	<input class="admin-button" value="Proceed to checkout" />
</div>



<%}} %>

<jsp:include page="footer.jsp" />
