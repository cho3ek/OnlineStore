<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <jsp:include page="header.jsp" />

<jsp:include page="sidemenu2.jsp" />
		
		<table>
			<tr>
				<td class="product-foto">
				<img src="images/products/polo_1.jpg">
				</td>
				<td>
				<h1>Man Polo nr 1</h1><br/>&nbsp;<br/>
					<p>Price:&nbsp;&nbsp; <a class="product-price">€ 237,16</a><br/>
			<small>Available sizes: <b>S, M, L, XL</b></small></p>
			
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
			<h3>Product description</h3><hr><p>Introducing  the latest prep looks, ready just in time for rowing season. 
			Sporting stripes, burnt hues and preppy checks team up with quilted outerwear for action on the water.</strong></p>
<ul>
<li>Machine Wash 30°C Gentle</li>
<li>Non-Chlorine Bleach When Needed</li>
<li>Iron Low Heat</li>
<li>Dryclean Any Solvent Except Trichloroethylene</li>
<li>50% Rayon, 50% Cotton Machine Wash 30°C Gentle.</li>
</ul>

	</div>
	
		
		</div>
				
<jsp:include page="footer.jsp" />