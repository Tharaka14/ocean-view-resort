package com.oceanview.controller;

import com.oceanview.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("userRole"))) {
            resp.sendRedirect("dashboard");
            return;
        }

        UserDAO dao = new UserDAO();
        req.setAttribute("staffList", dao.getAllStaff());
        req.getRequestDispatcher("/admin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("userRole"))) {
            resp.sendRedirect("dashboard");
            return;
        }

        String action = req.getParameter("action");
        UserDAO dao = new UserDAO();

        if ("addStaff".equals(action)) {
            String username = req.getParameter("username");
            String password = req.getParameter("password");

            if (dao.usernameExists(username)) {
                req.setAttribute("error", "Username already exists.");
                req.setAttribute("staffList", dao.getAllStaff());
                req.getRequestDispatcher("/admin.jsp").forward(req, resp);
                return;
            }
            dao.addStaff(username, password);

        } else if ("deleteStaff".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            dao.deleteUser(id);
        }

        resp.sendRedirect("admin");
    }
}
