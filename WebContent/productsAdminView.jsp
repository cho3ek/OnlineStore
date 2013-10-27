
<jsp:include page="header.jsp" />
</head>


<jsp:include page="adminSidemenu.jsp" />


	<h2 style="margin-bottom:40px;">Products</h2>	
<input type="submit" class="admin-button" onclick="document.location='addProductForm.jsp';return false;" value="Add new product" style="position:absolute;margin-top:-80px;margin-left:200px;" />
<table id="products-admin">

<tr><td><img src="images/kids/pantsb1.jpg" width="94" height="65" alt="" /></td>
<td>T-shirt nr 1</td>
<td class="tdbutton"><input type="submit" class="admin-button" value="Edit" onclick="document.location='addProductForm.jsp';return false;" /></td>
<td class="tdbutton"><input type="submit" class="admin-button" value="Delete" /></td></tr>

<tr><td><img src="images/kids/pantsb2.jpg" width="94" height="65" alt="" /></td>
<td>T-shirt nr 2</td>
<td class="tdbutton"><input type="submit" class="admin-button" value="Edit" onclick="document.location='addProductForm.jsp';return false;" /></td>
<td class="tdbutton"><input type="submit" class="admin-button" value="Delete" /></td></tr>

<tr><td><img src="images/kids/pantsb3.jpg" width="94" height="65" alt="" /></td>
<td>T-shirt nr 3</td>
<td class="tdbutton"><input type="submit" class="admin-button" value="Edit" onclick="document.location='addProductForm.jsp';return false;" /></td>
<td class="tdbutton"><input type="submit" class="admin-button" value="Delete" /></td></tr>
</table>

<jsp:include page="footer.jsp" />
