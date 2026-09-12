/*
    Author: Girma
    Date: September 11, 2026
    Assignment: CSD430 – Modules 5.2 & 6.2
    File: Movie.java
    Encoding: UTF-8

    Purpose:
    This class represents a Movie object containing all fields stored in the
    'girmaMoviesdata' table. It is used by the MovieBean to transfer data
    between the database and JSP pages.

    Academic Honesty:
    This file was written by me (Girma).
    AI assistance was used only for formatting, documentation structure,
    and comment organization.

    References:
    - Bellevue University Documentation Requirements PDF
    - Microsoft Copilot assistance for formatting and documentation
*/

package com.girma.girmamoviesproject;

/*
    The Movie class holds all movie-related fields retrieved from the database.
    Each instance represents one record from the girmaMoviesdata table.
*/
public class Movie {

    // Fields representing columns in the database table
    private int movieID;
    private String title;
    private String genre;
    private int yearReleased;
    private double rating;
    private String director;

    /*
        Constructor:
        Initializes a Movie object with all fields.
    */
    public Movie(int movieID, String title, String genre, int yearReleased, double rating, String director) {
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

/* End of Movie.java */
