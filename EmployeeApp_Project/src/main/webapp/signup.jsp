<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<div class="card" style="max-width: 500px; margin: 0 auto;">
			<h2 class="mb-4 text-center">Create Account</h2>
			<form action="SignupServlet" method="post">
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
						<option value="manager">Manager</option>
					</select>
				</div>

				<div class="form-group text-center">
					<button type="submit" class="btn btn-success">
						<i class="fas fa-user-plus"></i> Sign Up
					</button>
					<a href="login.jsp" class="btn btn-primary">Already have an
						account?</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>