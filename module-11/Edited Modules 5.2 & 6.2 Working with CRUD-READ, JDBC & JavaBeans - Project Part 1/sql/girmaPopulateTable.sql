/* 
    Author: Girma
    Date: September 11, 2026
    Assignment: CSD430 – Modules 5.2 & 6.2
    File: girmaPopulateTable.sql

    Purpose:
    This SQL script populates the table 'girmaMoviesdata' inside the CSD430 
    database with 10 movie records. These records are used for CRUD‑READ 
    operations in Modules 5.2 & 6.2.

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

-- Select the correct database
USE CSD430;

-- Insert 10 movie records into the table
INSERT INTO girmaMoviesdata VALUES
(1, 'Inception', 'Sci-Fi', 2010, 8.8, 'Christopher Nolan'),
(2, 'Avatar', 'Sci-Fi', 2009, 7.8, 'James Cameron'),
(3, 'Titanic', 'Drama', 1997, 7.9, 'James Cameron'),
(4, 'The Matrix', 'Sci-Fi', 1999, 8.7, 'The Wachowskis'),
(5, 'Toy Story', 'Animation', 1995, 8.3, 'John Lasseter'),
(6, 'The Lion King', 'Animation', 1994, 8.5, 'Roger Allers'),
(7, 'Interstellar', 'Sci-Fi', 2014, 8.6, 'Christopher Nolan'),
(8, 'Joker', 'Drama', 2019, 8.4, 'Todd Phillips'),
(9, 'Frozen', 'Animation', 2013, 7.5, 'Chris Buck'),
(10, 'Shrek', 'Animation', 2001, 7.9, 'Andrew Adamson');

-- End of girmaPopulateTable.sql
