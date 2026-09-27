<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%-- 
    Author: Girma Dingeto
    Date: September 26, 2026
    Assignment: CSD430 – Module 8.2 (Project Part 3)
    File: updateForm.jsp
    Encoding: UTF-8

    Purpose:
    This JSP retrieves all movieID values from the girmamoviesdata table in the
    csd430 database and displays them in a dropdown list. The selected movieID 
    is sent to editRecord.jsp for editing.

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
    <title>Module 8 – Select Movie to Update</title>
</head>

<body>

<h1>Module 8 – Select Movie to Update</h1>
<hr>

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/csd430",
            "student1",
            "pass");

        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT movieID FROM girmamoviesdata");
%>

<form action="editRecord.jsp" method="post">
    <label>Select Movie ID:</label><br><br>

    <select name="movieID">
        <% while(rs.next()) { %>
            <option value="<%= rs.getInt("movieID") %>">
                <%= rs.getInt("movieID") %>
            </option>
        <% } %>
    </select>

    <br><br>
    <input type="submit" value="Edit Record">
</form>

<%
    } catch(Exception e) {
        out.println("<p style='color:red;'>Error loading movie IDs: " + e.getMessage() + "</p>");
    } finally {
        if(rs != null) rs.close();
        if(stmt != null) stmt.close();
        if(conn != null) conn.close();
    }
%>

<hr>
<a href="index.jsp">Back to Project Navigation</a>

</body>
</html>
