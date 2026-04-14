<%@ page import="com.example.Employee, com.example.EmployeeDAO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	Employee employee = (Employee) request.getAttribute("employee");
	if (employee == null) {
		String idParam = request.getParameter("id");
		if (idParam != null && !idParam.isBlank()) {
			employee = EmployeeDAO.getEmployeeById(Integer.parseInt(idParam));
		}
	}
	if (employee == null) {
		response.sendRedirect("listEmployees");
		return;
	}
%>

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
		</div>
	</div>

	<div class="page-shell">
		<div class="container auth-shell auth-shell-single">
			<div class="card page-panel">
				<span class="section-kicker"><i class="fas fa-user-edit"></i> Employee records</span>
				<h2 class="mb-3">Edit Employee</h2>
				<p class="hero-copy mb-4">Update the employee profile details below and keep the record current.</p>
				<form action="updateEmployee" method="POST">
					<input type="hidden" name="id" value="<%= employee.getId() %>">

					<div class="form-group">
						<label for="name">Name</label>
						<input type="text" id="name" name="name" class="form-control" value="<%= employee.getName() %>" required>
					</div>

					<div class="form-group">
						<label for="email">Email</label>
						<input type="email" id="email" name="email" class="form-control" value="<%= employee.getEmail() %>" required>
					</div>

					<div class="form-group">
						<label for="phone">Phone</label>
						<input type="text" id="phone" name="phone" class="form-control" value="<%= employee.getPhone() %>" required>
					</div>

					<div class="action-row">
						<button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Update</button>
						<a href="listEmployees" class="btn btn-secondary">Cancel</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>