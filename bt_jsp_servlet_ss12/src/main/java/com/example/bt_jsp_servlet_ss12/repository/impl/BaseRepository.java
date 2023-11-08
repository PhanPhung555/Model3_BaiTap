package com.example.bt_jsp_servlet_ss12.repository.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepository {
    private static final String JDBCURL = "jdbc:mysql://localhost:3306/demo_ss3";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Phung@2004";
    private static Connection connection;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(JDBCURL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    private BaseRepository() {

    }

    public static Connection getConnectionJavaToDB() {
        return connection;
    }
}
