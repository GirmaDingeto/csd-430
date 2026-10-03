/*
    Author: Girma Dingeto
    Date: September 11, 2026
    Assignment: CSD430 – Modules 5.2 & 6.2
    File: TestDB.java
    Encoding: UTF-8

    Purpose:
    This Java program tests the JDBC connection to the CSD430 database.
    It loads the MySQL JDBC driver, attempts to connect using the provided
    credentials, and prints a confirmation message upon success. This file
    is required for Task 1 to verify database connectivity.

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

import java.sql.Connection;
import java.sql.DriverManager;

public class TestDB {

    public static void main(String[] args) {
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Attempt connection to the CSD430 database
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/CSD430",
                "student1",
                "pass"
            );

            System.out.println("Connection successful!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

/* End of TestDB.java */
