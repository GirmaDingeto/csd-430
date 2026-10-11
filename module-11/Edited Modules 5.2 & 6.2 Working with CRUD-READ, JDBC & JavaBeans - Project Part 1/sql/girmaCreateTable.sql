/* 
    Author: Girma
    Date: September 11, 2026
    Assignment: CSD430 – Modules 5.2 & 6.2
    File: girmaCreateTable.sql

    Purpose:
    This SQL script creates the database CSD430 and the table girmaMoviesdata
    used for CRUD‑READ operations in Modules 5.2 & 6.2.

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

-- Create the database if it does not already exist
CREATE DATABASE IF NOT EXISTS CSD430;

-- Select the database to use
USE CSD430;

-- Create the table to store movie data
CREATE TABLE girmaMoviesdata (
    movieID INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    yearReleased INT,
    rating DECIMAL(3,1),
    director VARCHAR(100)
);

-- End of girmaCreateTable.sql
