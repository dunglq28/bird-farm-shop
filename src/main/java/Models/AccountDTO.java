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

    private String accountID;
    private String password;
    private String fullName;
    private String email;
    private Date date_created;
    private String createBy;
    private int roleID;
    private boolean status;

    public AccountDTO(String accountID, String password, String fullName, String email, Date date_created, String createBy, int roleID, boolean status) {
        this.accountID = accountID;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.date_created = date_created;
        this.createBy = createBy;
        this.roleID = roleID;
        this.status = status;
    }

    public AccountDTO(String accountID, String fullName, int roleID) {
        this.accountID = accountID;
        this.fullName = fullName;
        this.roleID = roleID;
    }
    
    

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDate_created() {
        return date_created;
    }

    public void setDate_created(Date date_created) {
        this.date_created = date_created;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    

}
