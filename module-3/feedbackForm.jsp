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
    <title>Restaurant Experience Feedback Form</title>

    <!-- External CSS file -->
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>

<h1>Restaurant Experience Feedback</h1>

<!-- ============================================================
     FEEDBACK FORM
     - Contains 6 fields
     - Uses 4 different input types
     - All HTML tags are outside scriptlets
     ============================================================ -->
<form action="displayFeedback.jsp" method="post">

    <!-- TEXT INPUT: Customer Name -->
    <label for="customerName">Your Name:</label>
    <input type="text" id="customerName" name="customerName" required>

    <!-- EMAIL INPUT: Customer Email -->
    <label for="email">Email Address:</label>
    <input type="email" id="email" name="email" required>

    <!-- DROPDOWN INPUT: Meal Type -->
    <label for="mealType">Type of Meal Ordered:</label>
    <select id="mealType" name="mealType">
        <option value="Breakfast">Breakfast</option>
        <option value="Lunch">Lunch</option>
        <option value="Dinner">Dinner</option>
    </select>

    <!-- RADIO BUTTONS: Experience Rating -->
    <label>Rate Your Overall Experience:</label>

    <!-- Clean, aligned radio buttons -->
    <div class="radio-group">
        <label><input type="radio" name="rating" value="Excellent" checked> Excellent</label>
        <label><input type="radio" name="rating" value="Good"> Good</label>
        <label><input type="radio" name="rating" value="Fair"> Fair</label>
        <label><input type="radio" name="rating" value="Poor"> Poor</label>
    </div>

    <!-- NUMBER INPUT: Visit Count -->
    <label for="visitCount">How many times have you visited this restaurant?</label>
    <input type="number" id="visitCount" name="visitCount" min="1" required>

    <!-- TEXTAREA INPUT: Additional Comments -->
    <label for="comments">Additional Comments:</label>
    <textarea id="comments" name="comments" rows="5"></textarea>

    <!-- Submit Button -->
    <button type="submit">Submit Feedback</button>
</form>

</body>
</html>
