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
<script src="${contextPath}/bootstrap/js/bootstrap.min.js"></script>

<title>Gaifaim - Accueil</title>

<script>
	
	function reserver() {
		alert("${logged}");
		if ("${logged}" == "true") {
			showFormReserver();
		} else {
			alert("Veuillez vous connecter!");
			showLoginForm();
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
						document.getElementById('seConnecterField').innerHTML="<a>Bonjour, " + response.message + "!</a>";
						<c:set var="logged" value="true"/>
						hideLoginForm();
					} else {
						<c:set var="logged" value="false"/>
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
	            <li class="active"> <a href="#">ACCUEIL</a> </li>
	            <li> <a href="${contextPath}/menu">MENUS</a> </li>
	            <li> <a href="#">MES RESERVATIONS</a> </li>
	            <li> <a href="#">SAVOIR-FAIRE</a> </li>
         
	            <li class="dropdown"> 
					<a  data-toggle="dropdown" class="dropdown-toggle">ADMIN<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Comptes</a></li>
					  	<li><a href="#">Menus</a></li>
					  	<li><a href="#">Réservations</a></li>
					</ul>
				  </li>
	          </ul>
	          <div class="navbar-form navbar-right inline-form" id="seConnecterField">
	          
	          	<c:choose>
		          	<c:when test="${logged eq true}">
		          		<a >Bonjour, ${utilisateur.login}</a>
		          	</c:when>
		          	<c:when test="${logged eq false}">
		          		<a onClick="javascript:showLoginForm()">Se connecter</a>
		          	</c:when>
	          	</c:choose>
	          </div>
	        </div>
	      </nav>
	
		<header class="row">
			<div class="col-lg-3">
				<img src="${contextPath}/img/gaifaim.png" alt="Gaifaim" />
			</div>
			<div class="col-lg-5">
				<div id="menu-midi" class="titre1">MENU MIDI DELICIEUX</div>
				<br />

				<img src="${contextPath}/img/cover.png"/>
				<br />
				<div id="livraison-gratuite" class="titre1">LIVRAISON GRATUITE</div><br/>
				<div>
				 Vous êtes lassé des fast-food habituels? Vous ne trouvez plus votre bonheur dans les restaurants près de votre lieu de travail/domicile ? 

    Commandez votre plat préféré chez GaiFaim et faites vous livrer un repas chaud 100% fait maison !
				</div>
			</div>
			<div class="col-lg-4">
				ENTREE<br/>
				 + <br/>
				 PLAT<br/>
				  + <br/>
				  DESSERT<br/>
				   = <br/>
				   10 €<br/>
				   ...................<br/>
				   ★ Un menu unique(le midi) par jour suggéré par le chef.<br/>
				   ★ Livraison uniquement à Boulogne-Billancourt<br/>

				<h1>
					<a  onClick="reserver()">RESERVER</a>
				</h1>
				
			</div>
		</header>

		<div class="row"*>
			<section class="col-lg-8">
				
			</section>

			<section class="col-lg-4">
			</section>
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
		<form id="formLogin" class="form-horizontal col-lg-11"
			action="${contextPath}/login">
			<header>Login</header>
				<a class="pull-right"  onClick="javascript:hideLoginForm()">X</a>
			<div class="row">
				<div id="loginFormResponse"></div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="login" class="col-lg-4 control-label">Login : </label>
					<div class="col-lg-8">
						<input type="text" class="form-control" id="login">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="mdp" class="col-lg-4 control-label">Mot de passe : </label>
					<div class="col-lg-8">
						<input type="password" class="form-control" id="mdp">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<a href="/gaifaim/creationCompte">Créer un compte</a>
					<button class="pull-right btn btn-default">Connecter</button>
				</div>
			</div>
			<div class="form-group"></div>
		</form>
	</div>


	<!-- 	RESERVATION -->
	<div id="dialog-reserver" title="Réservation">
		<form id="formReserver" class="form-horizontal col-lg-11"
			action="/gaifaim/reserver">
			<div class="row">
				<div id="reserverFormResponse"></div>
			</div>
			<!-- login -->
			<div class="row">
				<div class="form-group">
					<label for="login" class="col-lg-4 control-label">Login : </label>
					<div class="col-lg-8">
						<input type="text" class="form-control" id="login"
							value="${utilisateur.login}">
					</div>
				</div>
			</div>
			<!-- téléphone -->
			<div class="row">
				<div class="form-group">
					<label for="telephone" class="col-lg-4 control-label">Téléphone
						: </label>
					<div class="col-lg-8">
						<input type="text" class="form-control" id="telephone"
							value="${utilisateur.telephone}">
					</div>
				</div>
			</div>
			<!-- e-mail -->
			<div class="row">
				<div class="form-group">
					<label for="email" class="col-lg-4 control-label">E-mail :
					</label>
					<div class="col-lg-8">
						<input type="text" class="form-control" id="email"
							value="${utilisateur.email}">
					</div>
				</div>
			</div>
			<!-- adresse -->
			<div class="row">
				<div class="form-group">
					<label for="adresse" class="col-lg-4 control-label">Adresse
						: </label>
					<div class="col-lg-8">
						<input type="text" class="form-control" id="adresse"
							value="${utilisateur.adresse}">
					</div>
				</div>
			</div>
			<!-- quantite -->
			<div class="row">
				<div class="form-group">
					<label for="quantite" class="col-lg-4 control-label">Quantité
						: </label>
					<div class="col-lg-8">
						<input type="text" class="form-control" id="quantite" value="1">
					</div>
				</div>
			</div>

			<!-- note -->
			<div class="row">
				<div class="form-group">
					<label for="note" class="col-lg-4 control-label">Note : </label>
					<div class="col-lg-8">
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