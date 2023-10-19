package Models;

import java.sql.Date;

public class StaffDTO {
    private String StaffID;
    private String Name;
    private String Email;
    private String Phone_Number;
    private String DOB;
    private String Gender;
    private String ManagerID;
    private String AccountID;
    private Date Date_created;
    private boolean status;

    public StaffDTO() {
    }

    public StaffDTO(String StaffID, String Name, String Email, String Phone_Number, String DOB, String Gender, String ManagerID, String AccountID, Date Date_created, boolean status) {
        this.StaffID = StaffID;
        this.Name = Name;
        this.Email = Email;
        this.Phone_Number = Phone_Number;
        this.DOB = DOB;
        this.Gender = Gender;
        this.ManagerID = ManagerID;
        this.AccountID = AccountID;
        this.Date_created = Date_created;
        this.status = status;
    }

    public String getStaffID() {
        return StaffID;
    }

    public void setStaffID(String StaffID) {
        this.StaffID = StaffID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
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

    public String getDOB() {
        return DOB;
    }

    public void setDOB(String DOB) {
        this.DOB = DOB;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getManagerID() {
        return ManagerID;
    }

    public void setManagerID(String ManagerID) {
        this.ManagerID = ManagerID;
    }

    public String getAccountID() {
        return AccountID;
    }

    public void setAccountID(String AccountID) {
        this.AccountID = AccountID;
    }

    public Date getDate_created() {
        return Date_created;
    }

    public void setDate_created(Date Date_created) {
        this.Date_created = Date_created;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
}
