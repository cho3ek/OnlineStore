package com.uc3.onlineStore.model;
import java.beans.*;
import java.io.*;

public class User implements Serializable {
    private String firstname = "";
    private String lastname = "";
    private String email = "";
    private String login = "";
    private String password = "";
    
    public User() { }

    public User(String firstname, String lastname, String email, String login, String password) {
	this.firstname = firstname;
	this.lastname = lastname;
	this.email = email;
	this.login = login;
	this.password = password;
    }
    
    public String getFirstname() { return this.firstname; }
    
    public void setFirstname(String firstname) { this.firstname = firstname; }
    
    public String getLastname() { return this.lastname; }
    
    public void setLastname(String lastname) { this.lastname = lastname; }

    public String getEmail() { return this.email; }
    
    public void setEmail(String email) { this.email = email; }

    public String getLogin() { return this.login; }
    
    public void setLogin(String login) { this.login = login; }

    public String getPassword() { return this.password; }
    
    public void setPassword(String password) { this.password = password; }
}
