/* 
    Author: Girma
    Date: September 11, 2026
    Assignment: CSD430 – Modules 5.2 & 6.2
    File: droptable.sql

    Purpose:
    This SQL script safely removes the table 'girmaMoviesdata' from the 
    CSD430 database. The DROP TABLE command is used during development 
    and testing phases when the table structure needs to be reset or 
    recreated. This file ensures the table is deleted cleanly without 
    causing SQL errors if the table does not exist.

    Academic Honesty:
    This file was written entirely by me (Girma).
    AI assistance was used only for formatting, documentation structure, and
    reference organization. All logic and implementation are my own.

    References:
    Bellevue University – Documentation Requirements PDF
    https://cyberactive.bellevue.edu/ultra/courses/_546986_1/document/_18077820_1?view=content&state=view

    MySQL DROP TABLE – Official Documentation
    https://dev.mysql.com/doc/refman/8.0/en/drop-table.html

    Java JDBC CRUD Tutorial – SQL Drop, Create, and Reset Examples
    https://www.geeksforgeeks.org/java/simplifying-crud-operation-with-jdbc/

    Microsoft Copilot – Assistance with formatting, documentation, and organization
*/

-- Select the correct database
USE CSD430;

-- Safely drop the table only if it exists
DROP TABLE IF EXISTS girmaMoviesdata;

-- End of droptable.sql
