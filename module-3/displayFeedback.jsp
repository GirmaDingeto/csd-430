<%-- 
    Name: Girma Dingeto
    Assignment: Module3.2 Assignment
    Course: CSD430
    Date: 08/30/2026
    References: https://www.geeksforgeeks.org/advance-java/jsp-form-processing 
    			https://www.geeksforgeeks.org/advance-java/jsp-registration-form
--%>
<%@ page language="Java" contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <title>Feedback Results</title>

    <!-- External CSS file -->
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>

<h1>Submitted Restaurant Feedback</h1>

<p style="text-align:center; color:#2C3E50;">
    Below is the information you submitted in the Restaurant Experience Feedback Form.
</p>

<!-- ============================================================
     SCRIPTLET SECTION
     - Retrieves submitted form data
     - Uses request.getParameter()
     ============================================================ -->
<%
    String customerName = request.getParameter("customerName");
    String email = request.getParameter("email");
    String mealType = request.getParameter("mealType");
    String rating = request.getParameter("rating");
    String visitCount = request.getParameter("visitCount");
    String comments = request.getParameter("comments");
%>

<!-- ============================================================
     DISPLAY DATA IN HTML TABLE
     - Professional colors from style.css
     - Clean spacing and alignment
     ============================================================ -->
<table>
    <tr>
        <th>Field</th>
        <th>Description</th>
        <th>Submitted Value</th>
    </tr>

    <tr>
        <td>Name</td>
        <td>The customer's full name</td>
        <td><%= customerName %></td>
    </tr>

    <tr>
        <td>Email</td>
        <td>Customer contact email</td>
        <td><%= email %></td>
    </tr>

    <tr>
        <td>Meal Type</td>
        <td>Type of meal ordered during the visit</td>
        <td><%= mealType %></td>
    </tr>

    <tr>
        <td>Experience Rating</td>
        <td>Customer’s rating of the restaurant experience</td>
        <td><%= rating %></td>
    </tr>

    <tr>
        <td>Visit Count</td>
        <td>Number of times the customer has visited the restaurant</td>
        <td><%= visitCount %></td>
    </tr>

    <tr>
        <td>Comments</td>
        <td>Additional feedback or suggestions</td>
        <td><%= comments %></td>
    </tr>
</table>

</body>
</html>
