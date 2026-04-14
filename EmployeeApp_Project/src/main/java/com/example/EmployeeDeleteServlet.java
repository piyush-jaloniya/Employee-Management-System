package com.example;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/deleteEmployee")
public class EmployeeDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isBlank()) {
            response.sendRedirect("listEmployees");
            return;
        }

        int id = Integer.parseInt(idParam);

        boolean deleted = EmployeeDAO.deleteEmployee(id);

        if (deleted) {
            // Redirect to the employee list after deletion
            response.sendRedirect("listEmployees");
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Employee not found");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Delete requires POST");
    }
}
