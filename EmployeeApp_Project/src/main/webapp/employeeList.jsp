<%@ page import="java.util.List, com.example.Employee"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<h2 class="mb-4">Employee Records</h2>
			<table class="table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Phone</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<%
                        List<Employee> employees = (List<Employee>) request.getAttribute("employees");
                        for (Employee emp : employees) {
                    %>
					<tr>
						<td><%= emp.getId() %></td>
						<td><%= emp.getName() %></td>
						<td><%= emp.getEmail() %></td>
						<td><%= emp.getPhone() %></td>
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
				<a href="index.jsp" class="btn btn-primary"> <i
					class="fas fa-home"></i> Go to Home
				</a>
			</div>
		</div>
	</div>
</body>
</html>