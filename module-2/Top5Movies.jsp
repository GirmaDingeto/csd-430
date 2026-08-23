<%@ page language="Java" contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <title>Top Five Spiritual Movies</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>

<body>

<h1>Top Five Spiritual Movies I have enjoyed watching</h1>

<p class="description">
    This dynamic JSP page displays five spiritual movies that explore themes of faith, purpose, hope, and inner transformation.
    The table includes three fields for each record: Movie Title, Year Released, and Spiritual Theme.
</p>

<!-- ============================
     JSP SCRIPTLET SECTION
   ============================ -->
<%
    // Dataset: Five Top Spiritual Movies
    // Fields:
    // 1. Movie Title
    // 2. Year Released
    // 3. Spiritual Theme

    String[][] moviesData = {
        {"The Shack", "2017", "Healing, forgiveness, and encountering God"},
        {"Heaven Is for Real", "2014", "Faith, afterlife, and spiritual testimony"},
        {"The Passion of the Christ", "2004", "Sacrifice, redemption, and divine love"},
        {"Miracles from Heaven", "2016", "Hope, miracles, and divine intervention"},
        {"I Still Believe", "2020", "Love, suffering, and unwavering faith"}
    };
%>

<!-- ============================
     HTML TABLE SECTION
   ============================ -->

<table>
    <tr>
        <th>Movie Title</th>
        <th>Year Released</th>
        <th>Spiritual Theme</th>
    </tr>

    <%
        for (int i = 0; i < moviesData.length; i++) {
    %>
        <tr>
            <td><%= moviesData[i][0] %></td>
            <td><%= moviesData[i][1] %></td>
            <td><%= moviesData[i][2] %></td>
        </tr>
    <%
        }
    %>
</table>

<p class="description">
    <strong>Field Descriptions:</strong><br>
    Movie Title – The name of the spiritual movie.<br>
    Year Released – The year the movie was released.<br>
    Spiritual Theme – The message or inspiration behind the film.<br><br>

    <strong>Record Description:</strong><br>
    Each record represents one spiritual movie and includes three descriptive fields.
    The data is grouped into the topical category: “Top Five Spiritual Movies.”
</p>

</body>
</html>
