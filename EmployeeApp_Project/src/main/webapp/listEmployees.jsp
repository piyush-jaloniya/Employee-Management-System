<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.example.UserDAO, com.example.User"%>
<!DOCTYPE html>
<html>
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
				<li class="nav-item"><a href="managerDashboard.jsp"
					class="nav-link">Dashboard</a></li>
			</ul>
		</div>
	</div>

	<div class="container">
		<div class="card">
			<h2 class="mb-4">Employee List</h2>
			<table class="table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Role</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<% 
                        List<User> employees = UserDAO.getAllEmployees();
                        for (User emp : employees) { 
                    %>
					<tr>
						<td><%= emp.getId() %></td>
						<td><%= emp.getName() %></td>
						<td><%= emp.getEmail() %></td>
						<td><span
							class="badge <%= "manager".equals(emp.getRole()) ? "bg-success" : "bg-primary" %>">
								<%= emp.getRole() %>
						</span></td>
						<td><a href="editEmployee?id=<%= emp.getId() %>"
							class="btn btn-sm btn-primary"> <i class="fas fa-edit"></i>
								Edit
						</a> <a href="deleteEmployee?id=<%= emp.getId() %>"
							class="btn btn-sm btn-danger"
							onclick="return confirm('Are you sure you want to delete this employee?')">
								<i class="fas fa-trash"></i> Delete
						</a></td>
					</tr>
					<% } %>
				</tbody>
			</table>
			<div class="text-center">
				<a href="addEmployee.jsp" class="btn btn-success"> <i
					class="fas fa-user-plus"></i> Add New Employee
				</a> <a href="managerDashboard.jsp" class="btn btn-primary"> <i
					class="fas fa-arrow-left"></i> Back to Dashboard
				</a>
			</div>
		</div>
	</div>
</body>
</html>