<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.model.Reservation" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Ocean View Resort</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
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
            font-size: 1.15rem;
            font-weight: 700;
            letter-spacing: 1px;
            text-decoration: none;
        }

        .navbar-brand-custom i {
            background: linear-gradient(135deg, #1a73e8, #0d47a1);
            padding: 8px 11px;
            border-radius: 12px;
            margin-right: 10px;
        }

        .user-badge {
            background: rgba(255,255,255,0.1);
            border: 1px solid rgba(255,255,255,0.2);
            border-radius: 30px;
            padding: 7px 16px;
            color: white;
            font-size: 0.82rem;
            font-weight: 600;
        }

        .role-pill-admin {
            background: linear-gradient(135deg, #e53935, #b71c1c);
            border-radius: 20px;
            padding: 2px 10px;
            font-size: 0.72rem;
            margin-left: 6px;
            color: white;
        }

        .role-pill-staff {
            background: linear-gradient(135deg, #00c853, #00897b);
            border-radius: 20px;
            padding: 2px 10px;
            font-size: 0.72rem;
            margin-left: 6px;
            color: white;
        }

        .btn-logout {
            background: rgba(255,255,255,0.1);
            border: 1px solid rgba(255,255,255,0.25);
            color: white;
            border-radius: 30px;
            padding: 7px 18px;
            font-size: 0.82rem;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s;
        }

        .btn-logout:hover {
            background: rgba(244,67,54,0.3);
            border-color: #f44336;
            color: white;
        }

        /* ===== STAT CARDS ===== */
        .stat-card {
            border: none;
            border-radius: 18px;
            padding: 22px 24px;
            backdrop-filter: blur(10px);
            transition: transform 0.3s, box-shadow 0.3s;
            text-decoration: none;
            display: block;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.4) !important;
        }

        .stat-card-blue  { background: linear-gradient(135deg, #1a73e8, #0d47a1); box-shadow: 0 8px 25px rgba(26,115,232,0.4); }
        .stat-card-orange{ background: linear-gradient(135deg, #ff9800, #e65100); box-shadow: 0 8px 25px rgba(255,152,0,0.4); }
        .stat-card-green { background: linear-gradient(135deg, #00c853, #00796b); box-shadow: 0 8px 25px rgba(0,200,83,0.4); }
        .stat-card-red   { background: linear-gradient(135deg, #f44336, #b71c1c); box-shadow: 0 8px 25px rgba(244,67,54,0.4); }
        .stat-card-cyan  { background: linear-gradient(135deg, #00bcd4, #006064); box-shadow: 0 8px 25px rgba(0,188,212,0.4); }

        .stat-label { font-size: 0.75rem; font-weight: 500; opacity: 0.75; color: white; margin-bottom: 4px; }
        .stat-value { font-size: 2rem; font-weight: 700; color: white; line-height: 1; }
        .stat-sub   { font-size: 0.9rem; font-weight: 700; color: white; margin-top: 4px; }
        .stat-icon  { font-size: 2.5rem; color: rgba(255,255,255,0.3); }

        /* ===== TABLE CARD ===== */
        .table-card {
            background: rgba(255,255,255,0.95);
            border: 1px solid rgba(255,255,255,0.2);
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 20px 50px rgba(0,0,0,0.4);
        }

        .table-card-header {
            background: #f8f9fa;
            border-bottom: 1px solid #e9ecef;
            padding: 18px 24px;
        }

        .table-card-header h5 {
            color: #1a1a2e;
            font-weight: 700;
            margin: 0;
            font-size: 1rem;
        }

        .btn-add-new {
            background: linear-gradient(135deg, #1a73e8, #0d47a1);
            color: white;
            border: none;
            border-radius: 20px;
            padding: 7px 18px;
            font-size: 0.8rem;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s;
        }

        .btn-add-new:hover { opacity: 0.9; color: white; }

        /* ===== TABLE ===== */
        .custom-table {
            margin: 0;
            --bs-table-bg: transparent !important;
            --bs-table-color: #1a1a2e !important;
            --bs-table-hover-bg: #f0f4ff !important;
        }

        .custom-table,
        .custom-table > :not(caption) > * > * {
            background-color: transparent !important;
            color: #1a1a2e !important;
            border-color: #e9ecef !important;
        }

        .custom-table thead th {
            background: #e8f0fe !important;
            color: #1a73e8 !important;
            font-size: 0.72rem;
            font-weight: 700;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            border: none !important;
            padding: 14px 16px;
        }

        .custom-table tbody tr {
            border-bottom: 1px solid #f0f0f0 !important;
            transition: background 0.2s;
        }

        .custom-table tbody tr:hover {
            background: #f0f4ff !important;
        }

        .custom-table tbody td {
            border: none !important;
            padding: 14px 16px;
            font-size: 0.85rem;
            vertical-align: middle;
            color: #1a1a2e !important;
        }

        /* Badges */
        .id-badge {
            background: #e8f0fe;
            color: #1a73e8;
            border-radius: 8px;
            padding: 3px 10px;
            font-size: 0.78rem;
            font-weight: 600;
        }

        .room-badge {
            background: linear-gradient(135deg, #1a73e8, #0d47a1);
            color: white;
            border-radius: 20px;
            padding: 3px 12px;
            font-size: 0.75rem;
            font-weight: 600;
        }

        .status-badge {
            background: #e8f5e9;
            color: #2e7d32;
            border: 1px solid #a5d6a7;
            border-radius: 20px;
            padding: 3px 12px;
            font-size: 0.75rem;
            font-weight: 600;
        }

        .pay-cash {
            background: #e8f5e9;
            color: #2e7d32;
            border: 1px solid #a5d6a7;
            border-radius: 20px;
            padding: 3px 12px;
            font-size: 0.75rem;
        }

        .pay-card {
            background: #e3f2fd;
            color: #1565c0;
            border: 1px solid #90caf9;
            border-radius: 20px;
            padding: 3px 12px;
            font-size: 0.75rem;
        }

        .amount-text {
            color: #0d47a1 !important;
            font-weight: 700;
        }

        /* Action Buttons */
        .btn-action-edit {
            background: #e8f0fe;
            border: 1px solid #90caf9;
            color: #1a73e8;
            border-radius: 8px;
            padding: 5px 10px;
            font-size: 0.78rem;
            text-decoration: none;
            transition: all 0.2s;
        }

        .btn-action-edit:hover { background: #1a73e8; color: white; }

        .btn-action-bill {
            background: #fff3e0;
            border: 1px solid #ffcc80;
            color: #e65100;
            border-radius: 8px;
            padding: 5px 10px;
            font-size: 0.78rem;
            text-decoration: none;
            transition: all 0.2s;
        }

        .btn-action-bill:hover { background: #ff9800; color: white; }

        .btn-action-delete {
            background: #ffebee;
            border: 1px solid #ef9a9a;
            color: #c62828;
            border-radius: 8px;
            padding: 5px 10px;
            font-size: 0.78rem;
            text-decoration: none;
            transition: all 0.2s;
        }

        .btn-action-delete:hover { background: #f44336; color: white; }

        .empty-state {
            color: #aaa;
            padding: 50px 20px;
            text-align: center;
        }

        .empty-state i {
            font-size: 3rem;
            display: block;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<%
    String role = (String) session.getAttribute("userRole");
    String loggedUser = (String) session.getAttribute("loggedUser");
    List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
    int total = (reservations != null) ? reservations.size() : 0;
%>

<!-- NAVBAR -->
<nav class="navbar-custom d-flex justify-content-between align-items-center">
    <span class="navbar-brand-custom">
        <i class="bi bi-building"></i> Ocean View Resort
    </span>
    <div class="d-flex align-items-center gap-3">
        <span class="user-badge">
            <i class="bi bi-person-circle"></i> <%= loggedUser %>
            <span class="<%= "admin".equals(role) ? "role-pill-admin" : "role-pill-staff" %>">
                <%= role %>
            </span>
        </span>
        <a href="logout" class="btn-logout">
            <i class="bi bi-box-arrow-right"></i> Logout
        </a>
    </div>
</nav>

<div class="container-fluid mt-4 px-4 pb-5">

    <!-- STAT CARDS -->
    <div class="row g-3 mb-4">

        <div class="col-md-3">
            <div class="stat-card stat-card-blue">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <div class="stat-label">Total Reservations</div>
                        <div class="stat-value"><%= total %></div>
                    </div>
                    <i class="bi bi-calendar-check stat-icon"></i>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <a href="availability" class="stat-card stat-card-orange">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <div class="stat-label">Check Availability</div>
                        <div class="stat-sub">Rooms</div>
                    </div>
                    <i class="bi bi-search stat-icon"></i>
                </div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="reservation" class="stat-card stat-card-green">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <div class="stat-label">Add Reservation</div>
                        <div class="stat-sub">New Booking</div>
                    </div>
                    <i class="bi bi-plus-circle stat-icon"></i>
                </div>
            </a>
        </div>

        <% if ("admin".equals(role)) { %>
        <div class="col-md-3">
            <a href="admin" class="stat-card stat-card-red">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <div class="stat-label">Admin Panel</div>
                        <div class="stat-sub">Manage Staff</div>
                    </div>
                    <i class="bi bi-people stat-icon"></i>
                </div>
            </a>
        </div>
        <% } %>

        <div class="col-md-3">
            <a href="help.jsp" class="stat-card stat-card-cyan">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <div class="stat-label">Help</div>
                        <div class="stat-sub">User Guide</div>
                    </div>
                    <i class="bi bi-question-circle stat-icon"></i>
                </div>
            </a>
        </div>

    </div>

    <!-- RESERVATIONS TABLE -->
    <div class="table-card">
        <div class="table-card-header d-flex justify-content-between align-items-center">
            <h5><i class="bi bi-table me-2"></i>All Reservations</h5>
            <a href="reservation" class="btn-add-new">
                <i class="bi bi-plus"></i> Add New
            </a>
        </div>

        <div class="table-responsive">
            <table class="table custom-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Guest Name</th>
                    <th>Room Type</th>
                    <th>Check-In</th>
                    <th>Check-Out</th>
                    <th>Total (LKR)</th>
                    <th>Payment</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if (reservations != null && !reservations.isEmpty()) {
                        for (Reservation r : reservations) {
                %>
                <tr>
                    <td><span class="id-badge">#<%= r.getReservationId() %></span></td>
                    <td><strong><%= r.getGuestName() %></strong></td>
                    <td><span class="room-badge"><%= r.getRoomType() %></span></td>
                    <td><%= r.getCheckInDate() %></td>
                    <td><%= r.getCheckOutDate() %></td>
                    <td><span class="amount-text">LKR <%= String.format("%.2f", r.getTotalBill()) %></span></td>
                    <td>
                        <%
                            String pm = r.getPaymentMethod();
                            String label = (pm != null) ? pm : "Pending";
                            boolean isCash = "Cash".equals(pm);
                        %>
                        <span class="<%= isCash ? "pay-cash" : "pay-card" %>">
                            <i class="bi bi-<%= isCash ? "cash" : "credit-card" %>"></i>
                            <%= label %>
                        </span>
                    </td>
                    <td><span class="status-badge"><%= r.getStatus() %></span></td>
                    <td>
                        <a href="reservation?action=edit&id=<%= r.getReservationId() %>"
                           class="btn-action-edit me-1">
                            <i class="bi bi-pencil"></i>
                        </a>
                        <a href="bill?id=<%= r.getReservationId() %>"
                           class="btn-action-bill me-1">
                            <i class="bi bi-receipt"></i>
                        </a>
                        <% if ("admin".equals(role)) { %>
                        <a href="reservation?action=delete&id=<%= r.getReservationId() %>"
                           class="btn-action-delete"
                           onclick="return confirm('Delete this reservation?')">
                            <i class="bi bi-trash"></i>
                        </a>
                        <% } %>
                    </td>
                </tr>
                <%      }
                    } else { %>
                <tr>
                    <td colspan="9">
                        <div class="empty-state">
                            <i class="bi bi-inbox"></i>
                            No reservations found.
                        </div>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
