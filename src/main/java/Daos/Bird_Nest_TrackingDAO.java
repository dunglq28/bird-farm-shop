/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Models.Bird_Nest_TrackingDTO;
import Utils.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author hj
 */
public class Bird_Nest_TrackingDAO {
    public String createBirdNestID() throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select MAX(Bird_Nest_ID) as 'Bird_Nest_ID' "
                        + "From Bird_Nest_Tracking "
                        + "Where Bird_Nest_ID like ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, "BN" + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String BirdNestIDMax = rs.getString("Bird_Nest_ID");
                    if (BirdNestIDMax == null) {
                        return "BN1";
                    } else {
                        int num = Integer.parseInt(BirdNestIDMax.substring(2)) + 1;
                        String newBirdNestID = "BN";
                        return newBirdNestID.concat(String.valueOf(num));
                    }
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
        return null;
    }
    
    public boolean createBirdNestTracking(Bird_Nest_TrackingDTO newBirdNest) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert into Bird_Nest_Tracking ( "
                        + "Bird_Nest_ID, OrderID, Bird_Nest_Name, Dad_Bird_ID, Mom_Bird_ID, Eggs_Quantity, AccountID, ServiceID, " 
                        + "SubService, Deposit_Price, StaffID, OrderDate, LastUpdateDate, NOTE, Status "
                        + ") values ( "
                        + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? "
                        + ") ";
                stm = con.prepareStatement(sql);
                stm.setString(1, newBirdNest.getBird_Nest_ID());
                stm.setString(2, newBirdNest.getOrderID());
                stm.setString(3, newBirdNest.getBird_Nest_Name());
                stm.setString(4, newBirdNest.getDad_Bird_ID());
                stm.setString(5, newBirdNest.getMom_Bird_ID());
                stm.setInt(6, newBirdNest.getEggs_Quantity());
                stm.setString(7, newBirdNest.getAccountID());
                stm.setInt(8, newBirdNest.getServiceID());
                stm.setString(9, newBirdNest.getSubService());
                stm.setFloat(10, newBirdNest.getDeposit_Price());
                stm.setString(11, newBirdNest.getStaffID());
                stm.setDate(12, newBirdNest.getOrderDate());
                stm.setDate(13, newBirdNest.getLastUpdateDate());
                stm.setString(14, newBirdNest.getNote());
                stm.setString(15, newBirdNest.getStatus());
                
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
}
