/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Models.BirdNestDetail_TrackingDTO;
import Utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

    private List<BirdNestDetail_TrackingDTO> bndetalList;

    public List<BirdNestDetail_TrackingDTO> getBNDetailList() {
        return bndetalList;
    }

    public List<BirdNestDetail_TrackingDTO> getPagingByCreateDateDesc(int index, int product_typeID)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select type.Product_Type_Name, Gender, Status, NOTE, LastUpdateDate "
                        + "from BirdNestDetail_Tracking "
                        + "inner join Product_Type type on BirdNestDetail_Tracking.Product_TypeID = type.Product_TypeID  "
                        + "Order by LastUpdateDate desc "
                        + "OFFSET ? ROWS "
                        + "FETCH FIRST 9 ROWS ONLY";
                stm = con.prepareStatement(sql);
                stm.setInt(1, product_typeID);
                stm.setInt(2, (index - 1) * 9);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("ProductID");
                    String product_Name = rs.getString("Product_Name");
                    String cate_Name = rs.getString("Category_Name");
                    String image = rs.getString("Image");
                    int product_TypeID = rs.getInt("Product_TypeID");
                    String age = rs.getString("Age");
                    String color = rs.getString("Color");
                    String gender = rs.getString("Gender");
                    int quantity_Available = rs.getInt("Quantity_Available");
                    float price = rs.getFloat("Price");
                    float discount = rs.getFloat("Discount");
                    int quantity_Sold = rs.getInt("Quantity_Sold");
                    String status = rs.getString("Status");
//                    Bird_Nest_TrackingDTO result = new Bird_Nest_TrackingDTO
//                    if (this.bndetalList == null) {
//                        this.bndetalList = new ArrayList<BirdNestDetail_TrackingDTO>();
//                    }
//                    this.bndetalList.add(result);
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
}
