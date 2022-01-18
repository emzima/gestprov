/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import database.AccountDAO;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

/**
 *
 * @author gerencia
 */
public class Invoices {
    private int idInvoice;
    private String fromInvoice;
    private String toInvoice;
    private String operationNum;
    private String invoiceNum;
    private long payTotal;
    private Date dateIssue;
    private Date dateExpire;
    private String statusInvoice;
    private List<Invoices> custToInvoices;
    private List<Invoices> custFromInvoices;
    private String statusCal;
    private String customer;

    public Invoices(int idInvoice, String fromInvoice, String toInvoice, String operationNum, String invoiceNum, long payTotal, Date dateIssue, Date dateExpire, String statusInvoice, String statusCal) {
        this.idInvoice = idInvoice;
        this.fromInvoice = fromInvoice;
        this.toInvoice = toInvoice;
        this.operationNum = operationNum;
        this.invoiceNum = invoiceNum;
        this.payTotal = payTotal;
        this.dateIssue = dateIssue;
        this.dateExpire = dateExpire;
        this.statusInvoice = statusInvoice;
        this.statusCal = statusCal;
        
        AccountDAO AccountDB = new AccountDAO();
        try {
            this.custToInvoices = AccountDB.getToInvoices(fromInvoice);
        } catch(SQLException e){
        }
        
        try {
            this.custFromInvoices = AccountDB.getFromInvoices(toInvoice);
        } catch(SQLException e){
        }
    }
    
    public Invoices(int idInvoice, String fromInvoice, String toInvoice, String operationNum, String invoiceNum, long payTotal, Date dateIssue, Date dateExpire, String statusInvoice) {
        this.idInvoice = idInvoice;
        this.fromInvoice = fromInvoice;
        this.toInvoice = toInvoice;
        this.operationNum = operationNum;
        this.invoiceNum = invoiceNum;
        this.payTotal = payTotal;
        this.dateIssue = dateIssue;
        this.dateExpire = dateExpire;
        this.statusInvoice = statusInvoice;
    }

    public Invoices(int idInvoice, String customer, String operationNum, String invoiceNum, long payTotal, Date dateExpire, String statusInvoice) {
        this.idInvoice = idInvoice;
        this.customer = customer;
        this.operationNum = operationNum;
        this.invoiceNum = invoiceNum;
        this.payTotal = payTotal;
        this.dateExpire = dateExpire;
        this.statusInvoice = statusInvoice;
    }
    
    public int getIdInvoice() {
        return idInvoice;
    }

    public void setIdInvoice(int idInvoice) {
        this.idInvoice = idInvoice;
    }

    public String getFromInvoice() {
        return fromInvoice;
    }

    public void setFromInvoice(String fromInvoice) {
        this.fromInvoice = fromInvoice;
    }

    public String getToInvoice() {
        return toInvoice;
    }

    public void setToInvoice(String toInvoice) {
        this.toInvoice = toInvoice;
    }

    public String getOperationNum() {
        return operationNum;
    }

    public void setOperationNum(String operationNum) {
        this.operationNum = operationNum;
    }

    public String getInvoiceNum() {
        return invoiceNum;
    }

    public void setInvoiceNum(String invoiceNum) {
        this.invoiceNum = invoiceNum;
    }

    public long getPayTotal() {
        return payTotal;
    }

    public void setPayTotal(long payTotal) {
        this.payTotal = payTotal;
    }

    public Date getDateIssue() {
        return dateIssue;
    }

    public void setDateIssue(Date dateIssue) {
        this.dateIssue = dateIssue;
    }

    public Date getDateExpire() {
        return dateExpire;
    }

    public void setDateExpire(Date dateExpire) {
        this.dateExpire = dateExpire;
    }

    public String getStatusInvoice() {
        return statusInvoice;
    }

    public void setStatusInvoice(String statusInvoice) {
        this.statusInvoice = statusInvoice;
    }

    public String getStatusCal() {
        return statusCal;
    }

    public void setStatusCal(String statusCal) {
        this.statusCal = statusCal;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }
}
