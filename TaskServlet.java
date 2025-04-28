protected void doPost(HttpServletRequest request, HttpServletResponse response) {
    Task task = new Task(
        request.getParameter("title"),
        request.getParameter("description"),
        LocalDate.parse(request.getParameter("dueDate"))
    );
    List<Task> tasks = (List<Task>) request.getSession().getAttribute("tasks");
    tasks.add(task);
}
