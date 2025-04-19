package com.example;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // Try to register user
        boolean isRegistered = UserDAO.registerUser(name, email, password, role);

        if (isRegistered) {
            // Redirect to home page with success message
            response.sendRedirect("index.jsp?success=" + java.net.URLEncoder.encode("Signup successful! You can now log in.", "UTF-8"));
        } else {
            // Redirect back to signup page with error message
            response.sendRedirect("signup.jsp?error=" + java.net.URLEncoder.encode("Signup failed. Email may already exist.", "UTF-8"));
        }
    }
}
