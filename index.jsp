<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>ASCII Art - Accueil</title>
</head>
<body>
    <h1>Générateur d'ASCII Art</h1>
    <form method="post" action="AsciiArt.jsp"> <!-- Corrigé ici -->
        <input type="text" name="phrase" placeholder="Entrez du texte ici" required>
        <button type="submit">Générer</button>
    </form>
</body>
</html>
