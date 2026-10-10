/*
 *Girma Dingeto
 * CSD430 Module 10.2 Assignment, 10/10/2026
 * ======================================================================
 * listMovies.java
 * ----------------------------------------------------------------------
 * PURPOSE:
 *    Connects to MySQL database "csd430".
 *    Reads all rows from table "girmamoviesdata".
 *    Prints results inside a Bootstrap-styled HTML table.
 *
 * IMPORTANT:
 *    Uses Jakarta EE imports (required for Tomcat 10+).
 *    Column names MUST match your actual MySQL table:
 *
 *       movieID | title | genre | yearReleased | rating | director
 *
 * ======================================================================
 */

package com.girma.customtags;

import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import jakarta.servlet.jsp.JspException;
import java.io.IOException;
import java.sql.*;

public class listMovies extends SimpleTagSupport {

    @Override
    public void doTag() throws JspException, IOException {

        // Database connection details
        String url  = "jdbc:mysql://localhost:3306/csd430";
        String user = "student1";
        String pass = "pass"; // <-- Replace with your real password

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection conn = DriverManager.getConnection(url, user, pass);

            // Create SQL statement
            Statement stmt = conn.createStatement();

            // Execute query
            ResultSet rs = stmt.executeQuery("SELECT * FROM girmamoviesdata");

            var out = getJspContext().getOut();

            // Print table header
            out.write("<table class='table table-bordered'>");
            out.write("<tr>"
                    + "<th>ID</th>"
                    + "<th>Title</th>"
                    + "<th>Genre</th>"
                    + "<th>Year</th>"
                    + "<th>Rating</th>"
                    + "<th>Director</th>"
                    + "</tr>");

            // Loop through results
            while (rs.next()) {

                out.write("<tr>");
                out.write("<td>" + rs.getInt("movieID") + "</td>");
                out.write("<td>" + rs.getString("title") + "</td>");
                out.write("<td>" + rs.getString("genre") + "</td>");
                out.write("<td>" + rs.getInt("yearReleased") + "</td>");
                out.write("<td>" + rs.getDouble("rating") + "</td>");
                out.write("<td>" + rs.getString("director") + "</td>");
                out.write("</tr>");
            }

            out.write("</table>");

            conn.close();

        } catch (Exception e) {
            getJspContext().getOut().write("Database Error: " + e.getMessage());
        }
    }
}
