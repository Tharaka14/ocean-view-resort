package com.oceanview.controller;
import com.oceanview.dao.ReservationDAO;
import com.oceanview.model.Reservation;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            resp.sendRedirect("login");
            return;
        }
        ReservationDAO dao = new ReservationDAO();
        List<Reservation> reservations = dao.getAllReservations();
        req.setAttribute("reservations", reservations);
        req.getRequestDispatcher("/dashboard.jsp").forward(req, resp);
    }
}
