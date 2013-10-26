<jsp:include page="header.jsp" />
<jsp:include page="adminSidemenu.jsp" />



<div id="shadowing"></div>
<div id="box"></box>
    <span id="boxtitle"></span>
    <form method="GET" action="lightbox-form-test.html" >
    <table border="0" cellpadding="5" cellspacing="15">
       <tr><td><h4>Name</td><td><input id="TextName" name="Name" class="field" type="text" size="30"></h4></td></tr>
       <tr><td><h4>Section</td><td><select name="sections">
					<option> Coat </option>
					<option> Shirt </option>
					<option> Polo </option>
					<option> Jeans </option>
					<option> Dress </option>
					<option> Shoes </option>
		</select></h4></td></tr>
       <tr><td><h4>Category</td><td><select name="categories">
					<option> Young </option>
					<option> Women and Men </option>
					<option> Sports </option>
					<option> Kids </option>
		</select></h4></td></tr>
       <tr><td><h4>Description</td><td><TEXTAREA NAME="TextDescription" name="Description" class="field" style="width:400px;height:150px;"></TEXTAREA></h4></td></tr>
		<tr><td><h4>Price</td><td><input id="TextPrice" name="Price" type="text" style="width:70px;"> Euro</h4></td></tr>
		<tr><td><h4>Image</td><td></h3><input id="Image" name="Image" type="file" size="30"/></h4></td> </tr> 
<tr><td>	<br/>&nbsp;<br/>
<input type="button" name="cancel" value="Cancel" class="admin-button" >
<input type="button" name="submit" value="Submit" class="admin-button" onclick="submit">    </td></tr>
</table>         
    </form>
    </div>


<jsp:include page="footer.jsp" />

