<%@ page import="com.example.User" %>
<%@ page import="com.example.UserDAO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null || !"manager".equalsIgnoreCase(currentUser.getRole())) {
        response.sendRedirect("login.jsp?msg=Access denied!");
        return;
    }

    List<User> users = UserDAO.getAllUsers();
    String success = request.getParameter("success");
    String error = request.getParameter("error");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Role Management - EmployeeApp</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="navbar">
        <div class="container">
            <a href="index.jsp" class="navbar-brand">Employee Management</a>
            <ul class="navbar-nav">
                <li class="nav-item"><a href="managerDashboard.jsp" class="nav-link">Dashboard</a></li>
                <li class="nav-item"><a href="logout.jsp" class="nav-link"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </div>
    </div>

    <div class="container">
        <div class="card">
            <span class="section-kicker"><i class="fas fa-user-cog"></i> Protected admin area</span>
            <h2 class="mb-3">Manage User Roles</h2>
            <p class="mb-4 hero-copy">Promote employee users to manager access when needed. The page stays compact so the action column remains easy to scan.</p>

            <% if (success != null) { %>
                <div class="alert alert-success"><strong><%= success %></strong></div>
            <% } %>
            <% if (error != null) { %>
                <div class="alert alert-danger"><strong><%= error %></strong></div>
            <% } %>

            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <% for (User u : users) { %>
                    <tr>
                        <td><%= u.getId() %></td>
                        <td><%= u.getName() %></td>
                        <td><%= u.getEmail() %></td>
                        <td><%= u.getRole() %></td>
                        <td>
                            <% if ("manager".equalsIgnoreCase(u.getRole())) { %>
                                <span class="badge bg-success">Manager</span>
                            <% } else { %>
                                <form action="promoteManager" method="post" class="form-inline">
                                    <input type="hidden" name="userId" value="<%= u.getId() %>">
                                    <button type="submit" class="btn btn-sm btn-warning">Promote to Manager</button>
                                </form>
                            <% } %>
                        </td>
                    </tr>
                <% } %>
                </tbody>
            </table>

            <div class="text-center mt-4">
                <a href="managerDashboard.jsp" class="btn btn-primary"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
            </div>
        </div>
    </div>
</body>
</html>