/*
    Author: Girma
    Date: September 18, 2026
    Assignment: CSD430 – Module 7
    File: MovieBean.java
    Encoding: UTF-8

    Purpose:
    This JavaBean provides database access methods for retrieving movie
    records from the CSD430 database table 'girmaMoviesdata'. It is used
    by JSP pages to perform READ operations for this assignment.

    Module 7 Additions:
    - getAllMovies(): returns a List<Movie> containing all records in the table.

    Academic Honesty:
    This file was written by me (Girma).
    AI assistance was used only for formatting, documentation structure,
    and comment organization.

    References:
    Bellevue University – Documentation Requirements PDF
    Microsoft Copilot assistance for formatting and documentation
*/

package com.girma.girmamoviesproject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
            Connection conn = DriverManager.getConnection(url, username, password);

            String sql = "SELECT * FROM girmaMoviesdata WHERE movieID = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, movieID);

            ResultSet rs = stmt.executeQuery();

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

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return movie;
    }

    /*
        getAllMovies:
        Module 7 requirement – retrieves all movie records from girmaMoviesdata.
        Returns a List<Movie> containing every row in the table.
    */
    public List<Movie> getAllMovies() {
        List<Movie> movies = new ArrayList<>();

        try {
            Connection conn = DriverManager.getConnection(url, username, password);

            String sql = "SELECT * FROM girmaMoviesdata ORDER BY movieID";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Movie movie = new Movie(
                    rs.getInt("movieID"),
                    rs.getString("title"),
                    rs.getString("genre"),
                    rs.getInt("yearReleased"),
                    rs.getDouble("rating"),
                    rs.getString("director")
                );
                movies.add(movie);
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return movies;
    }
}

/* End of MovieBean.java */
