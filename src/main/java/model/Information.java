/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author gerencia
 */
public class Information {
    private int idInf;
    private int idCus;
    private String namesCust;
    private String companyName;
    private String phone;
    private String direction;
    private String postalCode;
    private String city;
    private String country;
    private String statusIVA;
    private String statusIncome;
    private String typeActivity;
    private Date dateStart;
    private String descriptionActivity;

    public Information(int idInf, int idCus, String namesCust, String companyName, String phone, String direction, String postalCode, String city, String country, String statusIVA, String statusIncome, String typeActivity, Date dateStart, String descriptionActivity) {
        this.idInf = idInf;
        this.idCus = idCus;
        this.namesCust = namesCust;
        this.companyName = companyName;
        this.phone = phone;
        this.direction = direction;
        this.postalCode = postalCode;
        this.city = city;
        this.country = country;
        this.statusIVA = statusIVA;
        this.statusIncome = statusIncome;
        this.typeActivity = typeActivity;
        this.dateStart = dateStart;
        this.descriptionActivity = descriptionActivity;
    }

    public int getIdInf() {
        return idInf;
    }

    public void setIdInf(int idInf) {
        this.idInf = idInf;
    }

    public int getIdCus() {
        return idCus;
    }

    public void setIdCus(int idCus) {
        this.idCus = idCus;
    }

    public String getNamesCust() {
        return namesCust;
    }

    public void setNamesCust(String namesCust) {
        this.namesCust = namesCust;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getStatusIVA() {
        return statusIVA;
    }

    public void setStatusIVA(String statusIVA) {
        this.statusIVA = statusIVA;
    }

    public String getStatusIncome() {
        return statusIncome;
    }

    public void setStatusIncome(String statusIncome) {
        this.statusIncome = statusIncome;
    }

    public String getTypeActivity() {
        return typeActivity;
    }

    public void setTypeActivity(String typeActivity) {
        this.typeActivity = typeActivity;
    }

    public Date getDateStart() {
        return dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public String getDescriptionActivity() {
        return descriptionActivity;
    }

    public void setDescriptionActivity(String descriptionActivity) {
        this.descriptionActivity = descriptionActivity;
    }
}
