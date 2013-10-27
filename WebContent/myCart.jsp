<jsp:include page="header.jsp" />

<h1>Shopping Cart</h1>
<hr>
<br><br>
<table id="products-admin">
	<tr>
		<td><img src="images/kids/pantsb1.jpg" width="94" height="65" alt="" /></td>
		<td>Kids T-shirt 1: </td><td><strong>$13.00</strong></td>
		<td class="tdbutton"><input type="submit" class="admin-button" value="Remove" /></td>
	</tr>
	<tr>
		<td><img src="images/manwoman/jeanm2.jpg" width="94" height="65" alt="" /></td>
		<td>Men Jeans 2: </td><td><strong>$50.00</strong></td>
		<td class="tdbutton"><input type="submit" class="admin-button" value="Remove" /></td>
	</tr>
	<tr>
		<td><img src="images/sports/sportm5.jpg" width="94" height="65" alt="" /></td>
		<td>Men Sports 5: </td><td><strong>$45.00</strong></td>
		<td class="tdbutton"><input type="submit" class="admin-button" value="Remove" /></td>
	</tr>
</table>
<br>
<p><strong>Total: <h2>$108.00</h2></strong></p>
<input onclick="document.location='checkout.jsp';return false;" class="admin-button" value="Proceed to checkout" />
<jsp:include page="footer.jsp" />
