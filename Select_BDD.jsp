<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion à MariaDB via JSP</title>
</head>
<body bgcolor="white">
    <h1>Exemple de connexion à MariaDB avec JSP</h1>

    <%
    // Déclaration des paramètres de connexion
    String url = "jdbc:mariadb://localhost:3306/films";
    String user = "cnam";
    String password = "cnam";

    try {
        // Charger le pilote JDBC
        Class.forName("org.mariadb.jdbc.Driver");

        // Établir la connexion
        Connection conn = DriverManager.getConnection(url, user, password);

        // Exemple de requête SQL
        String sql = "SELECT idFilm, titre, annee FROM Film WHERE annee >= 2000";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        // Afficher les résultats
        while (rs.next()) {
            String idFilm = rs.getString("idFilm");
            String titre = rs.getString("titre");
            String annee = rs.getString("annee");

            out.println("ID : " + idFilm + ", Titre : " + titre + ", Année : " + annee + "<br/>");
        }

        // Fermer les ressources
        rs.close();
        pstmt.close();
        conn.close();

    } catch (Exception e) {
        out.println("Erreur de connexion ou d'exécution SQL : " + e.getMessage());
    }
    %>

    <h2>Exercice 1 : Les films entre 2000 et 2015</h2>
    <p>Extraire les films dont l'année est strictement supérieure à 2000 et inférieure à 2015.</p>

    <h2>Exercice 2 : Année de recherche</h2>
    <p>Créer un champ de saisie permettant à l'utilisateur de choisir l'année de sa recherche.</p>

    <h2>Exercice 3 : Modification du titre du film</h2>
    <p>Créer une page permettant de modifier le titre d'un film à partir de son ID (saisi par l'utilisateur).</p>

    <h2>Exercice 4 : Ajout d'un nouveau film</h2>
    <p>Créer un formulaire pour saisir un nouveau film dans la base de données.</p>

    <hr>

    <h3>Projet Bibliothèque</h3>
    <p>Votre projet consiste à concevoir et développer une application de gestion de bibliothèque moderne qui simplifie le processus de prêt et de retour de livres. Les fonctionnalités attendues sont :</p>
    <ul>
        <li>L’enregistrement et la suppression de livres.</li>
        <li>La recherche de livres disponibles.</li>
        <li>L'emprunt d'un livre par un utilisateur.</li>
        <li>La gestion des utilisateurs.</li>
        <li>La gestion des stocks.</li>
    </ul>
    <p>L'application utilisera JSP (Java) pour interagir avec la base de données MariaDB.<br/>
    Elle pourra être enrichie avec des fonctionnalités supplémentaires, telles que des recommandations de livres, des notifications pour les retours en retard, ou encore des rapports statistiques sur l'utilisation des livres, pour améliorer l'expérience utilisateur et la gestion de la bibliothèque.</p>

    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
