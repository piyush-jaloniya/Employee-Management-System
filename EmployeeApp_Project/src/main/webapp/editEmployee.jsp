<%@ page import="com.example.Employee"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% Employee employee = (Employee) request.getAttribute("employee"); %>

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

	<div class="container">
		<div class="card">
			<h2 class="mb-4">Edit Employee</h2>
			<form action="updateEmployee" method="POST">
				<input type="hidden" name="id" value="<%= employee.getId() %>">

				<div class="form-group">
					<label for="name">Name:</label> <input type="text" id="name"
						name="name" class="form-control" value="<%= employee.getName() %>"
						required>
				</div>

				<div class="form-group">
					<label for="email">Email:</label> <input type="email" id="email"
						name="email" class="form-control"
						value="<%= employee.getEmail() %>" required>
				</div>

				<div class="form-group">
					<label for="phone">Phone:</label> <input type="text" id="phone"
						name="phone" class="form-control"
						value="<%= employee.getPhone() %>" required>
				</div>

				<div class="form-group text-center">
					<button type="submit" class="btn btn-success">
						<i class="fas fa-save"></i> Update
					</button>
					<a href="employeeList.jsp" class="btn btn-danger">Cancel</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>