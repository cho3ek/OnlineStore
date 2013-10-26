<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator</title>
<jsp:include page="header.jsp" />
</head>


<jsp:include page="adminSidemenu.jsp" />


	<h2 style="margin-bottom:40px;">Users</h2>	
<input type="submit" class="admin-button" value="Delete selected" style="position:absolute;margin-top:-80px;margin-left:180px;" />
<table id="products-admin">

<tr>
<td><img src="images/userImage.jpg" width="94" height="65" alt="" /></td>
<td>Cristian Ayerbe</td>
<td class="tdbutton"><input style="float:right" type="checkbox" name="product" value="select"></td>
</tr>
<tr>
<td><img src="images/userImage.jpg" width="94" height="65" alt="" /></td>
<td>Sonia Rodriguez</td>
<td class="tdbutton"><input style="float:right" type="checkbox" name="product" value="select"></td>
</tr>
<tr>
<td><img src="images/userImage.jpg" width="94" height="65" alt="" /></td>
<td>Karol Cholody</td>
<td class="tdbutton"><input style="float:right" type="checkbox" name="product" value="select"></td>
</tr>
<tr>
<td><img src="images/userImage.jpg" width="94" height="65" alt="" /></td>
<td>Tom Strassner</td>
<td class="tdbutton"><input style="float:right" type="checkbox" name="product" value="select"></td>
</tr>

</table>

<jsp:include page="footer.jsp" />
