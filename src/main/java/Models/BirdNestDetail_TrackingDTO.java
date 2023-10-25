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
    private String note;
    private Date lastUpdateDate;

    public BirdNestDetail_TrackingDTO(String bird_Nest_ID, String note, Date lastUpdateDate) {
        this.bird_Nest_ID = bird_Nest_ID;
        this.note = note;
        this.lastUpdateDate = lastUpdateDate;
    }

    public String getBird_Nest_ID() {
        return bird_Nest_ID;
    }

    public void setBird_Nest_ID(String bird_Nest_ID) {
        this.bird_Nest_ID = bird_Nest_ID;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getLastUpdateDate() {
        return lastUpdateDate;
    }

    public void setLastUpdateDate(Date lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }
   
}
