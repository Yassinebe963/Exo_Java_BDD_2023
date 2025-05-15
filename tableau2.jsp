<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestion de Tableau</title>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }
        .container {
            background-color: #f5f5f5;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .menu {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 20px;
        }
        button {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        #valeurInput {
            padding: 8px;
            width: 60px;
        }
        .message {
            padding: 10px;
            margin: 10px 0;
            border-radius: 4px;
        }
        .success {
            background-color: #dff0d8;
            color: #3c763d;
        }
        .error {
            background-color: #f2dede;
            color: #a94442;
        }
        .info {
            background-color: #d9edf7;
            color: #31708f;
        }
        .tableau {
            margin-top: 20px;
            padding: 10px;
            background-color: white;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Gestion de Tableau</h1>
        
        <%-- Initialisation du tableau --%>
        <% 
            ArrayList<Integer> tableau = (ArrayList<Integer>) session.getAttribute("tableau");
            if (tableau == null) {
                tableau = new ArrayList<Integer>();
                session.setAttribute("tableau", tableau);
            }
            
            String message = "";
            String messageType = "";
            
            // Gestion des actions
            String action = request.getParameter("action");
            if (action != null) {
                switch (action) {
                    case "ajouter":
                        try {
                            int valeur = Integer.parseInt(request.getParameter("valeur"));
                            if (tableau.size() >= 10) {
                                message = "Erreur : Le tableau est plein (10 éléments maximum)";
                                messageType = "error";
                            } else {
                                tableau.add(valeur);
                                message = "Valeur " + valeur + " ajoutée avec succès";
                                messageType = "success";
                            }
                        } catch (NumberFormatException e) {
                            message = "Erreur : Veuillez entrer un nombre valide";
                            messageType = "error";
                        }
                        break;
                    case "supprimer":
                        if (tableau.isEmpty()) {
                            message = "Erreur : Le tableau est déjà vide";
                            messageType = "error";
                        } else {
                            int derniereValeur = tableau.remove(tableau.size() - 1);
                            message = "Valeur " + derniereValeur + " supprimée avec succès";
                            messageType = "success";
                        }
                        break;
                    case "afficher":
                        if (tableau.isEmpty()) {
                            message = "Le tableau est vide";
                            messageType = "info";
                        } else {
                            message = "Contenu actuel du tableau affiché";
                            messageType = "info";
                        }
                        break;
                    case "vider":
                        if (tableau.isEmpty()) {
                            message = "Le tableau est déjà vide";
                            messageType = "info";
                        } else {
                            tableau.clear();
                            message = "Tableau vidé avec succès";
                            messageType = "success";
                        }
                        break;
                }
                session.setAttribute("tableau", tableau);
            }
        %>
        
        <%-- Affichage des messages --%>
        <% if (!message.isEmpty()) { %>
            <div class="message <%= messageType %>">
                <%= message %>
            </div>
        <% } %>
        
        <%-- Menu d'actions --%>
        <form method="post" class="menu">
            <div>
                <input type="number" id="valeurInput" name="valeur" placeholder="Valeur">
                <button type="submit" name="action" value="ajouter">Ajouter</button>
            </div>
            <button type="submit" name="action" value="supprimer">Supprimer dernier</button>
            <button type="submit" name="action" value="afficher">Afficher</button>
            <button type="submit" name="action" value="vider">Vider</button>
        </form>
        
        <%-- Affichage du tableau --%>
        <% if (action != null && action.equals("afficher")) { %>
            <div class="tableau">
                <h3>Contenu du tableau (<%= tableau.size() %>/10 éléments)</h3>
                <% if (tableau.isEmpty()) { %>
                    <p>Le tableau est vide</p>
                <% } else { %>
                    <ul>
                        <% for (int i = 0; i < tableau.size(); i++) { %>
                            <li>Élément <%= i+1 %> : <%= tableau.get(i) %></li>
                        <% } %>
                    </ul>
                <% } %>
            </div>
        <% } %>
    </div>
</body>
</html>
