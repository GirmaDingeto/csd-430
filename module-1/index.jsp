<%-- 
    Name: Girma
    Date: August 15, 2026
    Assignment: Module 1 – JSP Test
--%>

<html>
<head>
    <title>TomcatRunning JSP Test</title>
</head>

<body>
    <h1>Hello Everyone, Tomcat is Running Successfully!</h1>

    <p>This JSP file is executing inside Eclipse using Jakarta Tomcat.</p>

    <hr>

    <% 
        int x = 10;
        int y = 20;
        int sum = x + y;
    %>

    <p>The sum of <%= x %> and <%= y %> is:
       <strong><%= sum %></strong>
    </p>
</body>
</html>
