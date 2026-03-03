<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Help - Ocean View Resort</title>
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
            font-size: 1.1rem;
            font-weight: 700;
            text-decoration: none;
        }

        .navbar-brand-custom i {
            background: linear-gradient(135deg, #00bcd4, #006064);
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
            margin: 35px 0 30px;
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

        /* ===== STEP CARDS ===== */
        .step-card {
            background: rgba(255,255,255,0.06);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 18px;
            padding: 24px 26px;
            margin-bottom: 16px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .step-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 35px rgba(0,0,0,0.3);
        }

        .step-number {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            font-size: 0.85rem;
            font-weight: 700;
            color: white;
            margin-right: 12px;
            flex-shrink: 0;
        }

        .step-title {
            font-size: 0.95rem;
            font-weight: 700;
            color: white;
            margin: 0;
        }

        .step-body {
            font-size: 0.85rem;
            color: rgba(255,255,255,0.65);
            margin: 12px 0 0 48px;
            line-height: 1.7;
        }

        .code-pill {
            background: rgba(26,115,232,0.2);
            border: 1px solid rgba(26,115,232,0.35);
            color: #90caf9;
            border-radius: 8px;
            padding: 2px 10px;
            font-family: monospace;
            font-size: 0.82rem;
        }

        /* Step Colors */
        .s1 { background: linear-gradient(135deg, #1a73e8, #0d47a1); }
        .s2 { background: linear-gradient(135deg, #00c853, #00796b); }
        .s3 { background: linear-gradient(135deg, #ff9800, #e65100); }
        .s4 { background: linear-gradient(135deg, #9c27b0, #4a148c); }
        .s5 { background: linear-gradient(135deg, #00bcd4, #006064); }
        .s6 { background: linear-gradient(135deg, #f44336, #b71c1c); }

        /* ===== RATES TABLE ===== */
        .rates-card {
            background: rgba(255,255,255,0.95);
            border-radius: 16px;
            overflow: hidden;
            margin-top: 4px;
        }

        .rates-table {
            margin: 0;
            --bs-table-bg: transparent;
            --bs-table-color: #1a1a2e;
        }

        .rates-table thead th {
            background: #e8f0fe;
            color: #1a73e8;
            font-size: 0.75rem;
            font-weight: 700;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            border: none;
            padding: 12px 16px;
        }

        .rates-table tbody tr {
            border-bottom: 1px solid #f0f0f0;
        }

        .rates-table tbody td {
            padding: 12px 16px;
            font-size: 0.85rem;
            font-weight: 500;
            color: #1a1a2e;
            border: none;
        }

        .rates-table tbody tr:last-child {
            border-bottom: none;
        }

        .room-type-badge {
            background: linear-gradient(135deg, #1a73e8, #0d47a1);
            color: white;
            border-radius: 20px;
            padding: 3px 14px;
            font-size: 0.78rem;
            font-weight: 600;
        }

        .price-text {
            font-weight: 700;
            color: #0d47a1;
        }

        /* ===== FORMULA BOX ===== */
        .formula-box {
            background: rgba(26,115,232,0.12);
            border: 1px solid rgba(26,115,232,0.25);
            border-radius: 12px;
            padding: 14px 18px;
            margin: 10px 0 0 48px;
            font-size: 0.85rem;
            color: #90caf9;
            font-family: monospace;
            letter-spacing: 0.3px;
        }
    </style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar-custom d-flex justify-content-between align-items-center">
    <span class="navbar-brand-custom">
        <i class="bi bi-question-circle"></i> Help Center
    </span>
    <a href="dashboard" class="btn-back-nav">
        <i class="bi bi-arrow-left"></i> Back
    </a>
</nav>

<!-- PAGE TITLE -->
<div class="page-title">
    <h2>❓ How to Use the System</h2>
    <p>Ocean View Resort — Reservation Management Guide</p>
</div>

<div class="container pb-5">
    <div class="row justify-content-center">
        <div class="col-md-8">

            <!-- Step 1: Login -->
            <div class="step-card">
                <div class="d-flex align-items-center">
                    <span class="step-number s1">1</span>
                    <h6 class="step-title">Login</h6>
                </div>
                <div class="step-body">
                    Use your assigned username and password to access the system.<br>
                    Default credentials: <span class="code-pill">staff1</span> / <span class="code-pill">staff123</span>
                </div>
            </div>

            <!-- Step 2: Adding -->
            <div class="step-card">
                <div class="d-flex align-items-center">
                    <span class="step-number s2">2</span>
                    <h6 class="step-title">Adding a Reservation</h6>
                </div>
                <div class="step-body">
                    Click <strong style="color:white;">"Add Reservation"</strong> → Fill all required fields → Submit.<br>
                    Reservation ID format: <span class="code-pill">RES001</span>, <span class="code-pill">RES002</span> ...
                </div>
            </div>

            <!-- Step 3: Viewing -->
            <div class="step-card">
                <div class="d-flex align-items-center">
                    <span class="step-number s3">3</span>
                    <h6 class="step-title">Viewing Reservations</h6>
                </div>
                <div class="step-body">
                    All reservations appear on the <strong style="color:white;">Dashboard</strong>. Click <strong style="color:white;">"View"</strong> to see full details.
                </div>
            </div>

            <!-- Step 4: Bill -->
            <div class="step-card">
                <div class="d-flex align-items-center">
                    <span class="step-number s4">4</span>
                    <h6 class="step-title">Generating a Bill</h6>
                </div>
                <div class="step-body">
                    Click <strong style="color:white;">"Bill"</strong> next to any reservation to view and print the bill.
                </div>
                <div class="formula-box">
                    💡 Total Bill = Room Price per Night × Number of Nights
                </div>
            </div>

            <!-- Step 5: Room Rates -->
            <div class="step-card">
                <div class="d-flex align-items-center">
                    <span class="step-number s5">5</span>
                    <h6 class="step-title">Room Rates</h6>
                </div>
                <div class="step-body mb-3">
                    Current room pricing per night:
                </div>
                <div class="rates-card mx-auto" style="margin-left:48px !important;">
                    <table class="table rates-table">
                        <thead>
                            <tr>
                                <th>Room Type</th>
                                <th>Price per Night (LKR)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><span class="room-type-badge">Standard</span></td>
                                <td><span class="price-text">5,000</span></td>
                            </tr>
                            <tr>
                                <td><span class="room-type-badge">Deluxe</span></td>
                                <td><span class="price-text">8,000</span></td>
                            </tr>
                            <tr>
                                <td><span class="room-type-badge">Ocean View</span></td>
                                <td><span class="price-text">12,000</span></td>
                            </tr>
                            <tr>
                                <td><span class="room-type-badge">Suite</span></td>
                                <td><span class="price-text">15,000</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Step 6: Logout -->
            <div class="step-card">
                <div class="d-flex align-items-center">
                    <span class="step-number s6">6</span>
                    <h6 class="step-title">Logout</h6>
                </div>
                <div class="step-body">
                    Always <strong style="color:white;">logout</strong> after using the system to maintain security.
                </div>
            </div>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
