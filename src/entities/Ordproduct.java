package entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the ordproduct database table.
 * 
 */
@Entity
@Table(name="ordproduct")
public class Ordproduct implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idOrdproduct;

	private int quantity;

	//bi-directional many-to-one association to Ord
    @ManyToOne
	@JoinColumn(name="Order_idOrd")
	private Ord ord;

	//bi-directional many-to-one association to Product
    @ManyToOne
	@JoinColumn(name="Product_idProduct")
	private Product product;

    public Ordproduct() {
    }

	public int getIdOrdproduct() {
		return this.idOrdproduct;
	}

	public void setIdOrdproduct(int idOrdproduct) {
		this.idOrdproduct = idOrdproduct;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Ord getOrd() {
		return this.ord;
	}

	public void setOrd(Ord ord) {
		this.ord = ord;
	}
	
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
}