package entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the user database table.
 * 
 */
@Entity
@Table(name="user")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idUser;

	private String address;

	private byte adminRights;

	private String email;

	private String name;

	private String password;

	private String phone;

	private String surname;

	//bi-directional many-to-one association to Favourite
	@OneToMany(mappedBy="user")
	private List<Favourite> favourites;

	//bi-directional many-to-one association to Ord
	@OneToMany(mappedBy="user")
	private List<Ord> ords;

    public User() {
    }

	public int getIdUser() {
		return this.idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public byte getAdminRights() {
		return this.adminRights;
	}

	public void setAdminRights(byte adminRights) {
		this.adminRights = adminRights;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSurname() {
		return this.surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public List<Favourite> getFavourites() {
		return this.favourites;
	}

	public void setFavourites(List<Favourite> favourites) {
		this.favourites = favourites;
	}
	
	public List<Ord> getOrds() {
		return this.ords;
	}

	public void setOrds(List<Ord> ords) {
		this.ords = ords;
	}
	
}