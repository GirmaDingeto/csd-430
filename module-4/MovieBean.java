package com.girma.beans;

import java.io.Serializable;

/**
 * Girma Dingeto, CSD430 Module 4.2 Assignment, 09/06/2026
 
 * MovieBean
 * ----------
 * This JavaBean stores information for one  movie.
 * It follows standard JavaBean conventions:
 *  Private fields
 *  Public no‑argument constructor
 *  Public getters and setters
 *   Serializable for JSP compatibility
 
 * Fields:
 *  title        – Movie title
 *  year         – Year released
 *  theme        – Spiritual or inspirational theme
 *  director     – Movie director
 *  country      – Country of production
 *  referenceUrl – External link for more information
 */

public class MovieBean implements Serializable {

    private String title;
    private String year;
    private String theme;
    private String director;
    private String country;
    private String referenceUrl;

    /** No‑argument constructor required for JavaBeans */
    public MovieBean() {}

    /** Full constructor used to initialize all fields */
    public MovieBean(String title, String year, String theme,
                     String director, String country, String referenceUrl) {

        this.title = title;
        this.year = year;
        this.theme = theme;
        this.director = director;
        this.country = country;
        this.referenceUrl = referenceUrl;
    }

    // ======= Getter Methods (Provide Read Access) =======
    public String getTitle() { return title; }
    public String getYear() { return year; }
    public String getTheme() { return theme; }
    public String getDirector() { return director; }
    public String getCountry() { return country; }
    public String getReferenceUrl() { return referenceUrl; }

    // ======= Setter Methods (Provide Write Access) =======
    public void setTitle(String title) { this.title = title; }
    public void setYear(String year) { this.year = year; }
    public void setTheme(String theme) { this.theme = theme; }
    public void setDirector(String director) { this.director = director; }
    public void setCountry(String country) { this.country = country; }
    public void setReferenceUrl(String referenceUrl) { this.referenceUrl = referenceUrl; }
}
