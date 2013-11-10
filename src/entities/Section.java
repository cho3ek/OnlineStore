package entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the section database table.
 * 
 */
@Entity
@Table(name="section")
public class Section implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idSection;

	private String name;

	private String url;

	//bi-directional many-to-one association to Category
	@OneToMany(mappedBy="section")
	private List<Category> categories;

    public Section() {
    }

	public int getIdSection() {
		return this.idSection;
	}

	public void setIdSection(int idSection) {
		this.idSection = idSection;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public List<Category> getCategories() {
		return this.categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}
	
}