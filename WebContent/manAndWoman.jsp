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


<img src="images/main_man_woman.jpg" alt="" style="margin-top:-40px;margin-bottom:40px;" /><br/>
<jsp:include page="sidemenu.jsp" />

<%if(category.getName()!=null) {%>
<h3 class="box-title" style="margin-bottom:40px;margin-left:30px;"><%=category.getName()%></h3>
				<ul class="products">
	
			
<% Object d = request.getAttribute("products");
	for(Object current: (List)d){
		product = (Product)current;%>
		
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
	
	
	<p>All products of this section:</p><br/>
	
	
	<% 	Object c = request.getAttribute("productsSection");
	for(Object actual: (List)c){
		product = (Product)actual;
		%>
		<a href="/OnlineStore/product?id=<%=product.getIdProduct() %>" title="<%=product.getName() %>, € <%=product.getPrice() %>">
			<img src="<%=product.getImageUrl() %>" class="small-image">
		</a>
		
		<%
		} %>
		
		<br/>&nbsp;<br/>
		
	
	<%} %>
			</div>
<jsp:include page="footer.jsp" />