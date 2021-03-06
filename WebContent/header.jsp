<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>			
<%@page import="entities.User"%>	
<%@ page import="java.util.*" %>
<jsp:useBean id="user" scope="request" class="entities.User" />

    <!DOCTYPE html 
      PUBLIC "-//W3C//DTD HTML 4.01//EN"
      "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
	<title>UC3M - Online Store - Computing Technologies for the Web</title>
	<meta charset="UTF-8">
	<meta name="description" content="">
	<link rel="stylesheet" href="css/template.css">
	<link href="http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300" rel="stylesheet" type="text/css">
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,600,700" rel="stylesheet" type="text/css">


 <!-- TABS FOR ADMIN EDIT PRODUCTS AND CATEGORIES -->  
   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<link href='css/tabs.css' rel='stylesheet' type='text/css'>


   
<script type="text/javascript">
    function sortApply(){ //js to add to url &sort=... if it doesn't exist, or change if exists
    	var url = window.location;
    	var index = (window.location.href).indexOf("&sort");
    	if(index!=-1) {
        	url = (window.location.href).substr(0,index);
		}
        var option = document.getElementById("sort").value;
        
        if(option == "priceUp"){
            window.location = url+"&sort=priceUp";
        } else  if(option == "priceDown"){
            window.location = url+"&sort=priceDown";
        } else  if(option == "nameUp"){
            window.location = url+"&sort=nameUp";
        } else  if(option == "nameDown"){
            window.location = url+"&sort=nameDown";
        }
    }
    
    function setSortType(){ //after choosing a type of sorting it shoul be selected in the list
    	var select = document.getElementById("sort");
        var i;
        for(i=0; i<select.options.length; i++){
           if(((window.location.href).indexOf(select.options[i].value))>0){
           		var opt = document.getElementById(select.options[i].value);
           		opt.selected = true;
    			return;
    			//alert("yes");
           }
        }
    
    }
</script>

	<style type="text/css">
		body, html, body button, body input, #main-menu .sub-menu li { font-family: 'Roboto Condensed'; }
		h1,h2,h3,h4,h5,h6, #main-menu > li,
		.my-popup h3 { font-family: 'Open Sans'; }
		#my-mainbody-columns > section { width: 100%; }			
		@media (min-width: 1031px) {
		#my-mainmenu-collapse { height: auto!important; }
			}
	</style>
</head>

<body class="home" onload="setSortType()">
	<div class="my-page-wrapper my-page">
		<header id="my-head" class="my-absolute-head">
			<div id="main-menu"></div>						
			<!--logo header-->
			<h2><a href="/OnlineStore/home" class="cssLogo">UC3Mshop</small></a></h2>
			
				
				
	<%boolean logged = false; %>
	<%try{
	if(session.getAttribute("logged").toString().equals("yes")) { 
			logged = true;
			user = (User)session.getAttribute("user"); %>
			
			<ul id="top-menu" class="menu my_normal">
			<li><p style="margin: 0 10px 0 14px;color:#888;">Hello <b><%=user.getName() %> <%=user.getSurname() %></b>!</p></li>
			<li><a href="login">Your account</a></li>
			<li><a href="/OnlineStore/cart">Your cart</a></li>
			<li><a href="login?action=logout"><b>Logout</b></a></li>
	<% 	}}catch(Exception e){}%>
	
	<%if(!logged){ %>
	<ul id="top-menu" class="menu my_normal">
	<li><a href="/OnlineStore/cart">Your cart</a></li>
	<li><a href="/OnlineStore/registration">Registration</a></li>
	<li><a href="/OnlineStore/login">Login</a></li>
		<%} %>
		
			</ul>			
			<!-- search form header -->
			<div id="my-search">
				<div id="search-3" class="box widget_search">
					<form method="get" id="searchform" action="search">
						<label for="s">Search</label>
						<input type="text" class="field" name="keyword" id="s" placeholder="Search" value="">
						<input type="submit" id="searchsubmit" value="Search">
					</form>
				</div>	
			</div>

			<ul id="main-menu" class="menu my_normal">
				<li class="linkk"><a href="/OnlineStore/home">Home</a></li>
				<li class="linkk"><a href="/OnlineStore/young">Young fashion</a></li>
				<li class="linkk"><a href="/OnlineStore/sports">Sportswear</a></li>
				<li class="linkk"><a href="/OnlineStore/kids">Kids clothing</a></li>
				<li class="linkk"><a href="/OnlineStore/manAndWoman">Man & woman fashion</a></li>
				<li class="linkk"><a href="/OnlineStore/informations">Informations</a></li>
			</ul>
		</header>




		<div class="my-page-wrap">	
		<div style="clear:both;height:210px;"></div>
