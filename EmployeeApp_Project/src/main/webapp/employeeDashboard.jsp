<%@ page import="com.example.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<% 
    User user = (User) session.getAttribute("user");
    if (user == null || !"employee".equals(user.getRole())) {
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
		<div class="card">
			<h1 class="mb-4">
				Welcome,
				<%= user.getName() %>!
			</h1>
			<p class="mb-4">
				<i class="fas fa-envelope"></i>
				<%= user.getEmail() %></p>

			<div class="card mb-4">
				<h3 class="mb-3">
					<i class="fas fa-user"></i> Your Profile
				</h3>
				<ul class="list-unstyled">
					<li class="mb-2"><strong>Name:</strong> <%= user.getName() %></li>
					<li class="mb-2"><strong>Email:</strong> <%= user.getEmail() %></li>
					<li><strong>Role:</strong> <span class="badge bg-primary">Employee</span></li>
				</ul>
			</div>

			<div class="text-center">
				<a href="logout.jsp" class="btn btn-danger"> <i
					class="fas fa-sign-out-alt"></i> Logout
				</a>
			</div>
		</div>
	</div>
</body>
</html>