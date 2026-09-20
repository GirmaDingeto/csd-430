<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="com.girma.girmamoviesproject.MovieBean" %>
<%@ page import="com.girma.girmamoviesproject.Movie" %>

<%-- 
    Author: Girma
    Date: September 18, 2026
    Assignment: CSD430 – Module 7
    File: addMovie.jsp

    Purpose:
    This JSP page provides a form to insert a new movie record into the
    'girmaMoviesdata' table. The movieID is generated automatically by
    finding the current maximum movieID and adding 1. After insertion,
    all records are displayed in an HTML table.

    Academic Honesty:
    This file was written entirely by me (Girma).
    AI assistance was used only for formatting, documentation structure,
    and reference organization. All logic and implementation are my own.
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Module 7 – Add Movie and Display All Records</title>
</head>

<body>

<h1>Module 7 – Add Movie Record</h1>
<p>Use the form below to add a new movie. After submission, all records will be displayed.</p>

<%
    // Database connection details
    String url = "jdbc:mysql://localhost:3306/CSD430";
    String username = "student1";
    String password = "pass";

    // Flag to indicate whether an insert was performed
    boolean inserted = false;

    // Handle form submission
    if ("POST".equalsIgnoreCase(request.getMethod())) {

        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        String yearReleasedParam = request.getParameter("yearReleased");
        String ratingParam = request.getParameter("rating");
        String director = request.getParameter("director");

        if (title != null && genre != null && yearReleasedParam != null &&
            ratingParam != null && director != null &&
            !title.trim().isEmpty() && !genre.trim().isEmpty() &&
            !yearReleasedParam.trim().isEmpty() && !ratingParam.trim().isEmpty() &&
            !director.trim().isEmpty()) {

            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                conn = DriverManager.getConnection(url, username, password);

                // Generate next movieID (max + 1)
                String maxSql = "SELECT MAX(movieID) AS maxID FROM girmaMoviesdata";
                stmt = conn.prepareStatement(maxSql);
                rs = stmt.executeQuery();

                int nextID = 1;
                if (rs.next()) {
                    nextID = rs.getInt("maxID") + 1;
                }

                rs.close();
                stmt.close();

                int yearReleased = Integer.parseInt(yearReleasedParam);
                double rating = Double.parseDouble(ratingParam);

                String insertSql = "INSERT INTO girmaMoviesdata " +
                                   "(movieID, title, genre, yearReleased, rating, director) " +
                                   "VALUES (?, ?, ?, ?, ?, ?)";
                stmt = conn.prepareStatement(insertSql);
                stmt.setInt(1, nextID);
                stmt.setString(2, title);
                stmt.setString(3, genre);
                stmt.setInt(4, yearReleased);
                stmt.setDouble(5, rating);
                stmt.setString(6, director);

                int rows = stmt.executeUpdate();
                if (rows > 0) {
                    inserted = true;
                }

            } catch (Exception e) {
                out.println("<p style='color:red;'>Error inserting record: " + e.getMessage() + "</p>");
            } finally {
                try { if (rs != null) rs.close(); } catch (Exception ignored) {}
                try { if (stmt != null) stmt.close(); } catch (Exception ignored) {}
                try { if (conn != null) conn.close(); } catch (Exception ignored) {}
            }
        } else {
            out.println("<p style='color:red;'>All fields are required.</p>");
        }
    }
%>

<form action="addMovie.jsp" method="post">
    <label for="title">Title:</label><br>
    <input type="text" name="title" id="title"><br><br>

    <label for="genre">Genre:</label><br>
    <input type="text" name="genre" id="genre"><br><br>

    <label for="yearReleased">Year Released:</label><br>
    <input type="text" name="yearReleased" id="yearReleased"><br><br>

    <label for="rating">Rating:</label><br>
    <input type="text" name="rating" id="rating"><br><br>

    <label for="director">Director:</label><br>
    <input type="text" name="director" id="director"><br><br>

    <input type="submit" value="Add Movie">
</form>

<%
    if (inserted) {
        out.println("<p style='color:green;'>Movie record inserted successfully.</p>");
    }
%>

<hr>

<h2>All Movie Records</h2>
<p>The table below displays all records from the girmaMoviesdata table.</p>

<%
    MovieBean bean = new MovieBean();
    List<Movie> movies = bean.getAllMovies();

    if (movies == null || movies.isEmpty()) {
%>
        <p>No records found in the database.</p>
<%
    } else {
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
            <%
                for (Movie m : movies) {
            %>
                <tr>
                    <td><%= m.getMovieID() %></td>
                    <td><%= m.getTitle() %></td>
                    <td><%= m.getGenre() %></td>
                    <td><%= m.getYearReleased() %></td>
                    <td><%= m.getRating() %></td>
                    <td><%= m.getDirector() %></td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
<%
    }
%>

<br>
<a href="index.jsp">Return to Main Menu</a>

</body>
</html>
