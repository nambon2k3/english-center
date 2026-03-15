/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Level;
import Utils.Mapper;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Legion
 */
public class LevelDAO extends BaseDAO {

    Connection connection;

    public LevelDAO() {
        try {
            connection = getConnection();
        } catch (Exception e) {
            System.out.println("Cannot connect to database: Check username & password");
        }
    }

    public List<Level> getAllLevels() {

        List<Level> levels = new ArrayList<>();

        String sql = """
            SELECT *
            FROM levels
            WHERE is_deleted = 0
            ORDER BY level_name
        """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                levels.add(Mapper.extractLevel(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("[LevelDAO] getAllLevels: Failed with error: " + e.getMessage());
        }

        return levels;
    }
}
