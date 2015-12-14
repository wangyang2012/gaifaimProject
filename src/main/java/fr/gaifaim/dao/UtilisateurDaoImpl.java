package fr.gaifaim.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import fr.gaifaim.model.Utilisateur;

@Repository("iUtilisateurDao")
public class UtilisateurDaoImpl extends AbstractDao<Integer, Utilisateur> implements IUtilisateurDao {

	//    public Employee findById(int id) {
	//        return getByKey(id);
	//    }
	// 
	//    public void saveEmployee(Employee employee) {
	//        persist(employee);
	//    }
	// 
	//    public void deleteEmployeeBySsn(String ssn) {
	//        Query query = getSession().createSQLQuery("delete from Employee where ssn = :ssn");
	//        query.setString("ssn", ssn);
	//        query.executeUpdate();
	//    }

	@SuppressWarnings("unchecked")
	public List<Utilisateur> getAllUtilisateurs() {
		Criteria criteria = createEntityCriteria();
		return (List<Utilisateur>) criteria.list();
	}
}