<%@ page import="com.example.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%
    User user = (User) session.getAttribute("user");
	if (user == null || !"manager".equalsIgnoreCase(user.getRole())) {
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
			<span class="section-kicker"><i class="fas fa-user-shield"></i> Manager workspace</span>
			<h1 class="hero-title">Manager Dashboard</h1>
			<p class="hero-copy mb-3">Welcome, <%= user.getName() %>. You can manage records, promote users, and keep role access under control from here.</p>
			<p class="mb-4">Current role: <span class="badge bg-success">Manager</span></p>

			<div class="feature-grid mb-4 mt-0">
				<div class="feature-card">
					<i class="fas fa-users fa-2x"></i>
					<h3>Employee records</h3>
					<p>View the full employee list, create new employees, and keep data up to date.</p>
				</div>
				<div class="feature-card">
					<i class="fas fa-user-cog fa-2x"></i>
					<h3>Role management</h3>
					<p>Promote users to manager access from the protected admin screen.</p>
				</div>
				<div class="feature-card">
					<i class="fas fa-id-card fa-2x"></i>
					<h3>Profile context</h3>
					<p>Keep your own access details visible while moving through the app.</p>
				</div>
			</div>

			<div class="card mb-4">
				<h3 class="mb-3"><i class="fas fa-users"></i> Manage Employees</h3>
				<div class="action-row mt-0">
					<a href="listEmployees" class="btn btn-primary"><i class="fas fa-list"></i> View Employee List</a>
					<a href="employeeForm.jsp" class="btn btn-success"><i class="fas fa-user-plus"></i> Add Employee</a>
				</div>
			</div>

			<div class="card mb-4">
				<h3 class="mb-3"><i class="fas fa-user-shield"></i> Access Control</h3>
				<p class="mb-3 page-note">Use role management to promote existing users without exposing that action to employees.</p>
				<a href="manageRoles" class="btn btn-warning"><i class="fas fa-user-cog"></i> Manage User Roles</a>
			</div>

			<div class="card">
				<h3 class="mb-3"><i class="fas fa-user"></i> Your Profile</h3>
				<ul class="list-unstyled">
					<li class="mb-2"><strong>Name:</strong> <%= user.getName() %></li>
					<li class="mb-2"><strong>Email:</strong> <%= user.getEmail() %></li>
					<li><strong>Role:</strong> <span class="badge bg-success">Manager</span></li>
				</ul>
			</div>

			<div class="text-center mt-4">
				<a href="logout.jsp" class="btn btn-danger"><i class="fas fa-sign-out-alt"></i> Logout</a>
			</div>
		</div>
	</div>
</body>
</html>