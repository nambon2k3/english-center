/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author Legion
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseDAO {

    // Configuration for MySQL connection
    private final String serverName = "localhost";
    private final String dbName = "englishcenter";
    private final String portNumber = "3306";
    private final String userID = "root"; 
    private final String password = "root";

    // Method to establish a database connection
    public Connection getConnection() {
        Connection conn = null;
        String url = "jdbc:mysql://" + serverName + ":" + portNumber + "/" + dbName + "?allowPublicKeyRetrieval=true&useSSL=true&serverTimezone=Asia/Ho_Chi_Minh";

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish the connection
            conn = DriverManager.getConnection(url, userID, password);
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Failed to establish a connection to the MySQL database.");
            e.printStackTrace();
        }

        return conn;
    }
}
