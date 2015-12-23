<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/taglibs.jsp"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Réservations</title>
 
    <style>
        tr:first-child{
            font-weight: bold;
            background-color: #C6C9C4;
        }
    </style>
 
</head>
 
 
<body>

<c:set var="myValue" value="a tag </tag>" />
<c:out value="${myValue}" />

    <h2>Liste des réservation d'aujourd'hui</h2>  
    <table>
        <tr>
            <td>LOGIN</td><td>EMAIL</td><td>TELEPHONE</td><td></td><td></td>
        </tr>
        <c:forEach items="${utilisateurs}" var="utilisateur">
            <tr>
            <td>${utilisateur.login}</td>
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