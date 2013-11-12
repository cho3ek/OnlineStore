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

public class SectionsController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	String comparator = "";
	String mail = "";
	String password = "";
	Query query;
	List results;
	EntityManager em;
	String url = "index";
	String keyword = "";
	int idProductGet = 0;
	int idCategoryGet = 0;

	public SectionsController() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String pathInfo = request.getServletPath();
		String[] urlParsed = pathInfo.split("/");
		String section = "";
		idProductGet = 0;
		idCategoryGet = 0;

		EntityManagerFactory emf = Persistence
				.createEntityManagerFactory("OnlineStore_WEB");
		em = emf.createEntityManager();

		if (urlParsed.length >= 2)
			section = urlParsed[1];

		if (section.contains("manAndWoman")) {
			url = "manAndWoman";
			getListOfAllCategories(request);
			getListOfAllCategories(request);
			getCurrentCategory(request);
			getAllProductsOfCategory(request);
			getAllProductsOfSection(request);
		} else if (section.contains("kids")) {
			url = "kids";
			getListOfAllCategories(request);
			getListOfAllCategories(request);
			getCurrentCategory(request);
			getAllProductsOfCategory(request);
			getAllProductsOfSection(request);
		} else if (section.contains("sports")) {
			url = "sports";
			getListOfAllCategories(request);
			getCurrentCategory(request);
			getAllProductsOfCategory(request);
			getAllProductsOfSection(request);
		} else if (section.contains("young")) {
			url = "young";
			getListOfAllCategories(request);
			getListOfAllCategories(request);
			getCurrentCategory(request);
			getAllProductsOfCategory(request);
			getAllProductsOfSection(request);
		} else if (section.contains("informations")) {
			url = "informations";
		} else if (section.contains("login")) {
			url = "login";
		} else if (section.contains("product")) {
			url = "product";
			getCurrentProduct(request);
			getListOfAllCategories(request);
		} else if (section.contains("search")) {
			url = "search";
			getSearchResults(request);
		} else if (section.contains("home")) {
			url = "index";
			getBestsellers(request);
		} else if (section.contains("index")) {
			url = "index";
			getBestsellers(request);
		}

		/* closing connections and using RequestDispatcher */
		em.close();
		url = "/" + url + ".jsp";
		try {
			this.getServletContext().getRequestDispatcher(url)
					.forward(request, response);
		} catch (Exception e) {
			request.getRequestDispatcher("/index.jsp").forward(request,
					response);
			return;
		}
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}
	
	/**************
	 * FUNCTIONS  * 
	 **************/
	
	/* TO DIFFER QUERY DEPENDING ON CHOSEN SORT TYPE */
	public void getSortComparator(HttpServletRequest request) {
		String sort = "";
		if (request.getParameter("sort") != null) {
			sort = (String) request.getParameter("sort");
			if (sort.equals("priceDown")) {
				comparator = " ORDER BY p.price DESC";
			} else if (sort.equals("priceUp")) {
				comparator = " ORDER BY p.price";
			} else if (sort.equals("nameDown")) {
				comparator = " ORDER BY p.name DESC";
			} else if (sort.equals("nameUp")) {
				comparator = " ORDER BY p.name";
			}
		}
	}

	/* TO GET DATA FOR LEFT SIDE MENU */
	public void getListOfAllCategories(HttpServletRequest request) {
		query = em
				.createQuery("SELECT c FROM Category c WHERE c.section=(SELECT s FROM Section s WHERE s.url='"
						+ url + "')");
		results = query.getResultList();
		int index = 1;
		if (results.size() < 1) {
			Query maxIdobjectQuery = em
					.createQuery("SELECT c.section.idSection FROM Category c WHERE c.products=(SELECT p FROM Product p WHERE p.idProduct="
							+ idProductGet + ")");
			results = maxIdobjectQuery.getResultList();
			int newId = 0;
			Iterator it = results.iterator();
			while (it.hasNext()) {
				newId = ((Integer) it.next()).intValue();
			}
			maxIdobjectQuery = em
					.createQuery("SELECT c FROM Category c WHERE c.section.idSection="
							+ newId);
			results = maxIdobjectQuery.getResultList();
			request.setAttribute("categories", results);
		} else {
			request.setAttribute("categories", results);
		}
	}

	/* TO GET ALL DATA OF CURRENT PRODUCT */
	public void getCurrentProduct(HttpServletRequest request) {
		if (request.getParameter("id") != null) {
			idProductGet = Integer.parseInt(request.getParameter("id"));
		}
		query = em.createQuery("SELECT p FROM Product p WHERE p.idProduct="
				+ idProductGet);
		results = query.getResultList();
		if (results == null) {
			request.setAttribute("product", "");
		} else {
			for (Object prod : results) {
				request.setAttribute("product", (Product) prod);
			}
		}
	}

	/* TO DISTINGUISH CURRENT CATEGORY IN LEFT MENU */
	public void getCurrentCategory(HttpServletRequest request) {
		if (request.getParameter("catId") != null) {
			idCategoryGet = Integer.parseInt(request.getParameter("catId"));
		}
		try {
			query = em
					.createQuery("SELECT c FROM Category c WHERE c.idCategory="
							+ idCategoryGet);
			Object cat = query.getSingleResult();
			if (cat == null) {
				request.setAttribute("category", "");
			} else {
				request.setAttribute("category", cat);
			}
		} catch (Exception e) {
		}
	}

	/* TO SHOW ALL THE PRODUCTS IN CHOSEN CATEGORY */
	public void getAllProductsOfCategory(HttpServletRequest request) {
		getSortComparator(request);
		query = em
				.createQuery("SELECT p FROM Product p WHERE p.category.idCategory="
						+ idCategoryGet + comparator);

		results = query.getResultList();
		if (results == null) {
			request.setAttribute("products", "");
		} else {
			request.setAttribute("products", results);
		}
	}

	/* TO SHOW ALL THE PRODUCTS OF SECTION IN MAIN VIEW OF EACH SECTION */
	public void getAllProductsOfSection(HttpServletRequest request) {
		query = em
				.createQuery("SELECT p FROM Product p WHERE p.category.section.url='"
						+ url + "'");
		results = query.getResultList();
		if (results == null) {
			request.setAttribute("productsSection", "");
		} else {
			request.setAttribute("productsSection", results);
		}
	}
	
	/* TO SHOW SEARCH RESULTS */
	public void getSearchResults(HttpServletRequest request) {
		if (request.getParameter("keyword") != null) {
			keyword = request.getParameter("keyword");
		}
		if (keyword.length() > 1) {
			try {
				query = em
						.createQuery("SELECT p FROM Product p WHERE p.name LIKE '%"
								+ keyword + "%'");
				results = query.getResultList();
				if (results == null) {
					request.setAttribute("searchResults", "");
				} else {
					request.setAttribute("searchResults", (List) results);
				}
			} catch (Exception e) {
			}
		}
		else {
			List empty = new ArrayList();
			request.setAttribute("searchResults", empty);
		}
	}
	
	/* TO GET BESTSELLERS */
	public void getBestsellers(HttpServletRequest request) {
			try {
				
				query = em
						.createQuery("SELECT p FROM Product p ORDER BY p.price"); /* SONIA - CHANGE THIS TO GET BESTSELLERS FROM OrderProducts TABLE */
				query.setMaxResults(6);
				results = query.getResultList();
				if (results == null) {
					request.setAttribute("bestSellers", "");
				} else {
					request.setAttribute("bestSellers", (List)results);
				}
			} catch (Exception e) {
			}
		
	}

	
}