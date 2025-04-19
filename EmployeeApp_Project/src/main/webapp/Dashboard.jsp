<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - EmployeeApp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f1f3f5;
        }
        .dashboard-container {
            padding-top: 60px;
        }
        .card {
            border-radius: 1rem;
            box-shadow: 0 0.5rem 1rem rgba(0,0,0,0.1);
            transition: transform 0.2s ease;
        }
        .card:hover {
            transform: translateY(-5px);
        }
    </style>
</head>
<body>
    <div class="container dashboard-container">
        <h2 class="text-center mb-4">Welcome to EmployeeApp Dashboard</h2>
        <div class="row g-4 justify-content-center">
            <div class="col-md-4">
                <div class="card text-center p-4">
                    <h4>View Employees</h4>
                    <p>Browse, update or delete employees from the system.</p>
                    <a href="employeeList.jsp" class="btn btn-primary">Go</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center p-4">
                    <h4>Add Employee</h4>
                    <p>Register a new employee to the system.</p>
                    <a href="employeeForm.jsp" class="btn btn-success">Go</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
