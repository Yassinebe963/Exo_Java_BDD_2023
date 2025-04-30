<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Affichage ASCII personnalisé</title>
    <style>
        body {
            font-family: Verdana, sans-serif;
            padding: 20px;
        }
        input[type="text"] {
            padding: 8px;
            width: 60%;
            font-size: 15px;
        }
        input[type="submit"] {
            padding: 8px 16px;
            font-size: 15px;
            margin-left: 10px;
        }
        pre {
            background-color: #eee;
            padding: 15px;
            font-family: monospace;
            border: 1px solid #ccc;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<h1>Convertisseur ASCII (lettres + chiffres)</h1>

<form method="post">
    <input type="text" name="phrase" placeholder="Entrez un mot ou une phrase..." />
    <input type="submit" value="Afficher en ASCII" />
</form>

<%
    String texte = request.getParameter("phrase");

    if (texte != null && !texte.trim().isEmpty()) {
        texte = texte.toUpperCase();

        Map<Character, String[]> asciiMap = new HashMap<>();

        asciiMap.put('A', new String[]{"  ^  ", " /_\\ ", "/   \\", "|   |", "|   |"});
        asciiMap.put('B', new String[]{"|--\\ ", "|/ ", "|--\\ ", "|   \\", "|/ "});
        asciiMap.put('C', new String[]{" /\\", "|    ", "|    ", "|    ", " \\/"});       
        asciiMap.put('D', new String[]{"|\\   ", "| \\  ", "|  \\ ", "|   \\", "|/ "});
        asciiMap.put('E', new String[]{"|----", "|    ", "|--- ", "|    ", "|"});
        asciiMap.put('F', new String[]{"|----", "|    ", "|--- ", "|    ", "|    "});
        asciiMap.put('G', new String[]{" /\\", "|    ", "| __ ", "|  | ", " \\_/ "});
        asciiMap.put('H', new String[]{"|  | ", "|  | ", "|--| ", "|  | ", "|  | "});
        asciiMap.put('I', new String[]{"|", "|", "|", "|", "|"});
        asciiMap.put('J', new String[]{"    |", "    |", "    |", "|   |", " \\_/ "});
        asciiMap.put('K', new String[]{"|  /", "| / ", "|<  ", "| \\ ", "|  \\"});
        asciiMap.put('L', new String[]{"|   ", "|   ", "|   ", "|   ", "|_"});
        asciiMap.put('M', new String[]{"|\\/|", "|  |", "|  |", "|  |", "|  |"});
        asciiMap.put('N', new String[]{"|\\ |", "|\\ |", "| \\|", "|  |", "|  |"});
        asciiMap.put('O', new String[]{" /\\ ", "|  |", "|  |", "|  |", " \\/ "});
        asciiMap.put('P', new String[]{"|\\", "|/ ", "|    ", "|    ", "|    "});
        asciiMap.put('Q', new String[]{" /\\ ", "|  |", "|  |", "|_\\|", "  \\\\"});
        asciiMap.put('R', new String[]{"|\\", "|/ ", "|\\  ", "| \\ ", "|  \\"});
        asciiMap.put('S', new String[]{" /", "|   ", " \\_ ", "   \\", "_/"});
        asciiMap.put('T', new String[]{"-----", "  |  ", "  |  ", "  |  ", "  |  "});
        asciiMap.put('U', new String[]{"|  |", "|  |", "|  |", "|  |", " \\_/ "});
        asciiMap.put('V', new String[]{"\\   /", " \\ / ", "  |  ", "  |  ", "     "});
        asciiMap.put('W', new String[]{"|  |", "|  |", "|  |", "|/\\|", "|  |"});
        asciiMap.put('X', new String[]{"\\  /", " \\/ ", " /\\ ", "/  \\", "    "});
        asciiMap.put('Y', new String[]{"\\ /", " | ", " | ", " | ", "   "});
        asciiMap.put('Z', new String[]{"", "  / ", " /  ", "/   ", ""});

        // Chiffres
        asciiMap.put('0', new String[]{" /\\ ", "|  |", "|  |", "|  |", " \\/ "});
        asciiMap.put('1', new String[]{" /| ", "  | ", "  | ", "  | ", " |"});
        asciiMap.put('2', new String[]{" /\\ ", "   |", "  / ", " /  ", "|_"});
        asciiMap.put('3', new String[]{" /\\ ", "   |", " _/ ", "   |", " \\/ "});
        asciiMap.put('4', new String[]{"|  |", "|  |", "||", "   |", "   |"});
        asciiMap.put('5', new String[]{"|", "|   ", "|~\\", "   |", "\\/"});        
        asciiMap.put('6', new String[]{" /", "|   ", "|\\", "|  |", "\\/"});        
        asciiMap.put('7', new String[]{"", "   /", "  / ", " /  ", "/   "});        
        asciiMap.put('8', new String[]{" /\\ ", "||", "|--|", "|  |", "\\/"});
        asciiMap.put('9', new String[]{" /\\ ", "|  |", "\\|", "   |", " \\_/"});        

        asciiMap.put(' ', new String[]{"    ", "    ", "    ", "    ", "    "});
        asciiMap.put('?', new String[]{" ?? ", "   ?", "  ? ", "     ", "  ? "});

        // Initialiser les lignes de sortie
        String[] result = new String[5];
        Arrays.fill(result, "");

        for (char letter : texte.toCharArray()) {
            String[] ascii = asciiMap.getOrDefault(letter, asciiMap.get('?'));
            for (int i = 0; i < 5; i++) {
                result[i] += ascii[i] + "  ";
            }
        }
%>

<h3>Affichage ASCII :</h3>
<%
    // Remplacement des caractères visibles par '#'
    for (int i = 0; i < result.length; i++) {
        result[i] = result[i].replaceAll("[^\\s]", "#"); // remplace tout sauf les espaces
    }
%>
<pre>
<%= result[0] %>
<%= result[1] %>
<%= result[2] %>
<%= result[3] %>
<%= result[4] %>
</pre>

<% } %>

</body>
</html>
