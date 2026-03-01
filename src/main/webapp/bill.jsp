<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.oceanview.model.Reservation" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bill - Ocean View Resort</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .bill-header { background: linear-gradient(135deg, #1a73e8, #0d47a1); }
        @media print { .no-print { display: none; } }
    </style>
    <link rel="stylesheet" href="css/style.css">
    
</head>
<body>
<div class="container mt-4">
    <% Reservation r = (Reservation) request.getAttribute("reservation"); if(r != null) { %>
    <div class="card shadow-lg mx-auto" style="max-width:600px;">
        <div class="card-header bill-header text-white text-center py-4">
            <h3>🏨 Ocean View Resort</h3>
            <p class="mb-0">Beachside Hotel, Galle, Sri Lanka</p>
            <hr class="border-light">
            <h5>RESERVATION BILL</h5>
        </div>
        <div class="card-body p-4">
            <table class="table">
                <tr><th>Reservation ID:</th><td><%= r.getReservationId() %></td></tr>
                <tr><th>Guest Name:</th><td><%= r.getGuestName() %></td></tr>
                <tr><th>Contact:</th><td><%= r.getContactNumber() %></td></tr>
                <tr><th>Address:</th><td><%= r.getAddress() %></td></tr>
                <tr><th>Room Type:</th><td><%= r.getRoomType() %></td></tr>
                <tr><th>Check-In:</th><td><%= r.getCheckInDate() %></td></tr>
                <tr><th>Check-Out:</th><td><%= r.getCheckOutDate() %></td></tr>
                <tr><th>No. of Nights:</th><td><%= r.getNumberOfNights() %></td></tr>
                <tr class="table-success"><th><strong>Total Bill:</strong></th>
                    <td><strong>LKR <%= String.format("%.2f", r.getTotalBill()) %></strong></td></tr>
            </table>
        </div>
        <div class="card-footer text-center no-print">
            <button onclick="window.print()" class="btn btn-primary me-2">🖨 Print Bill</button>
            <a href="dashboard" class="btn btn-secondary">← Back</a>
        </div>
    </div>
    <% } %>
</div>
</body>
</html>
