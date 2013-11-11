package com.uc3.onlineStore.controller;

import entities.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
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

		if (request.getParameter("action") != null) {
			if (request.getParameter("action").equals("logout")) {
				session.invalidate();
				response.sendRedirect("/OnlineStore/login?action=loggedout");
				return;
			}
		}
		String pathInfo = request.getServletPath();
		String[] urlParsed = pathInfo.split("/");
		String url = "index", section = "";
		if (urlParsed.length >= 2)
			section = urlParsed[1];
		if (section.contains("login")) {
			url = "login";
		} else if (section.contains("registration")) {
			url = "registration";
			try {
				if (session.getAttribute("user") != null)
					url = "login";
			} catch (Exception e) {
			}
		}

		if (request.getParameter("action") != null) {
			if (request.getParameter("action").equals("edit")) {
				url = "userEdit";
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

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String pathInfo = request.getServletPath();
		String[] urlParsed = pathInfo.split("/");
		String url = "index", section = "";
		String mail = "";
		String action = "";
		Query query;
		List results;
		String password = "";
		EntityManagerFactory emf = Persistence
				.createEntityManagerFactory("OnlineStore_WEB");
		EntityManager em = emf.createEntityManager();
		boolean isLoginSession = false;
		if (urlParsed.length >= 2)
			section = urlParsed[1];

		if (section.equals("login")) {
			url = "login";

			try {
				if (session.getAttribute("logged").equals("yes")) {
					isLoginSession = true;
				}
			} catch (Exception e) {
			}

			/* CREATING LOGIN SESSION AND SENDING MESSAGES */
			if (!isLoginSession) {
				mail = request.getParameter("mail");
				password = request.getParameter("password");
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
							session.setAttribute("user", (User)user);
							session.setAttribute("login",
									((User)user).getEmail());
							session.setAttribute("logged", "yes");
							request.setAttribute("message", "okData");
						}
					}
				} catch (Exception e) {
				}

			}

			/* SAVING EDITED USER DATA */
			if (request.getParameter("action") != null) {
				if (request.getParameter("action").equals("save")) {
					String name = request.getParameter("name");
					String surname = request.getParameter("surname");
					String newEmail = request.getParameter("newEmail");
					String phone = request.getParameter("phone");
					String address = request.getParameter("address");
					String password2 = request.getParameter("password2");
					String password3 = request.getParameter("password3");

					EntityTransaction et = em.getTransaction();
					et.begin();
					String currentEmail = "";
					try {
						currentEmail = (String) session.getAttribute("login");
					} catch (Exception e) {
					}

					Query getUser = em
							.createQuery("SELECT u FROM User u WHERE u.email='"
									+ currentEmail + "'");
					results = getUser.getResultList();
					for (Object us : results) {
						User u = (User) us;
						u.setName(name);
						u.setSurname(surname);
						u.setEmail(newEmail);
						u.setPhone(phone);
						u.setAddress(address);
						if (password2 != null && password3 != null
								&& !password2.equals("")
								&& !password3.equals("")
								&& password2.equals(password3)
								&& password3.equals(password2)) {
							u.setPassword(password2);
						}
						session.setAttribute("user", (User) u);
						et.commit();
						em.close();
					}
				}

				/* CREATING NEW USER */
				if (request.getParameter("action").equals("newUser")) {
					EntityTransaction et = em.getTransaction();
					et.begin();
					String name = request.getParameter("name");
					String surname = request.getParameter("surname");
					String newEmail = request.getParameter("newEmail");
					String phone = request.getParameter("phone");
					String address = request.getParameter("address");
					String password2 = request.getParameter("password2");
					String password3 = request.getParameter("password3");

					Query maxId = em
							.createQuery("SELECT MAX(u.idUser) FROM User u");
					results = maxId.getResultList();
					int newId = 0;
					Iterator it = results.iterator();
					while (it.hasNext()) {
						newId = ((Integer) it.next()).intValue();
					}

					User u = new User();
					u.setIdUser(newId + 1);
					u.setName(name);
					u.setSurname(surname);
					u.setEmail(newEmail);
					u.setPhone(phone);
					u.setAddress(address);

					if (password2 != null && password3 != null
							&& !password2.equals("") && !password3.equals("")
							&& password2.equals(password3)
							&& password3.equals(password2)) {
						u.setPassword(password2);
					}
					em.persist(u);
					et.commit();
					em.close();
					request.setAttribute("message", "okData");
					url = "login";
				}
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
