<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/template.css">
<title>Form</title>
<script>
function openbox(formtitle, fadin)
{
  var box = document.getElementById('box'); 
  document.getElementById('filter').style.display='block';
  
  var btitle = document.getElementById('boxtitle');
  btitle.innerHTML = formtitle;
  
  if(fadin)
  {
	 gradient("box", 0);
	 fadein("box");
  }
  else
  { 	
    box.style.display='block';
  }  	
}

</script>
</head>
<body>
<div class="my-page-wrapper my-page">


<div id="shadowing"></div>
<div id="box"></box>
    <span id="boxtitle"></span>
    <form method="GET" action="lightbox-form-test.html" >
    <table border="0" cellpadding="5" cellspacing="15">
       <tr><td><h4>Name</td><td><input id="TextName" name="Name" class="field" type="text" size="30"></h4></td></tr>
       <tr><td><h4>Section</td><td><select multiple="multiple" name="sections">
					<option> Coat </option>
					<option> Shirt </option>
					<option> Polo </option>
					<option> Jeans </option>
					<option> Dress </option>
					<option> Shoes </option>
		</select></h4></td></tr>
       <tr><td><h4>Category</td><td><select multiple="multiple" name="categories">
					<option> Young </option>
					<option> Women and Men </option>
					<option> Sports </option>
					<option> Kids </option>
		</select></h4></td></tr>
       <tr><td><h4>Description</td><td><TEXTAREA NAME="TextDescription" name="Description" class="field" ROWS=3 COLS=30 >
				</TEXTAREA></h4></td></tr>
		<tr><td><h4>Price</td><td><input id="TextPrice" name="Price" type="text" size="30"/></h4></td></tr>
		<tr><td><h4>Image</td><td></h3><input id="Image" name="Image" type="file" size="30"/></h4></td> </tr> 
	</table>             
    </form>
    
<input type="button" name="cancel" value="Cancel" onclick="closebox()">
<input type="button" name="submit" value="Submit" onclick="submit">
</div>
</div>

</body>
</html>