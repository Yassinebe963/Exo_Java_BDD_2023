<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manipulation de Chaîne en JSP</title>
    <meta charset="UTF-8">
</head>
<body>
    <h1>Manipulation de Chaîne</h1>
    
    <%-- Déclaration de la méthode Java --%>
    <%!
        public String capitalizeFirstLetter(String str) {
            if (str == null || str.isEmpty()) {
                return str;
            }
            return str.substring(0, 1).toUpperCase() + str.substring(1).toLowerCase();
        }
    %>
    
    <%-- Bloc de script principal --%>
    <%
        String bonjour = "salut la compagnie";
        
        // Traitements
        String enMajuscules = bonjour.toUpperCase();
        String premiereLettreMaj = capitalizeFirstLetter(bonjour);
    %>
    
    <%-- Affichage des résultats --%>
    <p>Chaîne originale : <strong><%= bonjour %></strong></p>
    <p>En majuscules : <strong><%= enMajuscules %></strong></p>
    <p>Première lettre en majuscule : <strong><%= premiereLettreMaj %></strong></p>
</body>
</html>
