package Models;

import java.sql.Date;

public class CustomerDTO {
    private String customerID;
    private String accountID;
    private String fullName;
    private String gender;
    private String email;
    private String phone_Number;
    private String address;
    private String city;
    private String district;
    private Date dOB;
    private Date date_created;
    private boolean status;

    public CustomerDTO(String customerID, String accountID, String fullName, String gender, String email, String phone_Number, String address, String city, String district, Date dOB, Date date_created, boolean status) {
        this.customerID = customerID;
        this.accountID = accountID;
        this.fullName = fullName;
        this.gender = gender;
        this.email = email;
        this.phone_Number = phone_Number;
        this.address = address;
        this.city = city;
        this.district = district;
        this.dOB = dOB;
        this.date_created = date_created;
        this.status = status;
    }

    public CustomerDTO(String fullName, String phone_Number, String address, String city, String district) {
        this.fullName = fullName;
        this.phone_Number = phone_Number;
        this.address = address;
        this.city = city;
        this.district = district;
    }
    
    

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone_Number() {
        return phone_Number;
    }

    public void setPhone_Number(String phone_Number) {
        this.phone_Number = phone_Number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }
    
    

    public Date getdOB() {
        return dOB;
    }

    public void setdOB(Date dOB) {
        this.dOB = dOB;
    }

    public Date getDate_created() {
        return date_created;
    }

    public void setDate_created(Date date_created) {
        this.date_created = date_created;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    

    
    
}
