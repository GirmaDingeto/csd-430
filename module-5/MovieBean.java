/*
    Author: Girma
    Date: September 11, 2026
    Assignment: CSD430 – Modules 5.2 & 6.2
    File: MovieBean.java
    Encoding: UTF-8

    Purpose:
    This JavaBean provides database access methods for retrieving movie
    records from the CSD430 database table 'girmaMoviesdata'. It is used
    by JSP pages to perform READ operations for this assignment.

   Academic Honesty:
    This file was written by me.
    AI assistance was used only for formatting,and documentation structure.

    References:
    https://cyberactive.bellevue.edu/ultra/courses/_546986_1/document/_18077820_1?view=content&state=view 
    Java JDBC CRUD Tutorial: SQL Insert, Select, Update, and Delete Examples
    https://www.geeksforgeeks.org/java/simplifying-crud-operation-with-jdbc/
    https://www.codejava.net/coding/jsp-servlet-jdbc-mysql-create-read-update-delete-crud-example

    Bellevue University Documentation Requirements PDF
    Microsoft Copilot assistance for formatting and documentation

*/

package com.girma.girmamoviesproject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/*
    This JavaBean connects to the MySQL database using JDBC.
    It retrieves movie records based on the movieID selected by the user.
*/
public class MovieBean {

    // Database connection details
    private final String url = "jdbc:mysql://localhost:3306/CSD430";
    private final String username = "student1";
    private final String password = "pass";

    /*
        getMovieById:
        Retrieves a single movie record from the database using the movieID.
        Returns a Movie object containing all fields from the table.
    */
    public Movie getMovieById(int movieID) {
        Movie movie = null;

        try {
            // Establish database connection
            Connection conn = DriverManager.getConnection(url, username, password);

            // SQL query to retrieve a movie by its ID
            String sql = "SELECT * FROM girmaMoviesdata WHERE movieID = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, movieID);

            // Execute query
            ResultSet rs = stmt.executeQuery();

            // If a record is found, populate the Movie object
            if (rs.next()) {
                movie = new Movie(
                    rs.getInt("movieID"),
                    rs.getString("title"),
                    rs.getString("genre"),
                    rs.getInt("yearReleased"),
                    rs.getDouble("rating"),
                    rs.getString("director")
                );
            }

            // Close resources
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace(); // Error handling for debugging
        }

        return movie;
    }
}

/* End of MovieBean.java */
