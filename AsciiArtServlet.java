<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map, java.util.HashMap" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Iterator" %>

<!DOCTYPE html>
<html>
<head>
    <title>ASCII Art - Résultat</title>
</head>
<body>
    <h1>Résultat ASCII Art</h1>

    <% 
        // Fonction pour construire la Map des caractères ASCII
        Map<Character, String[]> buildAsciiMap() {
            Map<Character, String[]> asciiMap = new HashMap<>();
            
            // Lettres A-Z
            asciiMap.put('A', new String[] {
                " ## ",
                "#  #",
                "####",
                "#  #",
                "#  #"
            });
            asciiMap.put('B', new String[] {
                "### ",
                "#  #",
                "### ",
                "#  #",
                "### "
            });
            asciiMap.put('C', new String[] {
                " ## ",
                "#   ",
                "#   ",
                "#   ",
                " ## "
            });
            asciiMap.put('D', new String[] {
                "### ",
                "#  #",
                "#  #",
                "#  #",
                "### "
            });
            asciiMap.put('E', new String[] {
                "####",
                "#   ",
                "### ",
                "#   ",
                "####"
            });
            asciiMap.put('F', new String[] {
                "####",
                "#   ",
                "### ",
                "#   ",
                "#   "
            });
            asciiMap.put('G', new String[] {
                " ## ",
                "#   ",
                "# ##",
                "#  #",
                " ###"
            });
            asciiMap.put('H', new String[] {
                "#  #",
                "#  #",
                "####",
                "#  #",
                "#  #"
            });
            asciiMap.put('I', new String[] {
                "###",
                " # ",
                " # ",
                " # ",
                "###"
            });
            asciiMap.put('J', new String[] {
                "  ##",
                "   #",
                "   #",
                "#  #",
                " ## "
            });
            asciiMap.put('K', new String[] {
                "#  #",
                "# # ",
                "##  ",
                "# # ",
                "#  #"
            });
            asciiMap.put('L', new String[] {
                "#   ",
                "#   ",
                "#   ",
                "#   ",
                "####"
            });
            asciiMap.put('M', new String[] {
                "#   #",
                "## ##",
                "# # #",
                "#   #",
                "#   #"
            });
            asciiMap.put('N', new String[] {
                "#   #",
                "##  #",
                "# # #",
                "#  ##",
                "#   #"
            });
            asciiMap.put('O', new String[] {
                " ## ",
                "#  #",
                "#  #",
                "#  #",
                " ## "
            });
            asciiMap.put('P', new String[] {
                "### ",
                "#  #",
                "### ",
                "#   ",
                "#   "
            });
            asciiMap.put('Q', new String[] {
                " ## ",
                "#  #",
                "#  #",
                "# ##",
                " ###"
            });
            asciiMap.put('R', new String[] {
                "### ",
                "#  #",
                "### ",
                "# # ",
                "#  #"
            });
            asciiMap.put('S', new String[] {
                " ###",
                "#   ",
                " ## ",
                "   #",
                "### "
            });
            asciiMap.put('T', new String[] {
                "#####",
                "  #  ",
                "  #  ",
                "  #  ",
                "  #  "
            });
            asciiMap.put('U', new String[] {
                "#  #",
                "#  #",
                "#  #",
                "#  #",
                " ## "
            });
            asciiMap.put('V', new String[] {
                "#   #",
                "#   #",
                "#   #",
                " # # ",
                "  #  "
            });
            asciiMap.put('W', new String[] {
                "#   #",
                "#   #",
                "# # #",
                "# # #",
                " # # "
            });
            asciiMap.put('X', new String[] {
                "#   #",
                " # # ",
                "  #  ",
                " # # ",
                "#   #"
            });
            asciiMap.put('Y', new String[] {
                "#   #",
                " # # ",
                "  #  ",
                "  #  ",
                "  #  "
            });
            asciiMap.put('Z', new String[] {
                "####",
                "   #",
                "  # ",
                " #  ",
                "####"
            });

            // Chiffres 0-9
            asciiMap.put('0', new String[] {
                " ## ",
                "#  #",
                "#  #",
                "#  #",
                " ## "
            });
            asciiMap.put('1', new String[] {
                "  # ",
                " ## ",
                "  # ",
                "  # ",
                "  # "
            });
            asciiMap.put('2', new String[] {
                "### ",
                "   #",
                " ###",
                "#   ",
                "####"
            });
            asciiMap.put('3', new String[] {
                "### ",
                "   #",
                " ###",
                "   #",
                "### "
            });
            asciiMap.put('4', new String[] {
                "#  #",
                "#  #",
                "####",
                "   #",
                "   #"
            });
            asciiMap.put('5', new String[] {
                "####",
                "#   ",
                "### ",
                "   #",
                "### "
            });
            asciiMap.put('6', new String[] {
                " ###",
                "#   ",
                "### ",
                "#  #",
                " ###"
            });
            asciiMap.put('7', new String[] {
                "####",
                "   #",
                "  # ",
                " #  ",
                "#   "
            });
            asciiMap.put('8', new String[] {
                " ###",
                "#  #",
                " ###",
                "#  #",
                " ###"
            });
            asciiMap.put('9', new String[] {
                " ###",
                "#  #",
                " ###",
                "   #",
                " ###"
            });

            // Espace
            asciiMap.put(' ', new String[] {
                "    ",
                "    ",
                "    ",
                "    ",
                "    "
            });

            return asciiMap;
        }

        // Récupération du texte soumis par l'utilisateur
        String text = request.getParameter("text").toUpperCase(); // Convertir en majuscules
        Map<Character, String[]> asciiMap = buildAsciiMap();
        StringBuilder asciiArt = new StringBuilder();

        // Générer l'ASCII Art pour chaque caractère
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            String[] asciiChar = asciiMap.get(c);
            if (asciiChar != null) {
                for (String line : asciiChar) {
                    asciiArt.append(line).append("\n");
                }
            }
        }

        // Mettre l'ASCII Art et le texte original dans les attributs de la requête
        request.setAttribute("originalText", text);
        request.setAttribute("asciiArt", asciiArt.toString());
    %>

    <p><strong>Texte original :</strong> <%= text %></p>
    <pre style="font-family: monospace; font-size: 14px;">
        <%= asciiArt.toString() %>
    </pre>

    <a href="index.jsp">← Retour</a>
</body>
</html>
