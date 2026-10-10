/*
 * Girma Dingeto
 *CSD430 Module 10.2 Assignment
 * ======================================================================
 * AskNameTag.java
 * ----------------------------------------------------------------------
 * PURPOSE:
 *   - Accepts a "name" attribute from the JSP page.
 *   - Prints a personalized greeting message.
 *   - Demonstrates attribute handling in custom tags.
 *
 * IMPORTANT:
 *   - Uses jakarta.servlet.* (required for Tomcat 10+).
 * ======================================================================
 */

package com.girma.customtags;

import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import jakarta.servlet.jsp.JspException;
import java.io.IOException;

public class AskNameTag extends SimpleTagSupport {

    // Attribute passed from JSP
    private String name;

    // Setter required for JSP attribute binding
    public void setName(String name) {
        this.name = name;
    }

    @Override
    public void doTag() throws JspException, IOException {

        // If no name provided, show a message
        if (name == null || name.trim().isEmpty()) {
            getJspContext().getOut().write("<p>Please enter your name.</p>");
        }
        else {
            // Print personalized greeting
            getJspContext().getOut().write(
                "<h3>Hello, " + name + "! Welcome to your custom tag.</h3>"
            );
        }
    }
}
