package com.oceanview.dao;

import com.oceanview.model.Room;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class RoomDAO {

    private Connection getConnection() throws SQLException {
        return DBConnection.getConnection();
    }

    // Get all rooms
    public List<Room> getAllRooms() {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT * FROM rooms";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Room room = new Room();
                room.setRoomId(rs.getInt("room_id"));
                room.setRoomType(rs.getString("room_type"));
                room.setPricePerNight(rs.getDouble("price_per_night"));
                room.setRoomCount(rs.getInt("room_count"));
                rooms.add(room);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }

    // Get room by ID
    public Room getRoomById(int roomId) {
        Room room = null;
        String sql = "SELECT * FROM rooms WHERE room_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, roomId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    room = new Room();
                    room.setRoomId(rs.getInt("room_id"));
                    room.setRoomType(rs.getString("room_type"));
                    room.setPricePerNight(rs.getDouble("price_per_night"));
                    room.setRoomCount(rs.getInt("room_count"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return room;
    }

    // Create room
    public boolean addRoom(Room room) {
        String sql = "INSERT INTO rooms (room_type, price_per_night, room_count) " +
                     "VALUES (?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, room.getRoomType());
            ps.setDouble(2, room.getPricePerNight());
            ps.setInt(3, room.getRoomCount());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Update room
    public boolean updateRoom(Room room) {
        String sql = "UPDATE rooms SET room_type = ?, price_per_night = ?, room_count = ? " +
                     "WHERE room_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, room.getRoomType());
            ps.setDouble(2, room.getPricePerNight());
            ps.setInt(3, room.getRoomCount());
            ps.setInt(4, room.getRoomId());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete room
    public boolean deleteRoom(int roomId) {
        String sql = "DELETE FROM rooms WHERE room_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, roomId);
            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get price_per_night for given room type
    public double getRoomPrice(String roomType) {
        String sql = "SELECT price_per_night FROM rooms WHERE room_type = ?";
        double price = 0.0;

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, roomType);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    price = rs.getDouble("price_per_night");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return price;
    }

    // Availability check
    public int getAvailableRooms(String roomType, LocalDate checkIn, LocalDate checkOut) {
        String sqlTotal = "SELECT room_count FROM rooms WHERE room_type = ?";
        String sqlBooked =
                "SELECT COUNT(*) AS booked " +
                "FROM reservations " +
                "WHERE room_type = ? " +
                "AND NOT (check_out_date <= ? OR check_in_date >= ?)";

        try (Connection conn = getConnection()) {

            int total = 0;
            try (PreparedStatement psTotal = conn.prepareStatement(sqlTotal)) {
                psTotal.setString(1, roomType);
                try (ResultSet rs = psTotal.executeQuery()) {
                    if (rs.next()) {
                        total = rs.getInt("room_count");
                    }
                }
            }

            int booked = 0;
            try (PreparedStatement psBooked = conn.prepareStatement(sqlBooked)) {
                psBooked.setString(1, roomType);
                psBooked.setDate(2, Date.valueOf(checkIn));
                psBooked.setDate(3, Date.valueOf(checkOut));
                try (ResultSet rs = psBooked.executeQuery()) {
                    if (rs.next()) {
                        booked = rs.getInt("booked");
                    }
                }
            }

            return Math.max(total - booked, 0);

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }
}
