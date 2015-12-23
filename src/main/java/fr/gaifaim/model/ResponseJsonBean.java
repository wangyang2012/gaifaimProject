package fr.gaifaim.model;

public class ResponseJsonBean {
	public static final Integer REUSSI = 1;
	public static final Integer ECHEC = -1;
	
	private Integer codeRetour;
	private String message;
	
	public ResponseJsonBean() {
	}
	
	public ResponseJsonBean(Integer codeRetour, String message) {
		super();
		this.codeRetour = codeRetour;
		this.message = message;
	}
	public Integer getCodeRetour() {
		return codeRetour;
	}
	public void setCodeRetour(Integer codeRetour) {
		this.codeRetour = codeRetour;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
