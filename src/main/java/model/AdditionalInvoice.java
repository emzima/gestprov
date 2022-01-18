/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author gerencia
 */
public class AdditionalInvoice {
    private int idInvo;
    private int idInvoice;
    private int quotas;
    private int interestRate;
    private int exchange;
    private String caeNum;
    private String purchaseOrder;
    private String descriptionInvoice;

    public AdditionalInvoice(int idInvo, int idInvoice, int quotas, int interestRate, int exchange, String caeNum, String purchaseOrder, String descriptionInvoice) {
        this.idInvo = idInvo;
        this.idInvoice = idInvoice;
        this.quotas = quotas;
        this.interestRate = interestRate;
        this.exchange = exchange;
        this.caeNum = caeNum;
        this.purchaseOrder = purchaseOrder;
        this.descriptionInvoice = descriptionInvoice;
    }

    public int getIdInvo() {
        return idInvo;
    }

    public void setIdInvo(int idInvo) {
        this.idInvo = idInvo;
    }

    public int getIdInvoice() {
        return idInvoice;
    }

    public void setIdInvoice(int idInvoice) {
        this.idInvoice = idInvoice;
    }

    public int getQuotas() {
        return quotas;
    }

    public void setQuotas(int quotas) {
        this.quotas = quotas;
    }

    public int getInterestRate() {
        return interestRate;
    }

    public void setInterestRate(int interestRate) {
        this.interestRate = interestRate;
    }

    public int getExchange() {
        return exchange;
    }

    public void setExchange(int exchange) {
        this.exchange = exchange;
    }

    public String getCaeNum() {
        return caeNum;
    }

    public void setCaeNum(String caeNum) {
        this.caeNum = caeNum;
    }

    public String getPurchaseOrder() {
        return purchaseOrder;
    }

    public void setPurchaseOrder(String purchaseOrder) {
        this.purchaseOrder = purchaseOrder;
    }

    public String getDescriptionInvoice() {
        return descriptionInvoice;
    }

    public void setDescriptionInvoice(String descriptionInvoice) {
        this.descriptionInvoice = descriptionInvoice;
    }
}
