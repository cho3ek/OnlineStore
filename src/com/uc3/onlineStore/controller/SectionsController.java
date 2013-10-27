package com.uc3.onlineStore.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class SectionsController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private boolean debug = true;

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
    
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

        String userPath = request.getPathInfo();
	String[] urlParsed = userPath.split("/");
	String url;
	

	if (debug) {System.out.println(userPath);System.out.println(urlParsed[0]); System.out.println(urlParsed[1]);}

        if (userPath.equals("/manWomen")) {
            
        } else if (userPath.equals("/kids")) {
            
	} else if (userPath.equals("/category")) {
          
	} else if (userPath.equals("/sports")) {

	} else if (userPath.equals("/YoungMain")) {

	}

        // use RequestDispatcher to forward request internally
	url = userPath + ".jsp";
	
	try {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } catch (Exception e) {
	    if(debug) System.out.println("Exception: " + e.getMessage());
            this.getServletContext().getRequestDispatcher("index.jsp").forward(request, response);
            return;
	}
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

