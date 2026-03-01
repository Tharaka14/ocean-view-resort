<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.oceanview.model.Reservation" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add / Edit Reservation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">

<%
    Reservation r = (Reservation) request.getAttribute("reservation");
    boolean editMode = (r != null);
%>

<nav class="navbar navbar-dark bg-primary shadow">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold">
            <i class="bi bi-calendar-plus"></i>
            <%= editMode ? "Edit Reservation" : "Add Reservation" %>
        </a>
        <a href="dashboard" class="btn btn-outline-light btn-sm">
            <i class="bi bi-arrow-left"></i> Back to Dashboard
        </a>
    </div>
</nav>

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-7">
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white">
                    <h5 class="mb-0">
                        <%= editMode ? "Update existing reservation" : "Create a new reservation" %>
                    </h5>
                </div>
                <div class="card-body">

                    <% if (request.getAttribute("error") != null) { %>
                    <div class="alert alert-danger">
                        <i class="bi bi-exclamation-triangle"></i>
                        <%= request.getAttribute("error") %>
                    </div>
                    <% } %>

                    <form action="reservation" method="post">
                        <input type="hidden" name="action" value="<%= editMode ? "update" : "add" %>">

                        <!-- Reservation ID -->
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Reservation ID *</label>
                                <input type="text"
                                       name="reservationId"
                                       class="form-control"
                                       pattern="RES[0-9]{3}"
                                       placeholder="e.g. RES001"
                                       value="<%= editMode ? r.getReservationId() : "" %>"
                                       <%= editMode ? "readonly" : "required" %> >
                                <div class="form-text">Use format RES001, RES002, ...</div>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label">Guest Name *</label>
                                <input type="text"
                                       name="guestName"
                                       class="form-control"
                                       required
                                       value="<%= editMode ? r.getGuestName() : "" %>">
                            </div>
                        </div>

                        <!-- Address -->
                        <div class="mb-3">
                            <label class="form-label">Address</label>
                            <textarea name="address" class="form-control" rows="2"><%= editMode && r.getAddress() != null ? r.getAddress() : "" %></textarea>
                        </div>

                        <!-- Contact + Room Type -->
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Contact Number *</label>
                                <input type="tel"
                                       name="contactNumber"
                                       class="form-control"
                                       pattern="[0-9]{10}"
                                       placeholder="0771234567"
                                       required
                                       value="<%= editMode ? r.getContactNumber() : "" %>">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Room Type *</label>
                                <select name="roomType" class="form-select" required>
                                    <option value="">Select Room Type</option>
                                    <option value="Standard"   <%= editMode && "Standard".equals(r.getRoomType())   ? "selected" : "" %>>Standard - LKR 5,000/night</option>
                                    <option value="Deluxe"     <%= editMode && "Deluxe".equals(r.getRoomType())     ? "selected" : "" %>>Deluxe - LKR 8,000/night</option>
                                    <option value="Ocean View" <%= editMode && "Ocean View".equals(r.getRoomType()) ? "selected" : "" %>>Ocean View - LKR 12,000/night</option>
                                    <option value="Suite"      <%= editMode && "Suite".equals(r.getRoomType())      ? "selected" : "" %>>Suite - LKR 15,000/night</option>
                                </select>
                            </div>
                        </div>

                        <!-- Dates -->
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Check-In Date *</label>
                                <input type="date"
                                       name="checkIn"
                                       class="form-control"
                                       required
                                       value="<%= editMode && r.getCheckInDate() != null ? r.getCheckInDate() : "" %>">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Check-Out Date *</label>
                                <input type="date"
                                       name="checkOut"
                                       class="form-control"
                                       required
                                       value="<%= editMode && r.getCheckOutDate() != null ? r.getCheckOutDate() : "" %>">
                            </div>
                        </div>

                        <!-- Payment Method -->
                        <%
                            String pm = editMode ? r.getPaymentMethod() : null;
                            String cashSelected = (pm != null && pm.equals("Cash")) ? "selected" : "";
                            String cardSelected = (pm != null && pm.equals("Card")) ? "selected" : "";
                        %>
                        <div class="mb-3">
                            <label class="form-label">Payment Method *</label>
                            <select name="paymentMethod" class="form-select" required>
                                <option value="">Select Payment Method</option>
                                <option value="Cash" <%= cashSelected %>>💵 Cash</option>
                                <option value="Card" <%= cardSelected %>>💳 Card</option>
                            </select>
                        </div>

                        <!-- Submit -->
                        <button type="submit" class="btn btn-primary w-100">
                            <i class="bi bi-save"></i>
                            <%= editMode ? "Update Reservation" : "Add Reservation" %>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
