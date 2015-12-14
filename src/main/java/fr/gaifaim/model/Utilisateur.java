package fr.gaifaim.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "UTILISATEUR")
public class Utilisateur {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "ID_ROLE", nullable = false)
	private Integer idRole;

	@Column(name = "NOM", nullable = false)
	private String nom;

	@Column(name = "LOGIN", nullable = false)
	private String login;

	@Column(name = "MDP", nullable = false)
	private byte[] mdp;

	@Column(name = "TELEPHONE", nullable = false)
	private String telephone;

	@Column(name = "EMAIL", nullable = false)
	private String email;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Utilisateur [id=" + id + ", idRole=" + idRole + ", nom=" + nom + ", telephone=" + telephone + ", email=" + email + "]";
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public byte[] getMdp() {
		return mdp;
	}

	public void setMdp(byte[] mdp) {
		this.mdp = mdp;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getIdRole() {
		return idRole;
	}

	public void setIdRole(Integer idRole) {
		this.idRole = idRole;
	}

}