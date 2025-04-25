<h2>Exercice 1 : Le carré d'étoiles</h2>
<p>Ecrire le code afin de produire un carré d'étoile</p>
<p>Exemple si l'utilisateur saisie la valeur 5</p>
<% for (int i = 1; i <= cpt; i++) { %>
    <p>
    <% for (int j = 1; j <= cpt; j++) { %>
        <%= "*" %>
    <% } %>
    </p>
<% } %>

<h2>Exercice 2 : Triangle rectangle gauche</h2>
<p>Exemple si l'utilisateur saisie la valeur 5</p>
<% for (int i = 1; i <= cpt; i++) { %>
    <p>
    <% for (int j = 1; j <= i; j++) { %>
        <%= "*" %>
    <% } %>
    </p>
<% } %>

<h2>Exercice 3 : Triangle rectangle inversé</h2>
<p>Exemple si l'utilisateur saisie la valeur 5</p>
<% for (int i = cpt; i >= 1; i--) { %>
    <p>
    <% for (int j = 1; j <= i; j++) { %>
        <%= "*" %>
    <% } %>
    </p>
<% } %>

<h2>Exercice 4 : Triangle rectangle 2</h2>
<p>Exemple si l'utilisateur saisie la valeur 5</p>
<% for (int i = 1; i <= cpt; i++) { %>
    <p>
    <% for (int j = 1; j <= cpt - i; j++) { %>
        &nbsp;
    <% } %>
    <% for (int k = 1; k <= i; k++) { %>
        <%= "*" %>
    <% } %>
    </p>
<% } %>
