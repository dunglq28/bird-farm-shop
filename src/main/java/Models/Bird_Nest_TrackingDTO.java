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
    private int eggs_Quantity;
    private String accountID;
    private int serviceID;
    private float deposit_Price;
    private Date orderDate;
    private Date lastUpdateDate;
    private String note;
    private String status;

    public Bird_Nest_TrackingDTO() {
    }

    public Bird_Nest_TrackingDTO(String bird_Nest_ID, String orderID, String bird_Nest_Name, int eggs_Quantity, String accountID, int serviceID, float deposit_Price, Date orderDate, Date lastUpdateDate, String note, String status) {
        this.bird_Nest_ID = bird_Nest_ID;
        this.orderID = orderID;
        this.bird_Nest_Name = bird_Nest_Name;
        this.eggs_Quantity = eggs_Quantity;
        this.accountID = accountID;
        this.serviceID = serviceID;
        this.deposit_Price = deposit_Price;
        this.orderDate = orderDate;
        this.lastUpdateDate = lastUpdateDate;
        this.note = note;
        this.status = status;
    }

    public Bird_Nest_TrackingDTO(String bird_Nest_ID, String orderID, int eggs_Quantity, String accountID, int serviceID, Date lastUpdateDate, String status) {
        this.bird_Nest_ID = bird_Nest_ID;
        this.orderID = orderID;
        this.eggs_Quantity = eggs_Quantity;
        this.accountID = accountID;
        this.serviceID = serviceID;
        this.lastUpdateDate = lastUpdateDate;
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


    public float getDeposit_Price() {
        return deposit_Price;
    }

    public void setDeposit_Price(float deposit_Price) {
        this.deposit_Price = deposit_Price;
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
