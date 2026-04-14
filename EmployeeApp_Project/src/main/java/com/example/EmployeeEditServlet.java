package com.example;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/editEmployee")  // Ensure this matches your JSP link
public class EmployeeEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isBlank()) {
            response.sendRedirect("listEmployees");
            return;
        }

        int id = Integer.parseInt(idParam);

        Employee employee = EmployeeDAO.getEmployeeById(id);  // Fixed method name
        if (employee == null) {
            response.sendRedirect("listEmployees");
            return;
        }
        request.setAttribute("employee", employee);

        RequestDispatcher dispatcher = request.getRequestDispatcher("editEmployee.jsp");
        dispatcher.forward(request, response);
    }
}
