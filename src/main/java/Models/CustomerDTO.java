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
public class CustomerDTO {
    private String CustomerID;
    private String AccountID;
    private String FullName;
    private String Gender;
    private String Email;
    private String Phone_Number;
    private String Address;
    private String City;
    private Date DOB;
    private Date Date_created;
    private boolean Status;

    public CustomerDTO(String CustomerID, String AccountID, String FullName, String Gender, String Email, String Phone_Number, String Address, String City, Date DOB, Date Date_created, boolean Status) {
        this.CustomerID = CustomerID;
        this.AccountID = AccountID;
        this.FullName = FullName;
        this.Gender = Gender;
        this.Email = Email;
        this.Phone_Number = Phone_Number;
        this.Address = Address;
        this.City = City;
        this.DOB = DOB;
        this.Date_created = Date_created;
        this.Status = Status;
    }

    public String getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(String CustomerID) {
        this.CustomerID = CustomerID;
    }

    public String getAccountID() {
        return AccountID;
    }

    public void setAccountID(String AccountID) {
        this.AccountID = AccountID;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPhone_Number() {
        return Phone_Number;
    }

    public void setPhone_Number(String Phone_Number) {
        this.Phone_Number = Phone_Number;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String City) {
        this.City = City;
    }

    public Date getDOB() {
        return DOB;
    }

    public void setDOB(Date DOB) {
        this.DOB = DOB;
    }

    public Date getDate_created() {
        return Date_created;
    }

    public void setDate_created(Date Date_created) {
        this.Date_created = Date_created;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }

    
    
}
