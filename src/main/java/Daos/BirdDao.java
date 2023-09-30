/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Models.BirdDTO;
import Utils.DBHelper;
import java.math.BigDecimal;
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
public class BirdDao {
    private List<BirdDTO> birdList;

    public List<BirdDTO> getBirdList() {
        return birdList;
    }
    
    public List<BirdDTO> getPagingByCreateDateDesc(int index)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select BirdID, Bird_Name, Image, Price, Discount, Status "
                        + "from Birds "
                        + "Order by Date_created desc "
                        + "OFFSET ? ROWS "
                        + "FETCH FIRST 9 ROWS ONLY";
                stm = con.prepareStatement(sql);
                stm.setInt(1, (index - 1) * 9);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String birdID = rs.getString("BirdID");
                    String birdName = rs.getString("Bird_Name");
                    String image = rs.getString("Image");
                    float price = rs.getFloat("Price");
                    float discount = rs.getFloat("Discount");
                    String status = rs.getString("Status");
                    BirdDTO result = new BirdDTO(birdID, birdName, image, price, discount, status);
                    if (this.birdList == null) {
                        this.birdList = new ArrayList<BirdDTO>();
                    }
                    this.birdList.add(result);
                }
                return this.birdList;
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
    
    public int getNumberPage ()
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select count(*) "
                        + "From Birds ";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int total = rs.getInt(1);
                    int countPage = total / 9;
                    if (countPage % 9 != 0 && countPage % 2 != 0) {
                        countPage++;
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
