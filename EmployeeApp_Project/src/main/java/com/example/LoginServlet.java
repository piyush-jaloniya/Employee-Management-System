package com.example;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = UserDAO.getUserByEmail(email);

        if (user != null && password.equals(user.getPassword())) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            System.out.println("User logged in: " + user.getEmail() + ", Role: " + user.getRole());

            if ("manager".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("managerDashboard.jsp");
            } else if ("employee".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("employeeDashboard.jsp");
            } else {
                response.sendRedirect("login.jsp?msg=" + java.net.URLEncoder.encode("Invalid role!", "UTF-8"));
            }
        } else {
            response.sendRedirect("login.jsp?msg=" + java.net.URLEncoder.encode("Invalid email or password!", "UTF-8"));
        }
    }
}
