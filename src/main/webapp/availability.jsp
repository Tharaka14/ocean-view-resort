<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Room Availability - Ocean View Resort</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            min-height: 100vh;
        }

        /* ===== NAVBAR ===== */
        .navbar-custom {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid rgba(255,255,255,0.1);
            padding: 14px 24px;
        }

        .navbar-brand-custom {
            color: white;
            font-size: 1.1rem;
            font-weight: 700;
            letter-spacing: 1px;
            text-decoration: none;
        }

        .navbar-brand-custom i {
            background: linear-gradient(135deg, #1a73e8, #0d47a1);
            padding: 7px 10px;
            border-radius: 10px;
            margin-right: 8px;
        }

        .btn-back-nav {
            background: rgba(255,255,255,0.12);
            color: white;
            border: 1px solid rgba(255,255,255,0.25);
            border-radius: 30px;
            padding: 7px 20px;
            font-size: 0.82rem;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s;
        }

        .btn-back-nav:hover {
            background: rgba(255,255,255,0.22);
            color: white;
        }

        /* ===== PAGE TITLE ===== */
        .page-title {
            text-align: center;
            color: white;
            margin: 40px 0 30px;
        }

        .page-title h2 {
            font-size: 1.9rem;
            font-weight: 700;
            margin-bottom: 6px;
        }

        .page-title p {
            font-size: 0.88rem;
            opacity: 0.65;
        }

        /* ===== SEARCH CARD ===== */
        .search-card {
            background: rgba(255, 255, 255, 0.07);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255,255,255,0.12);
            border-radius: 20px;
            padding: 32px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.4);
        }

        .search-card .section-label {
            font-size: 0.72rem;
            font-weight: 700;
            letter-spacing: 2px;
            color: #64b5f6;
            text-transform: uppercase;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .search-card .section-label::after {
            content: '';
            flex: 1;
            height: 1px;
            background: rgba(255,255,255,0.1);
        }

        /* Form Labels */
        .form-label-custom {
            font-size: 0.78rem;
            font-weight: 600;
            color: rgba(255,255,255,0.7);
            margin-bottom: 6px;
            letter-spacing: 0.5px;
        }

        /* Inputs */
        .form-control-custom,
        .form-select-custom {
            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.15);
            border-radius: 12px;
            color: white;
            padding: 11px 16px;
            font-size: 0.88rem;
            font-family: 'Poppins', sans-serif;
            transition: all 0.3s;
        }

        .form-control-custom:focus,
        .form-select-custom:focus {
            background: rgba(255,255,255,0.12);
            border-color: #1a73e8;
            box-shadow: 0 0 0 3px rgba(26,115,232,0.25);
            color: white;
            outline: none;
        }

        .form-select-custom option {
            background: #1a2a3a;
            color: white;
        }

        /* Date input icon color fix */
        input[type="date"]::-webkit-calendar-picker-indicator {
            filter: invert(1);
            opacity: 0.6;
        }

        /* Search Button */
        .btn-search {
            background: linear-gradient(135deg, #1a73e8, #0d47a1);
            color: white;
            border: none;
            border-radius: 12px;
            padding: 11px;
            font-size: 1.1rem;
            font-weight: 700;
            width: 100%;
            transition: all 0.3s;
            box-shadow: 0 5px 20px rgba(26,115,232,0.4);
        }

        .btn-search:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(26,115,232,0.55);
            color: white;
        }

        /* ===== RESULT CARD ===== */
        .result-card {
            border-radius: 16px;
            border: none;
            padding: 24px 28px;
            margin-top: 20px;
            backdrop-filter: blur(10px);
        }

        .result-available {
            background: rgba(0, 200, 83, 0.12);
            border: 1px solid rgba(0, 200, 83, 0.3);
        }

        .result-unavailable {
            background: rgba(244, 67, 54, 0.12);
            border: 1px solid rgba(244, 67, 54, 0.3);
        }

        .result-icon {
            font-size: 2.8rem;
            margin-bottom: 8px;
        }

        .result-available .result-icon { color: #00e676; }
        .result-unavailable .result-icon { color: #ff5252; }

        .result-title {
            font-size: 1.15rem;
            font-weight: 700;
            color: white;
            margin-bottom: 10px;
        }

        .result-detail {
            background: rgba(255,255,255,0.06);
            border-radius: 10px;
            padding: 12px 16px;
            margin-bottom: 8px;
        }

        .detail-label {
            font-size: 0.72rem;
            color: rgba(255,255,255,0.5);
            font-weight: 600;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .detail-value {
            font-size: 0.9rem;
            font-weight: 600;
            color: white;
        }

        .rooms-badge {
            display: inline-block;
            background: linear-gradient(135deg, #00c853, #00897b);
            color: white;
            border-radius: 30px;
            padding: 6px 20px;
            font-size: 0.88rem;
            font-weight: 700;
            margin-top: 10px;
        }

        .no-rooms-badge {
            display: inline-block;
            background: linear-gradient(135deg, #f44336, #c62828);
            color: white;
            border-radius: 30px;
            padding: 6px 20px;
            font-size: 0.82rem;
            font-weight: 600;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar-custom d-flex justify-content-between align-items-center">
    <span class="navbar-brand-custom">
        <i class="bi bi-search"></i> Room Availability
    </span>
    <a href="dashboard" class="btn-back-nav">
        <i class="bi bi-arrow-left"></i> Back to Dashboard
    </a>
</nav>

<!-- PAGE TITLE -->
<div class="page-title">
    <h2>🏨 Check Room Availability</h2>
    <p>Select room type and dates to check availability</p>
</div>

<!-- MAIN CONTENT -->
<div class="container pb-5">
    <div class="row justify-content-center">
        <div class="col-md-7">

            <!-- SEARCH CARD -->
            <div class="search-card">
                <div class="section-label">
                    <i class="bi bi-sliders"></i> Search Filters
                </div>

                <form action="availability" method="post">
                    <div class="row g-3">

                        <!-- Room Type -->
                        <div class="col-md-12">
                            <label class="form-label-custom">Room Type</label>
                            <select name="roomType" class="form-select-custom w-100" required>
                                <option value="">🛏 Select Room Type</option>
                                <option value="Standard">Standard</option>
                                <option value="Deluxe">Deluxe</option>
                                <option value="Ocean View">Ocean View</option>
                                <option value="Suite">Suite</option>
                            </select>
                        </div>

                        <!-- Check-In -->
                        <div class="col-md-5">
                            <label class="form-label-custom">Check-In Date</label>
                            <input type="date" name="checkIn"
                                   class="form-control-custom w-100" required>
                        </div>

                        <!-- Check-Out -->
                        <div class="col-md-5">
                            <label class="form-label-custom">Check-Out Date</label>
                            <input type="date" name="checkOut"
                                   class="form-control-custom w-100" required>
                        </div>

                        <!-- Search Btn -->
                        <div class="col-md-2 d-flex align-items-end">
                            <button type="submit" class="btn-search">
                                <i class="bi bi-search"></i>
                            </button>
                        </div>

                    </div>
                </form>
            </div>

            <!-- RESULT SECTION - Logic 100% same -->
            <% if (request.getAttribute("available") != null) { %>
            <%
                String roomType = (String) request.getAttribute("roomType");
                LocalDate ci = (LocalDate) request.getAttribute("checkIn");
                LocalDate co = (LocalDate) request.getAttribute("checkOut");
                int available = (Integer) request.getAttribute("available");
            %>

            <div class="result-card <%= available > 0 ? "result-available" : "result-unavailable" %> text-center">

                <div class="result-icon">
                    <%= available > 0 ? "✅" : "❌" %>
                </div>

                <div class="result-title">
                    <%= available > 0 ? "Rooms Available!" : "No Rooms Available" %>
                </div>

                <div class="row g-2 text-start mb-2">
                    <div class="col-md-4">
                        <div class="result-detail">
                            <div class="detail-label">Room Type</div>
                            <div class="detail-value"><%= roomType %></div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="result-detail">
                            <div class="detail-label">Check-In</div>
                            <div class="detail-value"><%= ci %></div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="result-detail">
                            <div class="detail-label">Check-Out</div>
                            <div class="detail-value"><%= co %></div>
                        </div>
                    </div>
                </div>

                <% if (available > 0) { %>
                    <span class="rooms-badge">
                        <i class="bi bi-check-circle"></i>
                        <%= available %> Room<%= available > 1 ? "s" : "" %> Available
                    </span>
                <% } else { %>
                    <span class="no-rooms-badge">
                        <i class="bi bi-x-circle"></i>
                        Please change dates or room type
                    </span>
                <% } %>

            </div>
            <% } %>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
