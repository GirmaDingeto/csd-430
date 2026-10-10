package com.girma.calculator;

/**
 * Girma Dingeto
 * CSD430 Module 11.2 Assignment, 10/10/2026
 */

/*
  Calculator.java
  ------------------------------------------------------------
  This code example demonstrates clean coding standards used in
  corporate environments. It includes:
  Clear naming conventions
  Proper indentation and spacing
  Descriptive comments explaining purpose, inputs, outputs
  Simple, readable methods (single responsibility)
  Error handling for invalid operations
  Separation of concerns (each method performs one task)
 */

/* HOW THIS FULFILLS CORPORATE CODING STANDARDS:
  ------------------------------------------------------------
  1. **Consistency**:
     All methods follow the same naming pattern (verb + noun),
     parameters use camelCase, and indentation is uniform.

  2. **Readability**:
     Comments explain WHAT each method does, HOW it works,
     and WHY it is structured this way. This reduces onboarding
     time and makes the code easier for teammates to understand.

  3. **Maintainability**:
     Each method performs one clear task. This aligns with the
     Single Responsibility Principle (SRP), making future updates
     easier and reducing the risk of breaking other logic.

  4. **Error Handling**:
     The divideNumbers() method checks for invalid input and
     throws a descriptive exception. Corporate standards require
     defensive programming to prevent runtime failures.

  5. **Scalability**:
     The class is structured so additional operations (subtract,
     modulus, etc.) can be added without modifying existing logic.

  6. **User Interaction**:
     The main method requests input from the user in a clean,
     predictable way, demonstrating how enterprise applications
     handle input validation and user flow.

  7. **Documentation**:
     The comment blocks follow a structured format similar to
     corporate JavaDoc conventions, making the code suitable for
     team collaboration, code reviews, and long-term maintenance.
 */

import java.util.Scanner;

public class Calculator {

    /**
     * Task: Add two numbers and return the result.
     * ------------------------------------------------------------
     * HOW IT FULFILLS CORPORATE STANDARDS:
     * - Method name clearly describes its purpose.
     * - Parameters use descriptive names instead of generic ones.
     * - Logic is simple and readable.
     * - No side effects; returns a pure result.
     */
    public int addNumbers(int firstNumber, int secondNumber) {
        return firstNumber + secondNumber;
    }

    /**
     * Task: Multiply two numbers.
     * ------------------------------------------------------------
     * HOW IT FULFILLS CORPORATE STANDARDS:
     * - Follows the same naming and formatting conventions as
     *   addNumbers(), demonstrating consistency.
     * - Easy to test and reuse.
     * - Clear separation of concerns.
     */
    public int multiplyNumbers(int firstNumber, int secondNumber) {
        return firstNumber * secondNumber;
    }

    /**
     * Task: Safely divide two numbers.
     * ------------------------------------------------------------
     * HOW IT FULFILLS CORPORATE STANDARDS:
     * - Includes defensive programming (division by zero check).
     * - Throws a descriptive exception instead of failing silently.
     * - Uses double for more accurate division results.
     * - Follows predictable method structure used across the class.
     */
    public double divideNumbers(double numerator, double denominator) {

        // Corporate Standard: Always validate inputs before use.
        if (denominator == 0) {
            throw new IllegalArgumentException(
                "Denominator cannot be zero. Division by zero is undefined."
            );
        }

        return numerator / denominator;
    }

    /**
     * Task: Main method to run the program.
     * ------------------------------------------------------------
     * HOW IT FULFILLS CORPORATE STANDARDS:
     * - Demonstrates clean user input handling using Scanner.
     * - Shows how methods are used in real application flow.
     * - Includes clear output formatting for user readability.
     * - Closes the Scanner to prevent resource leaks.
     */
    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        Calculator calc = new Calculator();

        System.out.println("=== Corporate Standard Calculator ===");
        System.out.print("Enter first number: ");
        int first = input.nextInt();

        System.out.print("Enter second number: ");
        int second = input.nextInt();

        int sum = calc.addNumbers(first, second);
        int product = calc.multiplyNumbers(first, second);

        System.out.print("Enter numerator for division: ");
        double numerator = input.nextDouble();

        System.out.print("Enter denominator for division: ");
        double denominator = input.nextDouble();

        double quotient = 0;
        boolean divisionSuccessful = true;

        try {
            quotient = calc.divideNumbers(numerator, denominator);
        } catch (IllegalArgumentException e) {
            System.out.println("Error: " + e.getMessage());
            divisionSuccessful = false; // Prevent printing 0
        }

        System.out.println("\n=== Results ===");
        System.out.println("Sum: " + sum);
        System.out.println("Product: " + product);

        // Only print quotient if division succeeded
        if (divisionSuccessful) {
            System.out.println("Quotient: " + quotient);
        } else {
            System.out.println("Quotient: ERROR (division by zero)");
        }

        input.close();
    }
}
