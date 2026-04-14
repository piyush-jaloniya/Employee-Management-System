package com.example;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Set;

@WebFilter("/*")
public class AuthorizationFilter implements Filter {
    private static final Set<String> MANAGER_ONLY_PATHS = Set.of(
            "/managerDashboard.jsp",
            "/manageRoles.jsp",
            "/employeeList.jsp",
            "/employeeForm.jsp",
            "/editEmployee.jsp",
            "/EmployeeServlet",
            "/updateEmployee",
            "/editEmployee",
            "/deleteEmployee",
            "/listEmployees",
            "/promoteManager"
    );

    private static final Set<String> EMPLOYEE_ONLY_PATHS = Set.of(
            "/employeeDashboard.jsp"
    );

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        String path = httpRequest.getServletPath();

        if (isPublicPath(path) || isStaticResource(path)) {
            chain.doFilter(request, response);
            return;
        }

        if (MANAGER_ONLY_PATHS.contains(path)) {
            if (isManager(httpRequest)) {
                chain.doFilter(request, response);
            } else {
                redirectToLogin(httpRequest, httpResponse);
            }
            return;
        }

        if (EMPLOYEE_ONLY_PATHS.contains(path)) {
            if (isEmployee(httpRequest) || isManager(httpRequest)) {
                chain.doFilter(request, response);
            } else {
                redirectToLogin(httpRequest, httpResponse);
            }
            return;
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }

    private boolean isPublicPath(String path) {
        return "/".equals(path)
                || "/index.jsp".equals(path)
                || "/login.jsp".equals(path)
                || "/signup.jsp".equals(path)
                || "/LoginServlet".equals(path)
                || "/SignupServlet".equals(path)
                || "/logout.jsp".equals(path)
                || "/error404.jsp".equals(path);
    }

    private boolean isStaticResource(String path) {
        return path.endsWith(".css")
                || path.endsWith(".js")
                || path.endsWith(".png")
                || path.endsWith(".jpg")
                || path.endsWith(".jpeg")
                || path.endsWith(".svg")
                || path.endsWith(".ico")
                || path.endsWith(".woff")
                || path.endsWith(".woff2");
    }

    private boolean isManager(HttpServletRequest request) {
        return hasRole(request, "manager");
    }

    private boolean isEmployee(HttpServletRequest request) {
        return hasRole(request, "employee");
    }

    private boolean hasRole(HttpServletRequest request, String expectedRole) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return false;
        }

        Object userObject = session.getAttribute("user");
        if (!(userObject instanceof User user)) {
            return false;
        }

        return user.getRole() != null && expectedRole.equalsIgnoreCase(user.getRole());
    }

    private void redirectToLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect(request.getContextPath() + "/login.jsp?msg=Access%20denied!");
    }
}