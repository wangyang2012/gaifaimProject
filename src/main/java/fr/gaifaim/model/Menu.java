package fr.gaifaim.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "MENU")
public class Menu {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	 @ManyToOne
	 @JoinColumn(name = "id", insertable=false, updatable=false)
	 private Plat plat1;

//	 @ManyToOne
//	 @JoinColumn(name = "id")
//	 private Plat plat2;
//
//	 @ManyToOne
//	 @JoinColumn(name = "id")
//	 private Plat plat3;
//	 
	 @OneToMany(mappedBy="menu")
	 private List<JourHasMenu> jourHasMenus;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Plat getPlat1() {
		return plat1;
	}

	public void setPlat1(Plat plat1) {
		this.plat1 = plat1;
	}

//	public Plat getPlat2() {
//		return plat2;
//	}
//
//	public void setPlat2(Plat plat2) {
//		this.plat2 = plat2;
//	}
//
//	public Plat getPlat3() {
//		return plat3;
//	}
//
//	public void setPlat3(Plat plat3) {
//		this.plat3 = plat3;
//	}

	public List<JourHasMenu> getJourHasMenus() {
		return jourHasMenus;
	}

	public void setJourHasMenus(List<JourHasMenu> jourHasMenus) {
		this.jourHasMenus = jourHasMenus;
	}
}