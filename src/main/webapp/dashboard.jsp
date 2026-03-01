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
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<%
    String role = (String) session.getAttribute("userRole");
    String loggedUser = (String) session.getAttribute("loggedUser");
    List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
    int total = (reservations != null) ? reservations.size() : 0;
%>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold"><i class="bi bi-building"></i> Ocean View Resort</a>
        <div class="ms-auto d-flex align-items-center gap-3">
            <span class="badge bg-light text-primary fs-6">
                <i class="bi bi-person-circle"></i> <%= loggedUser %>
                <span class="badge bg-<%= "admin".equals(role) ? "danger" : "success" %> ms-1">
                    <%= role %>
                </span>
            </span>
            <a href="logout" class="btn btn-outline-light btn-sm">
                <i class="bi bi-box-arrow-right"></i> Logout
            </a>
        </div>
    </div>
</nav>

<div class="container-fluid mt-4 px-4">

    <!-- Stats Cards -->
    <div class="row g-3 mb-4">
        <div class="col-md-3">
            <div class="card border-0 shadow-sm bg-primary text-white">
                <div class="card-body d-flex justify-content-between align-items-center">
                    <div>
                        <div class="text-white-50">Total Reservations</div>
                        <h2 class="fw-bold"><%= total %></h2>
                    </div>
                    <i class="bi bi-calendar-check fs-1 opacity-50"></i>
                </div>
            </div>
        </div>
        
        <div class="col-md-3">
    <a href="availability" class="text-decoration-none">
        <div class="card border-0 shadow-sm bg-warning text-dark">
            <div class="card-body d-flex justify-content-between align-items-center">
                <div>
                    <div class="text-dark-50">Check Availability</div>
                    <h5 class="fw-bold mt-1">Rooms</h5>
                </div>
                <i class="bi bi-search fs-1 opacity-50"></i>
            </div>
        </div>
    </a>
</div>
        
        
        <div class="col-md-3">
            <a href="reservation" class="text-decoration-none">
                <div class="card border-0 shadow-sm bg-success text-white">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <div>
                            <div class="text-white-50">Add Reservation</div>
                            <h5 class="fw-bold mt-1">New Booking</h5>
                        </div>
                        <i class="bi bi-plus-circle fs-1 opacity-50"></i>
                    </div>
                </div>
            </a>
        </div>
        <% if ("admin".equals(role)) { %>
        <div class="col-md-3">
            <a href="admin" class="text-decoration-none">
                <div class="card border-0 shadow-sm bg-danger text-white">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <div>
                            <div class="text-white-50">Admin Panel</div>
                            <h5 class="fw-bold mt-1">Manage Staff</h5>
                        </div>
                        <i class="bi bi-people fs-1 opacity-50"></i>
                    </div>
                </div>
            </a>
        </div>
        <% } %>
        <div class="col-md-3">
            <a href="help.jsp" class="text-decoration-none">
                <div class="card border-0 shadow-sm bg-info text-white">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <div>
                            <div class="text-white-50">Help</div>
                            <h5 class="fw-bold mt-1">User Guide</h5>
                        </div>
                        <i class="bi bi-question-circle fs-1 opacity-50"></i>
                    </div>
                </div>
            </a>
        </div>
    </div>

    <!-- Reservations Table -->
    <div class="card border-0 shadow-sm">
        <div class="card-header bg-white d-flex justify-content-between align-items-center py-3">
            <h5 class="mb-0"><i class="bi bi-table"></i> All Reservations</h5>
            <a href="reservation" class="btn btn-primary btn-sm">
                <i class="bi bi-plus"></i> Add New
            </a>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead class="table-light">
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
                        <td><span class="badge bg-secondary"><%= r.getReservationId() %></span></td>
                        <td><%= r.getGuestName() %></td>
                        <td><span class="badge bg-primary"><%= r.getRoomType() %></span></td>
                        <td><%= r.getCheckInDate() %></td>
                        <td><%= r.getCheckOutDate() %></td>
                        <td class="fw-bold">LKR <%= String.format("%.2f", r.getTotalBill()) %></td>
                        <td>
                            <%
                                String pm = r.getPaymentMethod();
                                String badgeClass = "info";
                                String iconClass = "credit-card";
                                if ("Cash".equals(pm)) {
                                    badgeClass = "success";
                                    iconClass = "cash";
                                }
                                String label = (pm != null) ? pm : "Pending";
                            %>
                            <span class="badge bg-<%= badgeClass %>">
                                <i class="bi bi-<%= iconClass %>"></i>
                                <%= label %>
                            </span>
                        </td>
                        <td><span class="badge bg-success"><%= r.getStatus() %></span></td>
                        <td>
                            <a href="reservation?action=edit&id=<%= r.getReservationId() %>"
                               class="btn btn-sm btn-outline-primary">
                                <i class="bi bi-pencil"></i>
                            </a>
                            <a href="bill?id=<%= r.getReservationId() %>"
                               class="btn btn-sm btn-outline-warning">
                                <i class="bi bi-receipt"></i>
                            </a>
                            <% if ("admin".equals(role)) { %>
                            <a href="reservation?action=delete&id=<%= r.getReservationId() %>"
                               class="btn btn-sm btn-outline-danger"
                               onclick="return confirm('Delete this reservation?')">
                                <i class="bi bi-trash"></i>
                            </a>
                            <% } %>
                        </td>
                    </tr>
                    <%      }
                        } else { %>
                    <tr>
                        <td colspan="9" class="text-center text-muted py-4">
                            <i class="bi bi-inbox fs-3 d-block mb-2"></i>
                            No reservations found.
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
