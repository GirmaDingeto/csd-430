<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%-- 
    Author: Girma
    Date: September 26, 2026
    Assignment: CSD430 – Module 8.2 (Project Part 3)
    File: editRecord.jsp
    Encoding: UTF-8

    Purpose:
    Receives movieID from updateForm.jsp, loads the full record from 
    csd430.girmamoviesdata, and displays editable fields. Sends updated 
    values to updateDisplay.jsp.

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
    <title>Module 8 – Edit Movie Record</title>
</head>

<body>

<h1>Module 8 – Edit Movie Record</h1>
<hr>

<%
    // Prevent direct access — redirect back to updateForm.jsp
    String idParam = request.getParameter("movieID");

    if(idParam == null || idParam.trim().equals("")) {
        response.sendRedirect("updateForm.jsp");
        return;
    }

    int movieID = Integer.parseInt(idParam);

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/csd430",
            "student1",
            "pass");

        ps = conn.prepareStatement("SELECT * FROM girmamoviesdata WHERE movieID=?");
        ps.setInt(1, movieID);
        rs = ps.executeQuery();

        if(rs.next()) {
%>

<form action="updateDisplay.jsp" method="post">

    <input type="hidden" name="movieID" value="<%= movieID %>">

    <label>Title:</label><br>
    <input type="text" name="title" value="<%= rs.getString("title") %>"><br><br>

    <label>Genre:</label><br>
    <input type="text" name="genre" value="<%= rs.getString("genre") %>"><br><br>

    <label>Year Released:</label><br>
    <input type="text" name="yearReleased" value="<%= rs.getInt("yearReleased") %>"><br><br>

    <label>Rating:</label><br>
    <input type="text" name="rating" value="<%= rs.getString("rating") %>"><br><br>

    <label>Director:</label><br>
    <input type="text" name="director" value="<%= rs.getString("director") %>"><br><br>

    <input type="submit" value="Update Movie">

</form>

<%
        } else {
            out.println("<p style='color:red;'>Record not found.</p>");
        }
    } catch(Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if(rs != null) rs.close();
        if(ps != null) ps.close();
        if(conn != null) conn.close();
    }
%>

</body>
</html>
