<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <jsp:include page="header.jsp" />
    <%@page import="entities.Product"%>	
<%@ page import="java.util.*" %>
<jsp:useBean id="product"  scope="request" class="entities.Product" />
		
			<div id="my-mainbody-columns" class="with-menu">

<h2>Search results: <span style="font-size:24px;"></h2><br/>
You are searching for keyword:&nbsp;&nbsp;&nbsp;<big><b><%=request.getParameter("keyword") %></b></big><br/>&nbsp;<br/>	

	<ul class="results">
	
	<% Object d = request.getAttribute("searchResults");
	for(Object current: (List)d){
		product = (Product)current;%>
		
		<a href="/OnlineStore/product?id=<%=product.getIdProduct()%>" class="product-overlay">
		<li class="product">									
						
							<img width="104" src="<%=product.getImageUrl()%>" style="float:left;padding-right:30px;" alt="">
								<h4 style="margin-top:15px;"><%=product.getName()%></h4>
							<span class="price" style="font-size:14px;">€ <%=product.getPrice()%></span>
							<h4 style="font-size:12px;margin-top:15px;">Section: &nbsp;&nbsp;<%=product.getCategory().getSection().getName()%></h4>
							
		</li>		</a>
		<%} %>	
		
				</ul>
				
	
				
				
			</div>
<jsp:include page="footer.jsp" />