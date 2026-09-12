<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 
    Author: Girma
    Date: September 11, 2026
    Assignment: CSD430 – Modules 5.2 & 6.2
    File: movieSelect.jsp

    Purpose:
    This JSP page initializes a dropdown menu containing all movieID values
    from the database table 'girmaMoviesdata'. The user selects a movieID,
    and the form submits the value to displayMovie.jsp for record display.

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
    <title>Select Movie</title>
</head>

<body>

<h1>Select a Movie Record</h1>
<p>Please choose a movie ID from the dropdown list below.</p>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%
    String url = "jdbc:mysql://localhost:3306/CSD430";
    String username = "student1";
    String password = "pass";

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        // Load MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        conn = DriverManager.getConnection(url, username, password);

        String sql = "SELECT movieID FROM girmaMoviesdata";
        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery();
%>

<form action="displayMovie.jsp" method="post">
    <label for="movieID">Select Movie ID:</label>
    <select name="movieID" id="movieID">

        <%
            while (rs.next()) {
                int id = rs.getInt("movieID");
        %>
                <option value="<%= id %>"><%= id %></option>
        <%
            }
        %>

    </select>

    <br><br>
    <input type="submit" value="Display Movie">
</form>

<%
    } catch (Exception e) {
        out.println("<p style='color:red;'>Database error: " + e.getMessage() + "</p>");
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception ignored) {}
        try { if (stmt != null) stmt.close(); } catch (Exception ignored) {}
        try { if (conn != null) conn.close(); } catch (Exception ignored) {}
    }
%>

</body>
</html>
