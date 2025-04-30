<%@ page import="com.example.asciiart.AsciiArtGenerator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String text = request.getParameter("text");
    String asciiResult = AsciiArtGenerator.generate(text);
    request.setAttribute("asciiArt", asciiResult);
    request.setAttribute("originalText", text);
    RequestDispatcher dispatcher = request.getRequestDispatcher("resultat.jsp");
    dispatcher.forward(request, response);
%>
