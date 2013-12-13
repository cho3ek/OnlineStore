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
<h1>Checkout</h1><br>
<hr>
		<h3>Billing Information:</h3><br/>
		<h5>All fields required. You can change this data if you want a delivery to different address.</h5><br/>
		
		 <span id="message" class="message" style="color:red;font-size:12px;"></span><br/>
	
		<form action="confirmation" method="post" name="confirmm" id="confirmm" style="margin-left:30px;">	
			<input type="hidden" name="actionPost" value="confirmation" />
			<input type="hidden" name="userId" value="<%=user.getIdUser()%>" />
			<table id="billingAddressForm" cellpadding=3>
				<tr><td align="right"><b>First name:</b></td>
					<td><input type="text" id="name" name="name" value="<%=user.getName()%>" /></td>
					<td align="right"><b>Last name:</b></td>
					<td><input type="text" id="surname" name="surname" value="<%=user.getSurname()%>" /></td>
					</tr>
				<tr><td align="right" rowspan=2><b>Address:</b></td>
					<td colspan=3><input type="text" id="address" name="address" style="width:365px;" value="<%=user.getAddress()%>" /></td>
				</tr><tr></tr>
				<tr><td align="right"><b>Email:</b></td>
					<td colspan=3><input type="text" id="email" name="email" value="<%=user.getEmail()%>" style="width:265px;" /></td>
					</tr>
				<tr><td align="right"><b>Phone:</b></td>
					<td colspan=3><input type="text" id="phone" name="phone" value="<%=user.getPhone()%>" style="width:265px;" /></td></tr>
					</table>
		
			<br>
			<h4>Credit or debit card information: </h4><br/>
			<table cellpadding="3">
				<tr><td><b>Card type: </b></td>
					<td>		
						<select style="padding:0px" id="cardType">
							<option value="Visa">Visa</optoin>
							<option value="MasterCard">MasterCard</option>
							<option value="Discover">Discover</option>
							<option value="AmericanExpress">American Express</option>
						</select>
			 		</td></tr>
				<tr><td><b>Credit card number:</b></td>
					<td><input type="text" id="creditCardNum" name="creditCardNum" value="" style="width:340px;margin-left:2px;" /></td></tr>
				<tr><td><b>Exp date (MMYY):</b></td>
					<td>
						<input type="text" id="creditExp" name="creditExp" value="" size="4" maxlength="4" />
					</td></tr>
				</table>
				<br>
				<input type="button" onClick="checkPass();submitForm();" class="admin-button" value="Submit Payment" /><br/>
				
	</form>
	
	
		<script type="text/javascript">
	
	var errorCount;
	
	function checkPass()
	{ 
	var goodColor = "#66cc66";
    var badColor = "#ff6666";
    var withoutColor = "#ffffff";
    errorCount = 0;
	var name = document.getElementById('name');
	var surname = document.getElementById('surname');
	var address = document.getElementById('address'); 
	var email = document.getElementById('email');
	var phone = document.getElementById('phone');
	var creditCardNum = document.getElementById('creditCardNum');
	var creditExp = document.getElementById('creditExp');
	var atPosition = email.value.indexOf("@");
	var dotPosition = email.value.lastIndexOf(".");
	var message  = document.getElementById('message');
	message.innerHTML = ""; 
	
	if(name.value.length < 2) {
		name.style.backgroundColor = badColor; 
		name.style.color = "#fff";
		errorCount++;
		message.innerHTML += "Name field error! Minimum <b>2 characters!</b><br/>";
	} else {
		name.style.backgroundColor = withoutColor;
   		name.style.color = "#9d9d9d";
   		}
	
	if(surname.value.length < 2) {
		surname.style.backgroundColor = badColor; 
		surname.style.color = "#fff";
		errorCount++;
		message.innerHTML += "Surname field error! Minimum <b>2 characters!</b><br/>";
	} else {
		surname.style.backgroundColor = withoutColor;
   		surname.style.color = "#9d9d9d";
   		}
	
	if(atPosition < 1 || dotPosition < atPosition+2 || dotPosition+2 > email.value.length) {
		email.style.backgroundColor = badColor; 
		email.style.color = "#fff";
		errorCount++;
		message.innerHTML += "Email field error! Empty or in wrong format<br/>";
	} else {
		email.style.backgroundColor = withoutColor;
   		email.style.color = "#9d9d9d";
   		}
	
	if(phone.value.length < 6) {
		phone.style.backgroundColor = badColor; 
		phone.style.color = "#fff";
		errorCount++;
		message.innerHTML += "Phone field error! Minimum <b>6 characters!</b><br/>";
	} else {
		phone.style.backgroundColor = withoutColor;
   		phone.style.color = "#9d9d9d";
		}
	
	if(address.value.length < 10) {
		address.style.backgroundColor = badColor; 
		address.style.color = "#fff";
		errorCount++;
		message.innerHTML += "Address field error! Minimum <b>10 characters!</b><br/>";
	} else {
		address.style.backgroundColor = withoutColor;
   		address.style.color = "#9d9d9d";
   		}
   		
   		if(creditCardNum.value.length != 16) {
		creditCardNum.style.backgroundColor = badColor; 
		creditCardNum.style.color = "#fff";
		errorCount++;
		message.innerHTML += "Card number should contain <b>16 characters!</b><br/>";
	} else {
		creditCardNum.style.backgroundColor = withoutColor;
   		creditCardNum.style.color = "#9d9d9d";
   		}
   		
   	if(creditExp.value.length < 4) {
		creditExp.style.backgroundColor = badColor; 
		creditExp.style.color = "#fff";
		errorCount++;
		message.innerHTML += "Card expiration date should contain <b>4 characters (mmYY)!</b><br/>";
	} else {
		creditExp.style.backgroundColor = withoutColor;
   		creditExp.style.color = "#9d9d9d";
   		}
   		
   		
}
    
function submitForm(){ 
	if(errorCount==0){
  		 document.getElementById('confirmm').submit();
  	 }
} 
</script>

<jsp:include page="footer.jsp"/>