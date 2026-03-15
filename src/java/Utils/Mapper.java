/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import Model.Classroom;
import Model.Level;
import Model.Role;
import Model.User;
import java.sql.*;

/**
 *
 * @author Legion
 */
public class Mapper {

    public static User extractUser(ResultSet rs) throws SQLException {

        Role role = null;

        int roleId = rs.getInt("role_id");
        if (!rs.wasNull()) {
            role = Role.builder()
                    .id((long) roleId)
                    .roleName(rs.getString("role_name"))
                    .build();
        }

        return User.builder()
                .id(rs.getLong("id"))
                .username(rs.getString("username"))
                .passwordHash(rs.getString("password_hash"))
                .fullName(rs.getString("full_name"))
                .dateOfBirth(
                        rs.getDate("date_of_birth") != null
                        ? rs.getDate("date_of_birth").toLocalDate()
                        : null
                )
                .phone(rs.getString("phone"))
                .email(rs.getString("email"))
                .address(rs.getString("address"))
                .role(role)
                .specialization(rs.getString("specialization"))
                .createdAt(
                        rs.getTimestamp("created_at") != null
                        ? rs.getTimestamp("created_at").toLocalDateTime()
                        : null
                )
                .isDeleted(rs.getBoolean("is_deleted"))
                .build();
    }

    public static Level extractLevel(ResultSet rs) throws SQLException {
        return Level.builder()
                .id(rs.getLong("id"))
                .levelName(rs.getString("level_name"))
                .description(rs.getString("description"))
                .createdAt(
                        rs.getTimestamp("created_at") != null
                        ? rs.getTimestamp("created_at").toLocalDateTime()
                        : null
                )
                .updatedAt(
                        rs.getTimestamp("updated_at") != null
                        ? rs.getTimestamp("updated_at").toLocalDateTime()
                        : null
                )
                .isDeleted(rs.getBoolean("is_deleted"))
                .build();
    }

    public static Classroom extractClassroom(ResultSet rs) throws SQLException {

        Level level = null;

        long levelId = rs.getLong("level_id");
        if (!rs.wasNull()) {
            level = Level.builder()
                    .id(levelId)
                    .levelName(rs.getString("level_name"))
                    .build();
        }

        User teacher = null;

        long teacherId = rs.getLong("teacher_id");
        if (!rs.wasNull()) {
            teacher = User.builder()
                    .id(teacherId)
                    .fullName(rs.getString("full_name"))
                    .build();
        }

        return Classroom.builder()
                .id(rs.getLong("id"))
                .className(rs.getString("class_name"))
                .level(level)
                .teacher(teacher)
                .tuitionFee(rs.getBigDecimal("tuition_fee"))
                .maxStudents(rs.getInt("max_students"))
                .startDate(
                        rs.getDate("start_date") != null
                        ? rs.getDate("start_date").toLocalDate()
                        : null
                )
                .endDate(
                        rs.getDate("end_date") != null
                        ? rs.getDate("end_date").toLocalDate()
                        : null
                )
                .createdAt(
                        rs.getTimestamp("created_at") != null
                        ? rs.getTimestamp("created_at").toLocalDateTime()
                        : null
                )
                .isDeleted(rs.getBoolean("is_deleted"))
                .build();
    }

}
