<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%-- 
    Author: Girma Dingeto
    Date: September 26, 2026
    Assignment: CSD430 – Module 8.2 (Project Part 3)
    File: updateDisplay.jsp
    Encoding: UTF-8

    Purpose:
    This JSP receives updated movie fields from editRecord.jsp, performs an SQL 
    UPDATE on csd430.girmamoviesdata, displays the updated record, and then 
    displays the entire database table so the user can visually confirm the update.

    Academic Honesty:
    This file was written entirely by me (Girma). AI assistance was used only 
    for formatting, documentation structure, and reference organization.

    References:
    Bellevue University – Documentation Requirements PDF
    Java JDBC CRUD Tutorial – GeeksforGeeks
    JSP + Servlet + JDBC CRUD Example – CodeJava
    Java JDBC CRUD Tutorial (Mihn, codejava.net, 2019)
    JavaBeans (codecademy.com, 2022)
    CRUD Application Using JSP/Servlet (mitrais.com, 2019)
    Create a Document from a JavaBean (hpe.com, 2024)
    CRUD Update Video (Bellevue University, 2024)
--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Module 8 – Updated Movie Record</title>
</head>

<body>

<h1>Module 8 – Updated Movie Record</h1>
<hr>

<%
    // Prevent direct access — redirect back to updateForm.jsp
    String idParam = request.getParameter("movieID");
    String yrParam = request.getParameter("yearReleased");

    if(idParam == null || yrParam == null ||
       idParam.trim().equals("") || yrParam.trim().equals("")) {

        response.sendRedirect("updateForm.jsp");
        return;
    }

    int movieID = Integer.parseInt(idParam);
    int yearReleased = Integer.parseInt(yrParam);

    String title = request.getParameter("title");
    String genre = request.getParameter("genre");
    String rating = request.getParameter("rating");
    String director = request.getParameter("director");

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    ResultSet rsAll = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/csd430",
            "student1",
            "pass");

        // UPDATE the record
        ps = conn.prepareStatement(
            "UPDATE girmamoviesdata SET title=?, genre=?, yearReleased=?, rating=?, director=? WHERE movieID=?");

        ps.setString(1, title);
        ps.setString(2, genre);
        ps.setInt(3, yearReleased);
        ps.setString(4, rating);
        ps.setString(5, director);
        ps.setInt(6, movieID);

        ps.executeUpdate();
        ps.close();

        // Retrieve updated record
        ps = conn.prepareStatement("SELECT * FROM girmamoviesdata WHERE movieID=?");
        ps.setInt(1, movieID);
        rs = ps.executeQuery();

        if(rs.next()) {
%>

<!-- Updated Record Table -->
<h2>Updated Record</h2>
<table border="1" cellpadding="8">
    <tr><th>Field</th><th>Value</th></tr>
    <tr><td>Movie ID</td><td><%= rs.getInt("movieID") %></td></tr>
    <tr><td>Title</td><td><%= rs.getString("title") %></td></tr>
    <tr><td>Genre</td><td><%= rs.getString("genre") %></td></tr>
    <tr><td>Year Released</td><td><%= rs.getInt("yearReleased") %></td></tr>
    <tr><td>Rating</td><td><%= rs.getString("rating") %></td></tr>
    <tr><td>Director</td><td><%= rs.getString("director") %></td></tr>
</table>

<%
        }

        // Retrieve full table
        Statement stmtAll = conn.createStatement();
        rsAll = stmtAll.executeQuery("SELECT * FROM girmamoviesdata");
%>

<!-- Full Database Table -->
<h2>Full Movie Database (csd430.girmamoviesdata)</h2>
<table border="1" cellpadding="8">
    <tr>
        <th>Movie ID</th>
        <th>Title</th>
        <th>Genre</th>
        <th>Year Released</th>
        <th>Rating</th>
        <th>Director</th>
    </tr>

    <% while(rsAll.next()) { %>
        <tr>
            <td><%= rsAll.getInt("movieID") %></td>
            <td><%= rsAll.getString("title") %></td>
            <td><%= rsAll.getString("genre") %></td>
            <td><%= rsAll.getInt("yearReleased") %></td>
            <td><%= rsAll.getString("rating") %></td>
            <td><%= rsAll.getString("director") %></td>
        </tr>
    <% } %>
</table>

<%
    } catch(Exception e) {
        out.println("<p style='color:red;'>Error updating movie record: " + e.getMessage() + "</p>");
    } finally {
        if(rs != null) rs.close();
        if(rsAll != null) rsAll.close();
        if(ps != null) ps.close();
        if(conn != null) conn.close();
    }
%>

<hr>

<!-- Back Navigation -->
<p>
    <a href="updateForm.jsp">Update Another Movie</a><br><br>
    <a href="index.jsp">Back to Project Navigation</a>
</p>

</body>
</html>
