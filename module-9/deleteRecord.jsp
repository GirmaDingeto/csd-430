<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 
    Author: Girma Dingeto
    Date: October 2, 2026
    Assignment: CSD430 – Module 9.2
    File: deleteRecord.jsp

    Purpose:
    • Receive movieID from deleteForm.jsp
    • Delete record from girmamoviesdata
    • Redisplay remaining records
    • Allow repeated deletion

    Academic Honesty:
    Written entirely by me (Girma). AI assistance used only for formatting.
--%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Module 9 – Delete Result</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>

<h1>Module 9 – Delete Result</h1>

<%
    String keyParam = request.getParameter("deleteKey");

    String dbUrl      = "jdbc:mysql://localhost:3306/csd430";
    String dbUser     = "student1";
    String dbPassword = "pass";
    String dbDriver   = "com.mysql.cj.jdbc.Driver";

    Connection conn = null;
    PreparedStatement psDelete = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName(dbDriver);
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        if (keyParam != null && !keyParam.trim().isEmpty()) {
            int deleteId = Integer.parseInt(keyParam);

            String deleteSql = "DELETE FROM girmamoviesdata WHERE movieID = ?";
            psDelete = conn.prepareStatement(deleteSql);
            psDelete.setInt(1, deleteId);
            int rows = psDelete.executeUpdate();
%>

<p>Deleted Movie ID: <strong><%= deleteId %></strong></p>
<p>Rows affected: <strong><%= rows %></strong></p>
<hr>

<%
        } else {
%>
<p style="color:red;">No valid Movie ID provided.</p>
<hr>
<%
        }

        String selectSql = "SELECT movieID, title, director, genre, yearReleased, rating " +
                           "FROM girmamoviesdata ORDER BY movieID";

        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                                    ResultSet.CONCUR_READ_ONLY);

        rs = stmt.executeQuery(selectSql);
%>

<h2>Remaining Movie Records</h2>

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
        <!-- All records deleted -->
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

<h2>Delete Another Movie</h2>

<%
    rs.beforeFirst();
    boolean hasRecords = rs.next();

    if (hasRecords) {
        rs.beforeFirst();
%>

<form action="deleteRecord.jsp" method="post">
    <label for="deleteKey">Movie ID:</label>
    <select name="deleteKey" id="deleteKey">
        <%
            while (rs.next()) {
        %>
            <option value="<%= rs.getInt("movieID") %>">
                <%= rs.getInt("movieID") %>
            </option>
        <%
            }
        %>
    </select>

    <br><br>
    <input type="submit" value="Delete Selected Movie">
</form>

<%
    } else {
%>
<p>All records have been deleted.</p>
<%
    }
%>

<%
    } catch (Exception e) {
%>
<p style="color:red;">Error: <%= e.getMessage() %></p>
<%
    } finally {
        try { if (rs != null) rs.close(); } catch (SQLException ex) {}
        try { if (stmt != null) stmt.close(); } catch (SQLException ex) {}
        try { if (psDelete != null) psDelete.close(); } catch (SQLException ex) {}
        try { if (conn != null) conn.close(); } catch (SQLException ex) {}
    }
%>

<hr>

<h3>References</h3>
<ul>
    <li>MySQL PreparedStatement Documentation – Oracle</li>
    <li>CRUD Operations in Java (Pandey, scaler.com, 2023)</li>
    <li>Java JDBC CRUD Tutorial – JDBC Execute DELETE Statement Example (Mihn, codejava.net, 2019)</li>
    <li>CRUD Delete Video – Bellevue University (2024)</li>
</ul>

<p><a href="deleteForm.jsp">Back to Delete Form</a></p>
<p><a href="index.jsp">Return to Project Navigation</a></p>

</body>
</html>
