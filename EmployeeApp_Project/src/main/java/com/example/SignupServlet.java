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
        boolean requestManagerRole = "on".equalsIgnoreCase(request.getParameter("managerSetup"));

        boolean isRegistered = UserDAO.registerUser(name, email, password, requestManagerRole);

        if (isRegistered) {
            // Keep manager-facing employee records aligned with employee account signups.
            if (!requestManagerRole) {
                EmployeeDAO.createEmployeeIfMissing(name, email);
            }
            response.sendRedirect("login.jsp?success=" + java.net.URLEncoder.encode("Signup successful! You can now log in.", "UTF-8"));
        } else {
            response.sendRedirect("signup.jsp?error=" + java.net.URLEncoder.encode("Signup failed. Email may already exist.", "UTF-8"));
        }
    }
}
