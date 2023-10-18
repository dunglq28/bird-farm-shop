/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Models.Service_Price_ListDTO;
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
public class Service_Price_ListDAO {

    private List<Service_Price_ListDTO> orderServicePirceList;

    public List<Service_Price_ListDTO> getServiceServicePirceList() {
        return orderServicePirceList;
    }

    public List<Service_Price_ListDTO> getServicePriceByServiceID(int id)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Service_Price_ListDTO result = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select * "
                        + "From Service_Price_List "
                        + "Where ServiceID = ? ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    result = new Service_Price_ListDTO(rs.getInt("Service_Price_List_ID"),
                            rs.getInt("ServiceID"),
                            rs.getString("ServiceName"),
                            rs.getInt("Minimum_number_of_eggs"),
                            rs.getInt("Maximum_number_of_eggs"),
                            rs.getFloat("ServicePrice"),
                            rs.getString("UnitPrice"));
                    if (this.orderServicePirceList == null) {
                        this.orderServicePirceList = new ArrayList<Service_Price_ListDTO>();
                    }
                    this.orderServicePirceList.add(result);
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
        return this.orderServicePirceList;
    }
}
