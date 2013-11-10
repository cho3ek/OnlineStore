package entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the orderproducts database table.
 * 
 */
@Entity
@Table(name="orderproducts")
public class Orderproduct implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idOrderProducts;

	private int quantity;

	//bi-directional many-to-one association to Order
    @ManyToOne
	@JoinColumn(name="Order_idOrder")
	private Order order;

	//bi-directional many-to-one association to Product
    @ManyToOne
	@JoinColumn(name="Product_idProduct")
	private Product product;

    public Orderproduct() {
    }

	public int getIdOrderProducts() {
		return this.idOrderProducts;
	}

	public void setIdOrderProducts(int idOrderProducts) {
		this.idOrderProducts = idOrderProducts;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
	
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
}