package com.uc3.onlineStore.model;

import com.uc3.onlineStore.model.Product;
import java.beans.*;
import java.util.*;
import java.io.*;

public class Cart {
    private HashSet<Product> theProducts;
    
    public Cart() {
	theProducts = new HashSet<Product>();
    }

    public HashSet<Product> getTheProducts() {
	return this.theProducts;
    }

    public void setTheProducts(HashSet<Product> theProducts) {
	this.theProducts = theProducts;
    }

    public void addProduct(Product product) {
	this.theProducts.add(product);
    }

    public void removeProduct(Product product) {
	if (theProducts.contains(product)) theProducts.remove(product);
    }

    public boolean isProductInCart(Product product) {
	return theProducts.contains(product);
    }

    public int getNumberOfProducts() {
	return theProducts.size();
    }

    public double getTotalPriceOfTheCart() {
	double total=0;  
   
	if (this.getNumberOfProducts()>0) {	    
	    for (Object product:getTheProducts()) {
		total += ((Product) product).getPrice();
	    }
	}
  
	return total;
    }
}
