package com.oceanview.dao;

import com.oceanview.model.Reservation;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {

    // Add new reservation
    public boolean addReservation(Reservation r) {
        String sql = "INSERT INTO reservations " +
                "(reservation_id, guest_name, address, contact_number, room_type, " +
                "check_in_date, check_out_date, total_bill, payment_method, status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, r.getReservationId());
            ps.setString(2, r.getGuestName());
            ps.setString(3, r.getAddress());
            ps.setString(4, r.getContactNumber());
            ps.setString(5, r.getRoomType());
            ps.setDate(6, Date.valueOf(r.getCheckInDate()));
            ps.setDate(7, Date.valueOf(r.getCheckOutDate()));
            ps.setDouble(8, r.getTotalBill());
            ps.setString(9, r.getPaymentMethod());
            ps.setString(10, r.getStatus());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Update existing reservation
    public boolean updateReservation(Reservation r) {
        String sql = "UPDATE reservations SET " +
                "guest_name = ?, address = ?, contact_number = ?, room_type = ?, " +
                "check_in_date = ?, check_out_date = ?, total_bill = ?, " +
                "payment_method = ?, status = ? " +
                "WHERE reservation_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, r.getGuestName());
            ps.setString(2, r.getAddress());
            ps.setString(3, r.getContactNumber());
            ps.setString(4, r.getRoomType());
            ps.setDate(5, Date.valueOf(r.getCheckInDate()));
            ps.setDate(6, Date.valueOf(r.getCheckOutDate()));
            ps.setDouble(7, r.getTotalBill());
            ps.setString(8, r.getPaymentMethod());
            ps.setString(9, r.getStatus());
            ps.setString(10, r.getReservationId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete reservation
    public boolean deleteReservation(String reservationId) {
        String sql = "DELETE FROM reservations WHERE reservation_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, reservationId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get single reservation
    public Reservation getReservation(String reservationId) {
        String sql = "SELECT * FROM reservations WHERE reservation_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, reservationId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapRow(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get all reservations
    public List<Reservation> getAllReservations() {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM reservations ORDER BY created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Helper to convert ResultSet row → Reservation object
    private Reservation mapRow(ResultSet rs) throws SQLException {
        Reservation r = new Reservation();
        r.setReservationId(rs.getString("reservation_id"));
        r.setGuestName(rs.getString("guest_name"));
        r.setAddress(rs.getString("address"));
        r.setContactNumber(rs.getString("contact_number"));
        r.setRoomType(rs.getString("room_type"));

        Date in = rs.getDate("check_in_date");
        Date out = rs.getDate("check_out_date");
        if (in != null)  r.setCheckInDate(in.toLocalDate());
        if (out != null) r.setCheckOutDate(out.toLocalDate());

        r.setTotalBill(rs.getDouble("total_bill"));
        r.setPaymentMethod(rs.getString("payment_method"));
        r.setStatus(rs.getString("status"));
        return r;
    }

    // Utility: calculate bill (nights * pricePerNight)
    public double calculateBill(LocalDate checkIn, LocalDate checkOut, double pricePerNight) {
        long nights = java.time.temporal.ChronoUnit.DAYS.between(checkIn, checkOut);
        if (nights < 0) nights = 0;
        return nights * pricePerNight;
    }
}
