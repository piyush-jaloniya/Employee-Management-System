package com.example;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/listEmployees")
public class EmployeeListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Keep historical employee user signups visible in manager employee records.
        List<User> employeeUsers = UserDAO.getAllEmployees();
        if (employeeUsers != null) {
            for (User user : employeeUsers) {
                EmployeeDAO.createEmployeeIfMissing(user.getName(), user.getEmail());
            }
        }

        List<Employee> employees = EmployeeDAO.getAllEmployees();
        request.setAttribute("employees", employees);

        RequestDispatcher dispatcher = request.getRequestDispatcher("employeeList.jsp");
        dispatcher.forward(request, response);
    }
}
