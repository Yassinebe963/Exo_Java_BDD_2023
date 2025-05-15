<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manipulation de Chaîne en JSP</title>
    <meta charset="UTF-8">
    <style>
        .resultat {
            margin: 10px 0;
            padding: 5px;
            border-left: 3px solid #ccc;
        }
    </style>
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
    
    <%-- Affichage des résultats sans gras --%>
    <div class="resultat">
        Chaîne originale : <span><%= bonjour %></span>
    </div>
    
    <div class="resultat">
        En majuscules : <span><%= enMajuscules %></span>
    </div>
    
    <div class="resultat">
        Première lettre en majuscule : <span><%= premiereLettreMaj %></span>
    </div>
</body>
</html>
