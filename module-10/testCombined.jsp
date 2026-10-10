<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="ex" uri="/WEB-INF/example.tld" %>

<!--
    ======================================================================
    testCombined.jsp
    ----------------------------------------------------------------------
    PURPOSE:
      - Demonstrates multiple custom tags working together.
      - Step 1: User enters name.
      - Step 2: AskNameTag prints greeting.
      - Step 3: User chooses YES/NO to view movie list.
      - Step 4: listMovies tag prints database table.
    ======================================================================
-->

<html>
<head>
    <title>Combined Custom Tag Demo</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
</head>

<body class="p-4">

<h2>Enter Your Name</h2>

<!-- Name input form -->
<form method="post">
    <label>Your Name:</label>
    <input type="text" name="username" class="form-control" />
    <button class="btn btn-primary mt-3">Submit</button>
</form>

<%
    // Retrieve name from form submission
    String name = request.getParameter("username");
%>

<!-- Show greeting only after name is submitted -->
<% if (name != null && !name.trim().isEmpty()) { %>

    <h3>Greeting</h3>
    <ex:askName name="<%= name %>" />

    <hr>

    <!-- Ask user if they want to see movie list -->
    <h3>Do you want to see the movie list?</h3>

    <form method="post">
        <!-- Keep name so greeting still works -->
        <input type="hidden" name="username" value="<%= name %>" />

        <label>Type YES or NO:</label>
        <input type="text" name="showMovies" class="form-control" />

        <button class="btn btn-success mt-3">Submit Choice</button>
    </form>

    <%
        // Retrieve YES/NO choice
        String choice = request.getParameter("showMovies");

        if (choice != null) {
            choice = choice.trim().toLowerCase();

            if (choice.equals("yes")) {
    %>
                <h3>Movie List</h3>
                <ex:listMovies />

    <%
            } else if (choice.equals("no")) {
    %>
                <h3>You chose not to view the movie list.</h3>
    <%
            }
        }
    %>

<% } %>

</body>
</html>
