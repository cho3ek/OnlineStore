package com.uc3.onlineStore.controller;

import entities.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;
import java.util.*;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 2L;
	private boolean debug = true;
	HttpSession session;

	public LoginController() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("logout") != null) {
			session.invalidate();
			response.sendRedirect("/OnlineStore/login?log=out");
			return;
		}
		String pathInfo = request.getServletPath();
		String[] urlParsed = pathInfo.split("/");
		String url = "index", section = "";
		if (urlParsed.length >= 2)
			section = urlParsed[1];
		if (section.contains("login")) {
			url = "login";
		}
		url = "/" + url + ".jsp";
		try {
			this.getServletContext().getRequestDispatcher(url)
					.forward(request, response);
		} catch (Exception e) {
			if (debug)
				System.out.println("Exception: " + e.getMessage());
			request.getRequestDispatcher("/index.jsp").forward(request,
					response);
			return;
		}
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String pathInfo = request.getServletPath();
		String[] urlParsed = pathInfo.split("/");
		String url = "index", section = "";
		String mail = "";
		Query query;
		String password = "";
		EntityManagerFactory emf = Persistence
				.createEntityManagerFactory("OnlineStore_WEB");
		EntityManager em = emf.createEntityManager();
		if (urlParsed.length >= 2)
			section = urlParsed[1];

		if (section.contains("login")) {
			url = "login";
		}
			mail = request.getParameter("mail");
			password = request.getParameter("password");
			if (mail == null || mail == "" || password == null
					|| password == "") {
				request.setAttribute("message", "noData");
			} else {
				request.setAttribute("message", "wrongData");
				try {
					query = em
							.createQuery("SELECT u FROM User u WHERE u.email='"
									+ mail + "' AND u.password='" + password
									+ "'");
					List u = query.getResultList();
					if (u != null) {
						for (Object user : u) {
							session = request.getSession();
							session.setAttribute("user", (User) user);
							session.setAttribute("logged", "yes");
							request.setAttribute("message", "okData");
						}
					}
				} catch (Exception e) {
				}
			}
			url = "/" + url + ".jsp";
			try {
				this.getServletContext().getRequestDispatcher(url)
						.forward(request, response);
			} catch (Exception e) {
				if (debug)
					System.out.println("Exception: " + e.getMessage());
				request.getRequestDispatcher("/index.jsp").forward(request,
						response);
				return;
			}
		

	}

}
