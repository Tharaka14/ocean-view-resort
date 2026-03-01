<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Help - Ocean View Resort</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    
</head>
<body>
<nav class="navbar navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand">🏨 Ocean View Resort - Help</a>
        <a href="dashboard" class="btn btn-outline-light btn-sm">← Back</a>
    </div>
</nav>
<div class="container mt-4">
    <div class="card shadow">
        <div class="card-header bg-info text-white"><h5>❓ How to Use the Reservation System</h5></div>
        <div class="card-body">
            <h6>1. Login</h6>
            <p>Use your assigned username and password to access the system. Default: <code>admin / admin123</code></p>
            <h6>2. Adding a Reservation</h6>
            <p>Click "Add Reservation" → Fill all required fields → Submit. Reservation ID format: RES001, RES002...</p>
            <h6>3. Viewing Reservations</h6>
            <p>All reservations appear on the dashboard. Click "View" to see full details.</p>
            <h6>4. Generating a Bill</h6>
            <p>Click "Bill" next to any reservation to view and print the bill. Bill is calculated as: <br>
            <code>Total Bill = Room Price per Night × Number of Nights</code></p>
            <h6>5. Room Rates</h6>
            <table class="table table-bordered">
                <tr><th>Room Type</th><th>Price per Night (LKR)</th></tr>
                <tr><td>Standard</td><td>5,000</td></tr>
                <tr><td>Deluxe</td><td>8,000</td></tr>
                <tr><td>Ocean View</td><td>12,000</td></tr>
                <tr><td>Suite</td><td>15,000</td></tr>
            </table>
            <h6>6. Logout</h6>
            <p>Always logout after using the system to maintain security.</p>
        </div>
    </div>
</div>
</body>
</html>
