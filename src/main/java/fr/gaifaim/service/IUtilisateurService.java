package fr.gaifaim.service;

import java.util.List;

import fr.gaifaim.model.Utilisateur;

public interface IUtilisateurService {
	List<Utilisateur> getAllUtilisateurs();

	Utilisateur getUtilisateurByLoginAndMdp(String login, String mdp);
}
