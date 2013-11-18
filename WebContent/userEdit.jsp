<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>			
<%@page import="entities.User"%>	
<%@ page import="java.util.*" %>
<jsp:useBean id="user" scope="request" class="entities.User" />


<jsp:include page="header.jsp" />






<!-- WE CAN ENTER THIS ONLY IF WE ARE LOGGED IN -->
<%try{
	if(session.getAttribute("logged").toString().equals("yes")) { %>
	<p style="text-align:left;font-size:18px;">
	<% user = (User)session.getAttribute("user");%>
	<table>
	<tr><td><h3>Hello <%=user.getName() %> <%=user.getSurname() %>!</h3></td>
	<td><form action="login" method="get" style="margin-left:30px;">
	<input type="submit" value="Go back to your account" class="admin-button" />
	</form></td><td>
	<form action="login" method="get" style="margin-left:30px;">
	<input type="hidden" name="action" value="logout"/>
	<input type="submit" value="Logout" class="admin-button" />
	</form></td></tr></table>
	
<br/>
<span id="message" class="message" style="font-size:12px;color:red;"></span><br/>
	<u>Edit your private data:</u><br/>&nbsp;<br/>
	<table>
	<form action="login?action=save" method="post" id="editUser" style="margin-left:30px;">
	<input type="hidden" name="actionPost" value="save" />
	<tr><td style="width:150px;"><b>Name:</b></td><td><input type="text" id="name" name="name" onkeyup="checkPass(); " onclick="checkPass(); " value="<%=user.getName() %>" /></td></tr>
	<tr><td><b>Surname:</b></td><td><input type="text" id="surname" name="surname" onkeyup="checkPass(); " onclick="checkPass(); " value="<%=user.getSurname() %>"/></td></tr>
	<tr><td><b>Email:</b></td><td><input type="text" id="newEmail" name="newEmail" onkeyup="checkPass(); " onclick="checkPass(); " value="<%=user.getEmail() %>"/> <small>Be careful - it will be your new login</small><br/>&nbsp;<br/></td></tr>
	<tr><td><b>New password:</b><br/>
			<small>leave empty if not changing</small></td><td><input type="password" name="password2" id="password2" onkeyup="checkPass(); " onclick="checkPass(); "value=""/></td></tr>
	<tr><td><b>Confirm new password:</b>
			</td><td><input type="password" name="password3" id="password3" value="" onkeyup="checkPass();" onclick="checkPass(); "/><br/>&nbsp;<br/></td></tr>
	<tr><td><b>Phone number:</b></td> <td><input type="text" id="phone" name="phone" onkeyup="checkPass();" onclick="checkPass();" value="<%=user.getPhone() %>"/></td></tr>
	<tr><td><b>Address:</b></td> <td><input type="text" name="address" id="address" onkeyup="checkPass();" onclick="checkPass();" style="width:300px;"value="<%=user.getAddress() %>"/><br/></td></tr>
	<tr><td> </td> <td><br/><input type="button" class="admin-button" value="Save" onClick="checkPass();submitForm();" /><br/></td></tr>
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
	
    if(pass1.value == pass2.value){
        //The passwords match. 
        //Set the color to the good color and inform
        //the user that they have entered the correct password 
        pass2.style.backgroundColor = goodColor;
        pass2.style.color = "#fff";
        if(pass1.value == "" && pass2.value =="") {
        	pass2.style.backgroundColor = "#fff";
        	pass2.style.color = "#e5e5e5";
        	}
    }else{
        //The passwords do not match.
        //Set the color to the bad color and
        //notify the user.
        pass2.style.backgroundColor = badColor; 
        errorCount++;
        pass2.style.color = "#fff";
    }
    if(errorCount>0) {}
  		 else {    
    		//document.getElementById('editUser').submit();
    		
    		}
    }
    
    
    
    function submitForm()
	{ 
	if(errorCount==0)
  		 document.getElementById('editUser').submit();
    } 
    
    
    </script>
    
    
	</p>
<% 	}}catch(Exception e){}%>


<jsp:include page="footer.jsp" />