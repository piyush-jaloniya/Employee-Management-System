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
		<div class="card text-center"
			style="max-width: 500px; margin: 0 auto;">
			<div class="alert alert-success">
				<i class="fas fa-check-circle fa-2x mb-3"></i>
				<h3>${message}</h3>
			</div>
			<a href="index.jsp" class="btn btn-primary"> <i
				class="fas fa-home"></i> Go to Home
			</a>
		</div>
	</div>
</body>
</html>