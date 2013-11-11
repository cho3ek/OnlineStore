package entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the favourites database table.
 * 
 */
@Entity
@Table(name="favourites")
public class Favourite implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idFavourites;

	//bi-directional many-to-one association to Product
    @ManyToOne
	@JoinColumn(name="Product_idProduct")
	private Product product;

	//bi-directional many-to-one association to User
    @ManyToOne
	@JoinColumn(name="User_idUser")
	private User user;

    public Favourite() {
    }

	public int getIdFavourites() {
		return this.idFavourites;
	}

	public void setIdFavourites(int idFavourites) {
		this.idFavourites = idFavourites;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}