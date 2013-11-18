<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>			
    <%@page import="entities.Product"%>				
<%@page import="entities.User"%>				
<%@page import="entities.Category"%>			
<%@page import="entities.Product"%>		
<%@ page import="java.util.*" %>
<jsp:useBean id="category"  scope="request" class="entities.Category" />
<jsp:useBean id="user"  scope="request" class="entities.User" />
<jsp:useBean id="product"  scope="request" class="entities.Product" />


<jsp:include page="header.jsp" />






<!-- IF WE ARE LOGGED IN AS ADMIN -->
<%try{
	if(session.getAttribute("loggedAdmin").toString().equals("yes")) { %>
	<p style="text-align:left;font-size:18px;">
	<% user = (User)session.getAttribute("user");%>
	<table>
	<tr><td><h3>Hello <%=user.getName() %> <%=user.getSurname() %>!</h3></td>
	<td><form action="login" method="get" style="margin-left:30px;">
	<input type="submit" value="Go back" class="admin-button" />
	</form></td><td>
	<form action="login" method="get" style="margin-left:30px;">
	<input type="hidden" name="action" value="logout"/>
	<input type="submit" value="Logout" class="admin-button" />
	</form></td></tr></table>
	
	
	<!--  WE SHOW THE TABLE WITH ALL PRODUCTS ONLY IF WE DON'T HAVE A PRODUCT CHOSEN -->

<br/>&nbsp;<br/>

<h3>Choose a category to edit:</h3><br/>




<div id="wrapper">
                <div id="tabs">
                <ul>
                        <li><a href="#tabs-1" title="">Young section</a></li>
                        <li><a href="#tabs-2" title="">Sports section</a></li>
                        <li><a href="#tabs-3" title="">Kids section</a></li>
                        <li><a href="#tabs-4" title="">Man and woman section</a></li>
                </ul>
                <div id="tabs_container">
                        


		<!-- TAB 1 - YOUNG SECTION -->
                <div id="tabs-1" style="text-align:justify;">
                	<table class="categories">
                	<% Object c = request.getAttribute("categories");
						for(Object current: (List)c){
							category = (Category)current;
								if(category.getSection().getUrl().equals("young")){%>
						
							<tr style="height:40px;"><td style="width:270px;vertical-align:middle;">
							<h3 style="color:#777;font-size:15px;padding-left: 20px;">
								<%=category.getSection().getName() %> - <b><%=category.getName()%></b>
							</h3></td><td style="vertical-align:middle;">
							<form action="login" method="get">
							<input type="hidden" name="action" value="categoryEdit" />	
							<input type="hidden" name="id" value="<%=category.getIdCategory()%>" />		
							<input type="submit" value="Edit" class="admin-button" style="padding: 9px;line-height: 10px;height: auto;"/>
							</form>
							</td><td style="vertical-align:middle;">
							<form action="login" method="get">
							<input type="hidden" name="action" value="categoryDelete" />	
							<input type="hidden" name="id" value="<%=category.getIdCategory()%>" />	
							<input type="submit" value="Delete" class="admin-button" style="padding: 9px;line-height: 10px;height: auto;"/>
							</form>
							</td></tr>
						
		<%}} %>	</table><br/>&nbsp;<br/>&nbsp;<br/>&nbsp;<br/>
                </div>
                
                
                
                
                	<!-- TAB 2 - SPORTS SECTION -->
                <div id="tabs-2" style="text-align:justify;">
                	<table class="categories">
                	<% c = request.getAttribute("categories");
						for(Object current: (List)c){
							category = (Category)current;
								if(category.getSection().getUrl().equals("sports")){%>
						
							<tr style="height:40px;"><td style="width:270px;vertical-align:middle;">
							<h3 style="color:#777;font-size:15px;padding-left: 20px;">
								<%=category.getSection().getName() %> - <b><%=category.getName()%></b>
							</h3></td><td style="vertical-align:middle;">
							<form action="login" method="get">
							<input type="hidden" name="action" value="categoryEdit" />	
							<input type="hidden" name="id" value="<%=category.getIdCategory()%>" />		
							<input type="submit" value="Edit" class="admin-button" style="padding: 9px;line-height: 10px;height: auto;"/>
							</form>
							</td><td style="vertical-align:middle;">
							<form action="login" method="get">
							<input type="hidden" name="action" value="categoryDelete" />	
							<input type="hidden" name="id" value="<%=category.getIdCategory()%>" />	
							<input type="submit" value="Delete" class="admin-button" style="padding: 9px;line-height: 10px;height: auto;"/>
							</form>
							</td></tr>
						
		<%}} %>	</table><br/>&nbsp;<br/>&nbsp;<br/>&nbsp;<br/>
                </div>
                
                
                
                
                
                	<!-- TAB 3 - KIDS SECTION -->
                <div id="tabs-3" style="text-align:justify;">
                	<table class="categories">
                	<% c = request.getAttribute("categories");
						for(Object current: (List)c){
							category = (Category)current;
								if(category.getSection().getUrl().equals("kids")){%>
						
							<tr style="height:40px;"><td style="width:270px;vertical-align:middle;">
							<h3 style="color:#777;font-size:15px;padding-left: 20px;">
								<%=category.getSection().getName() %> - <b><%=category.getName()%></b>
							</h3></td><td style="vertical-align:middle;">
							<form action="login" method="get">
							<input type="hidden" name="action" value="categoryEdit" />	
							<input type="hidden" name="id" value="<%=category.getIdCategory()%>" />		
							<input type="submit" value="Edit" class="admin-button" style="padding: 9px;line-height: 10px;height: auto;"/>
							</form>
							</td><td style="vertical-align:middle;">
							<form action="login" method="get">
							<input type="hidden" name="action" value="categoryDelete" />	
							<input type="hidden" name="id" value="<%=category.getIdCategory()%>" />	
							<input type="submit" value="Delete" class="admin-button" style="padding: 9px;line-height: 10px;height: auto;"/>
							</form>
							</td></tr>
						
		<%}} %>	</table><br/>&nbsp;<br/>&nbsp;<br/>&nbsp;<br/>
                </div>
                
                
                
                
                
                	<!-- TAB 4 - MAN AND WOMAN SECTION -->
                <div id="tabs-4" style="text-align:justify;">
                	<table class="categories">
                	<% c = request.getAttribute("categories");
						for(Object current: (List)c){
							category = (Category)current;
								if(category.getSection().getUrl().equals("manAndWoman")){%>
						
							<tr style="height:40px;"><td style="width:270px;vertical-align:middle;">
							<h3 style="color:#777;font-size:15px;padding-left: 20px;">
								<%=category.getSection().getName() %> - <b><%=category.getName()%></b>
							</h3></td><td style="vertical-align:middle;">
							<form action="login" method="get">
							<input type="hidden" name="action" value="categoryEdit" />	
							<input type="hidden" name="id" value="<%=category.getIdCategory()%>" />		
							<input type="submit" value="Edit" class="admin-button" style="padding: 9px;line-height: 10px;height: auto;"/>
							</form>
							</td><td style="vertical-align:middle;">
							<form action="login" method="get">
							<input type="hidden" name="action" value="categoryDelete" />	
							<input type="hidden" name="id" value="<%=category.getIdCategory()%>" />	
							<input type="submit" value="Delete" class="admin-button" style="padding: 9px;line-height: 10px;height: auto;"/>
							</form>
							</td></tr>
						
		<%}} %>	</table><br/>&nbsp;<br/>&nbsp;<br/>&nbsp;<br/>
                </div>
                
                
                
                
                </div>
                </div>
</div>
<script type="text/javascript" src="js/tabulous.js"></script>
<script type="text/javascript">
	$(document).ready(function($) {
		$('#tabs').tabulous({
				effect: 'scale'
		});
	});
</script>












						
		<%} else {%>


<br/>&nbsp;<br/>
<h4>You are editing category:</h4><br/>
<span id="message" class="message" style="color:red;font-size:13px;"></span><br/>
<table>
<form action="login?action=saveProduct" method="post" id="saveProduct" style="margin-left:30px;">
	<input type="hidden" name="actionPost" value="saveProduct" />
	<input type="hidden" name="id" value="<%=product.getIdProduct() %>" />
	<tr><td style="width:150px;"><b>Name:</b></td><td><input type="text" id="name" name="name" value="<%=product.getName() %>" /></td></tr>
	<tr><td><b>Price:</b></td><td><input type="text" id="price" name="price" value="<%=product.getPrice() %>"/></td></tr>
	<tr><td><b>Description (html):</b></td><td><textarea id="description" name="description" style="padding: 10px;font-family:'Open Sans';width:450px;height:150px;margin-left:2px;"><%=product.getDescription() %></textarea></td></tr>
	<tr><td><b>Category / section:</b></td> <td>
	<select name="category" style="padding:0;padding-left:10px;">
					<% Object s = request.getAttribute("categories");
		for(Object current: (List)s){
			category = (Category)current;%>
					<option value="<%=category.getIdCategory()%>"<%if( category.getIdCategory()==product.getCategory().getIdCategory()){%> selected="selected"<%} %>><%=category.getName() %> - <%=category.getSection().getName() %></option>
					<%} %>
				</select><br/>&nbsp;<br/>
				</td></tr>
	<tr><td><b>Image URL:</b></td> <td>	<input id="imageUrl" name="imageUrl" style="width:350px;margin-left:2px;" type="text" value="<%=product.getImageUrl() %>"/><br/></td></tr>
	
			
	<tr><td> </td> <td><br/><input type="button" class="admin-button" value="Save" onClick="checkPass();submitForm();" /><br/></td></tr>
	</table>
	</form>
	
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
   		
	if(price.value.length < 3 || isNaN(price.value) || price.value.toString().indexOf('.') == -1 || price.value.toString().indexOf('.')+3 > price.value.length || price.value.length > price.value.toString().indexOf('.')+3 ) {
		price.style.backgroundColor = badColor; 
		price.style.color = "#fff";
		errorCount++;
		message.innerHTML += "Price field error! Empty or bad format. Correct format is with a dot inside. For example: 23.56</b><br/>";
	} else {
		price.style.backgroundColor = withoutColor;
   		price.style.color = "#9d9d9d";
   		}

	if(price.value.length > 7 ) {
		price.style.backgroundColor = badColor; 
		price.style.color = "#fff";
		errorCount++;
		message.innerHTML += "Price field error! Max price is 9999.99</b><br/>";
	} else {
		price.style.backgroundColor = withoutColor;
   		price.style.color = "#9d9d9d";
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
	
    if(errorCount>0) {}
  		 else {    
    		//document.getElementById('editUser').submit();
    		
    		}
    }
    
    
    
    function submitForm()
	{ 
	if(errorCount==0)
  		 document.getElementById('saveProduct').submit();
    } 
    
    
    </script>








		<%} %>	
</td>
</tr>
</table>
    
    
	</p>
<% 	}catch(Exception e){}%>


<jsp:include page="footer.jsp" />