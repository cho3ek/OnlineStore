<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <div id="sidemenu" style="float: left;margin-right: 40px;">
<ul>
<%@page import="entities.Category"%>
<%@page import="entities.Product"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="product"  scope="request" class="entities.Product" />
<jsp:useBean id="category"  scope="request" class="entities.Category" />

<% 	Object c = request.getAttribute("categories");
	for(Object actual: (List)c){
		category = (Category)actual;
		%>
		
		<li class='active'><a href='<%=category.getSection().getUrl()%>?catId=<%=category.getIdCategory()%>'><span><%=category.getName()%></span></a></li>
<%	}
 %>
 


   
     
</ul>
</div>
			<div id="my-mainbody-columns" class="with-menu">