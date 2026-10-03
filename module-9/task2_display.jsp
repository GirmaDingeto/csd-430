<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.girma.girmamoviesproject.Task2MovieBean" %>
<%@ page import="com.girma.girmamoviesproject.Task2Movie" %>

<%-- 
    Author: Girma
    Date: September 11, 2026
    Assignment: CSD430 – Modules 5.3 & 6.3
    File: task2_display.jsp

    Purpose:
    This JSP page receives a movieID from task2_select.jsp, retrieves the 
    corresponding movie record using the Task2MovieBean, and displays the 
    data in an HTML table format as required by the assignment. This version 
    includes full null‑safety to prevent HTTP 500 errors when accessed 
    directly without a form submission.

    Academic Honesty:
    This file was written entirely by me (Girma).
    AI assistance was used only for formatting, documentation structure, and
    reference organization. All logic and implementation are my own.

    References:
    Bellevue University – Documentation Requirements PDF
    https://cyberactive.bellevue.edu/ultra/courses/_546986_1/document/_18077820_1?view=content&state=view

    Java JDBC CRUD Tutorial – SQL Insert, Select, Update, and Delete Examples
    https://www.geeksforgeeks.org/java/simplifying-crud-operation-with-jdbc/

    JSP + Servlet + JDBC CRUD Example
    https://www.codejava.net/coding/jsp-servlet-jdbc-mysql-create-read-update-delete-crud-example

    Microsoft Copilot – Assistance with formatting, documentation, and organization
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Task 2 – Movie Record Display</title>
</head>

<body>

<h1>Task 2 – Movie Record Details</h1>
<p>The selected movie record is displayed below.</p>

<%
    // Retrieve movieID submitted from task2_select.jsp with full null-safety
    String movieIDParam = request.getParameter("movieID");

    if (movieIDParam == null || movieIDParam.trim().isEmpty()) {
%>
        <h2>Error: No movie was selected.</h2>
        <p>Please return to the movie selection page.</p>
        <a href="task2_select.jsp">Go Back to Movie Selection</a>
</body>
</html>
<%
        return;
    }

    int movieID = Integer.parseInt(movieIDParam);

    Task2MovieBean bean = new Task2MovieBean();
    Task2Movie movie = bean.getMovieById(movieID);

    if (movie == null) {
%>
        <h2>Error: Movie not found.</h2>
        <p>The movieID you selected does not exist in the database.</p>
        <a href="task2_select.jsp">Go Back to Movie Selection</a>
</body>
</html>
<%
        return;
    }
%>

<table border="1" cellpadding="8" cellspacing="0">
    <thead>
        <tr>
            <th>Movie ID</th>
            <th>Title</th>
            <th>Genre</th>
            <th>Year Released</th>
            <th>Rating</th>
            <th>Director</th>
        </tr>
    </thead>

    <tbody>
        <tr>
            <td><%= movie.getMovieID() %></td>
            <td><%= movie.getTitle() %></td>
            <td><%= movie.getGenre() %></td>
            <td><%= movie.getYearReleased() %></td>
            <td><%= movie.getRating() %></td>
            <td><%= movie.getDirector() %></td>
        </tr>
    </tbody>
</table>

<br>
<a href="task2_select.jsp">Return to Movie Selection</a>
<br><br>
<a href="index.jsp">Return to Main Menu</a>

</body>
</html>
