<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List, com.oceanview.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">
<nav class="navbar navbar-dark bg-danger shadow">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold"><i class="bi bi-shield-lock"></i> Admin Panel</a>
        <a href="dashboard" class="btn btn-outline-light btn-sm">
            <i class="bi bi-arrow-left"></i> Back to Dashboard
        </a>
    </div>
</nav>

<div class="container mt-4">
    <div class="row g-4">

        <!-- Add Staff Form -->
        <div class="col-md-4">
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-danger text-white">
                    <h5 class="mb-0"><i class="bi bi-person-plus"></i> Add New Staff</h5>
                </div>
                <div class="card-body">
                    <form action="admin" method="post">
                        <input type="hidden" name="action" value="addStaff">
                        <div class="mb-3">
                            <label class="form-label">Username</label>
                            <input type="text" name="username" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-danger w-100">
                            <i class="bi bi-person-check"></i> Add Staff
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Staff List -->
        <div class="col-md-8">
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white">
                    <h5 class="mb-0"><i class="bi bi-people"></i> Staff Members</h5>
                </div>
                <div class="card-body p-0">
                    <table class="table table-hover mb-0">
                        <thead class="table-light">
                        <tr>
                            <th>#</th>
                            <th>Username</th>
                            <th>Role</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            List<User> staffList = (List<User>) request.getAttribute("staffList");
                            if (staffList != null) {
                                for (User u : staffList) {
                        %>
                        <tr>
                            <td><%= u.getId() %></td>
                            <td><i class="bi bi-person"></i> <%= u.getUsername() %></td>
                            <td><span class="badge bg-success">Staff</span></td>
                        </tr>
                        <%  } } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
