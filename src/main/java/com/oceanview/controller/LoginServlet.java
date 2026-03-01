package com.oceanview.controller;

import com.oceanview.dao.UserDAO;
import com.oceanview.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password  = req.getParameter("password");
        String role      = req.getParameter("role"); // "admin" or "staff"

        UserDAO dao = new UserDAO();
        User user = dao.getUser(username, password); // ✔ now works

        if (user != null && user.getRole().equals(role)) {
            // Role match – login success
            HttpSession session = req.getSession();
            session.setAttribute("loggedUser", user.getUsername());
            session.setAttribute("userRole",   user.getRole());
            resp.sendRedirect("dashboard");

        } else if (user != null && !user.getRole().equals(role)) {
            // Correct credentials but wrong portal
            req.setAttribute("error",
                "You selected the wrong portal. Please use the correct login.");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);

        } else {
            // Wrong username or password
            req.setAttribute("error", "Invalid username or password.");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }
}
