package com.Foodiee.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    public static Connection getConnection() {

        Connection connection = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            String host = System.getenv("MYSQLHOST");
            String port = System.getenv("MYSQLPORT");
            String database = System.getenv("MYSQLDATABASE");
            String username = System.getenv("MYSQLUSER");
            String password = System.getenv("MYSQLPASSWORD");

            // Local Eclipse fallback
            if (host == null || host.isEmpty()) {

                host = "localhost";
                port = "3306";
                database = "foodiee";
                username = "root";

                // Put your LOCAL MySQL password here
                password = "YOUR_LOCAL_MYSQL_PASSWORD";

                System.out.println("Using LOCAL MySQL database");

            } else {

                System.out.println("Using RAILWAY MySQL database");
            }

            String url =
                    "jdbc:mysql://" + host + ":" + port + "/" + database
                    + "?useSSL=false"
                    + "&allowPublicKeyRetrieval=true"
                    + "&serverTimezone=UTC";

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