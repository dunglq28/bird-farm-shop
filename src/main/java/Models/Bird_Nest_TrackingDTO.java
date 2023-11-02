
package Models;

import java.sql.Date;

public class Bird_Nest_TrackingDTO {
    private String bird_Nest_ID;
    private String orderID;
    private String bird_Nest_Name;
    private int eggs_Quantity;
    private int male_Babybird;
    private int female_Babybird;
    private String accountID;
    private int serviceID;
    private Date orderDate;
    private Date lastUpdateDate;
    private String status;

    public Bird_Nest_TrackingDTO() {
    }


    public Bird_Nest_TrackingDTO(String bird_Nest_ID, String orderID, String bird_Nest_Name, int eggs_Quantity, int male_Babybird, int female_Babybird, String accountID, int serviceID, Date orderDate, Date lastUpdateDate, String status) {
        this.bird_Nest_ID = bird_Nest_ID;
        this.orderID = orderID;
        this.bird_Nest_Name = bird_Nest_Name;
        this.eggs_Quantity = eggs_Quantity;
        this.male_Babybird = male_Babybird;
        this.female_Babybird = female_Babybird;
        this.accountID = accountID;
        this.serviceID = serviceID;
        this.orderDate = orderDate;
        this.lastUpdateDate = lastUpdateDate;
        this.status = status;
    }

    public Bird_Nest_TrackingDTO(String bird_Nest_ID, String orderID, int eggs_Quantity, int male_Babybird, int female_Babybird, String accountID, int serviceID, Date lastUpdateDate, String status) {
        this.bird_Nest_ID = bird_Nest_ID;
        this.orderID = orderID;
        this.eggs_Quantity = eggs_Quantity;
        this.male_Babybird = male_Babybird;
        this.female_Babybird = female_Babybird;
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

    public int getMale_Babybird() {
        return male_Babybird;
    }

    public void setMale_Babybird(int male_Babybird) {
        this.male_Babybird = male_Babybird;
    }

    public int getFemale_Babybird() {
        return female_Babybird;
    }

    public void setFemale_Babybird(int female_Babybird) {
        this.female_Babybird = female_Babybird;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
}
