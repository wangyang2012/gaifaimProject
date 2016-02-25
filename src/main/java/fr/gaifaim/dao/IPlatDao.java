package fr.gaifaim.dao;

import java.util.List;

import fr.gaifaim.model.Plat;

public interface IPlatDao {
	List<Plat> getAllPlats();

	Plat getPlatById(Integer id);
}
