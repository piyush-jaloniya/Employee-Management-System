package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/promoteManager")
public class PromoteManagerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User currentUser = session == null ? null : (User) session.getAttribute("user");

        if (currentUser == null || !"manager".equalsIgnoreCase(currentUser.getRole())) {
            response.sendRedirect("login.jsp?msg=" + java.net.URLEncoder.encode("Access denied!", "UTF-8"));
            return;
        }

        String idParam = request.getParameter("userId");
        if (idParam == null || idParam.isBlank()) {
            response.sendRedirect("manageRoles.jsp?error=" + java.net.URLEncoder.encode("Invalid user id", "UTF-8"));
            return;
        }

        boolean promoted;
        try {
            int userId = Integer.parseInt(idParam);
            promoted = UserDAO.promoteUserToManager(userId);
        } catch (NumberFormatException ex) {
            response.sendRedirect("manageRoles.jsp?error=" + java.net.URLEncoder.encode("Invalid user id", "UTF-8"));
            return;
        }

        if (promoted) {
            response.sendRedirect("manageRoles.jsp?success=" + java.net.URLEncoder.encode("User promoted to manager", "UTF-8"));
        } else {
            response.sendRedirect("manageRoles.jsp?error=" + java.net.URLEncoder.encode("Unable to promote user", "UTF-8"));
        }
    }
}