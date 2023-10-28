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
public class Bird_Nest_TrackingDAO implements Serializable {

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
                        return "BN01";
                    } else {
                        int num = Integer.parseInt(BirdNestIDMax.substring(2)) + 1;
                        String newOrderID;
                        if (num <= 9) {
                            newOrderID = "BN0";
                        } else {
                            newOrderID = "BN";
                        }

                        return newOrderID.concat(String.valueOf(num));
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
                        + "Bird_Nest_ID, OrderID, Bird_Nest_Name, Eggs_Quantity, Male_Babybird, Female_Babybird, AccountID, ServiceID, "
                        + "Deposit_Price, Total_Price, OrderDate, LastUpdateDate, NOTE, Status "
                        + ") values ( "
                        + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? "
                        + ") ";
                stm = con.prepareStatement(sql);
                stm.setString(1, newBirdNest.getBird_Nest_ID());
                stm.setString(2, newBirdNest.getOrderID());
                stm.setString(3, newBirdNest.getBird_Nest_Name());
                stm.setInt(4, newBirdNest.getEggs_Quantity());
                stm.setInt(5, newBirdNest.getMale_Babybird());
                stm.setInt(6, newBirdNest.getFemale_Babybird());
                stm.setString(7, newBirdNest.getAccountID());
                stm.setInt(8, newBirdNest.getServiceID());
                stm.setFloat(9, newBirdNest.getDeposit_Price());
                stm.setFloat(10, newBirdNest.getTotal_Price());
                stm.setDate(11, newBirdNest.getOrderDate());
                stm.setDate(12, newBirdNest.getLastUpdateDate());
                stm.setString(13, newBirdNest.getNote());
                stm.setString(14, newBirdNest.getStatus());

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
                sql = "select Bird_Nest_ID, OrderID, Eggs_Quantity, Male_Babybird, Female_Babybird, "
                        + "AccountID, ServiceID, Deposit_Price, Total_Price, LastUpdateDate, Status "
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
                            rs.getInt("Male_Babybird"),
                            rs.getInt("Female_Babybird"),
                            rs.getString("AccountID"),
                            rs.getInt("ServiceID"),
                            rs.getFloat("Deposit_Price"),
                            rs.getFloat("Total_Price"),
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
