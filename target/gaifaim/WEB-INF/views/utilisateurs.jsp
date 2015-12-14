<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core " %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Utilisateurs</title>
 
    <style>
        tr:first-child{
            font-weight: bold;
            background-color: #C6C9C4;
        }
    </style>
 
</head>
 
 
<body>
    <h2>Liste des utilisateurs</h2>  
    <table>
        <tr>
            <td>NOM</td><td>LOGIN</td><td>ID_ROLE</td><td>EMAIL</td><td>TELEPHONE</td>
        </tr>
        <c:forEach items="${utilisateurs}" var="utilisateurs">
            <tr>
            <td>${utilisateur.nom}</td>
            <td>${utilisateur.login}</td>
            <td>${utilisateur.idRole}</td>
            <td>${utilisateur.email}</td>
            <td>${utilisateur.telephone}</td>
            <td><a href="<c:url value='/edit-${utilisateur.id}-utilisateur' />">Modifier</a></td>
            <td><a href="<c:url value='/delete-${utilisateur.id}-utilisateur' />">Supprimer</a></td>
            </tr>
        </c:forEach>
    </table>
    <br/>
    <a href="<c:url value='/new' />">Ajouter un nouvel utilisateur</a>
</body>
</html>