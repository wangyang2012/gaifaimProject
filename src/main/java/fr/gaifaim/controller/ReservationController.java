package fr.gaifaim.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fr.gaifaim.model.ResponseJsonBean;
import fr.gaifaim.model.Utilisateur;

@Controller
@RequestMapping("/")
public class ReservationController {

//	@Autowired
//	IUtilisateurService service;

//	@Autowired
//	MessageSource messageSource;

	/*
	 * This method will list all existing utilisateurs.
	 */
	  @RequestMapping(value="/reserver", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	    @ResponseBody
	    public ResponseJsonBean reserver(@RequestBody String form) {
		  
	        return new ResponseJsonBean(ResponseJsonBean.REUSSI, "OK"); 
	    }
	  
	  @RequestMapping(value = { "/ReservationsToday"}, method = RequestMethod.GET)
		public String reservationsToday(ModelMap model) {

//			List<Utilisateur> utilisateurs = service.getAllUtilisateurs();
//			model.addAttribute("utilisateurs", utilisateurs);
			model.addAttribute("msg", "coucou");
			return "reservationsToday";
		}

}