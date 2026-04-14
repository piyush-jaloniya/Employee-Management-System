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

	<div class="page-shell">
		<div class="auth-shell auth-shell-single">
			<div class="card auth-panel">
				<span class="section-kicker"><i class="fas fa-user-plus"></i> Create account</span>
				<h2 class="mb-3">Start with a clean employee profile</h2>
				<p class="hero-copy mb-4">New users default to employee access. If your workspace has not been initialized yet, you can optionally bootstrap the first manager account here.</p>
				<form action="SignupServlet" method="post">
					<div class="form-group">
						<label for="name">Name</label>
						<input type="text" id="name" name="name" class="form-control" required>
					</div>

					<div class="form-group">
						<label for="email">Email</label>
						<input type="email" id="email" name="email" class="form-control" required>
					</div>

					<div class="form-group">
						<label for="password">Password</label>
						<input type="password" id="password" name="password" class="form-control" required>
					</div>

					<div class="form-group">
						<label>Role</label>
						<p class="form-control-plaintext mb-2">Employee accounts are the default. Manager setup is only available before the first manager exists.</p>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="managerSetup" name="managerSetup">
							<label class="form-check-label" for="managerSetup">Create this account as the initial manager</label>
						</div>
					</div>

					<div class="action-row">
						<button type="submit" class="btn btn-success">
							<i class="fas fa-user-plus"></i> Sign Up
						</button>
						<a href="login.jsp" class="btn btn-primary">Already have an account?</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>