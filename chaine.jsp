<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manipulation de chaînes</title>
</head>
<body>
    <h1>Manipulation de la chaîne "salut la compagnie"</h1>
    
    <%!
        // Méthode pour mettre la première lettre en majuscule
        public String premiereLettreMajuscule(String chaine) {
            if (chaine == null || chaine.isEmpty()) {
                return chaine;
            }
            return chaine.substring(0, 1).toUpperCase() + chaine.substring(1);
        }
    %>
    
    <%
        String bonjour = "salut la compagnie";
        
        // Affichage de la chaîne originale
        out.println("<p>Chaîne originale : " + bonjour + "</p>");
        
        // Affichage en majuscules
        out.println("<p>En majuscules : " + bonjour.toUpperCase() + "</p>");
        
        // Affichage avec première lettre en majuscule
        out.println("<p>Première lettre en majuscule : " + premiereLettreMajuscule(bonjour) + "</p>");
    %>
</body>
</html>
