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
    private String Bird_Nest_ID;
    private String OrderID;
    private String Bird_Nest_Name;
    private String Dad_Bird_ID;
    private String Mom_Bird_ID;
    private int Eggs_Quantity;
    private String CustomerID;
    private int ServiceID;
    private String SubService;
    private float Deposit_Price;
    private String StaffID;
    private Date OrderDate;
    private Date LastUpdateDate;
    private String NOTE;
    private String Status;

    public Bird_Nest_TrackingDTO() {
    }

    public Bird_Nest_TrackingDTO(String Bird_Nest_ID, String OrderID, String Bird_Nest_Name, String Dad_Bird_ID, String Mom_Bird_ID, int Eggs_Quantity, String CustomerID, int ServiceID, String SubService, float Deposit_Price, String StaffID, Date OrderDate, Date LastUpdateDate, String NOTE, String Status) {
        this.Bird_Nest_ID = Bird_Nest_ID;
        this.OrderID = OrderID;
        this.Bird_Nest_Name = Bird_Nest_Name;
        this.Dad_Bird_ID = Dad_Bird_ID;
        this.Mom_Bird_ID = Mom_Bird_ID;
        this.Eggs_Quantity = Eggs_Quantity;
        this.CustomerID = CustomerID;
        this.ServiceID = ServiceID;
        this.SubService = SubService;
        this.Deposit_Price = Deposit_Price;
        this.StaffID = StaffID;
        this.OrderDate = OrderDate;
        this.LastUpdateDate = LastUpdateDate;
        this.NOTE = NOTE;
        this.Status = Status;
    }

    public String getBird_Nest_ID() {
        return Bird_Nest_ID;
    }

    public void setBird_Nest_ID(String Bird_Nest_ID) {
        this.Bird_Nest_ID = Bird_Nest_ID;
    }

    public String getOrderID() {
        return OrderID;
    }

    public void setOrderID(String OrderID) {
        this.OrderID = OrderID;
    }

    public String getBird_Nest_Name() {
        return Bird_Nest_Name;
    }

    public void setBird_Nest_Name(String Bird_Nest_Name) {
        this.Bird_Nest_Name = Bird_Nest_Name;
    }

    public String getDad_Bird_ID() {
        return Dad_Bird_ID;
    }

    public void setDad_Bird_ID(String Dad_Bird_ID) {
        this.Dad_Bird_ID = Dad_Bird_ID;
    }

    public String getMom_Bird_ID() {
        return Mom_Bird_ID;
    }

    public void setMom_Bird_ID(String Mom_Bird_ID) {
        this.Mom_Bird_ID = Mom_Bird_ID;
    }

    public int getEggs_Quantity() {
        return Eggs_Quantity;
    }

    public void setEggs_Quantity(int Eggs_Quantity) {
        this.Eggs_Quantity = Eggs_Quantity;
    }

    public String getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(String CustomerID) {
        this.CustomerID = CustomerID;
    }

    public int getServiceID() {
        return ServiceID;
    }

    public void setServiceID(int ServiceID) {
        this.ServiceID = ServiceID;
    }

    public String getSubService() {
        return SubService;
    }

    public void setSubService(String SubService) {
        this.SubService = SubService;
    }

    public float getDeposit_Price() {
        return Deposit_Price;
    }

    public void setDeposit_Price(float Deposit_Price) {
        this.Deposit_Price = Deposit_Price;
    }

    public String getStaffID() {
        return StaffID;
    }

    public void setStaffID(String StaffID) {
        this.StaffID = StaffID;
    }

    public Date getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(Date OrderDate) {
        this.OrderDate = OrderDate;
    }

    public Date getLastUpdateDate() {
        return LastUpdateDate;
    }

    public void setLastUpdateDate(Date LastUpdateDate) {
        this.LastUpdateDate = LastUpdateDate;
    }

    public String getNOTE() {
        return NOTE;
    }

    public void setNOTE(String NOTE) {
        this.NOTE = NOTE;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }
    
    
    
}
