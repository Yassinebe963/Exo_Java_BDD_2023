<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Résultat ASCII Art</title>
</head>
<body>
    <h1>Résultat ASCII Art</h1>
    
    <!-- Affichage du texte original -->
    <p><strong>Texte original :</strong> <%= request.getAttribute("originalText") %></p>

    <!-- Affichage du ASCII Art généré avec un style de police monospace -->
    <pre style="font-family: monospace; font-size: 14px;">
        <%= request.getAttribute("asciiArt") %>
    </pre>

    <!-- Lien pour revenir à la page d'accueil -->
    <a href="AsciiArt.jsp">← Retour</a>
</body>
</html>
