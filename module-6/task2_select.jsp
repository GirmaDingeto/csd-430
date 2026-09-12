<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.girma.girmamoviesproject.Task2MovieBean" %>

<%-- 
    Author: Girma
    Date: September 11, 2026
    Assignment: CSD430 – Modules 5.3 & 6.3
    File: task2_select.jsp

    Purpose:
    This JSP page initializes a dropdown menu using the Task2MovieBean.
    It retrieves all movieID values from the 'girmaMoviesdata' table and
    displays them in a dropdown list. The selected movieID is submitted
    to task2_display.jsp for record display.

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
    <title>Task 2 – Select Movie</title>
</head>

<body>

<h1>Task 2 – Select a Movie Record</h1>
<p>Please choose a movie ID from the dropdown list below.</p>

<%
    Task2MovieBean bean = new Task2MovieBean();
    ArrayList<Integer> ids = bean.getAllMovieIDs();
%>

<form action="task2_display.jsp" method="post">
    <label for="movieID">Select Movie ID:</label>
    <select name="movieID" id="movieID">
        <%
            for (int id : ids) {
        %>
            <option value="<%= id %>"><%= id %></option>
        <%
            }
        %>
    </select>

    <br><br>
    <input type="submit" value="Display Movie">
</form>

<br>
<a href="index.jsp">Return to Main Menu</a>

</body>
</html>
