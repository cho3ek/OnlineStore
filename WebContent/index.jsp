<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <jsp:include page="header.jsp" />
    <%@page import="entities.Product"%>	
<%@ page import="java.util.*" %>
<jsp:useBean id="product"  scope="request" class="entities.Product" />

<div id="my-mainbody-columns" class="my-content-no-sidebar">			
<section id="my-mainbody">
<div id="widget_my_news_blocks-2" class="box  widget_my_news_bolocks">
					<div class="my-news-blocks active" data-cols="2">
						
							<figure class="inverse">
								<img src="images/main_page/young_fashion.jpg" alt="Young Fashion">
								<a href="/OnlineStore/young"><div class="my-img-overlay"></div></a>
								<figcaption>
									<h3>
										<strong>Young</strong> fashion
									</h3>
									<a href="/OnlineStore/young" title="Young Fashion" class="my-image show  active">More details</a>
								</figcaption>
							</figure>
						
							<figure>
								<img src="images/main_page/sportswear.jpg" alt="Sportswear">
								<a href="/OnlineStore/sports"><div class="my-img-overlay"></div></a>
								<figcaption>
									<h3><strong>Sports</strong>wear</h3>
									<a href="/OnlineStore/sports" title="Sportswear" class="my-image show  active">More details</a>
								</figcaption>
							</figure>
							<figure>
								<img src="images/main_page/kids_clothing.jpg" alt="Kids Clothing">
								<a href="/OnlineStore/kids"><div class="my-img-overlay"></div></a>
								<figcaption>
									<h3><strong>Kids</strong> Clothing</h3>
									<a href="/OnlineStore/kids" title="Kids Clothing" class="my-image show ">More details</a>
								</figcaption>
							</figure>
							<figure class="inverse">
								<img src="images/main_page/man_and_woman.jpg" alt="Man & Woman fashion">
								<a href="/OnlineStore/manAndWoman"><div class="my-img-overlay"></div></a>
								<figcaption>
									<h3><strong>Man & Woman</strong></h3>
									<a href="/OnlineStore/manAndWoman" title="Man & Woman fashion" class="my-image show ">More details</a>
								</figcaption>
							</figure>
						</div>
					</div>
					
					
					<br/>&nbsp;<br/>
					<h2>Bestsellers</h2><br/>
					<ul class="results">	
					<% Object d = request.getAttribute("bestSellers");
	for(Object current: (List)d){
		product = (Product)current;%>
		
		<a href="/OnlineStore/product?id=<%=product.getIdProduct()%>" class="product-overlay">
		<li class="product">									
						
							<img width="104" src="<%=product.getImageUrl()%>" style="float:left;padding-right:30px;" alt="">
								<h4 style="margin-top:15px;"><%=product.getName()%></h4>
							<span class="price" style="font-size:14px;">€ <%=product.getPrice()%></span>
							<h4 style="font-size:12px;margin-top:15px;">Section: &nbsp;&nbsp;<%=product.getCategory().getSection().getName()%></h4>
							
		</li>		</a>
		<%} %>	</ul>
		
				</section>
			</div>

<jsp:include page="footer.jsp" />