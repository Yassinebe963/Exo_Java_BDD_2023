<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ASCII Art - Accueil</title>
</head>
<body>
    <h1>Générateur d'ASCII Art</h1>
    <form method="post" action="AsciiArt.jsp">
        <label for="text">Texte à convertir :</label>
        <input type="text" id="text" name="text" placeholder="Entrez du texte ici" required>
        <button type="submit">Générer</button>
    </form>
</body>
</html>
