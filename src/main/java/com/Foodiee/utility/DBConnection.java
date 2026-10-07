package com.Foodiee.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    public static Connection getConnection() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Render will provide these environment variables
            String url = System.getenv("DB_URL");
            String username = System.getenv("DB_USERNAME");
            String password = System.getenv("DB_PASSWORD");

            // If environment variables are not available,
            // use local Eclipse/Tomcat MySQL settings
            if (url == null || url.trim().isEmpty()) {
                url = "jdbc:mysql://localhost:3306/food_delivery";
            }

            if (username == null || username.trim().isEmpty()) {
                username = "root";
            }

            if (password == null || password.trim().isEmpty()) {
                password = "root";
            }

            Connection connection = DriverManager.getConnection(
                    url,
                    username,
                    password
            );

            System.out.println("Database connected successfully");
            System.out.println(
                    "Connected database: " + connection.getCatalog()
            );

            return connection;

        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not found");
            e.printStackTrace();

        } catch (SQLException e) {
            System.out.println("Database connection failed");
            e.printStackTrace();
        }

        return null;
    }
}