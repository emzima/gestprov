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
public class User {
    private int idUser;
    private int idCus;
    private Timestamp dateUser;
    private String email;
    private String namesRepre;
    private String celular;
    private String password;
    private int entry;
    private Timestamp entryTime;
    private Timestamp outTime;
    
    public User(int idUser, int idCus, Timestamp dateUser, String email, String namesRepre, String celular, int entry, Timestamp entryTime, Timestamp outTime) {
        this.idUser = idUser;
        this.idCus = idCus;
        this.dateUser = dateUser;
        this.email = email;
        this.namesRepre = namesRepre;
        this.celular = celular;
        this.entry = entry;
        this.entryTime = entryTime;
        this.outTime = outTime;
    }
    
    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdCus() {
        return idCus;
    }

    public void setIdCus(int idCus) {
        this.idCus = idCus;
    }

    public Timestamp getDateUser() {
        return dateUser;
    }

    public void setDateUser(Timestamp dateUser) {
        this.dateUser = dateUser;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNamesRepre() {
        return namesRepre;
    }

    public void setNamesRepre(String namesRepre) {
        this.namesRepre = namesRepre;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getEntry() {
        return entry;
    }

    public void setEntry(int entry) {
        this.entry = entry;
    }

    public Timestamp getEntryTime() {
        return entryTime;
    }

    public void setEntryTime(Timestamp entryTime) {
        this.entryTime = entryTime;
    }

    public Timestamp getOutTime() {
        return outTime;
    }

    public void setOutTime(Timestamp outTime) {
        this.outTime = outTime;
    }
    
    
}
