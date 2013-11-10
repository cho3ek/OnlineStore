package com.uc3.onlineStore.controller;
import entities.*;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.*;
import javax.servlet.http.*;

import com.ibm.compat.c;

import java.io.*;
import java.util.*;
//import javax.servlet.annotation.WebServlet;


//@WebServlet(name="SectionsController", loadOnStartup = 1, urlPatterns = {"/category","/young","/manAndWoman","/kids","/sports","informations"})


public class SectionsController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private boolean debug = false;

    /**
     * @see HttpServlet#HttpServlet()
     */
    
    
    public SectionsController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    /**
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    String pathInfo = request.getServletPath();
	String[] urlParsed= pathInfo.split("/");
	String url="index", section = "";

	if (debug) {System.out.println("pathInfo: "+pathInfo);}
    
	EntityManagerFactory emf = 
	Persistence.createEntityManagerFactory("OnlineStore_WEB"); 
	EntityManager em = emf.createEntityManager(); 
	int idProductGet = 0;
	int idCategoryGet = 0;
	Query query;
    List results;
    
    
	if (urlParsed.length >= 2) section = urlParsed[1];

       
	if (section.contains("manAndWoman")) {
            url = "manAndWoman";
        } else if (section.contains("kids")) {
            url = "kids";  
		} else if (section.contains("category")) {
		    url = "category";
		} else if (section.contains("sports")) {
		    url = "sports";
		} else if (section.contains("young")) {
		    url = "young";
		} else if (section.contains("informations")) {
		    url = "informations";
		} else if (section.contains("product")) {
		    url = "product";
/*  ---------------------
 *  IN PRODUCT -------> current product entity
 *  -------------------- */
		    if(request.getParameter("id") != null) {
		    	idProductGet = Integer.parseInt(request.getParameter("id"));
		    }
		    query = em.createQuery("SELECT p FROM Product p WHERE p.idProduct="+idProductGet);
		    results = query.getResultList();
		    if (results == null) {request.setAttribute("product", "");}
		    else {
			    for (Object prod : results) { 
			    	request.setAttribute("product", (Product)prod);
			   	} 
		    }
		}
        
	
	/*  ---------------------
	 *  JPA comparators (normal Java don't work for JPA)
	 *  -------------------- */
	String comparator="";
	String sort = "";
	if(request.getParameter("sort") != null) {
		sort = (String)request.getParameter("sort");
		if(sort.equals("priceDown")){
			comparator = " ORDER BY p.price DESC";
	    } else if(sort.equals("priceUp")){
	    	comparator = " ORDER BY p.price";
	    } else if(sort.equals("nameDown")){
	    	comparator = " ORDER BY p.name DESC";
	    } else if(sort.equals("nameUp")){
	    	comparator = " ORDER BY p.name";
	    }
	 }
	
	
	
    
	/*  ---------------------
	 *  current section as entity
	 *  -------------------- */
    
    try{
	    query = em.createQuery("SELECT s FROM Section s WHERE s.url='"+url+"'");
	    Object sec = query.getSingleResult();
	    if (sec == null) {request.setAttribute("section", "");}
	    else {
		    	request.setAttribute("section", sec);
	    }
    }
    catch(Exception e){}
    
    
    
    
    /*  ---------------------
	 *  current category as entity
	 *  -------------------- */
    if(request.getParameter("catId") != null) {
    	idCategoryGet = Integer.parseInt(request.getParameter("catId"));
    }
    try{
	    query = em.createQuery("SELECT c FROM Category c WHERE c.idCategory="+idCategoryGet);
	    Object cat = query.getSingleResult();
	    if (cat == null) {request.setAttribute("category", "");}
	    else {
		    	request.setAttribute("category", cat);
	    }
    }
    catch(Exception e){}
	
    
    
	
    /*  ---------------------
	 *  list of all products of category as entity
	 *  -------------------- */
	
	
    query = em.createQuery("SELECT p FROM Product p WHERE p.category.idCategory="+idCategoryGet + comparator);
    
    results = query.getResultList();
    if (results == null) {request.setAttribute("products", "");}
    else {
	    	request.setAttribute("products", results);
    }
    
    /*  ---------------------
	 *  list of all products of section as entity
	 *  -------------------- */
	
    query = em.createQuery("SELECT p FROM Product p WHERE p.category.section.url='"+url+"'");
    results = query.getResultList();
    if (results == null) {request.setAttribute("productsSection", "");}
    else {
	    	request.setAttribute("productsSection", results);
    }
    
    
    
	
    /*  ---------------------
	 *  list of all categories as entity
	 *  -------------------- */
    
    query = em.createQuery("SELECT c FROM Category c WHERE c.section=(SELECT s FROM Section s WHERE s.url='"+url+"')");
    results = query.getResultList();
    int index = 1;
    if (results.size()<1) {
    	Query maxIdobjectQuery = em.createQuery("SELECT c.section.idSection FROM Category c WHERE c.products=(SELECT p FROM Product p WHERE p.idProduct="+idProductGet+")");
    	results = maxIdobjectQuery.getResultList();
    	int newId = 0;
    	Iterator it = results.iterator();
    	while (it.hasNext()){
    		newId = ((Integer) it.next()).intValue();
    	}
    	maxIdobjectQuery = em.createQuery("SELECT c FROM Category c WHERE c.section.idSection="+newId);
    	results = maxIdobjectQuery.getResultList();
    	request.setAttribute("categories", results);
    }
    else {
    	 request.setAttribute("categories", results);
	   	} 
  
    
    
    
	
    
    em.close();  // closing connection with database
	url = "/" + url + ".jsp";  // use RequestDispatcher to forward request internally
	
	try {
	    this.getServletContext().getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
	    if(debug) System.out.println("Exception: " + e.getMessage());
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            return;
	}
    }

    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

        String userPath = request.getServletPath();

        // if addToCart action is called
        if (userPath.equals("/addToCart")) {
            // TODO: Implement add product to cart action

	    // if updateCart action is called
        } else if (userPath.equals("/updateCart")) {
            // TODO: Implement update cart action

	    // if purchase action is called
        } else if (userPath.equals("/purchase")) {
            // TODO: Implement purchase action

            userPath = "/confirmation";
        }

        // use RequestDispatcher to forward request internally
        String url = "/WebContent/" + userPath + ".jsp";

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
  
  
}

