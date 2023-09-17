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
public class AccountDTO {

    private String AccountID;
    private String Password;
    private String FullName;
    private String Email;
    private Date Date_created;
    private String CreateBy;
    private int RoleID;
    private boolean Status;

    public AccountDTO(String AccountID, String FullName) {
        this.AccountID = AccountID;
        this.FullName = FullName;
    }

    public AccountDTO(String AccountID, String Password, String FullName, String Email, Date Date_created, String CreateBy, int RoleID, boolean Status) {
        this.AccountID = AccountID;
        this.Password = Password;
        this.FullName = FullName;
        this.Email = Email;
        this.Date_created = Date_created;
        this.CreateBy = CreateBy;
        this.RoleID = RoleID;
        this.Status = Status;
    }

    public String getAccountID() {
        return AccountID;
    }

    public void setAccountID(String AccountID) {
        this.AccountID = AccountID;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public Date getDate_created() {
        return Date_created;
    }

    public void setDate_created(Date Date_created) {
        this.Date_created = Date_created;
    }

    public String getCreateBy() {
        return CreateBy;
    }

    public void setCreateBy(String CreateBy) {
        this.CreateBy = CreateBy;
    }

    public int getRoleID() {
        return RoleID;
    }

    public void setRoleID(int RoleID) {
        this.RoleID = RoleID;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }

}
