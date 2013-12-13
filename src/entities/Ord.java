package entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the ord database table.
 * 
 */
@Entity
@Table(name="ord")
public class Ord implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idOrd;

	private String address;

	private byte confirmed;

	private String email;

	private String name;

	private byte paid;

	private String phone;

	private String surname;

    @Temporal( TemporalType.TIMESTAMP)
	private Date time;

	//bi-directional many-to-one association to User
    @ManyToOne
	@JoinColumn(name="User_idUser")
	private User user;

	//bi-directional many-to-one association to Ordproduct
	@OneToMany(mappedBy="ord")
	private List<Ordproduct> ordproducts;

    public Ord() {
    }

	public int getIdOrd() {
		return this.idOrd;
	}

	public void setIdOrd(int idOrd) {
		this.idOrd = idOrd;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public byte getConfirmed() {
		return this.confirmed;
	}

	public void setConfirmed(byte confirmed) {
		this.confirmed = confirmed;
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

	public byte getPaid() {
		return this.paid;
	}

	public void setPaid(byte paid) {
		this.paid = paid;
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

	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public List<Ordproduct> getOrdproducts() {
		return this.ordproducts;
	}

	public void setOrdproducts(List<Ordproduct> ordproducts) {
		this.ordproducts = ordproducts;
	}
	
}