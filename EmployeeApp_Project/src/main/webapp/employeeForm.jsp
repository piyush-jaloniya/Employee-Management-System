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
		<div class="card">
			<h2 class="mb-4 text-center">Employee Registration Form</h2>
			<form action="employee" method="POST">
				<div class="form-group">
					<label for="name">Name:</label> <input type="text" id="name"
						name="name" class="form-control" required>
				</div>

				<div class="form-group">
					<label for="email">Email:</label> <input type="email" id="email"
						name="email" class="form-control" required>
				</div>

				<div class="form-group">
					<label for="phone">Phone:</label> <input type="text" id="phone"
						name="phone" class="form-control" required>
				</div>

				<h4 class="mt-4 mb-3">Address Information</h4>

				<div class="form-group">
					<label for="street">Street:</label> <input type="text" id="street"
						name="street" class="form-control" required>
				</div>

				<div class="form-group">
					<label for="city">City:</label> <input type="text" id="city"
						name="city" class="form-control" required>
				</div>

				<div class="form-group">
					<label for="state">State:</label> <input type="text" id="state"
						name="state" class="form-control" required>
				</div>

				<div class="form-group">
					<label for="zipCode">Zip Code:</label> <input type="text"
						id="zipCode" name="zipCode" class="form-control" required>
				</div>

				<div class="form-group text-center">
					<button type="submit" class="btn btn-primary">
						<i class="fas fa-save"></i> Submit
					</button>
					<a href="index.jsp" class="btn btn-danger">Cancel</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>