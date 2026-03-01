package com.oceanview.controller;
import com.oceanview.dao.ReservationDAO;
import com.oceanview.model.Reservation;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/bill")
public class BillServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            resp.sendRedirect("login");
            return;
        }
        String id = req.getParameter("id");
        ReservationDAO dao = new ReservationDAO();
        Reservation r = dao.getReservation(id);
        req.setAttribute("reservation", r);
        req.getRequestDispatcher("/bill.jsp").forward(req, resp);
    }
}
