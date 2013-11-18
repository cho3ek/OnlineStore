<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <jsp:include page="header.jsp" />
    <%@page import="entities.Product"%>				
<%@page import="entities.Category"%>			
<%@page import="entities.Section"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="product"  scope="request" class="entities.Product" />
<jsp:useBean id="category"  scope="request" class="entities.Category" />
<jsp:useBean id="section"  scope="request" class="entities.Section" />


<img src="images/main_kids.jpg" alt="" style="margin-top:-40px;margin-bottom:40px;" /><br/>
<jsp:include page="sidemenu.jsp" />

<%if(category.getName()!=null) {%>
<div style="margin-left:530px;position:absolute;">			
		Sorting: <select id="sort" onChange="sortApply()" style="padding:0;">
		  
		  <option id="nameUp" value="nameUp">Name: A-Z</option>
		  <option id="nameDown" value="nameDown">Name: Z-A</option>
		  <option id="priceUp" value="priceUp">Price: Low to High</option>
		  <option id="priceDown" value="priceDown">Price: High to Low</option>
		</select>
	</div>	
<h3 class="box-title" style="margin-bottom:40px;margin-left:30px;"><%=category.getName()%></h3>
	
		
				<ul class="products">
	
			
<% Object d = request.getAttribute("products");
	for(Object current: (List)d){ product = (Product)current;%>
<!-- IF WE HAVE ATTRIBUTE "PRODUCTS" SENT BY SERVLET WE DISPLAY PRODUCTS IN CATEGORY -->		
		<li class="product">									
			<a href="/OnlineStore/product?id=<%=product.getIdProduct()%>" class="product-overlay">
				<img width="234" height="345" src="<%=product.getImageUrl()%>" alt="">
				<h3><%=product.getName()%></h3>
							<span class="price">€ <%=product.getPrice()%></span>
			</a>
		</li>		
		<%} %>	
		
				</ul>
				
	<%} else { %>
	<!-- OTHERWISE WE DISPLAY ALL PRODUCT OF CHOSEN SECTION -->
	
	<p>All products of this section:</p><br/>
	
	
	<% 	Object c = request.getAttribute("productsSection");
	for(Object actual: (List)c){ product = (Product)actual;%>
		
		<div style="float:left;">
			<a style="font-size:11px;" href="/OnlineStore/product?id=<%=product.getIdProduct() %>" title="<%=product.getName() %>, € <%=product.getPrice() %>">
				<img src="<%=product.getImageUrl() %>" class="small-image" />
				<div style="position:absolute;margin-top:-45px;opacity:0.7;margin-left:15px;background-color:#000;color:#fff;padding:4px;">€ <%=product.getPrice() %></div>
				<br/>&nbsp;<br/>
			</a>
		</div>
		
		<% } }%>
		
		
		<br/>&nbsp;<br/>
		</div>
<jsp:include page="footer.jsp" />