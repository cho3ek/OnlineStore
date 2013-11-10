<%@page import="entities.Product"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <jsp:include page="header.jsp" />

<jsp:include page="sidemenu.jsp" />
		
		<jsp:useBean id="product"  scope="request" class="entities.Product" />
  
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
													<input type="text" name="quantity[]" onblur="check(this);" value="1" style="width:40px;">
													
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