package com.girma.girmamoviesproject;

import java.sql.*;
import java.util.ArrayList;

public class Task2MovieBean {

    private final String url = "jdbc:mysql://localhost:3306/CSD430";
    private final String username = "student1";
    private final String password = "pass";

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
