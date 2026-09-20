<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.girma.girmamoviesproject.Movie" %>
<%@ page import="com.girma.girmamoviesproject.MovieBean" %>

<!--
    Author: Girma
    Date: September 18, 2026
    Assignment: CSD430 – Module 7.2
    File: displayMovie.jsp

    Purpose:
    Display ALL movie records using MovieBean.getAllMovies().

    Academic Honesty:
    This file was written by me.
    AI assistance was used only for formatting and documentation.
-->

<html>
<head>
    <title>Movie Records – All Movies</title>
    <meta charset="UTF-8">

    <!-- External CSS from Module 5 & 6 -->
    <link rel="stylesheet" href="css/styles.css">
</head>

<body>

<h2>Movie Records – All Movies</h2>

<%
    MovieBean bean = new MovieBean();
    List<Movie> movies = bean.getAllMovies();
%>

<div class="center">
    <p>The table below displays all movie records from the database.</p>
</div>

<%
    if (movies == null || movies.isEmpty()) {
%>
        <div class="center">
            <p><strong>No records found in the database.</strong></p>
        </div>
<%
    } else {
%>

<table>
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

<div class="center">
    <p><a href="addMovie.jsp">Add New Movie (Module 7)</a></p>
    <p><a href="index.jsp">Return to Main Menu</a></p>
</div>

</body>
</html>
