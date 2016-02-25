package fr.gaifaim.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import fr.gaifaim.model.Plat;

@Repository("iPlatDao")
public class PlatDaoImpl extends AbstractDao<Integer, Plat> implements IPlatDao {

	@SuppressWarnings("unchecked")
	public List<Plat> getAllPlats() {
		Criteria criteria = createEntityCriteria();
		return (List<Plat>) criteria.list();
	}

	public Plat getPlatById(Integer id) {
		
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("id", id));
		criteria.setMaxResults(1);
		return (Plat) criteria.uniqueResult();
	}
}