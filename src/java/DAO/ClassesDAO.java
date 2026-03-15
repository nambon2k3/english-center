/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Classroom;
import Utils.Mapper;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Legion
 */
public class ClassesDAO extends BaseDAO {

    Connection connection;

    public ClassesDAO() {
        try {
            connection = getConnection();
        } catch (Exception e) {
            System.out.println("Cannot connect to database: Check username & password");
        }
    }

    public List<Classroom> getClassrooms(String searchContent, int page, int pageSize) {

        List<Classroom> classrooms = new ArrayList<>();

        String sql = """
        SELECT c.*,
               l.level_name,
               u.full_name
        FROM classes c
        LEFT JOIN levels l ON c.level_id = l.id
        LEFT JOIN users u ON c.teacher_id = u.id
        WHERE 1= 1
        AND (
            c.class_name LIKE ?
            OR l.level_name LIKE ?
            OR u.full_name LIKE ?
        )
        ORDER BY c.created_at DESC
        LIMIT ? OFFSET ?
        """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            String keyword = "%" + (searchContent == null ? "" : searchContent) + "%";

            ps.setString(1, keyword);
            ps.setString(2, keyword);
            ps.setString(3, keyword);

            ps.setInt(4, pageSize);
            ps.setInt(5, (page - 1) * pageSize);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                classrooms.add(Mapper.extractClassroom(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[ClassroomDAO] getClassrooms: Failed with error: " + e.getMessage());
        }

        return classrooms;
    }

    public int countClassrooms(String searchContent) {

        String sql = """
        SELECT COUNT(*)
        FROM classes c
        LEFT JOIN levels l ON c.level_id = l.id
        LEFT JOIN users u ON c.teacher_id = u.id
        AND (
            c.class_name LIKE ?
            OR l.level_name LIKE ?
            OR u.full_name LIKE ?
        )
        """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            String keyword = "%" + (searchContent == null ? "" : searchContent.trim()) + "%";

            ps.setString(1, keyword);
            ps.setString(2, keyword);
            ps.setString(3, keyword);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    public boolean addClassroom(Classroom classroom) {

        String sql = """
            INSERT INTO classes
            (class_name, level_id, teacher_id, tuition_fee, max_students,
             start_date, end_date, created_at, is_deleted)
            VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), 0)
            """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, classroom.getClassName());
            ps.setLong(2, classroom.getLevel().getId());
            ps.setLong(3, classroom.getTeacher().getId());
            ps.setBigDecimal(4, classroom.getTuitionFee());
            ps.setInt(5, classroom.getMaxStudents());

            ps.setDate(6,
                    classroom.getStartDate() != null
                    ? Date.valueOf(classroom.getStartDate())
                    : null
            );

            ps.setDate(7,
                    classroom.getEndDate() != null
                    ? Date.valueOf(classroom.getEndDate())
                    : null
            );

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[ClassroomDAO] addClassroom: Failed with error: " + e.getMessage());
        }

        return false;
    }

    public boolean updateClassroom(Classroom classroom) {

        String sql = """
            UPDATE classes
            SET class_name = ?,
                level_id = ?,
                teacher_id = ?,
                tuition_fee = ?,
                max_students = ?,
                start_date = ?,
                end_date = ?,
                updated_at = NOW()
            WHERE id = ?
        """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, classroom.getClassName());
            ps.setLong(2, classroom.getLevel().getId());
            ps.setLong(3, classroom.getTeacher().getId());
            ps.setBigDecimal(4, classroom.getTuitionFee());
            ps.setInt(5, classroom.getMaxStudents());

            ps.setDate(6,
                    classroom.getStartDate() != null
                    ? Date.valueOf(classroom.getStartDate())
                    : null
            );

            ps.setDate(7,
                    classroom.getEndDate() != null
                    ? Date.valueOf(classroom.getEndDate())
                    : null
            );

            ps.setLong(8, classroom.getId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[ClassroomDAO] updateClassroom: Failed with error: " + e.getMessage());
        }

        return false;
    }

    public boolean deleteClassroom(long id) {
        String sql = """
            UPDATE classes
            SET is_deleted = !is_deleted,
                updated_at = NOW()
            WHERE id = ?
            """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setLong(1, id);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[ClassroomDAO] deleteClassroom: Failed with error: " + e.getMessage());
        }

        return false;
    }

    public Classroom getClassroomById(long id) {

        String sql = """
        SELECT c.*,
               l.level_name,
               u.full_name
        FROM classes c
        LEFT JOIN levels l ON c.level_id = l.id
        LEFT JOIN users u ON c.teacher_id = u.id
        WHERE c.id = ?
        LIMIT 1
        """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setLong(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return Mapper.extractClassroom(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[ClassroomDAO] getClassroomById: Failed with error: " + e.getMessage());
        }

        return null;
    }

}
