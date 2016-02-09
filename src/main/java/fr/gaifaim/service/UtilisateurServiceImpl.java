package fr.gaifaim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fr.gaifaim.dao.IUtilisateurDao;
import fr.gaifaim.model.Utilisateur;

@Service("iUtilisateurService")
@Transactional
public class UtilisateurServiceImpl implements IUtilisateurService {

	@Autowired
	private IUtilisateurDao dao;

	//	public Employee findById(int id) {
	//		return dao.findById(id);
	//	}
	//
	//	public void saveEmployee(Employee employee) {
	//		dao.saveEmployee(employee);
	//	}
	//
	//	/*
	//	 * Since the method is running with Transaction, No need to call hibernate update explicitly. Just fetch the entity from db and update it with proper values within transaction. It will be updated in db once transaction ends.
	//	 */
	//	public void updateEmployee(Employee employee) {
	//		Employee entity = dao.findById(employee.getId());
	//		if (entity != null) {
	//			entity.setName(employee.getName());
	//			entity.setJoiningDate(employee.getJoiningDate());
	//			entity.setSalary(employee.getSalary());
	//			entity.setSsn(employee.getSsn());
	//		}
	//	}
	//
	//	public void deleteEmployeeBySsn(String ssn) {
	//		dao.deleteEmployeeBySsn(ssn);
	//	}

	public List<Utilisateur> getAllUtilisateurs() {
		return dao.getAllUtilisateurs();
	}

	public Utilisateur getUtilisateurByLoginAndMdp(String login, String mdp) {
		return dao.getUtilisateurByLoginAndMdp(login, mdp);
	}
}
