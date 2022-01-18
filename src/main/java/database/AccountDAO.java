/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import config.DBConn;
import java.sql.Array;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import model.Customer;
import model.Information;
import model.Invoices;
import model.JsonPosts;
import org.json.JSONObject;

/**
 *
 * @author gerencia
 */
public class AccountDAO {
    Connection connec;
    
    long datetime = System.currentTimeMillis();
    Date dateToday = new Date(datetime);
    
    SimpleDateFormat formatYaD = new SimpleDateFormat("yyyy/MM/dd");
    SimpleDateFormat formatDaY = new SimpleDateFormat("dd/MM/yyyy");
    
    public AccountDAO() {
        DBConn conn = new DBConn();
        connec = conn.getConnection("gestprov", "", ""); //configurar usuario y clave segun el caso
    }
    
    public Information getInformationByEmail(String email) throws SQLException{
        PreparedStatement ps;
        ResultSet rs;
        Information information = null;
        
        ps = connec.prepareStatement("SELECT * FROM information inf "
                                    + "INNER JOIN customer cus "
                                    + "ON cus.idCustomer = inf.idCus "
                                    + "INNER JOIN user us "
                                    + "ON cus.idCustomer = us.idCus "
                                    +"WHERE us.email = ?");
        ps.setString(1,email);
        rs = ps.executeQuery();
        
        if (rs.next()) {
            int idInf = rs.getInt("idInf");
            int idCus = rs.getInt("idCus");
            String namesCust = rs.getString("namesCust");
            String companyName = rs.getString("companyName");
            String phone = rs.getString("phone");
            String direction = rs.getString("direction");
            String postalCode = rs.getString("postalCode");
            String city = rs.getString("city");
            String country = rs.getString("country");
            String statusIVA = rs.getString("statusIVA");
            String statusIncome = rs.getString("statusIncome");
            String typeActivity = rs.getString("typeActivity");
            
            Date dateStart = rs.getDate("dateStart");
//            String dateStartStr = String.format("%1$tY-%1$tm-%1$td", dateStartDate);
//            Date dateStart = formatDaY.parse(dateStartStr);
//            Timestamp dateTimestamp = new Timestamp(dateStartDate.getTime());
//            String dateStartStr = dateStartDate.toString(); dateStartDate.
//            
//            Date dateStart = formatDaY.parse(dateStartStr);
            
            String descriptionActivity = rs.getString("descriptionActivity");
            
            information = new Information(idInf, idCus, namesCust, companyName, phone, direction, postalCode, city, country, statusIVA, statusIncome, typeActivity, dateStart, descriptionActivity);
        }
        rs.close();
        ps.close();
        //connec.close();
        return information;
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
    
    public Invoices getInvoiceByOperationNum(String operationNum) throws SQLException{
        PreparedStatement ps;
        ResultSet rs;
        Invoices invoice = null;
        
        ps = connec.prepareStatement("SELECT * FROM invoices "
                                    +"WHERE operationNum = ?");
        ps.setString(1,operationNum);
        rs = ps.executeQuery();
        
        if (rs.next()) {
            int idInvoice = rs.getInt("idInvoice");
            String fromInvoice = rs.getString("fromInvoice");
            String toInvoice = rs.getString("toInvoice");
            String invoiceNum = rs.getString("invoiceNum");
            Long payTotal = rs.getLong("payTotal");
            Date dateIssue = rs.getDate("dateIssue");
            Date dateExpire = rs.getDate("dateExpire");
            String statusInvoice = rs.getString("statusInvoice");
            
            invoice = new Invoices(idInvoice,fromInvoice,toInvoice,operationNum,invoiceNum,payTotal,dateIssue,dateExpire,statusInvoice);
        }
        rs.close();
        ps.close();
        //connec.close();
        return invoice;    
    }
    
    public boolean updateInformation(String cuit, String phone, String direction, String postalCode, String city, String country, String typeCustomer) throws SQLException{
        PreparedStatement ps;
        
        boolean result = true;
        
        ps = connec.prepareStatement("UPDATE information inf "
                                    + "INNER JOIN customer cus "
                                    + "ON cus.idCustomer = inf.idCus "
                                    + "SET inf.phone = ?, inf.direction = ?, inf.postalCode = ?, inf.city = ?, inf.country = ?, cus.typeCustomer = ? "
                                    +"WHERE cus.cuitCustomer = ?");
        ps.setString(1,phone);
        ps.setString(2, direction);
        ps.setString(3, postalCode);
        ps.setString(4,city);
        ps.setString(5, country);
        ps.setString(6, typeCustomer);
        ps.setString(7, cuit);
        ps.executeUpdate();
        
        
        ps.close();
        //connec.close();
        return result;
    }
    
    public boolean updateInforAdditional(String cuit, String statusIVA, String statusIncome, String typeActivity, Date dateStart, String descriptionActivity) throws SQLException{
        PreparedStatement ps;
        
        boolean result = true;

        ps = connec.prepareStatement("UPDATE information inf "
                                    + "INNER JOIN customer cus "
                                    + "ON cus.idCustomer = inf.idCus "
                                    + "SET inf.statusIVA = ?, inf.statusIncome = ?, inf.typeActivity = ?, inf.dateStart = ?, inf.descriptionActivity = ? "
                                    +"WHERE cus.cuitCustomer = ?");
        ps.setString(1, statusIVA);
        ps.setString(2, statusIncome);
        ps.setString(3, typeActivity);
        ps.setDate(4, dateStart);
        ps.setString(5, descriptionActivity);
        ps.setString(6, cuit);
        ps.executeUpdate();
        
        ps.close();
        //connec.close();
        return result;
    }
    
    public List<Invoices> getToInvoices(String cuit) throws SQLException {
        PreparedStatement ps;
        ResultSet rs;
        List<Invoices> toInvoicesDB = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-mm-yyyy");
        ps = connec.prepareStatement("SELECT * FROM invoices "
                                    +"WHERE fromInvoice = ?");
        ps.setString(1,cuit);
        rs = ps.executeQuery();
        
        while(rs.next()){
            toInvoicesDB.add(new Invoices(rs.getInt("idInvoice"), rs.getString("toInvoice"), rs.getString("operationNum"), rs.getString("invoiceNum"), rs.getLong("payTotal"), rs.getDate("dateExpire"), rs.getString("statusInvoice")));
        }
        rs.close();
        ps.close();
        //connec.close();
        return toInvoicesDB;
    }
    
    public List<Invoices> getFromInvoices(String cuit) throws SQLException {
        PreparedStatement ps;
        ResultSet rs;
        List<Invoices> fromInvoicesDB = new ArrayList<>();
        
        ps = connec.prepareStatement("SELECT * FROM invoices "
                                    +"WHERE toInvoice = ?");
        ps.setString(1,cuit);
        rs = ps.executeQuery();
        
        while(rs.next()){
            fromInvoicesDB.add(new Invoices(rs.getInt("idInvoice"), rs.getString("fromInvoice"), rs.getString("operationNum"), rs.getString("invoiceNum"), rs.getLong("payTotal"), rs.getDate("dateExpire"), rs.getString("statusInvoice")));
        }
        rs.close();
        ps.close();
        //connec.close();
        return fromInvoicesDB;
    }
    
    public String statusCal (Date dateExpire) {
        if (!dateExpire.after(dateToday)){
            String statusCal = "Vencida";
            return statusCal;
        } else {
            String statusCal = "Vigente";
            return statusCal;
        }
    }
    
    public boolean delInvoices(String invoiceNum) throws SQLException {
        PreparedStatement ps;
        
        boolean result = true;
        
        ps = connec.prepareStatement("DELETE FROM invoices "
                                    +"WHERE invoiceNum = ?");
        ps.setString(1,invoiceNum);
        ps.executeUpdate();
        
        ps.close();
        //connec.close();
        return result;
    }
    
    public boolean sendPosts(int idInvoice, String from, Timestamp dateSend, String subject, int selectPosts, String textPosts) throws SQLException {
        PreparedStatement ps;
        JsonPosts JsonPosts = new JsonPosts();
        
        boolean result = true;
        
        ps = connec.prepareStatement("INSERT INTO posts (idInvoice,counterPosts,from,dateSend,subject,selectPosts,textPosts,historyPosts) VALUES (?,?,?,?,?,?,?,?)");
        ps.setInt(1, idInvoice);
        ps.setInt(2, 0);
        ps.setString(3, from);
        ps.setTimestamp(4, dateSend);
        ps.setString(5, subject);
        ps.setInt(6, selectPosts);
        ps.setString(7, textPosts);
        
        String counterPostsStr = "0";
        JSONObject posts = JsonPosts.posts(from, dateSend, selectPosts, textPosts);
        JSONObject historyPosts = JsonPosts.historyPosts(counterPostsStr, posts);
        ps.setArray(8, (Array) historyPosts);
        ps.executeUpdate();
        
        ps.close();
        //connec.close();
        return result;
    }
    public int convertArrayStringToInt(String[] arr) {
        int[] arr2 = new int[arr.length];
        int sum = 0;
        for (int i = 0; i < arr.length; i++) {
            arr2[i] = Integer.parseInt(arr[i]);
            sum += arr2[i];
        }
        return sum;
    }
}
