<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>			
    <%@page import="entities.Product"%>				
<%@page import="entities.User"%>				
<%@page import="entities.Category"%>			
<%@page import="entities.Product"%>			
<%@page import="entities.Section"%>		
<%@ page import="java.util.*" %>
<jsp:useBean id="category"  scope="request" class="entities.Category" />
<jsp:useBean id="user"  scope="request" class="entities.User" />
<jsp:useBean id="product"  scope="request" class="entities.Product" />
<jsp:useBean id="section"  scope="request" class="entities.Section" />


<jsp:include page="header.jsp" />






<!-- IF WE ARE LOGGED IN AS ADMIN -->
<%try{
	if(session.getAttribute("loggedAdmin").toString().equals("yes")) { %>
	<p style="text-align:left;font-size:18px;">
	<% user = (User)session.getAttribute("user");%>
	<table>
	<tr><td><h3>Hello <%=user.getName() %> <%=user.getSurname() %>!</h3></td>
	<td><form action="login" method="get" style="margin-left:30px;">
	<input type="submit" value="Go back to your account" class="admin-button" />
	</form></td><td>
	<form action="login" method="get" style="margin-left:30px;">
	<input type="hidden" name="action" value="categoryEdit"/>
	<input type="submit" value="Go back to categories list" class="admin-button" />
	</form></td><td>
	<form action="login" method="get" style="margin-left:30px;">
	<input type="hidden" name="action" value="logout"/>
	<input type="submit" value="Logout" class="admin-button" />
	</form></td></tr></table>
	
	
	<!--  WE SHOW THE TABLE WITH ALL PRODUCTS ONLY IF WE DON'T HAVE A PRODUCT CHOSEN -->

<br/>&nbsp;<br/>


<br/>&nbsp;<br/>
<h4>You are editing category:</h4><br/>
<span id="message" class="message" style="color:red;font-size:13px;"></span><br/>
<table>
<form action="login?action=categoryAdd" method="post" id="categoryAdd" style="margin-left:30px;">
	<input type="hidden" name="actionPost" value="categoryAdd" />
	<tr><td style="width:150px;"><b>Name:</b></td><td><input type="text" id="name" name="name" value="" /></td></tr>
	<tr><td><b>Section:</b></td> <td>
	<select name="section" style="padding:0;padding-left:10px;">
					<% Object s = request.getAttribute("sections");
		for(Object current: (List)s){
			section = (Section)current;%>
					<option value="<%=section.getIdSection()%>"><%=section.getName() %></option>
					<%} %>
				</select><br/>&nbsp;<br/>
				</td></tr>
	
			
	<tr><td> </td> <td><input type="button" class="admin-button" value="Add this category" onClick="checkPass();submitForm();" /><br/></td></tr>
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
	message.innerHTML = ""; 
	
	if(name.value.length < 3) {
		name.style.backgroundColor = badColor; 
		name.style.color = "#fff";
		errorCount++;
		message.innerHTML += "Name field error! Minimum <b>2 signs!</b><br/>";
	} else {
		name.style.backgroundColor = withoutColor;
   		name.style.color = "#9d9d9d";
   		}
   		
	
	
    if(errorCount>0) {}
  		 else {    
    		//document.getElementById('editUser').submit();
    		
    		}
    }
    
    
    
    function submitForm()
	{ 
	if(errorCount==0)
  		 document.getElementById('categoryAdd').submit();
    } 
    
    
    </script>








		<%} %>	
</td>
</tr>
</table>
    
    
	</p>
<% 	}catch(Exception e){}%>


<jsp:include page="footer.jsp" />