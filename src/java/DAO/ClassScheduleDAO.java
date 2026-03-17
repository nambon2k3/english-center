/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.ClassSchedule;
import java.sql.*;
import Utils.Mapper;
import java.sql.*;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Legion
 */
public class ClassScheduleDAO extends BaseDAO {

    Connection connection;

    public ClassScheduleDAO() {
        try {
            connection = getConnection();
        } catch (Exception e) {
            System.out.println("Cannot connect to database: Check username & password");
        }
    }

    public List<ClassSchedule> getSchedulesByClassId(Long classId) {
        List<ClassSchedule> list = new ArrayList<>();

        String sql = """
        SELECT *
        FROM class_schedules
        WHERE class_id = ? AND is_deleted = 0
        ORDER BY day_of_week, start_time
    """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setLong(1, classId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Mapper.extractClassSchedule(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean updateSchedule(Long scheduleId, LocalTime startTime, LocalTime endTime) {

        String sql = """
        UPDATE class_schedules
        SET start_time = ?, 
            end_time = ?
        WHERE id = ?
    """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setTime(1, startTime != null ? java.sql.Time.valueOf(startTime) : null);
            ps.setTime(2, endTime != null ? java.sql.Time.valueOf(endTime) : null);
            ps.setLong(3, scheduleId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean deleteSchedule(Long scheduleId, Long classId) {

        String sql = """
        UPDATE class_schedules
        SET is_deleted = 1, updated_at = NOW()
        WHERE id = ? AND class_id = ?
    """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setLong(1, scheduleId);
            ps.setLong(2, classId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean addSchedule(Long classId, int dayOfWeek, LocalTime startTime, LocalTime endTime) {

        String sql = """
        INSERT INTO class_schedules
        (class_id, day_of_week, start_time, end_time, created_at, updated_at, is_deleted)
        VALUES (?, ?, ?, ?, NOW(), NOW(), FALSE)
    """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setLong(1, classId);
            ps.setInt(2, dayOfWeek);
            ps.setTime(3, Time.valueOf(startTime));
            ps.setTime(4, Time.valueOf(endTime));

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

}
