<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 
    Author: Girma Dingeto
    Date: October 2, 2026
    Assignment: CSD430 – Module 9.2 (Delete Records)
    File: deleteForm.jsp
    Encoding: UTF-8

    Purpose:
    • Connect to csd430 database
    • Retrieve all records from girmamoviesdata
    • Display records in HTML table
    • Provide dropdown of movieID values
    • Submit selected ID to deleteRecord.jsp

    Academic Honesty:
    Written entirely by me (Girma). AI assistance used only for formatting.
--%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Module 9 – Delete Movie Record</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>

<h1>Module 9 – Delete Movie Record</h1>
<p>Select a movie ID to delete. The remaining records will be displayed.</p>
<hr>

<%
    String dbUrl      = "jdbc:mysql://localhost:3306/csd430";
    String dbUser     = "student1";
    String dbPassword = "pass";
    String dbDriver   = "com.mysql.cj.jdbc.Driver";

    Connection conn = null;
    Statement stmt  = null;
    ResultSet rs    = null;

    try {
        Class.forName(dbDriver);
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        String sql = "SELECT movieID, title, director, genre, yearReleased, rating " +
                     "FROM girmamoviesdata ORDER BY movieID";

        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                                    ResultSet.CONCUR_READ_ONLY);

        rs = stmt.executeQuery(sql);
%>

<h2>All Movie Records</h2>

<table>
    <thead>
        <tr>
            <th>Movie ID</th>
            <th>Title</th>
            <th>Director</th>
            <th>Genre</th>
            <th>Year Released</th>
            <th>Rating</th>
        </tr>
    </thead>
    <tbody>
    <%
        if (!rs.next()) {
    %>
        <tr><td colspan="6">No records found.</td></tr>
    <%
        } else {
            rs.beforeFirst();
            while (rs.next()) {
    %>
        <tr>
            <td><%= rs.getInt("movieID") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("director") %></td>
            <td><%= rs.getString("genre") %></td>
            <td><%= rs.getInt("yearReleased") %></td>
            <td><%= rs.getDouble("rating") %></td>
        </tr>
    <%
            }
        }
    %>
    </tbody>
</table>

<hr>

<h2>Select Movie ID to Delete</h2>

<form action="deleteRecord.jsp" method="post">
    <label for="deleteKey">Movie ID:</label>
    <select name="deleteKey" id="deleteKey">
        <%
            rs.beforeFirst();
            boolean first = true;
            while (rs.next()) {
                int id = rs.getInt("movieID");
        %>
            <option value="<%= id %>" <%= first ? "selected" : "" %>><%= id %></option>
        <%
                first = false;
            }
        %>
    </select>

    <br><br>
    <input type="submit" value="Delete Selected Movie">
</form>

<%
    } catch (Exception e) {
%>
    <p style="color:red;">Error: <%= e.getMessage() %></p>
<%
    } finally {
        try { if (rs != null) rs.close(); } catch (SQLException ex) {}
        try { if (stmt != null) stmt.close(); } catch (SQLException ex) {}
        try { if (conn != null) conn.close(); } catch (SQLException ex) {}
    }
%>

<hr>

<h3>References</h3>
<ul>
    <li>Bellevue University – Documentation Requirements PDF</li>
    <li>CRUD Operations in Java (Pandey, scaler.com, 2023)</li>
    <li>Java JDBC CRUD Tutorial – JDBC Execute DELETE Statement Example (Mihn, codejava.net, 2019)</li>
    <li>CRUD Delete Video – Bellevue University (2024)</li>
</ul>

<p><a href="index.jsp">Return to Project Navigation</a></p>

</body>
</html>
