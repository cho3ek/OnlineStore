<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>			
<%@page import="entities.User"%>	
<%@ page import="java.util.*" %>
<jsp:useBean id="user" scope="request" class="entities.User" />

<jsp:include page="header.jsp" />
<h1>Registration</h1>
<hr>

<p>To register for a UC3M Shop account, please fill out this form. All fields are required.</p>

   <span id="message" class="message" style="color:red;font-size:12px;"></span><br/>
	<table>
	<form action="login" method="post" id="newUser" style="margin-left:30px;">
	<input type="hidden" name="action" value="newUser" />
	<tr><td style="width:150px;"><b>Name:</b></td><td><input type="text" id="name" name="name" value="" /></td></tr>
	<tr><td><b>Surname:</b></td><td><input type="text" id="surname" name="surname" value=""/></td></tr>
	<tr><td><b>Email:</b></td><td><input type="text" id="newEmail" name="newEmail" value=""/><br/>&nbsp;<br/></td></tr>
	<tr><td><b>Password:</b></td><td><input type="password" name="password2" id="password2"  value=""/></td></tr>
	<tr><td><b>Confirm password:</b>
			</td><td><input type="password" name="password3" id="password3" value="" /><br/>&nbsp;<br/></td></tr>
	<tr><td><b>Phone number:</b></td> <td><input type="text" id="phone" name="phone" value=""/></td></tr>
	<tr><td><b>Address:</b></td> <td><input type="text" name="address" id="address" style="width:300px;"value=""/><br/></td></tr>
	<tr><td> </td> <td><br/><input type="button" class="admin-button" value="Create account" onClick="checkPass();submitForm();" /><br/></td></tr>
	</table>
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
	var newEmail = document.getElementById('newEmail');
	var atPosition = newEmail.value.indexOf("@");
	var dotPosition = newEmail.value.lastIndexOf(".");
	var pass1 = document.getElementById('password2');
    var pass2 = document.getElementById('password3');
	var phone = document.getElementById('phone');
	var address = document.getElementById('address'); 
	var message  = document.getElementById('message');
	message.innerHTML = ""; 
	
	if(name.value.length < 2) {
		name.style.backgroundColor = badColor; 
		name.style.color = "#fff";
		errorCount++;
		message.innerHTML += "Name field error! Minimum <b>2 signs!</b><br/>";
	} else {
		name.style.backgroundColor = withoutColor;
   		name.style.color = "#9d9d9d";
   		}
	
	if(surname.value.length < 2) {
		surname.style.backgroundColor = badColor; 
		surname.style.color = "#fff";
		errorCount++;
		message.innerHTML += "Surname field error! Minimum <b>2 signs!</b><br/>";
	} else {
		surname.style.backgroundColor = withoutColor;
   		surname.style.color = "#9d9d9d";
   		}
	
	if(atPosition < 1 || dotPosition < atPosition+2 || dotPosition+2 > newEmail.value.length) {
		newEmail.style.backgroundColor = badColor; 
		newEmail.style.color = "#fff";
		errorCount++;
		message.innerHTML += "Email field error! Empty or in wrong format<br/>";
	} else {
		newEmail.style.backgroundColor = withoutColor;
   		newEmail.style.color = "#9d9d9d";
   		}
	
	if(phone.value.length < 6) {
		phone.style.backgroundColor = badColor; 
		phone.style.color = "#fff";
		errorCount++;
		message.innerHTML += "Phone field error! Minimum <b>6 signs!</b><br/>";
	} else {
		phone.style.backgroundColor = withoutColor;
   		phone.style.color = "#9d9d9d";
		}
	
	if(address.value.length < 10) {
		address.style.backgroundColor = badColor; 
		address.style.color = "#fff";
		errorCount++;
		message.innerHTML += "Address field error! Minimum <b>10 signs!</b><br/>";
	} else {
		address.style.backgroundColor = withoutColor;
   		address.style.color = "#9d9d9d";
   		}
	
	if(pass1.value == "" || pass2.value =="") {
        pass1.style.backgroundColor = badColor; 
        pass2.style.backgroundColor = badColor; 
        pass1.style.color = "#fff";
        pass2.style.color = "#fff";
        errorCount++;
    }
    else if(pass1.value == pass2.value ){ 
    pass1.style.backgroundColor = withoutColor;  
    pass2.style.backgroundColor = withoutColor;
    pass1.style.color = "#9d9d9d";
    pass2.style.color = "#9d9d9d";
    }
}
    
function submitForm(){ 
	if(errorCount==0)
  		 document.getElementById('newUser').submit();
} 
    
    
    </script>
    
    
	</p>


<jsp:include page="footer.jsp" />