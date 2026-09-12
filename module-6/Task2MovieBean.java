/*
    Author: Girma
    Date: September 11, 2026
    Assignment: CSD430 – Modules 5.3 & 6.3
    File: Task2MovieBean.java
    Encoding: UTF-8

    Purpose:
    This JavaBean provides methods for Task 2:
    - getAllMovieIDs(): returns a list of movieID values
    - getMovieById(int): returns a Task2Movie object for the given movieID

    Academic Honesty:
    This file was written entirely by me (Girma).
    AI assistance was used only for formatting, documentation structure, and
    reference organization. All logic and implementation are my own.

    References:
    Bellevue University – Documentation Requirements PDF
    https://cyberactive.bellevue.edu/ultra/courses/_546986_1/document/_18077820_1?view=content&state=view

    Java JDBC CRUD Tutorial – SQL Insert, Select, Update, and Delete Examples
    https://www.geeksforgeeks.org/java/simplifying-crud-operation-with-jdbc/

    JSP + Servlet + JDBC CRUD Example
    https://www.codejava.net/coding/jsp-servlet-jdbc-mysql-create-read-update-delete-crud-example

    Microsoft Copilot – Assistance with formatting, documentation, and organization
*/

package com.girma.girmamoviesproject;

import java.sql.*;
import java.util.ArrayList;

public class Task2MovieBean {

    // Database connection details
    private final String url = "jdbc:mysql://localhost:3306/CSD430";
    private final String username = "student1";
    private final String password = "pass";

    /*
        getAllMovieIDs:
        Retrieves all movieID values from the girmaMoviesdata table.
        Used to populate dropdown menus in task2_select.jsp.
    */
    public ArrayList<Integer> getAllMovieIDs() {
        ArrayList<Integer> ids = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);

            String sql = "SELECT movieID FROM girmaMoviesdata";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ids.add(rs.getInt("movieID"));
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ids;
    }

    /*
        getMovieById:
        Retrieves a single movie record based on the movieID.
        Returns a Task2Movie object containing all fields.
    */
    public Task2Movie getMovieById(int movieID) {
        Task2Movie movie = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);

            String sql = "SELECT * FROM girmaMoviesdata WHERE movieID = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, movieID);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                movie = new Task2Movie(
                    rs.getInt("movieID"),
                    rs.getString("title"),
                    rs.getString("genre"),
                    rs.getInt("yearReleased"),
                    rs.getDouble("rating"),
                    rs.getString("director")
                );
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return movie;
    }
}
