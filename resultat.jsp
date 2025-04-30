<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Résultat ASCII Art</title>
</head>
<body>
    <h1>Résultat ASCII Art</h1>

    <%
        String originalText = (String) request.getAttribute("originalText");
        String asciiArt = (String) request.getAttribute("asciiArt");
    %>

    <p><strong>Texte original :</strong> <%= originalText != null ? originalText : "Aucun texte fourni." %></p>

    <pre style="font-family: monospace; font-size: 14px;">
<%= asciiArt != null ? asciiArt : "Aucun ASCII Art généré." %>
    </pre>

    <a href="index.jsp">← Retour</a>
</body>
</html>
