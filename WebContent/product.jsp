<%@page import="entities.Product"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <jsp:include page="header.jsp" />

		
		<jsp:useBean id="product"  scope="request" class="entities.Product" />
  
  <%String url = product.getCategory().getSection().getUrl();
  if(url.equals("kids")){ %> 
  <img src="images/main_kids.jpg" alt="" style="margin-top:-40px;margin-bottom:40px;" /><br/><%}%>
  <% if(url.equals("manAndWoman")){ %> <img src="images/main_man_woman.jpg" alt="" style="margin-top:-40px;margin-bottom:40px;" /><%} %>
  <% if(url.equals("young")){ %> <img src="images/main_young.jpg" alt="" style="margin-top:-40px;margin-bottom:40px;" /><%} %>
  <% if(url.equals("sports")){ %> <img src="images/main_sport.jpg" alt="" style="margin-top:-40px;margin-bottom:40px;" /><%} %>
  
  
<jsp:include page="sidemenuProduct.jsp" />
		<table>
			<tr>
				<td class="product-foto">
				<img src="<%=product.getImageUrl()%>" style="width:250px;">
				</td>
				<td>
				<small><%=product.getCategory().getSection().getName()%> <img src="images/ico_bullet.gif" style="width:8px;padding:0 10px" alt="" /> <%=product.getCategory().getName()%></small>
				<h1><%=product.getName()%> </h1><br/>&nbsp;<br/>
					<p>Price:&nbsp;&nbsp; <a class="product-price">€ <%=product.getPrice()%></a><br/>
			<small>Available sizes: <b>S, M, L, XL</b></small><br/>
			<small>In stock: <b><%=product.getStock()%></b></small></p>
			<br/>&nbsp;<br/>
																										
													<label>Quantity: </label>
													
													<span class="quantity-box">
													<input type="number" min="1" max="<%=product.getStock()%>" name="quantity" onblur="check(this);" value="1" style="width:65px;">
													
													</span>
													
																																							<span class="addtocart-button">
														<input type="submit" name="add-to-cart" class="add-to-cart" value="Add to Cart" title="Add to Cart">													</span>
																										
											
			
				</td>
			</tr>
		</table>
		
		
		<div class="product-description">
			<h3>Product description</h3><hr>
			<%=product.getDescription()%>



	</div>
	
		
		</div>
				
<jsp:include page="footer.jsp" />