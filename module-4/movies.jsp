<!-- Girma Dingeto, CSD430 Module4.2 Assignment, 09/06/2026 -->

<%@ page language="Java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.girma.beans.MovieBean" %>

<html>
<head>
    <title>Top Five Spiritual Movies</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>

<body>

<h1>Top Five Spiritual Movies I Have Enjoyed Watching</h1>

<p class="description">
    This JSP page uses a JavaBean to dynamically display five spiritual movies.
    Each movie includes six fields: Title, Year, Theme, Director, Country, and Reference URL.
</p>

<!-- ==========================================================
     CREATE MOVIE DATA USING THE MOVIEBEAN CLASS
     Each MovieBean object represents one record in the table.
   ========================================================== -->
<%
    MovieBean[] movies = {
        // Correct Shack reference (Moviefone) + updated director
        new MovieBean("The Shack", "2017", "Healing, forgiveness, and encountering God",
                      "Red Sprows", "USA",
                      "https://www.moviefone.com/movie/the-shack/20085105/main"),

        new MovieBean("Heaven Is for Real", "2014", "Faith, afterlife, and spiritual testimony",
                      "Randall Wallace", "USA",
                      "https://www.imdb.com/title/tt1929263/"),

        new MovieBean("The Passion of the Christ", "2004", "Sacrifice, redemption, and divine love",
                      "Mel Gibson", "USA",
                      "https://www.imdb.com/title/tt0335345/"),

        new MovieBean("Miracles from Heaven", "2016", "Hope, miracles, and divine intervention",
                      "Patricia Riggen", "USA",
                      "https://www.imdb.com/title/tt4257926/"),

        new MovieBean("I Still Believe", "2020", "Love, suffering, and unwavering faith",
                      "Erwin Brothers", "USA",
                      "https://www.imdb.com/title/tt9779516/")
    };
%>

<!-- ==========================================================
     DISPLAY MOVIE DATA IN A PROFESSIONAL HTML TABLE
     The table is styled using external CSS for readability.
   ========================================================== -->
<table class="movie-table">
    <tr>
        <th>Movie Title</th>
        <th>Year Released</th>
        <th>Spiritual Theme</th>
        <th>Director</th>
        <th>Country</th>
        <th>Reference</th>
    </tr>

    <%
        // Loop through each MovieBean and display its fields
        for (MovieBean m : movies) {
    %>
        <tr>
            <td><%= m.getTitle() %></td>
            <td><%= m.getYear() %></td>
            <td><%= m.getTheme() %></td>
            <td><%= m.getDirector() %></td>
            <td><%= m.getCountry() %></td>

            <!-- Reference URL displayed as a clickable link -->
            <td><a href="<%= m.getReferenceUrl() %>" target="_blank">Source</a></td>
        </tr>
    <%
        }
    %>
</table>

<!-- ==========================================================
     FIELD AND RECORD DESCRIPTION SECTION
   ========================================================== -->
<p class="description">
    <strong>Field Descriptions:</strong><br>
    Movie Title – The name of the spiritual movie.<br>
    Year Released – The year the movie was released.<br>
    Spiritual Theme – The message or inspiration behind the film.<br>
    Director – The person who directed the movie.<br>
    Country – The country where the movie was produced.<br>
    Reference – External website providing additional movie details.<br><br>

    <strong>Record Description:</strong><br>
    Each record represents one spiritual movie and includes six descriptive fields.
    The data is grouped into the topical category: “Top Five Spiritual Movies.”
</p>

</body>
</html>
