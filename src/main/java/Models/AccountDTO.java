package Models;

import java.sql.Date;

public class AccountDTO {

    private String accountID;
    private String password;
    private String fullName;
    private String email;
    private Date date_created;
    private String createBy;
    private int roleID;
    private String roleName;
    private boolean status;

    public AccountDTO(String accountID, String password, String fullName, String email, Date date_created, String createBy, int roleID, String roleName, boolean status) {
        this.accountID = accountID;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.date_created = date_created;
        this.createBy = createBy;
        this.roleID = roleID;
        this.roleName = roleName;
        this.status = status;
    }
 

    public AccountDTO(String accountID, String fullName, String roleName) {
        this.accountID = accountID;
        this.fullName = fullName;
        this.roleName = roleName;
    }
    
     public AccountDTO(String accountID, String fullName, String roleName, String passWord) {
        this.accountID = accountID;
        this.fullName = fullName;
        this.roleName = roleName;
        this.password = passWord;
    }


    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
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

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    

}
