<%@ page import="com.example.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User user = (User) session.getAttribute("user");
    if (user != null) {
        if ("manager".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("managerDashboard.jsp");
            return;
        } else if ("employee".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("employeeDashboard.jsp");
            return;
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>EmployeeApp</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="style.css"></head>
<body>
    <div class="navbar">
        <div class="container">
            <a href="index.jsp" class="navbar-brand">Employee Management</a>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a href="login.jsp" class="nav-link">Login</a>
                </li>
                <li class="nav-item">
                    <a href="signup.jsp" class="nav-link">Sign Up</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="page-shell">
        <div class="container page-hero">
            <div class="card page-panel">
                <span class="section-kicker"><i class="fas fa-layer-group"></i> Employee operations hub</span>
                <h1 class="hero-title">Run employee records with a cleaner, calmer workflow.</h1>
                <p class="hero-copy">Create accounts, manage staff, and control access from one place with a design that keeps the important actions visible and the busywork out of the way.</p>

                <div class="hero-actions">
                    <a href="login.jsp" class="btn btn-primary btn-lg">
                        <i class="fas fa-sign-in-alt"></i> Login
                    </a>
                    <a href="signup.jsp" class="btn btn-success btn-lg">
                        <i class="fas fa-user-plus"></i> Create Account
                    </a>
                </div>
            </div>

        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>