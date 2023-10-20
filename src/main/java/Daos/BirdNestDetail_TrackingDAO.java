/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Models.BirdNestDetail_TrackingDTO;
import Utils.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author hj
 */
public class BirdNestDetail_TrackingDAO {

    public boolean createBirdNestDetailTracking(BirdNestDetail_TrackingDTO newBirdNest) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert into BirdNestDetail_Tracking ( "
                        + "Bird_Nest_ID, Bird_ID, Product_TypeID, Gender, Customer_Product, "
                        + "LastUpdateDate, NOTE, Status "
                        + ") values ( "
                        + "?, ?, ?, ?, ?, ?, ?, ?"
                        + ") ";
                stm = con.prepareStatement(sql);
                stm.setString(1, newBirdNest.getBird_Nest_ID());
                stm.setString(2, newBirdNest.getBird_ID());
                stm.setInt(3, newBirdNest.getProduct_TypeID());
                stm.setString(4, newBirdNest.getGender());
                stm.setBoolean(5, newBirdNest.isCustomer_Product());
                stm.setDate(6, newBirdNest.getLastUpdateDate());
                stm.setString(7, newBirdNest.getNote());
                stm.setString(8, newBirdNest.getStatus());

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
