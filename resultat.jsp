<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Résultat ASCII Art</title>
</head>
<body>
    <h1>Résultat ASCII Art</h1>

    <p><strong>Texte original :</strong> <%= request.getAttribute("originalText") %></p>

    <pre style="font-family: monospace; font-size: 14px;">
<%= request.getAttribute("asciiArt") %>
    </pre>

    <a href="index.jsp">← Retour</a>
</body>
</html>
