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
public class BirdNestDetail_TrackingDTO {

    private String bird_Nest_ID;
    private String bird_ID;
    private int product_TypeID;
    private String product_TypeName;
    private String gender;
    private boolean customer_Product;
    private Date lastUpdateDate;
    private String note;
    private String status;

    public BirdNestDetail_TrackingDTO(String bird_Nest_ID, String bird_ID, int product_TypeID, String gender, boolean customer_Product, Date lastUpdateDate, String note, String status) {
        this.bird_Nest_ID = bird_Nest_ID;
        this.bird_ID = bird_ID;
        this.product_TypeID = product_TypeID;
        this.gender = gender;
        this.customer_Product = customer_Product;
        this.lastUpdateDate = lastUpdateDate;
        this.note = note;
        this.status = status;
    }

    public BirdNestDetail_TrackingDTO(String product_TypeName, String gender, Date lastUpdateDate, String note, String status) {
        this.product_TypeName = product_TypeName;
        this.gender = gender;
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

    public String getBird_ID() {
        return bird_ID;
    }

    public void setBird_ID(String bird_ID) {
        this.bird_ID = bird_ID;
    }

    public int getProduct_TypeID() {
        return product_TypeID;
    }

    public void setProduct_TypeID(int product_TypeID) {
        this.product_TypeID = product_TypeID;
    }

    public String getProduct_TypeName() {
        return product_TypeName;
    }

    public void setProduct_TypeName(String product_TypeName) {
        this.product_TypeName = product_TypeName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public boolean isCustomer_Product() {
        return customer_Product;
    }

    public void setCustomer_Product(boolean customer_Product) {
        this.customer_Product = customer_Product;
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
