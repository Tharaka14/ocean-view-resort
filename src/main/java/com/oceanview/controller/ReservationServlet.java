package com.oceanview.controller;

import com.oceanview.dao.ReservationDAO;
import com.oceanview.dao.RoomDAO;
import com.oceanview.model.Reservation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/reservation")
public class ReservationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            resp.sendRedirect("login");
            return;
        }

        String action = req.getParameter("action");
        String id = req.getParameter("id");

        ReservationDAO dao = new ReservationDAO();

        // Edit form load
        if ("edit".equals(action) && id != null) {
            Reservation r = dao.getReservation(id);
            req.setAttribute("reservation", r);
            req.getRequestDispatcher("/addReservation.jsp").forward(req, resp);
            return;
        }

        // Delete (admin only)
        if ("delete".equals(action) && id != null) {
            String role = (String) session.getAttribute("userRole");
            if ("admin".equals(role)) {
                dao.deleteReservation(id);
            }
            resp.sendRedirect("dashboard");
            return;
        }

        // Default: show empty add form
        req.getRequestDispatcher("/addReservation.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            resp.sendRedirect("login");
            return;
        }

        String action = req.getParameter("action"); // "add" or "update"

        String reservationId = req.getParameter("reservationId");
        String guestName     = req.getParameter("guestName");
        String address       = req.getParameter("address");
        String contactNumber = req.getParameter("contactNumber");
        String roomType      = req.getParameter("roomType");
        String paymentMethod = req.getParameter("paymentMethod");
        LocalDate checkIn    = LocalDate.parse(req.getParameter("checkIn"));
        LocalDate checkOut   = LocalDate.parse(req.getParameter("checkOut"));

        // Basic validation
        if (checkOut.isBefore(checkIn)) {
            req.setAttribute("error", "Check-out date must be after check-in date.");
            req.getRequestDispatcher("/addReservation.jsp").forward(req, resp);
            return;
        }

        // Get price per night for selected room type
        RoomDAO roomDAO = new RoomDAO();
        double pricePerNight = roomDAO.getRoomPrice(roomType);

        // Calculate total bill
        ReservationDAO reservationDAO = new ReservationDAO();
        double totalBill = reservationDAO.calculateBill(checkIn, checkOut, pricePerNight);

        Reservation r = new Reservation();
        r.setReservationId(reservationId);
        r.setGuestName(guestName);
        r.setAddress(address);
        r.setContactNumber(contactNumber);
        r.setRoomType(roomType);
        r.setCheckInDate(checkIn);
        r.setCheckOutDate(checkOut);
        r.setPaymentMethod(paymentMethod);
        r.setTotalBill(totalBill);
        r.setStatus("Active");

        boolean ok;
        if ("update".equals(action)) {
            ok = reservationDAO.updateReservation(r);
        } else { // add
            ok = reservationDAO.addReservation(r);
        }

        if (ok) {
            resp.sendRedirect("dashboard");
        } else {
            req.setAttribute("error", "Could not save reservation. Please try again.");
            req.setAttribute("reservation", r);
            req.getRequestDispatcher("/addReservation.jsp").forward(req, resp);
        }
    }
}
