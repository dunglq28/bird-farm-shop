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
public class Eggs_TrackingDTO {

    private String Bird_Nest_ID;
    private Date LastUpdateDate;
    private String NOTE;
    private String Status;

    public Eggs_TrackingDTO() {
    }
    
    

    public Eggs_TrackingDTO(String Bird_Nest_ID, Date LastUpdateDate, String NOTE, String Status) {
        this.Bird_Nest_ID = Bird_Nest_ID;
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
