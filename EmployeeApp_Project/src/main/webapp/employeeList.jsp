<%@ page import="java.util.List, com.example.Employee, com.example.EmployeeDAO"%>
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
		<div class="card page-panel">
			<div class="table-toolbar">
				<div>
					<span class="section-kicker"><i class="fas fa-list"></i> Employee management</span>
					<h2 class="mb-2">Employee Records</h2>
					<p class="page-note">Review, edit, or remove employee entries from a single table.</p>
				</div>
				<a href="managerDashboard.jsp" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
			</div>
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
                        if (employees == null) {
                            employees = EmployeeDAO.getAllEmployees();
                        }
                        for (Employee emp : employees) {
                    %>
					<tr>
						<td><%= emp.getId() %></td>
						<td><%= emp.getName() %></td>
						<td><%= emp.getEmail() %></td>
						<td><%= emp.getPhone() == null || emp.getPhone().isBlank() ? "-" : emp.getPhone() %></td>
						<td><a href="editEmployee?id=<%= emp.getId() %>"
							class="btn btn-sm btn-primary"> <i class="fas fa-edit"></i>
								Edit
						</a>
							<form action="deleteEmployee" method="post" class="form-inline">
								<input type="hidden" name="id" value="<%= emp.getId() %>">
								<button type="submit" class="btn btn-sm btn-danger"
									onclick="return confirm('Are you sure you want to delete this employee?')">
									<i class="fas fa-trash"></i> Delete
								</button>
							</form>
						</td>
					</tr>
					<% } %>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>