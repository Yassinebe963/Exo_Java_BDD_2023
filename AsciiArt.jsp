<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map, java.util.HashMap" %>

<!DOCTYPE html>
<html>
<head>
    <title>ASCII Art - Résultat</title>
</head>
<body>
    <h1>Résultat ASCII Art</h1>

    <%-- Déclaration de la méthode dans un bloc <%! ... %> --%>
    <%! 
        public Map<Character, String[]> buildAsciiMap() {
            Map<Character, String[]> asciiMap = new HashMap<>();
            
            // Ajoute ici toutes tes lettres et chiffres comme tu l’as fait
            asciiMap.put('A', new String[] {
                " ## ",
                "#  #",
                "####",
                "#  #",
                "#  #"
            });
            // ... (toutes les autres lettres et chiffres)
            asciiMap.put('9', new String[] {
                " ###",
                "#  #",
                " ###",
                "   #",
                " ###"
            });
            asciiMap.put(' ', new String[] {
                "    ",
                "    ",
                "    ",
                "    ",
                "    "
            });

            return asciiMap;
        }
    %>

    <%-- Traitement principal de la requête --%>
    <%
        String text = request.getParameter("text");
        if (text == null) text = "";
        text = text.toUpperCase(); // Convertir en majuscules

        Map<Character, String[]> asciiMap = buildAsciiMap();
        StringBuilder[] outputLines = new StringBuilder[5];
        for (int i = 0; i < 5; i++) outputLines[i] = new StringBuilder();

        for (char c : text.toCharArray()) {
            String[] lines = asciiMap.getOrDefault(c, new String[] { "????", "????", "????", "????", "????" });
            for (int i = 0; i < 5; i++) {
                outputLines[i].append(lines[i]).append("  ");
            }
        }

        StringBuilder asciiArt = new StringBuilder();
        for (StringBuilder line : outputLines) {
            asciiArt.append(line).append("\n");
        }
    %>

    <p><strong>Texte original :</strong> <%= text %></p>
    <pre style="font-family: monospace; font-size: 14px;">
<%= asciiArt.toString() %>
    </pre>

    <a href="index.jsp">← Retour</a>
</body>
</html>
