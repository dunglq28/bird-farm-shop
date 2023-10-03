/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Models.OrderDetailDTO;
import Utils.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author hj
 */
public class OrderDetailDAO {
    public boolean createOrderDetail(OrderDetailDTO orderDetail) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert into Order_Details ( "
                        + "OrderID, ServiceID, BirdID, Bird_Nest_ID, Price, Quantity_Buy, Status "
                        + ") values ( "
                        + "?, ?, ?, ?, ?, ?, ? "
                        + ") ";
                stm = con.prepareStatement(sql);
                stm.setString(1, orderDetail.getOrderID());
                stm.setInt(2, orderDetail.getServiceID());
                stm.setString(3, orderDetail.getBirdID());
                stm.setString(4, orderDetail.getBird_Nest_ID());
                stm.setFloat(5, orderDetail.getPrice());
                stm.setInt(6, orderDetail.getQuantity_Buy());
                stm.setString(7, orderDetail.getStatus());

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
