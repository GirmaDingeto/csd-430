<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 
    Author: Girma
    Date: September 18, 2026
    Assignment: CSD430 – Modules 5.2, 6.2, 5.3, 6.3, and Module 7.2
    File: index.jsp
    Encoding: UTF-8

    Purpose:
    This JSP file serves as the main navigation page for all project documents:
    • Document 1 – Modules 5.2 & 6.2 (CRUD‑READ, JDBC & JavaBeans)
    • Document 2 – Modules 5.3 & 6.3 (Permissions, JavaBean Access, Dropdown + Display)
    • Document 3 – Module 7.2 (Insert + Display All Records)
    It provides organized access to all SQL files, screenshots, Java source code,
    and JSP pages required for all tasks.

    Academic Honesty:
    This file was written entirely by me.
    AI assistance was used only for formatting, documentation structure, and
    reference organization. All logic and implementation are my own.

    References:
    Bellevue University – Documentation Requirements PDF
    Java JDBC CRUD Tutorial – GeeksforGeeks
    JSP + Servlet + JDBC CRUD Example – CodeJava
    Microsoft Copilot – Assistance with formatting and documentation
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CSD430 – Project Navigation</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>

<body>

<h1>CSD430 – Project Navigation</h1>
<p>Use the links below to access all deliverables for each project document.</p>

<hr>

<!-- ==========================================================
     DOCUMENT 1: Modules 5.2 & 6.2 – CRUD‑READ, JDBC & JavaBeans
     ========================================================== -->
<h2>Document 1 – Modules 5.2 & 6.2</h2>
<p>Database creation, population, and READ operation using JavaBeans.</p>

<h3>SQL Files</h3>
<ul>
    <li><a href="sql/girmaCreateTable.sql">Create Table SQL File</a></li>
    <li><a href="sql/girmaPopulateTable.sql">Populate Table SQL File</a></li>
    <li><a href="sql/girmaDropTable.sql">Drop Table SQL File</a></li>
</ul>

<h3>Screenshots</h3>
<ul>
    <li><a href="screenshots/module5_screenshots.html">Database & Table Screenshots</a></li>
</ul>

<h3>READ Operation (JavaBean + JSP)</h3>
<ul>
    <li><a href="movieSelect.jsp">Select Movie (Dropdown Page)</a></li>
    <li><a href="displayMovie.jsp">Display Movie Record</a></li>
    <li><a href="WEB-INF/classes/com/girma/girmamoviesproject/MovieBean.java">JavaBean Source Code</a></li>
    <li><a href="WEB-INF/classes/com/girma/girmamoviesproject/Movie.java">Movie Class Source Code</a></li>
</ul>

<hr>

<!-- ==========================================================
     DOCUMENT 2: Modules 5.3 & 6.3 – Permissions + Dropdown + Display
     ========================================================== -->
<h2>Document 2 – Modules 5.3 & 6.3</h2>
<p>Database permissions, JavaBean access, dropdown initialization, and record display.</p>

<h3>JSP Pages</h3>
<ul>
    <li><a href="task2_select.jsp">Task 2 – Dropdown Page</a></li>
    <li><a href="task2_display.jsp">Task 2 – Display Page</a></li>
</ul>

<h3>Java Source Code</h3>
<ul>
    <li><a href="WEB-INF/classes/com/girma/girmamoviesproject/Task2MovieBean.java">Task 2 JavaBean Source Code</a></li>
    <li><a href="WEB-INF/classes/com/girma/girmamoviesproject/Task2Movie.java">Task 2 Movie Class</a></li>
</ul>

<h3>Additional Files</h3>
<ul>
    <li><a href="permissions/permissions_setup.txt">Database Permission Setup</a></li>
</ul>

<hr>

<!-- ==========================================================
     DOCUMENT 3: Module 7 – Insert + Display All Records
     ========================================================== -->
<h2>Document 3 – Module 7</h2>
<p>Insert a new movie record and display all records in a table.</p>

<h3>JSP Pages</h3>
<ul>
    <li><a href="addMovie.jsp">Module 7 – Add Movie and Display All Records</a></li>
    <li><a href="displayMovie.jsp">Module 7 – Display All Movie Records</a></li>
</ul>

<h3>Java Source Code</h3>
<ul>
    <li><a href="WEB-INF/classes/com/girma/girmamoviesproject/MovieBean.java">Updated MovieBean Source Code (Module 7)</a></li>
    <li><a href="WEB-INF/classes/com/girma/girmamoviesproject/Movie.java">Movie Class Source Code</a></li>
</ul>

<hr>

<!-- ==========================================================
     REFERENCES
     ========================================================== -->
<h3>References</h3>
<ul>
    <li><a href="https://cyberactive.bellevue.edu/ultra/courses/_546986_1/document/_18077820_1?view=content&state=view" target="_blank">
        Bellevue University – Documentation Requirements PDF
    </a></li>

    <li><a href="https://www.geeksforgeeks.org/java/simplifying-crud-operation-with-jdbc/" target="_blank">
        Java JDBC CRUD Tutorial – GeeksforGeeks
    </a></li>

    <li><a href="https://www.codejava.net/coding/jsp-servlet-jdbc-mysql-create-read-update-delete-crud-example" target="_blank">
        JSP + Servlet + JDBC CRUD Example – CodeJava
    </a></li>

    <li>Microsoft Copilot – Assistance with formatting, documentation, and organization</li>
</ul>

</body>
</html>
