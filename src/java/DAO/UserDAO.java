/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author Legion
 */
import Model.Role;
import Model.User;
import Utils.Mapper;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends BaseDAO {

    Connection connection;

    public UserDAO() {
        try {
            connection = getConnection();
        } catch (Exception e) {
            System.out.println("Cannot connect to database: Check username & password");
        }
    }

    public User login(String username, String passwordHash) {

        String sql = """
            SELECT u.*, r.id AS role_id, r.role_name
            FROM users u
            LEFT JOIN roles r ON u.role_id = r.id
            WHERE u.username = ?
            AND u.password_hash = ?
            AND u.is_deleted = 0
            LIMIT 1
            """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, passwordHash);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return Mapper.extractUser(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[UserDAO] login: Failed to login with error: " + e.getMessage());
        }

        return null;
    }
    
    public User getUserByUsername(String username) {

        String sql = """
            SELECT u.*, r.id AS role_id, r.role_name
            FROM users u
            LEFT JOIN roles r ON u.role_id = r.id
            WHERE u.username = ?
            AND u.is_deleted = 0
            LIMIT 1
            """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return Mapper.extractUser(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[UserDAO] login: Failed to login with error: " + e.getMessage());
        }

        return null;
    }

    public List<User> getUsersByRoleId(int roleId, String searchContent, int page, int pageSize) {

        StringBuilder sql = new StringBuilder("""
            SELECT u.*, r.id AS role_id, r.role_name
            FROM users u
            LEFT JOIN roles r ON u.role_id = r.id
            WHERE u.role_id = ?
        """);

        List<Object> params = new ArrayList<>();
        params.add(roleId);

        if (searchContent != null && !searchContent.isBlank()) {
            sql.append(" AND (u.full_name LIKE ? OR u.phone LIKE ?) ");
            params.add("%" + searchContent.trim() + "%");
            params.add("%" + searchContent.trim() + "%");
        }

        sql.append(" ORDER BY u.updated_at DESC LIMIT ? OFFSET ? ");

        int offset = (page - 1) * pageSize;

        params.add(pageSize);
        params.add(offset);

        List<User> users = new ArrayList<>();

        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                users.add(Mapper.extractUser(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[UserDAO] getUsersByRoleId: Failed with error: " + e.getMessage());
        }

        return users;
    }

    public List<User> getUsersByRoleId(int roleId, String searchContent, int page, int pageSize, Long classID) {

        StringBuilder sql = new StringBuilder("""
            SELECT u.*, r.id AS role_id, r.role_name
            FROM users u
            LEFT JOIN roles r ON u.role_id = r.id
            WHERE u.role_id = ? AND NOT EXISTS (
                SELECT 1 
                FROM enrollments e 
                WHERE e.student_id = u.id 
                  AND e.class_id = ?
                  AND e.is_deleted = FALSE
            )
        """);

        List<Object> params = new ArrayList<>();
        params.add(roleId);
        params.add(classID);

        if (searchContent != null && !searchContent.isBlank()) {
            sql.append(" AND (u.full_name LIKE ? OR u.phone LIKE ?) ");
            params.add("%" + searchContent.trim() + "%");
            params.add("%" + searchContent.trim() + "%");
        }


        List<User> users = new ArrayList<>();

        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                users.add(Mapper.extractUser(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[UserDAO] getUsersByRoleId: Failed with error: " + e.getMessage());
        }

        return users;
    }

    public List<User> getUsersByRoleId(int roleId) {

        String sql = """
                         SELECT u.*, r.id AS role_id, r.role_name
                         FROM users u
                         LEFT JOIN roles r ON u.role_id = r.id
                         WHERE u.role_id = ?
                         AND u.is_deleted = 0
                     """;

        List<Object> params = new ArrayList<>();
        params.add(roleId);

        List<User> users = new ArrayList<>();

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                users.add(Mapper.extractUser(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[UserDAO] getUsersByRoleId: Failed with error: " + e.getMessage());
        }

        return users;
    }

    public int countStudents(int roleId, String searchContent, Long classID) {

        StringBuilder sql = new StringBuilder("""
            SELECT COUNT(*)
            FROM users u
            JOIN enrollments e ON e.student_id = u.id
            WHERE e.class_id = ?
            WHERE role_id = ?
        """);

        List<Object> params = new ArrayList<>();
        params.add(classID);
        params.add(roleId);

        if (searchContent != null && !searchContent.isBlank()) {
            sql.append(" AND (u.full_name LIKE ? OR u.phone LIKE ?) ");
            params.add("%" + searchContent.trim() + "%");
            params.add("%" + searchContent.trim() + "%");
        }

        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[UserDAO] countStudents: Failed with error: " + e.getMessage());
        }

        return 0;
    }
    
    public int countStudents(int roleId, String searchContent) {

        StringBuilder sql = new StringBuilder("""
            SELECT COUNT(*)
            FROM users u
            WHERE role_id = ? 
        """);

        List<Object> params = new ArrayList<>();
        params.add(roleId);

        if (searchContent != null && !searchContent.isBlank()) {
            sql.append(" AND (u.full_name LIKE ? OR u.phone LIKE ?) ");
            params.add("%" + searchContent.trim() + "%");
            params.add("%" + searchContent.trim() + "%");
        }

        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[UserDAO] countStudents: Failed with error: " + e.getMessage());
        }

        return 0;
    }

    public boolean addUser(User user) {

        String sql = """
            INSERT INTO users 
            (username, password_hash, full_name, date_of_birth, phone, email, address, role_id, created_at, is_deleted, specialization)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 0, ?)
        """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPasswordHash());
            ps.setString(3, user.getFullName());
            ps.setObject(4, user.getDateOfBirth());
            ps.setString(5, user.getPhone());
            ps.setString(6, user.getEmail());
            ps.setString(7, user.getAddress());
            ps.setLong(8, user.getRole().getId());
            ps.setObject(9, LocalDateTime.now());
            ps.setString(10, user.getSpecialization());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[UserDAO] addUser error: " + e.getMessage());
        }

        return false;
    }

    public boolean updateUser(User user) {

        String sql = """
            UPDATE users
            SET full_name = ?,
                date_of_birth = ?,
                phone = ?,
                email = ?,
                address = ?,
                role_id = ?,
                specialization = ?,
                updated_at = ?,
                username = ?,
                password_hash= ?            
                WHERE id = ?
        """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, user.getFullName());
            ps.setObject(2, user.getDateOfBirth());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getAddress());
            ps.setLong(6, user.getRole().getId());
            ps.setString(7, user.getSpecialization());
            ps.setObject(8, LocalDateTime.now());
            ps.setString(9, user.getUsername());
            ps.setString(10, user.getPasswordHash());
            ps.setLong(11, user.getId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[UserDAO] updateUser error: " + e.getMessage());
        }

        return false;
    }

    public boolean deleteUser(long id) {

        String sql = """
            UPDATE users
            SET is_deleted = !is_deleted,
                updated_at = ?
            WHERE id = ?
        """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setObject(1, LocalDateTime.now());
            ps.setLong(2, id);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[UserDAO] deleteUser error: " + e.getMessage());
        }

        return false;
    }

    public User getUserByEmailOrUsername(String email, String username) {

        String sql = """
        SELECT *
        FROM users
        WHERE email = ? or username = ?
        AND is_deleted = 0
    """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, username);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Role role = new Role();
                role.setId(rs.getLong("role_id"));

                return User.builder()
                        .id(rs.getLong("id"))
                        .username(rs.getString("username"))
                        .passwordHash(rs.getString("password_hash"))
                        .fullName(rs.getString("full_name"))
                        .dateOfBirth(rs.getObject("date_of_birth", LocalDate.class))
                        .phone(rs.getString("phone"))
                        .email(rs.getString("email"))
                        .address(rs.getString("address"))
                        .specialization(rs.getString("specialization"))
                        .createdAt(rs.getObject("created_at", LocalDateTime.class))
                        .updatedAt(rs.getObject("updated_at", LocalDateTime.class))
                        .isDeleted(rs.getBoolean("is_deleted"))
                        .role(role)
                        .build();
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[UserDAO] getUserByEmail error: " + e.getMessage());
        }

        return null;
    }

}
