/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.DashboardData;
import Model.RevenueMonth;
import Model.User;
import Utils.Mapper;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Legion
 */
public class AdminDAO extends BaseDAO {

    Connection connection;

    public AdminDAO() {
        try {
            connection = getConnection();
        } catch (Exception e) {
            System.out.println("Cannot connect to database: Check username & password");
        }
    }

    public void getCountUsersByRole(DashboardData dashboardData) {

        String sql = """
            select u.role_id, count(*) as nums
            from users u
            where u.role_id in (3,2)
            group by u.role_id
            order by u.role_id;
        """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                dashboardData.setNumTeachers(rs.getInt("nums"));
            }

            if (rs.next()) {
                dashboardData.setNumStudents(rs.getInt("nums"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[UserDAO] login: Failed to login with error: " + e.getMessage());
        }

    }

    public void getRevenue(DashboardData dashboardData) {

        String sql = """
            select sum(c.tuition_fee) as nums
            from enrollments e
            join classes c on e.class_id = c.id
            where e.paid = 1
        """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                dashboardData.setRevenue(rs.getLong("nums"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[UserDAO] login: Failed to login with error: " + e.getMessage());
        }

    }

    public void getNumClasses(DashboardData dashboardData) {

        String sql = """
            select count(*) as nums
            from classes c
            where c.is_deleted = 0
        """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                dashboardData.setClasses(rs.getInt("nums"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[UserDAO] login: Failed to login with error: " + e.getMessage());
        }

    }

    public List<RevenueMonth> getRevenueData() {
        List<RevenueMonth> list = new ArrayList<>();

        String sql = """
        WITH RECURSIVE months AS (
            SELECT DATE_FORMAT(CURRENT_DATE, '%Y-01-01') AS month_date
            UNION ALL
            SELECT month_date + INTERVAL 1 MONTH
            FROM months
            WHERE month_date < DATE_FORMAT(CURRENT_DATE, '%Y-12-01')
        )
        
        SELECT 
            m.month_date, 
            DATE_FORMAT(m.month_date, '%M') AS revenue_month, 
            COALESCE(SUM(c.tuition_fee), 0) AS revenue
        FROM months m
        LEFT JOIN enrollments e 
            ON DATE_FORMAT(e.created_at, '%Y-%m') = DATE_FORMAT(m.month_date, '%Y-%m') 
            AND e.paid = 1
        LEFT JOIN classes c 
            ON e.class_id = c.id
        GROUP BY m.month_date, revenue_month
        ORDER BY m.month_date;
    """;

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                RevenueMonth rm = new RevenueMonth();

                // Convert SQL Date -> LocalDate
                Date sqlDate = rs.getDate("month_date");
                if (sqlDate != null) {
                    rm.setDate(sqlDate.toLocalDate());
                }

                rm.setRevenue(rs.getLong("revenue"));

                list.add(rm);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

}
