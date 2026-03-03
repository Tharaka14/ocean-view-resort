<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.oceanview.model.Reservation" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add / Edit Reservation - Ocean View Resort</title>
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
            background: linear-gradient(135deg, #1a73e8, #0d47a1);
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
            margin: 35px 0 25px;
        }

        .page-title h2 {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .page-title p {
            font-size: 0.85rem;
            opacity: 0.6;
        }

        /* ===== FORM CARD ===== */
        .form-card {
            background: rgba(255,255,255,0.06);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255,255,255,0.12);
            border-radius: 24px;
            overflow: hidden;
            box-shadow: 0 25px 60px rgba(0,0,0,0.4);
            margin-bottom: 40px;
        }

        .form-card-header {
            background: rgba(26,115,232,0.2);
            border-bottom: 1px solid rgba(255,255,255,0.1);
            padding: 20px 30px;
        }

        .form-card-header h5 {
            color: white;
            font-weight: 600;
            margin: 0;
            font-size: 0.95rem;
            opacity: 0.85;
        }

        .form-card-body {
            padding: 30px;
        }

        /* ===== SECTION LABEL ===== */
        .section-label {
            font-size: 0.68rem;
            font-weight: 700;
            letter-spacing: 2px;
            color: #64b5f6;
            text-transform: uppercase;
            margin-bottom: 14px;
            margin-top: 10px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .section-label::after {
            content: '';
            flex: 1;
            height: 1px;
            background: rgba(255,255,255,0.08);
        }

        /* ===== FORM ELEMENTS ===== */
        .form-label-custom {
            font-size: 0.78rem;
            font-weight: 600;
            color: rgba(255,255,255,0.65);
            margin-bottom: 6px;
            letter-spacing: 0.3px;
        }

        .form-control-custom,
        .form-select-custom,
        .form-textarea-custom {
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

        .form-control-custom:focus,
        .form-select-custom:focus,
        .form-textarea-custom:focus {
            background: rgba(255,255,255,0.12) !important;
            border-color: #1a73e8 !important;
            box-shadow: 0 0 0 3px rgba(26,115,232,0.25) !important;
            color: white !important;
            outline: none !important;
        }

        .form-control-custom::placeholder {
            color: rgba(255,255,255,0.3) !important;
        }

        .form-select-custom option {
            background: #1a2a3a;
            color: white;
        }

        input[type="date"]::-webkit-calendar-picker-indicator {
            filter: invert(1);
            opacity: 0.5;
        }

        /* Readonly field */
        .form-control-custom[readonly] {
            background: rgba(255,255,255,0.04) !important;
            border-color: rgba(255,255,255,0.08) !important;
            color: rgba(255,255,255,0.5) !important;
            cursor: not-allowed;
        }

        /* Form text hint */
        .form-hint {
            font-size: 0.72rem;
            color: rgba(255,255,255,0.35);
            margin-top: 4px;
        }

        /* ===== ERROR ALERT ===== */
        .alert-custom {
            background: rgba(244,67,54,0.15);
            border: 1px solid rgba(244,67,54,0.35);
            border-radius: 12px;
            color: #ef9a9a;
            padding: 14px 18px;
            font-size: 0.85rem;
            margin-bottom: 24px;
        }

        /* ===== SUBMIT BUTTON ===== */
        .btn-submit {
            background: linear-gradient(135deg, #1a73e8, #0d47a1);
            color: white;
            border: none;
            border-radius: 14px;
            padding: 14px;
            font-size: 0.95rem;
            font-weight: 700;
            width: 100%;
            transition: all 0.3s;
            box-shadow: 0 6px 20px rgba(26,115,232,0.4);
            margin-top: 10px;
            letter-spacing: 0.5px;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 28px rgba(26,115,232,0.55);
            color: white;
        }

        .btn-submit:active {
            transform: translateY(0);
        }

        /* Edit mode - orange button */
        .btn-submit-edit {
            background: linear-gradient(135deg, #ff9800, #e65100);
            box-shadow: 0 6px 20px rgba(255,152,0,0.4);
        }

        .btn-submit-edit:hover {
            box-shadow: 0 10px 28px rgba(255,152,0,0.55);
        }

        /* ===== HIDDEN INPUT ===== */
        input[type="hidden"] { display: none; }
    </style>
</head>
<body>

<%
    Reservation r = (Reservation) request.getAttribute("reservation");
    boolean editMode = (r != null);
%>

<!-- NAVBAR -->
<nav class="navbar-custom d-flex justify-content-between align-items-center">
    <span class="navbar-brand-custom">
        <i class="bi bi-calendar-plus"></i>
        <%= editMode ? "Edit Reservation" : "Add Reservation" %>
    </span>
    <a href="dashboard" class="btn-back-nav">
        <i class="bi bi-arrow-left"></i> Back to Dashboard
    </a>
</nav>

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><%= editMode ? "✏️ Edit Reservation" : "➕ New Reservation" %></h2>
    <p><%= editMode ? "Update existing reservation details" : "Create a new guest reservation" %></p>
</div>

<!-- FORM -->
<div class="container pb-5">
    <div class="row justify-content-center">
        <div class="col-md-7">
            <div class="form-card">

                <div class="form-card-header">
                    <h5>
                        <i class="bi bi-<%= editMode ? "pencil-square" : "plus-circle" %> me-2"></i>
                        <%= editMode ? "Update existing reservation" : "Create a new reservation" %>
                    </h5>
                </div>

                <div class="form-card-body">

                    <!-- ERROR -->
                    <% if (request.getAttribute("error") != null) { %>
                    <div class="alert-custom">
                        <i class="bi bi-exclamation-triangle me-2"></i>
                        <%= request.getAttribute("error") %>
                    </div>
                    <% } %>

                    <form action="reservation" method="post">
                        <input type="hidden" name="action" value="<%= editMode ? "update" : "add" %>">

                        <!-- Guest Info -->
                        <div class="section-label">
                            <i class="bi bi-person"></i> Guest Information
                        </div>

                        <div class="row g-3 mb-3">
                            <div class="col-md-6">
                                <label class="form-label-custom">Reservation ID *</label>
                                <input type="text"
                                       name="reservationId"
                                       class="form-control-custom"
                                       pattern="RES[0-9]{3}"
                                       placeholder="e.g. RES001"
                                       value="<%= editMode ? r.getReservationId() : "" %>"
                                       <%= editMode ? "readonly" : "required" %>>
                                <div class="form-hint">Format: RES001, RES002 ...</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-custom">Guest Name *</label>
                                <input type="text"
                                       name="guestName"
                                       class="form-control-custom"
                                       required
                                       placeholder="Full name"
                                       value="<%= editMode ? r.getGuestName() : "" %>">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label-custom">Address</label>
                            <textarea name="address"
                                      class="form-textarea-custom"
                                      rows="2"
                                      placeholder="Guest address (optional)"><%= editMode && r.getAddress() != null ? r.getAddress() : "" %></textarea>
                        </div>

                        <div class="row g-3 mb-3">
                            <div class="col-md-6">
                                <label class="form-label-custom">Contact Number *</label>
                                <input type="tel"
                                       name="contactNumber"
                                       class="form-control-custom"
                                       pattern="[0-9]{10}"
                                       placeholder="0771234567"
                                       required
                                       value="<%= editMode ? r.getContactNumber() : "" %>">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-custom">Room Type *</label>
                                <select name="roomType" class="form-select-custom" required>
                                    <option value="">🛏 Select Room Type</option>
                                    <option value="Standard"   <%= editMode && "Standard".equals(r.getRoomType())   ? "selected" : "" %>>Standard — LKR 5,000/night</option>
                                    <option value="Deluxe"     <%= editMode && "Deluxe".equals(r.getRoomType())     ? "selected" : "" %>>Deluxe — LKR 8,000/night</option>
                                    <option value="Ocean View" <%= editMode && "Ocean View".equals(r.getRoomType()) ? "selected" : "" %>>Ocean View — LKR 12,000/night</option>
                                    <option value="Suite"      <%= editMode && "Suite".equals(r.getRoomType())      ? "selected" : "" %>>Suite — LKR 15,000/night</option>
                                </select>
                            </div>
                        </div>

                        <!-- Stay Details -->
                        <div class="section-label mt-3">
                            <i class="bi bi-calendar3"></i> Stay Details
                        </div>

                        <div class="row g-3 mb-3">
                            <div class="col-md-6">
                                <label class="form-label-custom">Check-In Date *</label>
                                <input type="date"
                                       name="checkIn"
                                       class="form-control-custom"
                                       required
                                       value="<%= editMode && r.getCheckInDate() != null ? r.getCheckInDate() : "" %>">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-custom">Check-Out Date *</label>
                                <input type="date"
                                       name="checkOut"
                                       class="form-control-custom"
                                       required
                                       value="<%= editMode && r.getCheckOutDate() != null ? r.getCheckOutDate() : "" %>">
                            </div>
                        </div>

                        <!-- Payment -->
                        <div class="section-label mt-3">
                            <i class="bi bi-credit-card"></i> Payment
                        </div>

                        <%
                            String pm = editMode ? r.getPaymentMethod() : null;
                            String cashSelected = (pm != null && pm.equals("Cash")) ? "selected" : "";
                            String cardSelected = (pm != null && pm.equals("Card")) ? "selected" : "";
                        %>

                        <div class="mb-4">
                            <label class="form-label-custom">Payment Method *</label>
                            <select name="paymentMethod" class="form-select-custom" required>
                                <option value="">Select Payment Method</option>
                                <option value="Cash" <%= cashSelected %>>💵 Cash</option>
                                <option value="Card" <%= cardSelected %>>💳 Card</option>
                            </select>
                        </div>

                        <!-- SUBMIT -->
                        <button type="submit"
                                class="btn-submit <%= editMode ? "btn-submit-edit" : "" %>">
                            <i class="bi bi-<%= editMode ? "arrow-repeat" : "save" %> me-2"></i>
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
