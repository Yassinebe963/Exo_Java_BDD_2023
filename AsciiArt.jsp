<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%! // DÉBUT de la déclaration de la fonction Java
    String generateAsciiArt(String input) {
        input = input.toUpperCase();
        int height = 5;
        int width = 4;

        String[] asciiFont = {
            // Ligne 1
            " #   ###  ###  # #  ###  ###  ###   #   ###  ###  ###  ###  ###  ###  # #  ###  ###  # #  ###  # #  ###  ###  ###  # #  ###  ###  ###  ###  ",
            // Ligne 2
            "# #  #    #    # #  #    #      #  # #  #    #      #  # #  #    #      #  #    #      #  #    # #  #      #  # #  #      #  # #  # #  # #  ",
            // Ligne 3
            "###  ###  ###  ###  ###  ###   #   ###  ###  ###   #   ###  ###  ###    #  ###  ###    #  ###  ###  ###   #   ###  ###    #  ###  ###  ### ",
            // Ligne 4
            "# #  #       #  #   #    #     #   # #    #  # #   #   #      #    #   #   #      #   #   #    # #    #   #   # #    #   #   # #    #      # ",
            // Ligne 5
            "# #  ###  ###   #   ###  ###  ###  # #  ###  ###  ###  ###  ###  ###   #   ###  ###  ###  ###  # #  ###  ###  # #  ###  ###  # #  ###  ###  "
        };

        StringBuilder[] output = new StringBuilder[height];
        for (int i = 0; i < height; i++) {
            output[i] = new StringBuilder();
        }

        for (char ch : input.toCharArray()) {
            int index = -1;
            if (ch >= 'A' && ch <= 'Z') {
                index = ch - 'A';
            } else if (ch >= '0' && ch <= '9') {
                index = 26 + (ch - '0');
            } else {
                continue;
            }

            for (int i = 0; i < height; i++) {
                int start = index * width;
                output[i].append(asciiFont[i], start, start + width).append(" ");
            }
        }

        StringBuilder finalResult = new StringBuilder();
        for (StringBuilder line : output) {
            finalResult.append(line.toString()).append("\n");
        }

        return finalResult.toString();
    }
%>

<% // CODE PRINCIPAL
    String texte = request.getParameter("text");
    String result = null;

    if (texte != null && !texte.trim().isEmpty()) {
        result = generateAsciiArt(texte);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ASCII Art en JSP</title>
</head>
<body>
    <h1>ASCII Art Generator (lettres + chiffres en #)</h1>

    <form method="post" action="AsciiArt.jsp">
        <input type="text" name="text" value="<%= texte != null ? texte : "" %>" required>
        <button type="submit">Générer</button>
    </form>

    <% if (result != null) { %>
        <h2>Résultat :</h2>
        <pre style="font-family: monospace; font-size: 14px;"><%= result %></pre>
    <% } %>
</body>
</html>
