/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Date;

/**
 *
 * @author hj
 */
public class Bird_Nest_TrackingDTO {
    private String bird_Nest_ID;
    private String orderID;
    private String bird_Nest_Name;
    private String dad_Bird_ID;
    private String mom_Bird_ID;
    private int eggs_Quantity;
    private String accountID;
    private int serviceID;
    private String subService;
    private float deposit_Price;
    private String staffID;
    private Date orderDate;
    private Date lastUpdateDate;
    private String note;
    private String status;

    public Bird_Nest_TrackingDTO() {
    }

    public Bird_Nest_TrackingDTO(String bird_Nest_ID, String orderID, String bird_Nest_Name, String dad_Bird_ID, String mom_Bird_ID, int eggs_Quantity, String accountID, int serviceID, String subService, float deposit_Price, String staffID, Date orderDate, Date lastUpdateDate, String note, String status) {
        this.bird_Nest_ID = bird_Nest_ID;
        this.orderID = orderID;
        this.bird_Nest_Name = bird_Nest_Name;
        this.dad_Bird_ID = dad_Bird_ID;
        this.mom_Bird_ID = mom_Bird_ID;
        this.eggs_Quantity = eggs_Quantity;
        this.accountID = accountID;
        this.serviceID = serviceID;
        this.subService = subService;
        this.deposit_Price = deposit_Price;
        this.staffID = staffID;
        this.orderDate = orderDate;
        this.lastUpdateDate = lastUpdateDate;
        this.note = note;
        this.status = status;
    }

    public String getBird_Nest_ID() {
        return bird_Nest_ID;
    }

    public void setBird_Nest_ID(String bird_Nest_ID) {
        this.bird_Nest_ID = bird_Nest_ID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getBird_Nest_Name() {
        return bird_Nest_Name;
    }

    public void setBird_Nest_Name(String bird_Nest_Name) {
        this.bird_Nest_Name = bird_Nest_Name;
    }

    public String getDad_Bird_ID() {
        return dad_Bird_ID;
    }

    public void setDad_Bird_ID(String dad_Bird_ID) {
        this.dad_Bird_ID = dad_Bird_ID;
    }

    public String getMom_Bird_ID() {
        return mom_Bird_ID;
    }

    public void setMom_Bird_ID(String mom_Bird_ID) {
        this.mom_Bird_ID = mom_Bird_ID;
    }

    public int getEggs_Quantity() {
        return eggs_Quantity;
    }

    public void setEggs_Quantity(int eggs_Quantity) {
        this.eggs_Quantity = eggs_Quantity;
    }

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

    public String getSubService() {
        return subService;
    }

    public void setSubService(String subService) {
        this.subService = subService;
    }

    public float getDeposit_Price() {
        return deposit_Price;
    }

    public void setDeposit_Price(float deposit_Price) {
        this.deposit_Price = deposit_Price;
    }

    public String getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Date getLastUpdateDate() {
        return lastUpdateDate;
    }

    public void setLastUpdateDate(Date lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
}
