<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator</title>
<jsp:include page="adminHeaderU.jsp" />
</head>



<table border="0" width="99%" cellpadding="4"> 

            <tr> 
            <td width="20%" valign="top"> 
<jsp:include page="adminSidemenu.jsp" />
</td> 
  
  
<td width="80%" valign="top"> 
	


<div class="title">
	<h2>Users</h2>	
</div>
 <ol type="1" class="lista">
 <li><h4><img src="images/userImage.jpg" width="94" height="65" alt="" />	John Smith  <input style="float:right" type="checkbox" name="product" value="select"></h4></li><hr>
 <li><h4><img src="images/userImage.jpg" width="94" height="65" alt="" />	Tom Strassner <input style="float:right" type="checkbox" name="product" value="select"></h4></li><hr>
 <li><h4><img src="images/userImage.jpg" width="94" height="65" alt="" />	Karol Cholody <input style="float:right" type="checkbox" name="product" value="select"></h4></li><hr>
 <li><h4><img src="images/userImage.jpg" width="94" height="65" alt="" />	Cristian Ayerbe <input style="float:right" type="checkbox" name="product" value="select"></h4></li><hr>
 <li><h4><img src="images/userImage.jpg" width="94" height="65" alt="" />	Sonia Rodriguez <input style="float:right" type="checkbox" name="product" value="select"></h4></li><hr>
</ol>


<jsp:include page="footer.jsp" />
</body>
</html>