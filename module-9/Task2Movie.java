/*
    Author: Girma Dingeto
    Date: September 11, 2026
    Assignment: CSD430 – Modules 5.3 & 6.3
    File: Task2Movie.java
    Encoding: UTF-8

    Purpose:
    This class represents a Movie object for Task 2. It stores all fields
    retrieved from the 'girmaMoviesdata' table and is used by Task2MovieBean
    to transfer data to task2_display.jsp.

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

public class Task2Movie {

    // Fields representing columns in the database table
    private int movieID;
    private String title;
    private String genre;
    private int yearReleased;
    private double rating;
    private String director;

    /*
        Constructor:
        Initializes a Task2Movie object with all fields.
    */
    public Task2Movie(int movieID, String title, String genre, int yearReleased, double rating, String director) {
        this.movieID = movieID;
        this.title = title;
        this.genre = genre;
        this.yearReleased = yearReleased;
        this.rating = rating;
        this.director = director;
    }

    // Getter methods for accessing private fields

    public int getMovieID() {
        return movieID;
    }

    public String getTitle() {
        return title;
    }

    public String getGenre() {
        return genre;
    }

    public int getYearReleased() {
        return yearReleased;
    }

    public double getRating() {
        return rating;
    }

    public String getDirector() {
        return director;
    }
}

/* End of Task2Movie.java */
