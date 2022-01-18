/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author gerencia
 */
public class DBConn {

    private final String driver = "com.mysql.cj.jdbc.Driver";
    private final String host = "jdbc:mysql://localhost:3306/";
    
    public Connection getConnection(String database, String userDB, String passwordDB) {
        Connection conn = null;
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(host + database, userDB, passwordDB);
        } catch(ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
         return conn;
    }
}
