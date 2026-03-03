<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List, com.oceanview.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Panel - Ocean View Resort</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        * { font-family: 'Poppins', sans-serif; }

        body {
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            min-height: 100vh;
        }

        /* ===== NAVBAR ===== */
        .navbar-custom {
            background: rgba(255,255,255,0.07);
            backdrop-filter: blur(15px);
            border-bottom: 1px solid rgba(255,255,255,0.1);
            padding: 14px 28px;
        }

        .navbar-brand-custom {
            color: white;
            font-size: 1.1rem;
            font-weight: 700;
            text-decoration: none;
        }

        .navbar-brand-custom i {
            background: linear-gradient(135deg, #f44336, #b71c1c);
            padding: 8px 11px;
            border-radius: 12px;
            margin-right: 10px;
        }

        .btn-back-nav {
            background: rgba(255,255,255,0.1);
            border: 1px solid rgba(255,255,255,0.25);
            color: white;
            border-radius: 30px;
            padding: 7px 20px;
            font-size: 0.82rem;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s;
        }

        .btn-back-nav:hover {
            background: rgba(255,255,255,0.2);
            color: white;
        }

        /* ===== PAGE TITLE ===== */
        .page-title {
            text-align: center;
            color: white;
            margin: 35px 0 28px;
        }

        .page-title h2 {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .page-title p {
            font-size: 0.85rem;
            opacity: 0.55;
        }

        /* ===== ADD STAFF CARD ===== */
        .add-card {
            background: rgba(255,255,255,0.06);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255,255,255,0.12);
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 20px 50px rgba(0,0,0,0.4);
            height: fit-content;
        }

        .add-card-header {
            background: linear-gradient(135deg, #f44336, #b71c1c);
            padding: 18px 22px;
        }

        .add-card-header h5 {
            color: white;
            font-weight: 700;
            margin: 0;
            font-size: 0.95rem;
        }

        .add-card-body {
            padding: 24px;
        }

        .form-label-custom {
            font-size: 0.78rem;
            font-weight: 600;
            color: rgba(255,255,255,0.65);
            margin-bottom: 6px;
        }

        .form-control-custom {
            background: rgba(255,255,255,0.08) !important;
            border: 1px solid rgba(255,255,255,0.15) !important;
            border-radius: 12px !important;
            color: white !important;
            padding: 11px 16px !important;
            font-size: 0.88rem !important;
            font-family: 'Poppins', sans-serif !important;
            transition: all 0.3s !important;
            width: 100%;
        }

        .form-control-custom:focus {
            background: rgba(255,255,255,0.12) !important;
            border-color: #f44336 !important;
            box-shadow: 0 0 0 3px rgba(244,67,54,0.25) !important;
            color: white !important;
            outline: none !important;
        }

        .form-control-custom::placeholder {
            color: rgba(255,255,255,0.3) !important;
        }

        .btn-add-staff {
            background: linear-gradient(135deg, #f44336, #b71c1c);
            color: white;
            border: none;
            border-radius: 12px;
            padding: 12px;
            font-size: 0.9rem;
            font-weight: 700;
            width: 100%;
            transition: all 0.3s;
            box-shadow: 0 6px 20px rgba(244,67,54,0.4);
            margin-top: 6px;
        }

        .btn-add-staff:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 28px rgba(244,67,54,0.55);
            color: white;
        }

        /* ===== STAFF LIST CARD ===== */
        .list-card {
            background: rgba(255,255,255,0.95);
            border: none;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 20px 50px rgba(0,0,0,0.4);
        }

        .list-card-header {
            background: #f8f9fa;
            border-bottom: 1px solid #e9ecef;
            padding: 18px 24px;
        }

        .list-card-header h5 {
            color: #1a1a2e;
            font-weight: 700;
            margin: 0;
            font-size: 1rem;
        }

        .staff-count-badge {
            background: linear-gradient(135deg, #f44336, #b71c1c);
            color: white;
            border-radius: 20px;
            padding: 3px 14px;
            font-size: 0.78rem;
            font-weight: 600;
        }

        /* ===== TABLE ===== */
        .staff-table {
            margin: 0;
            --bs-table-bg: transparent;
            --bs-table-color: #1a1a2e;
        }

        .staff-table,
        .staff-table > :not(caption) > * > * {
            background-color: transparent !important;
            color: #1a1a2e !important;
            border-color: #f0f0f0 !important;
        }

        .staff-table thead th {
            background: #e8f0fe !important;
            color: #1a73e8 !important;
            font-size: 0.72rem;
            font-weight: 700;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            border: none !important;
            padding: 13px 16px;
        }

        .staff-table tbody tr {
            border-bottom: 1px solid #f5f5f5 !important;
            transition: background 0.2s;
        }

        .staff-table tbody tr:hover {
            background: #fff5f5 !important;
        }

        .staff-table tbody td {
            border: none !important;
            padding: 14px 16px;
            font-size: 0.85rem;
            vertical-align: middle;
            color: #1a1a2e !important;
        }

        .id-badge {
            background: #fce4ec;
            color: #c62828;
            border-radius: 8px;
            padding: 3px 10px;
            font-size: 0.78rem;
            font-weight: 700;
        }

        .username-text {
            font-weight: 600;
            color: #1a1a2e !important;
        }

        .role-badge {
            background: linear-gradient(135deg, #00c853, #00796b);
            color: white;
            border-radius: 20px;
            padding: 3px 14px;
            font-size: 0.75rem;
            font-weight: 600;
        }

        /* ===== DELETE BUTTON ===== */
        .btn-delete {
            background: #ffebee;
            border: 1px solid #ef9a9a;
            color: #c62828;
            border-radius: 8px;
            padding: 5px 12px;
            font-size: 0.78rem;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.2s;
        }

        .btn-delete:hover {
            background: #f44336;
            border-color: #f44336;
            color: white;
        }

        /* ===== EMPTY STATE ===== */
        .empty-state {
            text-align: center;
            padding: 40px 20px;
            color: #aaa;
        }

        .empty-state i {
            font-size: 2.5rem;
            display: block;
            margin-bottom: 8px;
        }
    </style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar-custom d-flex justify-content-between align-items-center">
    <span class="navbar-brand-custom">
        <i class="bi bi-shield-lock"></i> Admin Panel
    </span>
    <a href="dashboard" class="btn-back-nav">
        <i class="bi bi-arrow-left"></i> Back to Dashboard
    </a>
</nav>

<!-- PAGE TITLE -->
<div class="page-title">
    <h2>🛡️ Admin Panel</h2>
    <p>Manage staff accounts and system access</p>
</div>

<div class="container pb-5">
    <div class="row g-4">

        <!-- ADD STAFF FORM -->
        <div class="col-md-4">
            <div class="add-card">
                <div class="add-card-header">
                    <h5><i class="bi bi-person-plus me-2"></i>Add New Staff</h5>
                </div>
                <div class="add-card-body">
                    <form action="admin" method="post">
                        <input type="hidden" name="action" value="addStaff">

                        <div class="mb-3">
                            <label class="form-label-custom">Username</label>
                            <input type="text"
                                   name="username"
                                   class="form-control-custom"
                                   placeholder="Enter username"
                                   required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label-custom">Password</label>
                            <input type="password"
                                   name="password"
                                   class="form-control-custom"
                                   placeholder="Enter password"
                                   required>
                        </div>

                        <button type="submit" class="btn-add-staff">
                            <i class="bi bi-person-check me-2"></i> Add Staff
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <!-- STAFF LIST -->
        <div class="col-md-8">
            <div class="list-card">
                <div class="list-card-header d-flex justify-content-between align-items-center">
                    <h5><i class="bi bi-people me-2"></i>Staff Members</h5>
                    <%
                        List<User> staffList = (List<User>) request.getAttribute("staffList");
                        int staffCount = (staffList != null) ? staffList.size() : 0;
                    %>
                    <span class="staff-count-badge">
                        <i class="bi bi-person"></i> <%= staffCount %> Staff
                    </span>
                </div>

                <div class="table-responsive">
                    <table class="table staff-table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Username</th>
                                <th>Role</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            if (staffList != null && !staffList.isEmpty()) {
                                for (User u : staffList) {
                        %>
                        <tr>
                            <td><span class="id-badge">#<%= u.getId() %></span></td>
                            <td>
                                <span class="username-text">
                                    <i class="bi bi-person-circle me-1" style="color:#1a73e8;"></i>
                                    <%= u.getUsername() %>
                                </span>
                            </td>
                            <td><span class="role-badge"><i class="bi bi-check-circle me-1"></i>Staff</span></td>
                            <td>
                                <a href="admin?action=deleteStaff&id=<%= u.getId() %>"
                                   class="btn-delete"
                                   onclick="return confirm('Delete staff member: <%= u.getUsername() %>?')">
                                    <i class="bi bi-trash"></i> Delete
                                </a>
                            </td>
                        </tr>
                        <%      }
                            } else { %>
                        <tr>
                            <td colspan="4">
                                <div class="empty-state">
                                    <i class="bi bi-people"></i>
                                    No staff members found.
                                </div>
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
