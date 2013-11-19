<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>			
    <%@page import="entities.Product"%>				
<%@page import="entities.User"%>				
<%@page import="entities.Category"%>		
<%@ page import="java.util.*" %>
<jsp:useBean id="product"  scope="request" class="entities.Product" />
<jsp:useBean id="user"  scope="request" class="entities.User" />
<jsp:useBean id="category"  scope="request" class="entities.Category" />


<jsp:include page="header.jsp" />






<!--WE CAN ENTER ONLY IF WE ARE LOGGED IN AS ADMIN -->
<%try{
	if(session.getAttribute("loggedAdmin").toString().equals("yes")) { %>
	<p style="text-align:left;font-size:18px;">
	<% user = (User)session.getAttribute("user");%>
	<table>
	<tr><td><h3>Hello <%=user.getName() %> <%=user.getSurname() %>!</h3></td>
	<td>
	<form action="login" method="get" style="margin-left:30px;">
	<input type="submit" value="Go back to your account" class="admin-button" />
	</form></td>
	
		<td>
		<form action="login" method="get" style="margin-left:30px;">
		<input type="hidden" name="action" value="productEdit"/>
		<input type="submit" value="Go back to list of products" class="admin-button" />
		</form></td>
	
	<td>
	<form action="login" method="get" style="margin-left:30px;">
	<input type="hidden" name="action" value="logout"/>
	<input type="submit" value="Logout" class="admin-button" />
	</form></td></tr></table>
	
	
	
<br/>&nbsp;<br/>
<h4>You are adding new product</h4><br/>
<span id="message" class="message" style="color:red;font-size:13px;"></span><br/>


<table>
<form action="login?action=productAdd" method="post" id="productAdd" style="margin-left:30px;">
	<input type="hidden" name="actionPost" value="productAdd" />
	<tr><td style="width:150px;"><b>Name:</b></td><td><input type="text" style="width:250px;margin-left:2px;" id="name" name="name" value="" /></td></tr>
	<tr><td><b>Price:</b></td><td><input type="text" id="price" name="price" style="width:90px;margin-left:2px;" value=""/></td></tr>
	<tr><td><b>In stock:</b></td><td><input type="text" id="stock" style="width:50px;margin-left:2px;" name="stock" value=""/></td></tr>
	<tr><td><b>Description (html):</b></td><td><textarea id="description" name="description" style="padding: 10px;font-family:'Open Sans';width:450px;height:150px;margin-left:2px;"></textarea></td></tr>
	<tr><td><b>Category / section:</b></td> <td>
	<select name="category" style="padding:0;padding-left:10px;">
					<% Object s = request.getAttribute("categories");
						for(Object current: (List)s){
							category = (Category)current;%>
							<option value="<%=category.getIdCategory()%>"><%=category.getName() %> - <%=category.getSection().getName() %></option>
							<%} %>
	</select>
	<br/>&nbsp;<br/>
	</td></tr>
	<tr><td><b>Image URL:</b></td> <td>	<input id="imageUrl" name="imageUrl" style="width:350px;margin-left:2px;" type="text" value=""/><br/></td></tr>
	
			
	<tr><td> </td> <td><br/><input type="button" class="admin-button" value="Add this product" onClick="checkPass();submitForm();" /><br/></td></tr>
	</table>
	
</td></tr>
	</form></table>
	
	
	
	
	<!-- SCRIPT TO VALIDATE A FORM -->
	<script type="text/javascript">
	var errorCount;
	function isFloat(n) {
    return n === +n && n !== (n|0);
    }

	function checkPass()
	{ 
	var goodColor = "#66cc66";
    var badColor = "#ff6666";
    var withoutColor = "#ffffff";
    errorCount = 0;
	var name = document.getElementById('name');
	var price = document.getElementById('price');
	var stock = document.getElementById('stock');
	var description = document.getElementById('description'); 
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
   		
	if(price.value.length < 3 || isNaN(price.value) || price.value.toString().indexOf('.') == -1 || price.value.toString().indexOf('.')+3 > price.value.length || price.value.length > price.value.toString().indexOf('.')+3 || price.value.length > 7 ) {
		price.style.backgroundColor = badColor; 
		price.style.color = "#fff";
		errorCount++;
		message.innerHTML += "Price field error! Bad format. Use dot inside. Maximum price is 9999.99. For example: 23.56</b><br/>";
	} else {
		price.style.backgroundColor = withoutColor;
   		price.style.color = "#9d9d9d";
   		}

if(isNaN(stock.value) || stock.value.toString().indexOf('.') > -1 || stock.value.length > 3 || stock.value.length < 1 ) {
		stock.style.backgroundColor = badColor; 
		stock.style.color = "#fff";
		errorCount++;
		message.innerHTML += "Stock field error! Bad format or empty. Max is 999.</b><br/>";
	} else {
		stock.style.backgroundColor = withoutColor;
   		stock.style.color = "#9d9d9d";
   		}
	
	if(description.value.length < 10) {
		description.style.backgroundColor = badColor; 
		description.style.color = "#fff";
		errorCount++;
		message.innerHTML += "Decription field error! Minimum <b>10 signs!</b><br/>";
	} else {
		description.style.backgroundColor = withoutColor;
   		description.style.color = "#9d9d9d";
   		}
   	if(imageUrl.value.length < 8 || imageUrl.value.toString().indexOf("images/")==-1) {
		imageUrl.style.backgroundColor = badColor; 
		imageUrl.style.color = "#fff";
		errorCount++;
		message.innerHTML += "Image URL field error! Must begin with 'images/'</b><br/>";
	} else {
		imageUrl.style.backgroundColor = withoutColor;
   		imageUrl.style.color = "#9d9d9d";
   		}
    }
    
    
    function submitForm(){ 
	if(errorCount==0)
  		 document.getElementById('productAdd').submit();
    } 
    </script>


<%} %>	



<% 	}catch(Exception e){}%>


<jsp:include page="footer.jsp" />