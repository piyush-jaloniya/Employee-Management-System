<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>EmployeeApp</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="style.css">
</head>

<body>
	<div class="navbar">
		<div class="container">
			<a href="index.jsp" class="navbar-brand">Employee Management</a>
		</div>
	</div>

	<div class="container">
		<div class="card">
			<h2 class="mb-4">Add New Employee</h2>
			<form action="EmployeeServlet" method="post">
				<div class="form-group">
					<label for="name">Name:</label> <input type="text" id="name"
						name="name" class="form-control" required>
				</div>

				<div class="form-group">
					<label for="email">Email:</label> <input type="email" id="email"
						name="email" class="form-control" required>
				</div>

				<div class="form-group">
					<label for="password">Password:</label> <input type="password"
						id="password" name="password" class="form-control" required>
				</div>

				<div class="form-group">
					<label for="role">Role:</label> <select id="role" name="role"
						class="form-control">
						<option value="employee">Employee</option>
					</select>
				</div>

				<button type="submit" class="btn btn-primary">
					<i class="fas fa-user-plus"></i> Add Employee
				</button>
				<a href="managerDashboard.jsp" class="btn btn-danger">Cancel</a>
			</form>
		</div>
	</div>
</body>
</html>