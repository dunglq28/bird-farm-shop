/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Models.BirdNestDetail_TrackingDTO;
import Models.Bird_Nest_TrackingDTO;
import Utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hj
 */
public class BirdNestDetail_TrackingDAO implements Serializable {

    public boolean createBirdNestDetailTracking(BirdNestDetail_TrackingDTO newBirdNest) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert into BirdNestDetail_Tracking ( "
                        + "Bird_Nest_ID, LastUpdateDate, NOTE, Status "
                        + ") values ( "
                        + "?, ?, ?, ? "
                        + ") ";
                stm = con.prepareStatement(sql);
                stm.setString(1, newBirdNest.getBird_Nest_ID());;
                stm.setDate(2, newBirdNest.getLastUpdateDate());
                stm.setString(3, newBirdNest.getNote());
                stm.setString(4, newBirdNest.getStatus());

                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    private List<BirdNestDetail_TrackingDTO> bndetalList;

    public List<BirdNestDetail_TrackingDTO> getBNDetailList() {
        return bndetalList;
    }

    public List<BirdNestDetail_TrackingDTO> getPagingByUpdateDateDesc(int index, String bnID)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select Bird_Nest_ID, Status, NOTE, LastUpdateDate "
                        + "from BirdNestDetail_Tracking "
                        + "where Bird_Nest_ID = ? "
                        + "Order by LastUpdateDate desc "
                        + "OFFSET ? ROWS "
                        + "FETCH FIRST 4 ROWS ONLY";
                stm = con.prepareStatement(sql);
                stm.setString(1, bnID);
                stm.setInt(2, (index - 1) * 4);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String note;
                    if (rs.getString("NOTE") == null) {
                        note = "Not Have";
                    } else {
                        note = rs.getString("NOTE");
                    }
                    BirdNestDetail_TrackingDTO result = new BirdNestDetail_TrackingDTO(rs.getString("Bird_Nest_ID"),
                            rs.getString("NOTE"),
                            rs.getDate("LastUpdateDate"),
                            rs.getString("Status"));
                    if (this.bndetalList == null) {
                        this.bndetalList = new ArrayList<BirdNestDetail_TrackingDTO>();
                    }
                    this.bndetalList.add(result);
                }
                return this.bndetalList;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }

    public int getNumberPage(String bnID)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select count(*) "
                        + "From BirdNestDetail_Tracking "
                        + "where Bird_Nest_ID = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, bnID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int total = rs.getInt(1);
                    int countPage;
                    if (total < 4) {
                        countPage = 1;
                    } else {
                        countPage = total / 4;
                        if (countPage % 4 != 0 && countPage % 2 != 0) {
                            countPage++;
                        }
                    }
                    return countPage;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return 0;
    }
}
