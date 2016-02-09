<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/taglibs.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${contextPath}/jquery/jquery-ui.css" rel="stylesheet">
<link href="${contextPath}/css/gaifaim.css" rel="stylesheet">

<script src="${contextPath}/jquery/jquery-1.10.2.js"></script>
<script src="${contextPath}/jquery/jquery-ui.js"></script>

<title>Gaifaim - Accueil</title>

<script>
	
	function reserver() {
		if ("${userLogin}" == "") {
			showLoginForm();
		} else {
			showFormReserver();
		}
	}
	
	function hideFormReserver() {
		$("#dialog-reserver").hide("slow");
	}
	
	function showFormReserver() {
		$("#dialog-reserver").show("slow");
	}
	
	function showLoginForm() {
		var dialog = $("div.dialog-login");
		$("#dialog-login").show("slow");
	}
	
	function hideLoginForm() {
		$("#dialog-login").hide("slow");
	}
	

	// dialogue reserver
	$(document).ready(function() {
		$("#dialog-login").hide("slow");
		$("#dialog-reserver").hide("slow");
		   
		  $('#formReserver').submit(function(event) {
			   
			  var nom = $('#nom').val();
			  var prenom = $('#prenom').val();
			  var telephone = $('#telephone').val();
			  var adresse = $('#adresse').val();
			  var note = $('#note').val();
			  var quantite = $('#quantite').val();
			  var json = { "nom" : nom, "prenom" : prenom, "telephone" : telephone, "adresse" : adresse, "note" : note, "quantite" : quantite};
			   
			$.ajax({
				url: $("#formReserver").attr( "action"),
				data: JSON.stringify(json),
				type: "POST",
				 
				beforeSend: function(xhr) {
					xhr.setRequestHeader("Accept", "application/json");
					xhr.setRequestHeader("Content-Type", "application/json");
				},
				success: function(response) {
					 
					var respContent = "";
					if (response != null && response.codeRetour == 1) {
						respContent = "<span class='success'>Smartphone was created: [";
						respContent += response.message + "]</span>";
						$("#reserverFormResponse").html(respContent);
						hideFormReserver();
					} else {
						respContent = "<span class='error'>Une erreur est survenue!</span>";
						$("#loginFormResponse").html(respContent);
					}
				}
			});
			  
			event.preventDefault();
		  });
			
		});

	// dialog login
	$(document).ready(function() {
		   
		  $('#formLogin').submit(function(event) {
			   
			  var login = $('#login').val();
			  var mdp = $('#mdp').val();
			  var json = { "login" : login, "mdp" : mdp};
			   
			$.ajax({
				url: $("#formLogin").attr( "action"),
				data: JSON.stringify(json),
				type: "POST",
				 
				beforeSend: function(xhr) {
					xhr.setRequestHeader("Accept", "application/json");
					xhr.setRequestHeader("Content-Type", "application/json");
				},
				success: function(response) {
					 
					var respContent = "";
					if (response != null && response.codeRetour == 1) {
						respContent = "<span class='success'>Smartphone was created: [";
						respContent += response.message + "]</span>";
						$("#loginFormResponse").html(respContent);
						hideLoginForm();
						showFormReserver();
					} else {
						respContent = "<span class='error'>Une erreur est survenue!</span>";
						$("#loginFormResponse").html(respContent);
					}
				}
			});
			  
			event.preventDefault();
		  });
			
		});
	
</script>

</head>


<body>
	<div class="container">
	
		<nav class="navbar navbar-inverse">
			<div class="navbar-header">
			  <a class="navbar-brand" href="#">GAI FAIM</a>
		    </div>
	        <div class="container-fluid">
	          <ul class="nav navbar-nav">
	            <li> <a href="${contextPath}/accueil">ACCUEIL</a> </li>
	            <li class="active"> <a href="#">MENUS</a> </li>
	            <li> <a href="#">MES RESERVATIONS</a> </li>
	            <li> <a href="#">SAVOIR-FAIRE</a> </li>
	          </ul>
	          <div class="navbar-form navbar-right inline-form">
	          	<a onClick="javascript:showLoginForm()">Se connecter</a>
	          </div>
	        </div>
	      </nav>
      
	
		<div class="row">
			<div class="col-lg-4">
				<img src="${contextPath}/img/gaifaim.png" alt="Gaifaim" />
			</div>
			<div class="col-lg-8">
				<div class="row">
					<div class="col-lg-5">
					<a href="#"><<<</a>
					</div>
					<div class="col-lg-5">
					${date}
					
					</div>
					<div class="col-lg-2">
					<a href="#">>>></a>
					</div>
					
				</div>
				<div class="row">
					${entree}<br/>
					${plat}
				</div>
				
			</div>
		</div>

		<footer class="row">
			<div class="col-lg-8">
				Tél: 06 95 39 00 07<br/> <a href="mailto:resa@gaifaim.com">resa@gaifaim.com</a>
			</div>
			<div class="col-lg-4"></div>
		</footer>
	</div>

	<!-- 	LOGIN -->
	<div id="dialog-login" title="Se connecter">
		<form id="formLogin" class="form-horizontal col-lg-6"
			action="/gaifaim/login">
			<div class="row">
				<div id="loginFormResponse"></div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="login" class="col-lg-2 control-label">Login : </label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="login">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="mdp" class="col-lg-2 control-label">Mot de
						passe : </label>
					<div class="col-lg-10">
						<input type="password" class="form-control" id="mdp">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label class="pull-left"><a href="/gaifaim/creationCompte">Créer
							un compte</a></label>
					<button class="pull-right btn btn-default">Connecter</button>
				</div>
			</div>
			<div class="form-group"></div>
		</form>
	</div>


	<!-- 	RESERVATION -->
	<div id="dialog-reserver" title="Réservation">
		<form id="formReserver" class="form-horizontal col-lg-6"
			action="/gaifaim/reserver">
			<div class="row">
				<div id="reserverFormResponse"></div>
			</div>
			<!-- login -->
			<div class="row">
				<div class="form-group">
					<label for="login" class="col-lg-2 control-label">Login : </label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="login"
							value="${utilisateur.login}">
					</div>
				</div>
			</div>
			<!-- téléphone -->
			<div class="row">
				<div class="form-group">
					<label for="telephone" class="col-lg-2 control-label">Téléphone
						: </label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="telephone"
							value="${utilisateur.telephone}">
					</div>
				</div>
			</div>
			<!-- e-mail -->
			<div class="row">
				<div class="form-group">
					<label for="email" class="col-lg-2 control-label">E-mail :
					</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="email"
							value="${utilisateur.email}">
					</div>
				</div>
			</div>
			<!-- adresse -->
			<div class="row">
				<div class="form-group">
					<label for="adresse" class="col-lg-2 control-label">Adresse
						: </label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="adresse"
							value="${utilisateur.adresse}">
					</div>
				</div>
			</div>
			<!-- quantite -->
			<div class="row">
				<div class="form-group">
					<label for="quantite" class="col-lg-2 control-label">Quantité
						: </label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="quantite" value="1">
					</div>
				</div>
			</div>

			<!-- note -->
			<div class="row">
				<div class="form-group">
					<label for="note" class="col-lg-2 control-label">Note : </label>
					<div class="col-lg-10">
						<input type="textarea" class="form-control" id="note">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<button class="pull-right btn btn-default">Confirmer</button>
					<button class="pull-right btn btn-default"
						onClick="fermerFormReserver()">Annuler</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>