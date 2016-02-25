package fr.gaifaim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fr.gaifaim.dao.IPlatDao;
import fr.gaifaim.model.Plat;

@Service("iPlatService")
@Transactional
public class PlatServiceImpl implements IPlatService {

	@Autowired
	private IPlatDao dao;

	public List<Plat> getAllPlats() {
		return dao.getAllPlats();
	}

	public Plat getPlatById(Integer id) {
		return dao.getPlatById(id);
	}
}
