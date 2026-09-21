package com.Foodiee.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    public static Connection getConnection() {

        Connection connection = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            // Get database details from environment variables
            String host = System.getenv("MYSQLHOST");
            String port = System.getenv("MYSQLPORT");
            String database = System.getenv("MYSQLDATABASE");
            String username = System.getenv("MYSQLUSER");
            String password = System.getenv("MYSQLPASSWORD");

            String url;

            // If environment variables are not available,
            // use local MySQL database
            if (host == null || host.isEmpty()) {

                host = "localhost";
                port = "3306";
                database = "foodiee";
                username = "root";

                // Replace this with your LOCAL MySQL password
                password = "YOUR_LOCAL_MYSQL_PASSWORD";

                url = "jdbc:mysql://" + host + ":" + port + "/" + database
                        + "?useSSL=false"
                        + "&allowPublicKeyRetrieval=true"
                        + "&serverTimezone=UTC";

                System.out.println("Using LOCAL MySQL database");

            } else {

                // Aiven / Render cloud database
                url = "jdbc:mysql://" + host + ":" + port + "/" + database
                        + "?sslMode=REQUIRED"
                        + "&serverTimezone=UTC";

                System.out.println("Using CLOUD MySQL database");
            }

            connection = DriverManager.getConnection(
                    url,
                    username,
                    password
            );

            System.out.println("Database connected successfully!");

        } catch (ClassNotFoundException e) {

            System.out.println("MySQL JDBC Driver not found!");
            e.printStackTrace();

        } catch (SQLException e) {

            System.out.println("Database connection failed!");
            e.printStackTrace();
        }

        return connection;
    }
}