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

	EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineStore_WEB"); // CHANGE IF U HAVE DIFFERENT NAME!
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
		} 

		url = "/" + url + ".jsp";
		try {
			this.getServletContext().getRequestDispatcher(url).forward(request, response);
		} catch (Exception e) {
			this.getServletContext().getRequestDispatcher("/index.jsp").forward(request,
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
		comparator = "";
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
		em = emf.createEntityManager();
		query = em
				.createQuery("SELECT c FROM Category c WHERE c.section=(SELECT s FROM Section s WHERE s.url='"
						+ url + "') ORDER BY c.name");
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
							+ newId +" ORDER BY c.name");
			results = maxIdobjectQuery.getResultList();
			request.setAttribute("categories", results);
		} else {
			request.setAttribute("categories", results);
		}
		em.close();
	}

	/* TO GET ALL DATA OF CURRENT PRODUCT */
	public void getCurrentProduct(HttpServletRequest request) {
		em = emf.createEntityManager();
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
		em.close();
	}

	/* TO DISTINGUISH CURRENT CATEGORY IN LEFT MENU */
	public void getCurrentCategory(HttpServletRequest request) {
		em = emf.createEntityManager();
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
		em.close();
	}

	/* TO SHOW ALL THE PRODUCTS IN CHOSEN CATEGORY */
	public void getAllProductsOfCategory(HttpServletRequest request) {
		em = emf.createEntityManager();
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
		em.close();
	}

	/* TO SHOW ALL THE PRODUCTS OF SECTION IN MAIN VIEW OF EACH SECTION */
	public void getAllProductsOfSection(HttpServletRequest request) {
		em = emf.createEntityManager();
		query = em
				.createQuery("SELECT p FROM Product p WHERE p.category.section.url='"
						+ url + "'");
		results = query.getResultList();
		if (results == null) {
			request.setAttribute("productsSection", "");
		} else {
			request.setAttribute("productsSection", results);
		}
		em.close();
	}
	
	/* TO SHOW SEARCH RESULTS */
	public void getSearchResults(HttpServletRequest request) {
		em = emf.createEntityManager();
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
		em.close();
	}
	
	
	
	/* TO GET BESTSELLERS */
	public void getBestsellers(HttpServletRequest request) {
		em = emf.createEntityManager();
		try {
			List res = new ArrayList(); 
			/* HERE I GET ONLY IDs OF BEST SELLING PRODUCTS */
			results = em.createNativeQuery("SELECT DISTINCT Product_idProduct FROM Ordproduct GROUP BY Product_idProduct ORDER BY COUNT(Product_idProduct) DESC").setMaxResults(6).getResultList();
			int index = 0;
			for(Object current: results){
					int c = (Integer)current;
					em = emf.createEntityManager();
					Product p = (Product)em.createQuery("SELECT p FROM Product p WHERE p.idProduct="+c).getSingleResult();
					/* THEN I GET PRODUCTS WITH THIS ID, ADD TO NEW LIST AND SAVE AS BESTSELLETS */
					res.add(index,p);
					index++;
					em.close();
				}
			request.setAttribute("bestSellers", (List)res);
			} catch (Exception e) {
			}
		    
	}
	
	
	
}