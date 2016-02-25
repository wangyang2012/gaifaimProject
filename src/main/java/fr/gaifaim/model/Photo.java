package fr.gaifaim.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "PLAT")
public class Photo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "FILENAME", nullable = false)
	private String filename;

	@ManyToMany  
	@JoinTable(name="plat_has_photo",joinColumns={@JoinColumn(name="id_photo")},inverseJoinColumns={@JoinColumn(name="id_plat")})
	private Set<Plat> plats;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Set<Plat> getPlats() {
		return plats;
	}

	public void setPlats(Set<Plat> plats) {
		this.plats = plats;
	}

}