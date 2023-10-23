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
    private String egg_ID;
    private String Product_Name;
    private String gender;
    private Date lastUpdateDate;
    private String note;
    private String status;

    public BirdNestDetail_TrackingDTO(String bird_Nest_ID, String egg_ID, String Product_Name, String gender, Date lastUpdateDate, String note, String status) {
        this.bird_Nest_ID = bird_Nest_ID;
        this.egg_ID = egg_ID;
        this.Product_Name = Product_Name;
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

    public String getEgg_ID() {
        return egg_ID;
    }

    public void setEgg_ID(String egg_ID) {
        this.egg_ID = egg_ID;
    }

    public String getProduct_Name() {
        return Product_Name;
    }

    public void setProduct_Name(String Product_Name) {
        this.Product_Name = Product_Name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
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
