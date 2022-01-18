/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import config.DBConn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import model.Customer;
import model.User;


/**
 *
 * @author gerencia
 */
public class CustomerDAO {
    Connection connec;
    
    public CustomerDAO() {
        DBConn conn = new DBConn();
        connec = conn.getConnection("gestprov", "", ""); //configurar usuario y clave segun el caso
    }
    
    public User getUserByEmail(String email) throws SQLException{
        PreparedStatement ps;
        ResultSet rs;
        User user = null;
        
        ps = connec.prepareStatement("SELECT * FROM user WHERE email = ?");
        ps.setString(1,email);
        rs = ps.executeQuery();
        
        while (rs.next()) {
            user = new User(rs.getInt("idUser"), rs.getInt("idCus"), rs.getTimestamp("dateUser"), email, rs.getString("namesRepre"), rs.getString("celular"), rs.getInt("entry"), rs.getTimestamp("entryTime"),rs.getTimestamp("outTime"));
        }
        
        rs.close();
        ps.close();
        //connec.close();
        return user;
    }
    
    public Customer getCustomerByEmail(String email) throws SQLException {
        PreparedStatement ps;
        ResultSet rs;
        Customer custumer = null;
        String sql = "SELECT * FROM customer "
                   + "LEFT JOIN user "
                   + "ON  idCustomer = idCus "
                   + "WHERE email = ?";
        ps = connec.prepareStatement(sql);
        ps.setString(1, email);
        rs = ps.executeQuery();
        
        while (rs.next()) {
            custumer = new Customer(rs.getInt("idCustomer"), rs.getString("cuitCustomer"), rs.getTimestamp("dateCustomer"), rs.getString("statusCustomer"), rs.getString("typeCustomer"));
        }
        rs.close();
        ps.close();
        //connec.close();
        return custumer;
    }
    
    public boolean validateStatusByEmail(String email) throws SQLException {
        PreparedStatement ps;
        ResultSet rs;
        Boolean isValid = false;
        String sql = "SELECT statusCustomer FROM customer "
                   + "LEFT JOIN user "
                   + "ON  idCustomer = idCus "
                   + "WHERE email = ?";
        ps = connec.prepareStatement(sql);
        ps.setString(1, email);
        rs = ps.executeQuery();
        
        if (rs.next()) {
            isValid = rs.getString("statusCustomer").equals("Activo");
            rs.close();
            ps.close();
            //connec.close();
            return isValid;
        }
        rs.close();
        ps.close();
        //connec.close();
        return isValid;
    }
    
    public boolean login(String email, String password) throws SQLException {
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT email, password FROM user WHERE email=? AND password = ?";
        ps = connec.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, password);
        rs = ps.executeQuery();
        
        if (rs.next()){
            rs.close();
            ps.close();
            //connec.close();
            return true;
        }
        rs.close();
        ps.close();
        //connec.close();
        return false;
    }
        
    public boolean duplicateCustomer(String cuit) throws SQLException {
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT cuitCustomer FROM customer "
                   + "WHERE email = ?";
        ps = connec.prepareStatement(sql);
        ps.setString(1, cuit);
        rs = ps.executeQuery();
        
         if (rs.next()){
            rs.close();
            ps.close();
            //connec.close();
            return true;
        }
        rs.close();
        ps.close();
        //connec.close();
        return false;
    }
    
    public boolean validate(String cuit, String email) throws SQLException {
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT cuitCustomer, email FROM customer "
                   + "FULL JOIN user "
                   + "ON  idCustomer = idCus "
                   + "WHERE email = ? AND cuitCustomer = ?";
        ps = connec.prepareStatement(sql);
        ps.setString(1,email);
        ps.setString(2, cuit);
        rs = ps.executeQuery();
        
         if (rs.next()){
            rs.close();
            ps.close();
            //connec.close();
            return true;
        }
        rs.close();
        ps.close();
        //connec.close();
        return false;
    }
    
    public void createUser(int idCus,Timestamp dateCre, String email, String namesRepre, String celular, String password) throws SQLException{
        PreparedStatement ps;
        String sql = "INSERT INTO user (idCus, dateUser, email, namesRepre, celular, password) VALUES (?,?,?,?,?,?)";
        ps = connec.prepareStatement(sql);
        ps.setInt(1, idCus);
        ps.setTimestamp(2, dateCre);
        ps.setString(3, email);
        ps.setString(4, namesRepre);
        ps.setString(5, celular);
        ps.setString(6, password);
        ps.executeUpdate();
        
        ps.close();
        //connec.close();
    }
    
    public Customer createCustomer(String cuit, Timestamp dateCre) throws SQLException{
        Customer customer = null;
        PreparedStatement ps;
        ResultSet rs;
        
        String sql = "INSERT INTO customer (cuitCustomer, dateCustomer) VALUES (?,?)";
        ps = connec.prepareStatement(sql);
        ps.setString(1, cuit);
        ps.setTimestamp(2, dateCre);
        ps.executeUpdate();
        
        String sql2 = "SELECT * FROM customer WHERE cuitCustomer = ?";
        ps = connec.prepareStatement(sql2);
        ps.setString(1, cuit);
        rs = ps.executeQuery();
        
        while (rs.next()) {
            customer = new Customer(rs.getInt("idCustomer"), rs.getString("cuitCustomer"), rs.getTimestamp("dateCustomer"), rs.getString("statusCustomer"), rs.getString("typeCustomer"));
        }
        
        rs.close();
        ps.close();
        //connec.close();
        return customer;
    }
    
    public String locked(String cuit) throws SQLException {
        PreparedStatement ps;
        ResultSet rs;
        String sql = "UPDATE customer SET statusCustomer = 'Bloqueado'"
                   + "WHERE cuitCustumer = ?"; 
        ps = connec.prepareStatement(sql);
        ps.setString(1, cuit);
        ps.executeUpdate();
        
        ps.close();
        //connec.close();
        return "Usuario bloqueado";
    }
    
    public Boolean repeated(String password, String passwordAgain) {
        return password.equals(passwordAgain);
    }
}