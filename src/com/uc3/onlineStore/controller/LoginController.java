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
import java.math.BigDecimal;
import java.util.*;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 2L;
	private boolean debug = true;
	HttpSession session;
	Query query;
	List results;

	

	public LoginController() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		if (request.getParameter("action") != null) {
			if (request.getParameter("action").equals("logout")) {
				session.invalidate(); // we destroy a session when logging out and redirecting to login page
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
			else if (request.getParameter("action").equals("productEdit")) {
				url = "productEdit";
				getAllProductsForAdminEdit(request);
				getProductForAdminEdit(request);
				getCategoriesForAdminEdit(request);
			} 
			else if (request.getParameter("action").equals("productDelete")) {
				url = "productDelete";
				getProductForAdminEdit(request);
			}
			else if (request.getParameter("action").equals("categoryEdit")) {
				url = "categoryEdit";
				getCategoriesForAdminEdit(request);
			}
			else if (request.getParameter("action").equals("categoryDelete")) {
				url = "categoryDelete";
				getCategoryForAdminEdit(request);
				getNumberOfProductsForAdminEdit(request);
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
		String password = "";

		EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineStore_WEB");
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
							if(((User)user).getAdminRights() != 0){
								session.setAttribute("loggedAdmin", "yes");	
							}
							request.setAttribute("message", "okData");
						}
					}
					em.close();
				} catch (Exception e) {
				}

			}

			/* SAVING EDITED USER DATA */
			if (request.getParameter("actionPost") != null) {
				if (request.getParameter("actionPost").equals("save")) {
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

					Query saveUser = em
							.createQuery("SELECT u FROM User u WHERE u.email='"
									+ currentEmail + "'");
					results = saveUser.getResultList();
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
				
				/* SAVING EDITED PRODUCT */
				if (request.getParameter("actionPost") != null) {
					if (request.getParameter("actionPost").equals("saveProduct")) {
						String name = request.getParameter("name");
						String price = request.getParameter("price");
						String stock = request.getParameter("stock");
						String description = request.getParameter("description");
						String categoryId = request.getParameter("category");
						String imageUrl = request.getParameter("imageUrl");
						Category category = null;

						emf = Persistence.createEntityManagerFactory("OnlineStore_WEB");
						em = emf.createEntityManager();
						query = em.createQuery("SELECT c FROM Category c WHERE c.idCategory="+categoryId);
						results = query.getResultList();
						if (results == null) {
							request.setAttribute("categories", "");
						} else {
							for(Object pr: results){
								category = (Category)pr;
							}
						}
						em.close();
						em = emf.createEntityManager();
						
						EntityTransaction et = em.getTransaction();
						et.begin();
						Query saveProduct = em
								.createQuery("SELECT p FROM Product p WHERE p.idProduct="
										+ request.getParameter("id"));
						results = saveProduct.getResultList();
						for (Object pr : results) {
							Product p = (Product) pr;
							p.setName(name);
							BigDecimal price2 = new BigDecimal(price);
							p.setPrice(price2);
							p.setStock(Integer.parseInt(stock));
							p.setCategory(category);
							p.setDescription(description);
							p.setImageUrl(imageUrl);
							
							et.commit();
							em.close();
						}
					}
				}

				/* CREATING NEW USER */
				if (request.getParameter("action") != null) {
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
								&& !password2.equals("")
								&& !password3.equals("")
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
				
				
				
				
				/* DELETING A PRODUCT */
				if (request.getParameter("action") != null) {
					if (request.getParameter("actionPost").equals("deleteProduct")) {

						EntityTransaction et = em.getTransaction();
						et.begin();
						Query deleteProduct = em
						.createQuery("SELECT p FROM Product p WHERE p.idProduct="
								+ request.getParameter("id"));
						results = deleteProduct.getResultList();
						for (Object pr : results) {
							Product p = (Product) pr;
							em.remove(p);
						}
						et.commit();
						em.close();
					}
				}
				
				
				
				/* DELETING A CATEGORY */
				if (request.getParameter("action") != null) {
					if (request.getParameter("actionPost").equals("deleteCategory")) {

						EntityTransaction et = em.getTransaction();
						et.begin();
						Query deleteCategory = em
						.createQuery("SELECT c FROM Category c WHERE c.idCategory="
								+ request.getParameter("id"));
						results = deleteCategory.getResultList();
						for (Object cat : results) {
							Category c = (Category) cat;
							em.remove(c);
						}
						et.commit();
						em.close();
					}
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
	
	/* GET ALL PRODUCTS (FOR ADMIN EDIT) */
	public void getAllProductsForAdminEdit(HttpServletRequest request) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineStore_WEB");
		EntityManager em = emf.createEntityManager();
		query = em.createQuery("SELECT p FROM Product p ORDER BY p.name");
				results = query.getResultList();
				if (results == null) {
					request.setAttribute("editProductList", "");
				} else {
					request.setAttribute("editProductList", results);
				}
				em.close();
	}
	
	/* GET PRODUCT TO EDIT (FOR ADMIN) */
	public void getProductForAdminEdit(HttpServletRequest request) {
		if (request.getParameter("id") != null) {
			int idProductForAdminEdit = Integer.parseInt(request.getParameter("id"));
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineStore_WEB");
			EntityManager em = emf.createEntityManager();
			query = em.createQuery("SELECT p FROM Product p WHERE p.idProduct="+ idProductForAdminEdit);
			results = query.getResultList();
			if (results == null) {
				request.setAttribute("product", "");
			} else {
				for (Object prod : results) {
					request.setAttribute("product", (Product) prod);
				}
			}
			em.close();
		}
	}
	
	
	
	/*    ----------------   */
	/*    FUNCTIONS TO USE   */
	/*    ----------------   */
	
	/* GET CATEOGORIES (FOR ADMIN PRODUCT EDIT) */
	public void getCategoriesForAdminEdit(HttpServletRequest request) {
		    EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineStore_WEB");
			EntityManager em = emf.createEntityManager();
			query = em.createQuery("SELECT c FROM Category c ORDER BY c.name");
			results = query.getResultList();
			if (results == null) {
				request.setAttribute("categories", "");
			} else {
				request.setAttribute("categories", results);
			}
			em.close();
		}
	
	/* GET CATEGORY TO EDIT (FOR ADMIN) */
	public void getCategoryForAdminEdit(HttpServletRequest request) {
		if (request.getParameter("id") != null) {
			int idCategoryForAdminEdit = Integer.parseInt(request.getParameter("id"));
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineStore_WEB");
			EntityManager em = emf.createEntityManager();
			query = em.createQuery("SELECT c FROM Category c WHERE c.idCategory="+ idCategoryForAdminEdit);
			results = query.getResultList();
			if (results == null) {
				request.setAttribute("category", "");
			} else {
				for (Object cat : results) {
					request.setAttribute("category", (Category) cat);
				}
			}
			em.close();
		}
	}
	
	
	/* GET NUMBER OF PRODUCTS IN CATEGORY TO EDIT (FOR ADMIN) */
	public void getNumberOfProductsForAdminEdit(HttpServletRequest request) {
		if (request.getParameter("id") != null) {
			int idCategoryForAdminEdit = Integer.parseInt(request.getParameter("id"));
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineStore_WEB");
			EntityManager em = emf.createEntityManager();
			query = em.createQuery("SELECT p FROM Product p WHERE p.category.idCategory="+ idCategoryForAdminEdit);
			results = query.getResultList();
			System.out.println(results.size());
			request.setAttribute("numberOfProducts", results.size());
			em.close();
		}
	}
	
}
