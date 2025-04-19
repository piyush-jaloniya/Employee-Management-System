package com.example;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/updateEmployee")
public class EmployeeUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        Employee employee = EmployeeDAO.getEmployeeById(id);  // Fixed method name
        employee.setName(name);
        employee.setEmail(email);
        employee.setPhone(phone);

        EmployeeDAO.updateEmployee(employee);  // Method added in DAO

        response.sendRedirect("listEmployees");  // Redirect back to the employee list
    }
}
