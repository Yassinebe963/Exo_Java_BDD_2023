@WebServlet("/tasks")
public class TaskServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        // Ajout tâche
        Task task = new Task(request.getParameter("title"), ...);
        ((List<Task>) request.getSession().getAttribute("tasks")).add(task);
    }
}
