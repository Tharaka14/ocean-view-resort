<%@ page contentType="text/html;charset=UTF-8" %>
<%
    // Already logged 
    if (session.getAttribute("loggedUser") != null) {
        response.sendRedirect("dashboard");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ocean View Resort</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', sans-serif;
        }

        .overlay {
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: url('https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=1920') center/cover no-repeat;
            opacity: 0.15;
            z-index: 0;
        }

        .main-card {
            position: relative;
            z-index: 1;
            background: rgba(255, 255, 255, 0.07);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 24px;
            padding: 50px 40px;
            max-width: 480px;
            width: 92%;
            text-align: center;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.4);
        }

        .resort-logo {
            font-size: 3.5rem;
            color: #ffd700;
            margin-bottom: 10px;
        }

        .resort-name {
            font-size: 2rem;
            font-weight: 700;
            color: #ffffff;
            letter-spacing: 1px;
        }

        .resort-tagline {
            color: rgba(255, 255, 255, 0.6);
            font-size: 0.95rem;
            margin-bottom: 40px;
            margin-top: 6px;
        }

        .divider {
            border-top: 1px solid rgba(255, 255, 255, 0.15);
            margin-bottom: 30px;
        }

        .btn-portal {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 100%;
            padding: 18px 24px;
            border-radius: 14px;
            font-size: 1.05rem;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            margin-bottom: 16px;
            border: none;
        }

        .btn-admin {
            background: linear-gradient(135deg, #f7971e, #ffd200);
            color: #1a1a1a;
        }

        .btn-admin:hover {
            background: linear-gradient(135deg, #ffd200, #f7971e);
            transform: translateY(-3px);
            box-shadow: 0 12px 30px rgba(247, 151, 30, 0.4);
            color: #1a1a1a;
        }

        .btn-staff {
            background: linear-gradient(135deg, #1e90ff, #00c6ff);
            color: #ffffff;
        }

        .btn-staff:hover {
            background: linear-gradient(135deg, #00c6ff, #1e90ff);
            transform: translateY(-3px);
            box-shadow: 0 12px 30px rgba(30, 144, 255, 0.4);
            color: #ffffff;
        }

        .btn-icon {
            font-size: 1.8rem;
        }

        .btn-label {
            flex: 1;
            text-align: left;
            padding-left: 16px;
        }

        .btn-label small {
            display: block;
            font-size: 0.75rem;
            font-weight: 400;
            opacity: 0.75;
        }

        .footer-text {
            color: rgba(255, 255, 255, 0.35);
            font-size: 0.78rem;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="overlay"></div>

<div class="main-card">

    <!-- Logo & Name -->
    <div class="resort-logo">
        <i class="bi bi-tsunami"></i>
    </div>
    <div class="resort-name">Ocean View Resort</div>
    <div class="resort-tagline">Luxury by the Sea – Management Portal</div>

    <div class="divider"></div>

    <!-- Admin Button -->
    <a href="login?role=admin" class="btn-portal btn-admin">
        <span class="btn-icon"><i class="bi bi-shield-lock-fill"></i></span>
        <span class="btn-label">
            Admin Portal
            <small>Full system access</small>
        </span>
        <i class="bi bi-arrow-right-circle-fill fs-4"></i>
    </a>

    <!-- Staff Button -->
    <a href="login?role=staff" class="btn-portal btn-staff">
        <span class="btn-icon"><i class="bi bi-person-badge-fill"></i></span>
        <span class="btn-label">
            Staff Portal
            <small>Reservations & operations</small>
        </span>
        <i class="bi bi-arrow-right-circle-fill fs-4"></i>
    </a>

    <div class="footer-text">
        &copy; 2026 Ocean View Resort &mdash; All rights reserved
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
