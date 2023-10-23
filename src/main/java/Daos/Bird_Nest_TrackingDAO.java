/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Models.Bird_Nest_TrackingDTO;
import Utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author hj
 */
public class Bird_Nest_TrackingDAO implements Serializable{

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
                        + "Bird_Nest_ID, OrderID, Bird_Nest_Name, Eggs_Quantity, AccountID, ServiceID, "
                        + "Deposit_Price, StaffID, OrderDate, LastUpdateDate, NOTE, Status "
                        + ") values ( "
                        + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? "
                        + ") ";
                stm = con.prepareStatement(sql);
                stm.setString(1, newBirdNest.getBird_Nest_ID());
                stm.setString(2, newBirdNest.getOrderID());
                stm.setString(3, newBirdNest.getBird_Nest_Name());
                stm.setInt(4, newBirdNest.getEggs_Quantity());
                stm.setString(5, newBirdNest.getAccountID());
                stm.setInt(6, newBirdNest.getServiceID());
                stm.setFloat(7, newBirdNest.getDeposit_Price());
                stm.setString(8, newBirdNest.getStaffID());
                stm.setDate(9, newBirdNest.getOrderDate());
                stm.setDate(10, newBirdNest.getLastUpdateDate());
                stm.setString(11, newBirdNest.getNote());
                stm.setString(12, newBirdNest.getStatus());

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

    public Bird_Nest_TrackingDTO getBNTrackingByOrderID(String orderId)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Bird_Nest_TrackingDTO result = null;
        try {
            //1.Make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = null;
                //2.Create SQL statement string
                sql = "select Bird_Nest_ID, OrderID, Eggs_Quantity, AccountID, ServiceID, StaffID, LastUpdateDate, Status "
                        + "from Bird_Nest_Tracking "
                        + "where OrderID = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, orderId);
                //4.execute-query
                rs = stm.executeQuery();
                //5.process
                while (rs.next()) {
                    result = new Bird_Nest_TrackingDTO(rs.getString("Bird_Nest_ID"),
                            rs.getString("OrderID"),
                            rs.getInt("Eggs_Quantity"),
                            rs.getString("AccountID"),
                            rs.getInt("ServiceID"),
                            rs.getString("StaffID"),
                            rs.getDate("LastUpdateDate"),
                            rs.getString("Status"));
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
        return result;
    }
}
