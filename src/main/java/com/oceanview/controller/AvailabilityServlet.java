package com.oceanview.controller;

import com.oceanview.dao.RoomDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/availability")
public class AvailabilityServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            resp.sendRedirect("login");
            return;
        }

        req.getRequestDispatcher("/availability.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            resp.sendRedirect("login");
            return;
        }

        String roomType = req.getParameter("roomType");
        LocalDate checkIn  = LocalDate.parse(req.getParameter("checkIn"));
        LocalDate checkOut = LocalDate.parse(req.getParameter("checkOut"));

        RoomDAO dao = new RoomDAO();
        int available = dao.getAvailableRooms(roomType, checkIn, checkOut);

        req.setAttribute("roomType", roomType);
        req.setAttribute("checkIn", checkIn);
        req.setAttribute("checkOut", checkOut);
        req.setAttribute("available", available);

        req.getRequestDispatcher("/availability.jsp").forward(req, resp);
    }
}
