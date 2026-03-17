/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Enrollment;
import Utils.Mapper;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Legion
 */
public class EnrollmentDAO extends BaseDAO {

    Connection connection;

    public EnrollmentDAO() {
        try {
            connection = getConnection();
        } catch (Exception e) {
            System.out.println("Cannot connect to database: Check username & password");
        }
    }

    public List<Enrollment> getEnrollmentsByClassId(Long classId, int page, int pageSize) {
        List<Enrollment> list = new ArrayList<>();

        String sql = """
            SELECT 
                e.*,
                u.id AS student_id,
                u.full_name AS fullname,
                u.email AS email,
                u.phone AS phone,
                u.date_of_birth
            FROM enrollments e
            JOIN users u ON e.student_id = u.id
            WHERE e.class_id = ? AND e.is_deleted = FALSE
            ORDER BY e.updated_at DESC
            LIMIT ? OFFSET ?
        """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            int offset = (page - 1) * pageSize;

            ps.setLong(1, classId);
            ps.setInt(2, pageSize);
            ps.setInt(3, offset);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Mapper.extractEnrollment(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean addStudentToClass(Long studentId, Long classId) {

        String sql = """
            INSERT INTO enrollments 
            (student_id, class_id, enrolled_at, status, paid, created_at, updated_at, is_deleted)
            VALUES (?, ?, NOW(), ?, ?, NOW(), NOW(), FALSE)
        """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setLong(1, studentId);
            ps.setLong(2, classId);
            ps.setString(3, "ACTIVE"); // or EnrollmentStatus.ACTIVE.name()
            ps.setInt(4, 0); // default unpaid

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean updateEnrollmentStatus(Long studentId, Long classId, String status) {

        String sql = """
        UPDATE enrollments
        SET status = ?, updated_at = NOW()
        WHERE student_id = ? AND class_id = ? AND is_deleted = FALSE
    """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, status); // "ACTIVE" or "DROPPED"
            ps.setLong(2, studentId);
            ps.setLong(3, classId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    

    public boolean updatePaid(Long studentId, Long classId, int paid) {

        String sql = """
        UPDATE enrollments
        SET paid = ?, updated_at = NOW()
        WHERE student_id = ? AND class_id = ? AND is_deleted = FALSE
    """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, paid);
            ps.setLong(2, studentId);
            ps.setLong(3, classId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public int countEnrollmentsByClassId(Long classId) {
        String sql = """
            SELECT COUNT(*) 
            FROM enrollments 
            WHERE class_id = ?
        """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setLong(1, classId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
}
