<table>
    <% for (Task task : (List<Task>) session.getAttribute("tasks")) { %>
        <tr>
            <td><%= task.getTitle() %></td>
            <td><%= task.getDescription() %></td>
            <td><%= task.getDueDate() %></td>
            <td><%= task.isCompleted() ? "✓" : "En cours" %></td>
            <td><a href="/tasks?action=delete&id=<%= task.getId() %>">❌</a></td>
        </tr>
    <% } %>
</table>
