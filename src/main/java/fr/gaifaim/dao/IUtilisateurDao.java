package fr.gaifaim.dao;

import java.util.List;

import fr.gaifaim.model.Utilisateur;

public interface IUtilisateurDao {
	List<Utilisateur> getAllUtilisateurs();

	Utilisateur getUtilisateurByLoginAndMdp(String login, String mdp);
}
