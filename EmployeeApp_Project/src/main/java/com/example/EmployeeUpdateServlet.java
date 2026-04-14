package com.example;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/updateEmployee")
public class EmployeeUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isBlank()) {
            response.sendRedirect("listEmployees");
            return;
        }

        int id = Integer.parseInt(idParam);
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        Employee employee = EmployeeDAO.getEmployeeById(id);  // Fixed method name
        if (employee == null) {
            response.sendRedirect("listEmployees");
            return;
        }
        employee.setName(name);
        employee.setEmail(email);
        employee.setPhone(phone);

        boolean updated = EmployeeDAO.updateEmployee(employee);  // Method added in DAO

        if (updated) {
            response.sendRedirect("listEmployees");  // Redirect back to the employee list
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to update employee");
        }
    }
}
