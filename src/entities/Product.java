package entities;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;


/**
 * The persistent class for the product database table.
 * 
 */
@Entity
@Table(name="product")
public class Product implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idProduct;

	private String description;

	private byte highlighted;

	private String imageUrl;

	private String name;

	private BigDecimal price;

	private int stock;

	//bi-directional many-to-one association to Favourite
	@OneToMany(mappedBy="product")
	private List<Favourite> favourites;

	//bi-directional many-to-one association to Ordproduct
	@OneToMany(mappedBy="product")
	private List<Ordproduct> ordproducts;

	//bi-directional many-to-one association to Category
    @ManyToOne
	@JoinColumn(name="Category_idCategory")
	private Category category;

    public Product() {
    }

	public int getIdProduct() {
		return this.idProduct;
	}

	public void setIdProduct(int idProduct) {
		this.idProduct = idProduct;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public byte getHighlighted() {
		return this.highlighted;
	}

	public void setHighlighted(byte highlighted) {
		this.highlighted = highlighted;
	}

	public String getImageUrl() {
		return this.imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BigDecimal getPrice() {
		return this.price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public int getStock() {
		return this.stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public List<Favourite> getFavourites() {
		return this.favourites;
	}

	public void setFavourites(List<Favourite> favourites) {
		this.favourites = favourites;
	}
	
	public List<Ordproduct> getOrdproducts() {
		return this.ordproducts;
	}

	public void setOrdproducts(List<Ordproduct> ordproducts) {
		this.ordproducts = ordproducts;
	}
	
	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	
}