<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.oceanview.model.Reservation" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bill - Ocean View Resort</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
        }

        .bill-wrapper {
            max-width: 650px;
            margin: 40px auto;
        }

        .bill-card {
            border: none;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.5);
        }

        /* ===== HEADER ===== */
        .bill-header {
            background: linear-gradient(135deg, #1a73e8, #0d47a1);
            padding: 35px 20px 25px;
            text-align: center;
            position: relative;
        }

        .bill-header::after {
            content: '';
            position: absolute;
            bottom: -1px;
            left: 0;
            right: 0;
            height: 30px;
            background: white;
            border-radius: 50% 50% 0 0 / 100% 100% 0 0;
        }

        .bill-header .resort-name {
            font-size: 1.8rem;
            font-weight: 700;
            letter-spacing: 1px;
            margin-bottom: 4px;
        }

        .bill-header .resort-address {
            font-size: 0.85rem;
            opacity: 0.85;
            margin-bottom: 15px;
        }

        .bill-badge {
            display: inline-block;
            background: rgba(255,255,255,0.2);
            border: 1px solid rgba(255,255,255,0.4);
            border-radius: 30px;
            padding: 5px 20px;
            font-size: 0.8rem;
            font-weight: 600;
            letter-spacing: 3px;
            backdrop-filter: blur(5px);
        }

        /* ===== BODY ===== */
        .bill-card .card-body {
            background: #ffffff;
            padding: 30px 35px;
        }

        .section-title {
            font-size: 0.7rem;
            font-weight: 700;
            letter-spacing: 2px;
            color: #1a73e8;
            text-transform: uppercase;
            margin-bottom: 12px;
            padding-bottom: 6px;
            border-bottom: 2px solid #e8f0fe;
        }

        .info-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px dashed #eee;
        }

        .info-row:last-child {
            border-bottom: none;
        }

        .info-label {
            font-size: 0.82rem;
            color: #888;
            font-weight: 500;
        }

        .info-value {
            font-size: 0.88rem;
            font-weight: 600;
            color: #2c3e50;
            text-align: right;
        }

        /* ===== TOTAL BOX ===== */
        .total-box {
            background: linear-gradient(135deg, #e8f0fe, #d2e3fc);
            border-radius: 15px;
            padding: 20px 25px;
            margin-top: 20px;
            border-left: 5px solid #1a73e8;
        }

        .total-label {
            font-size: 0.85rem;
            color: #555;
            font-weight: 500;
        }

        .total-amount {
            font-size: 1.8rem;
            font-weight: 700;
            color: #0d47a1;
        }

        .total-nights-badge {
            background: #1a73e8;
            color: white;
            border-radius: 20px;
            padding: 4px 14px;
            font-size: 0.75rem;
            font-weight: 600;
        }

        /* ===== FOOTER ===== */
        .bill-footer {
            background: #f8faff;
            padding: 20px 35px 25px;
            border-top: 1px solid #e8f0fe;
        }

        .btn-print {
            background: linear-gradient(135deg, #1a73e8, #0d47a1);
            color: white;
            border: none;
            border-radius: 30px;
            padding: 10px 28px;
            font-weight: 600;
            font-size: 0.88rem;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(26, 115, 232, 0.4);
        }

        .btn-print:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(26, 115, 232, 0.5);
            color: white;
        }

        .btn-back {
            background: transparent;
            color: #555;
            border: 2px solid #ddd;
            border-radius: 30px;
            padding: 10px 28px;
            font-weight: 600;
            font-size: 0.88rem;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .btn-back:hover {
            background: #f0f0f0;
            color: #333;
        }

        .thank-you {
            font-size: 0.78rem;
            color: #aaa;
            margin-top: 12px;
        }

        /* ===== PRINT ===== */
        @media print {
            body { background: white; }
            .bill-footer { display: none; }
            .bill-card { box-shadow: none; }
        }
    </style>
</head>
<body>

<% Reservation r = (Reservation) request.getAttribute("reservation"); if(r != null) { %>

<div class="bill-wrapper">
    <div class="bill-card card">

        <!-- HEADER -->
        <div class="bill-header text-white">
            <div class="resort-name">🏨 Ocean View Resort</div>
            <div class="resort-address">Beachside Hotel, Galle, Sri Lanka</div>
            <span class="bill-badge">RESERVATION BILL</span>
        </div>

        <!-- BODY -->
        <div class="card-body">

            <!-- Guest Info -->
            <div class="section-title">👤 Guest Information</div>
            <div class="info-row">
                <span class="info-label">Reservation ID</span>
                <span class="info-value">#<%= r.getReservationId() %></span>
            </div>
            <div class="info-row">
                <span class="info-label">Guest Name</span>
                <span class="info-value"><%= r.getGuestName() %></span>
            </div>
            <div class="info-row">
                <span class="info-label">Contact</span>
                <span class="info-value"><%= r.getContactNumber() %></span>
            </div>
            <div class="info-row">
                <span class="info-label">Address</span>
                <span class="info-value"><%= r.getAddress() %></span>
            </div>

            <!-- Stay Details -->
            <div class="section-title mt-4">🛏 Stay Details</div>
            <div class="info-row">
                <span class="info-label">Room Type</span>
                <span class="info-value"><%= r.getRoomType() %></span>
            </div>
            <div class="info-row">
                <span class="info-label">Check-In</span>
                <span class="info-value"><%= r.getCheckInDate() %></span>
            </div>
            <div class="info-row">
                <span class="info-label">Check-Out</span>
                <span class="info-value"><%= r.getCheckOutDate() %></span>
            </div>

            <!-- Total Box -->
            <div class="total-box d-flex justify-content-between align-items-center">
                <div>
                    <div class="total-label">Total Amount</div>
                    <div class="total-amount">LKR <%= String.format("%.2f", r.getTotalBill()) %></div>
                </div>
                <span class="total-nights-badge">
                    <%= r.getNumberOfNights() %> Night<%= r.getNumberOfNights() > 1 ? "s" : "" %>
                </span>
            </div>

        </div><!-- end card-body -->

        <!-- FOOTER (no-print) -->
        <div class="bill-footer text-center">
            <button onclick="window.print()" class="btn-print me-2">🖨 Print Bill</button>
            <a href="dashboard" class="btn-back">← Back to Dashboard</a>
            <div class="thank-you">Thank you for choosing Ocean View Resort 🌊..</div>
        </div>

    </div><!-- end bill-card -->
</div>

<% } %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
