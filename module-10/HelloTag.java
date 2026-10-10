/*
 *Girma Dingeto
 * CSD430 Module10.2 Assignment
 * ======================================================================
 * HelloTag.java
 * ----------------------------------------------------------------------
 * PURPOSE:
 *    A simple custom JSP tag that prints a static greeting message.
 *    Demonstrates how to create a basic Jakarta EE custom tag.
 *
 * IMPORTANT:
 *   Uses jakarta.servlet.* (required for Tomcat 10+).
 * ======================================================================
 */

package com.girma.customtags;

import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import jakarta.servlet.jsp.JspException;
import java.io.IOException;

public class HelloTag extends SimpleTagSupport {

    @Override
    public void doTag() throws JspException, IOException {

        // Output a simple greeting message to the JSP page
        getJspContext().getOut().write("<h3>Hello from HelloTag!</h3>");
    }
}
