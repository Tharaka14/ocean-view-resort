<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Room Availability - Ocean View Resort</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-dark bg-secondary shadow">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold">
            <i class="bi bi-search"></i> Room Availability
        </a>
        <a href="dashboard" class="btn btn-outline-light btn-sm">
            <i class="bi bi-arrow-left"></i> Back to Dashboard
        </a>
    </div>
</nav>

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-7">
            <div class="card border-0 shadow-sm mb-3">
                <div class="card-header bg-white">
                    <h5 class="mb-0">Check Availability</h5>
                </div>
                <div class="card-body">
                    <form action="availability" method="post" class="row g-3">
                        <div class="col-md-4">
                            <label class="form-label">Room Type</label>
                            <select name="roomType" class="form-select" required>
                                <option value="">Select Room Type</option>
                                <option value="Standard">Standard</option>
                                <option value="Deluxe">Deluxe</option>
                                <option value="Ocean View">Ocean View</option>
                                <option value="Suite">Suite</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Check-In</label>
                            <input type="date" name="checkIn" class="form-control" required>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Check-Out</label>
                            <input type="date" name="checkOut" class="form-control" required>
                        </div>
                        <div class="col-md-2 d-flex align-items-end">
                            <button type="submit" class="btn btn-secondary w-100">
                                <i class="bi bi-search"></i>
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <% if (request.getAttribute("available") != null) { %>
            <%
                String roomType = (String) request.getAttribute("roomType");
                LocalDate ci = (LocalDate) request.getAttribute("checkIn");
                LocalDate co = (LocalDate) request.getAttribute("checkOut");
                int available = (Integer) request.getAttribute("available");
            %>
            <div class="alert alert-<%= available > 0 ? "success" : "danger" %> border-0 shadow-sm">
                <h5 class="alert-heading">
                    <i class="bi bi-info-circle"></i>
                    Availability Result
                </h5>
                <p class="mb-1">
                    Room type: <strong><%= roomType %></strong><br>
                    Dates: <strong><%= ci %></strong> to <strong><%= co %></strong>
                </p>
                <p class="mb-0">
                    <% if (available > 0) { %>
                    <strong><%= available %></strong> rooms available for this period.
                    <% } else { %>
                    No rooms available for this period. Please change dates or room type.
                    <% } %>
                </p>
            </div>
            <% } %>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
