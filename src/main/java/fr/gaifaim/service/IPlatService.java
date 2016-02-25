package fr.gaifaim.service;

import java.util.List;

import fr.gaifaim.model.Plat;

public interface IPlatService {
	List<Plat> getAllPlats();

	Plat getPlatById(Integer id);
}
