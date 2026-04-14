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
				<span class="section-kicker"><i class="fas fa-sign-in-alt"></i> Secure sign in</span>
				<h2 class="mb-3">Login to your account</h2>
				<p class="hero-copy mb-4">Use your registered email and password to enter the dashboard assigned to your role.</p>
				<form action="LoginServlet" method="post">
					<div class="form-group">
						<label for="email">Email</label>
						<input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
					</div>

					<div class="form-group">
						<label for="password">Password</label>
						<input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
					</div>

					<div class="action-row">
						<button type="submit" class="btn btn-primary">
							<i class="fas fa-sign-in-alt"></i> Login
						</button>
						<a href="signup.jsp" class="btn btn-secondary">Create Account</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>