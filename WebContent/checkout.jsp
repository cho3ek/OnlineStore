<jsp:include page="header.jsp"/>
<h1>Checkout</h1><br>
<hr>
	<form method="post" action="">
		<h3>Billing Information:</h3><br/>
		<h5>All fields required</h5><br/>
		<table id="billingAddressForm" cellpadding=3>
			<tr>
				<td align="right"><b>First name:</b></td>
				<td><input type="text" name="fName" value=""></td>
				<td align="right"><b>Last name:</b></td>
				<td><input type="text" name="lName" value=""></td>
			</tr>

			<tr>
				<td align="right" rowspan=2><b>Address:</b></td>
				<td><input type="text" name="address1" value=""></td>
			</tr>

			<tr>
				<td><input type="text" name="address2" value=""></td>
			</tr>

			<tr>
				<td align="right"><b>City:</b></td>
				<td><input type="text" name="city" value=""></td>
				<td align="right"><b>State:</b></td>
				<td><input type="text" name="state" value=""></td>
			</tr>

			<tr>
				<td align="right"><b>Postal code:</b></td>
				<td><input type="text" name="zip" value=""></td>
				<td align="right"><b>Country:</b></td>
				<td><input type="text" name="country" value=""></td>
			</tr>

		</table>
		<br>
		<h4>Credit or debit card information: </h5><br/>
		<table cellpadding="3">
			<tr>
				<td><b>Card type: </b></td>
				<td>		
					<select style="padding:0px" id="cardType">
						<option value="Visa">Visa</optoin>
						<option value="MasterCard">MasterCard</option>
						<option value="Discover">Discover</option>
						<option value="AmericanExpress">American Express</option>
					</select>
		 		</td>
			</tr>
			<tr>
				<td><b>Credit card number:</b></td>
				<td><input type="text" name="creditCardNum" value="" size="20"></td>
			</tr>

			<tr>
				<td><b>Exp date (MM/YY):</b></td>
				<td>
					<input type="text" name="creditExp" value="" size="4" maxlength="4">
				</td>
			</tr>

		</table>
		<br><br>

		<script>
			function toggleAddressForm() {
				if (document.getElementById("addressBox").checked == true) {
					document.getElementById("shippingAddressForm").style.display = "none";
				} else {
					document.getElementById("shippingAddressForm").style.display = "block";
				}
			}
		</script>
		<hr>
		<h3>Shipping Information:</h3>
		<p>
			<input type="checkbox" id="addressBox" onClick="toggleAddressForm()" checked>
			 Shipping address same as billing address
		</p>
		<table id="shippingAddressForm" style="display:none;" cellpadding="3">
			<tr><td><h5>All fields required</h5></td></tr>
			<tr>
				<td align="right"><b>First name:</b></td>
				<td><input type="text" name="fName" value=""></td>
				<td align="right"><b>Last name:</b></td>
				<td><input type="text" name="lName" value=""></td>
			</tr>

			<tr>
				<td align=right rowspan=2><b>Address:</b></td>
				<td><input type="text" name="address1" value=""></td>
			</tr>

			<tr>
				<td><input type="text" name="address2" value=""></td>
			</tr>

			<tr>
				<td align="right"><b>City:</b></td>
				<td><input type="text" name="city" value=""></td>
				<td align="right"><b>State/Province:</b></td>
				<td><input type="text" name="state" value=""></td>
			</tr>

			<tr>
				<td align="right"><b>Postal code:</b></td>
				<td><input type="text" name="zip" value=""></td>
				<td align="right"><b>Country:</b></td>
				<td><input type="text" name="country" value=""></td>
			</tr>

		</table>
		<br>
		<p>
			<input type="submit" class="admin-button" name="submit" value="Submit Payment">
		</p>

	</form>
<jsp:include page="footer.jsp"/>