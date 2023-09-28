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
    
    public List<BirdDTO> getPaging(int index)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select * "
                        + "from Products "
                        + "Order by ProductID "
                        + "OFFSET ? ROWS "
                        + "FETCH FIRST 10 ROWS ONLY";
                stm = con.prepareStatement(sql);
                stm.setInt(1, (index - 1) * 10);
                rs = stm.executeQuery();
                while (rs.next()) {
     
                    BirdDTO result = new BirdDTO(sql, sql, sql, index, index, sql);
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
}
