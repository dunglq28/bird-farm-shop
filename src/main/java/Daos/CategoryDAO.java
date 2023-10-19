/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Models.CategoryDTO;
import Utils.DBHelper;
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
public class CategoryDAO {

    private List<CategoryDTO> cateList;

    public List<CategoryDTO> getCateList() {
        return cateList;
    }
    
    public List<CategoryDTO> getAllCate()
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select * "
                        + "from Category ";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    CategoryDTO result = new CategoryDTO(rs.getString("CategoryID"), rs.getString("Category_Name"));
                    if (this.cateList == null) {
                        this.cateList = new ArrayList<CategoryDTO>();
                    }
                    this.cateList.add(result);
                }
                return this.cateList;
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
