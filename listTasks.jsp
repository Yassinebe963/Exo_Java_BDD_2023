<% for(Task task : (List<Task>) session.getAttribute("tasks")) { %>
    <div class="task">
        <h3><%= task.getTitle() %></h3>
        <p>Échéance : <%= task.getDueDate() %></p>
    </div>
<% } %>
