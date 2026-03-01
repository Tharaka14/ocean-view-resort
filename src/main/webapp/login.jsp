<%@ page contentType="text/html;charset=UTF-8" %>
<%
    if (session.getAttribute("loggedUser") != null) {
        response.sendRedirect("dashboard");
        return;
    }
    String role = request.getParameter("role");
    if (role == null) role = "staff";
    boolean isAdmin = "admin".equals(role);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= isAdmin ? "Admin" : "Staff" %> Login – Ocean View Resort</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 20px;
            padding: 40px 36px;
            width: 100%;
            max-width: 420px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.4);
        }

        .login-icon {
            font-size: 2.8rem;
            color: <%= isAdmin ? "#ffd200" : "#00c6ff" %>;
        }

        .login-title {
            color: #ffffff;
            font-weight: 700;
            font-size: 1.5rem;
        }

        .login-sub {
            color: rgba(255,255,255,0.5);
            font-size: 0.88rem;
        }

        .form-control {
            background: rgba(255,255,255,0.1);
            border: 1px solid rgba(255,255,255,0.2);
            color: #ffffff;
            border-radius: 10px;
            padding: 12px 14px;
        }

        .form-control::placeholder {
            color: rgba(255,255,255,0.4);
        }

        .form-control:focus {
            background: rgba(255,255,255,0.15);
            border-color: <%= isAdmin ? "#ffd200" : "#00c6ff" %>;
            color: #ffffff;
            box-shadow: none;
        }

        .form-label {
            color: rgba(255,255,255,0.75);
            font-size: 0.9rem;
        }

        .btn-login {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            font-weight: 600;
            font-size: 1rem;
            border: none;
            background: <%= isAdmin ? "linear-gradient(135deg,#f7971e,#ffd200)" : "linear-gradient(135deg,#1e90ff,#00c6ff)" %>;
            color: <%= isAdmin ? "#1a1a1a" : "#ffffff" %>;
            transition: 0.3s;
        }

        .btn-login:hover {
            opacity: 0.9;
            transform: translateY(-2px);
        }

        .back-link {
            color: rgba(255,255,255,0.4);
            font-size: 0.85rem;
            text-decoration: none;
        }

        .back-link:hover {
            color: rgba(255,255,255,0.8);
        }
    </style>
</head>
<body>

<div class="login-card">
    <div class="text-center mb-4">
        <div class="login-icon mb-2">
            <i class="bi bi-<%= isAdmin ? "shield-lock-fill" : "person-badge-fill" %>"></i>
        </div>
        <div class="login-title"><%= isAdmin ? "Admin Login" : "Staff Login" %></div>
        <div class="login-sub">Ocean View Resort Management</div>
    </div>

    <% if (request.getAttribute("error") != null) { %>
    <div class="alert alert-danger border-0 rounded-3 py-2 px-3 mb-3" style="font-size:0.88rem;">
        <i class="bi bi-exclamation-circle me-1"></i>
        <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <form action="login" method="post">
        <input type="hidden" name="role" value="<%= role %>">

        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" name="username" class="form-control"
                   placeholder="Enter username" required autofocus>
        </div>

        <div class="mb-4">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control"
                   placeholder="Enter password" required>
        </div>

        <button type="submit" class="btn-login">
            <i class="bi bi-box-arrow-in-right me-2"></i>Login
        </button>
    </form>

    <div class="text-center mt-4">
        <a href="index.jsp" class="back-link">
            <i class="bi bi-arrow-left me-1"></i>Back to Home
        </a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
