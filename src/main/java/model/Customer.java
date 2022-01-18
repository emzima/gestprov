/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author gerencia
 */
public class Customer {
    private int idCustomer;
    private String cuitCustomer;
    private Timestamp dateCustomer;
    private String statusCustomer;
    private String typeCustomer;
    
    public Customer(int idCustomer, String cuitCustomer, Timestamp dateCustomer, String statusCustomer, String typeCustomer) {
        this.idCustomer = idCustomer;
        this.cuitCustomer = cuitCustomer;
        this.dateCustomer = dateCustomer;
        this.statusCustomer = statusCustomer;
        this.typeCustomer = typeCustomer;
    }

    public int getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(int idCustomer) {
        this.idCustomer = idCustomer;
    }

    public String getCuitCustomer() {
        return cuitCustomer;
    }

    public void setCuitCustomer(String cuitCustomer) {
        this.cuitCustomer = cuitCustomer;
    }

    public Timestamp getDateCustomer() {
        return dateCustomer;
    }

    public void setDateCustomer(Timestamp dateCustomer) {
        this.dateCustomer = dateCustomer;
    }

    public String getStatusCustomer() {
        return statusCustomer;
    }

    public void setStatusCustomer(String statusCustomer) {
        this.statusCustomer = statusCustomer;
    }

    public String getTypeCustomer() {
        return typeCustomer;
    }

    public void setTypeCustomer(String typeCustomer) {
        this.typeCustomer = typeCustomer;
    }
}
