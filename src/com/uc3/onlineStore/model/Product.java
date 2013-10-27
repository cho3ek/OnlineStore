package com.uc3.onlineStore.model;

import java.sql.Date;

public class Product {
    private int id;
    private String name;
    private String description;
    private Date registrationDate;
    private String imageUrl;    
    private double price;
    private double discounts;
    private int stock;

    public Product(String name, String description, int stock, double price, double discounts, String imageUrl) {
	this.name = name;
	this.description = description;
	this.stock = stock;
	this.price = price;
	this.discounts = discounts;
	this.imageUrl = imageUrl;
    }

    public String getName() {
	return name;
    }

    public void setName(String name) {
	this.name = name;
    }

    public String getDescription() {
	return description;
    }

    public void setDescription(String description) {
	this.description = description;
    }

    public int getStock() {
	return stock;
    }

    public void setStock(int stock) {
	this.stock = stock;
    }

    public double getPrice() {
	return price;
    }

    public void setPrice(double price) {
	this.price = price;
    }

    public double getDiscounts() {
	return discounts;
    }

    public void setDiscounts(double discounts) {
	this.discounts = discounts;
    }

    public Date getRegistrationDate() {
	return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
	this.registrationDate = registrationDate;
    }

    public int getId() {
	return id;
    }

    public void setImageUrl(String imageUrl) {
	this.imageUrl = imageUrl;
    }

    public String getImageUrl() {
	return imageUrl;
    }     

    public String toString() {
	return "Id : "+this.id+", name : "+this.name+", description : "+this.description+", price : "+this.price;
    }
}
