<%@ page import="com.example.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<% 
    User user = (User) session.getAttribute("user");
	if (user == null || !"employee".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("login.jsp?msg=Access denied!");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
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
				<li class="nav-item"><a href="logout.jsp" class="nav-link">
						<i class="fas fa-sign-out-alt"></i> Logout
				</a></li>
			</ul>
		</div>
	</div>

	<div class="container">
		<div class="card page-panel">
			<span class="section-kicker"><i class="fas fa-user"></i> Employee workspace</span>
			<h1 class="hero-title">Welcome, <%= user.getName() %>!</h1>
			<p class="hero-copy mb-3">Your profile is ready. This dashboard keeps your account details visible without overwhelming you with unrelated controls.</p>
			<p class="mb-4">Access level: <span class="badge bg-primary">Employee</span></p>

			<div class="feature-grid mb-4 mt-0 grid-2">
				<div class="feature-card">
					<i class="fas fa-envelope fa-2x"></i>
					<h3>Email contact</h3>
					<p><%= user.getEmail() %></p>
				</div>
				<div class="feature-card">
					<i class="fas fa-lock fa-2x"></i>
					<h3>Protected access</h3>
					<p>Access is filtered by role, so only employee-safe options appear here.</p>
				</div>
			</div>

			<div class="card mb-4">
				<h3 class="mb-3"><i class="fas fa-user"></i> Your Profile</h3>
				<ul class="list-unstyled">
					<li class="mb-2"><strong>Name:</strong> <%= user.getName() %></li>
					<li class="mb-2"><strong>Email:</strong> <%= user.getEmail() %></li>
					<li><strong>Role:</strong> <span class="badge bg-primary">Employee</span></li>
				</ul>
			</div>

			<div class="text-center">
				<a href="logout.jsp" class="btn btn-danger"><i class="fas fa-sign-out-alt"></i> Logout</a>
			</div>
		</div>
	</div>
</body>
</html>