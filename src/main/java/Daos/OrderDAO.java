/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Models.OrderDTO;
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
public class OrderDAO implements Serializable {

    public String createOrderID() throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select MAX(OrderID) as 'OrderID' "
                        + "From Orders "
                        + "Where OrderID like ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, "O" + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String OrderIDMax = rs.getString("OrderID");
                    if (OrderIDMax == null) {
                        return "O1";
                    } else {
                        int num = Integer.parseInt(OrderIDMax.substring(1)) + 1;
                        String newOrderID = "O";
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

    public boolean createOrder(OrderDTO order) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert into Orders ( "
                        + "OrderID, AccountID, StaffID, Form_Receipt, ShipperID, OrderDate, ReceiptDate, Discount, Delivery_charges, "
                        + "Total_Order, Pay_with, Status "
                        + ") values ( "
                        + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? "
                        + ") ";
                stm = con.prepareStatement(sql);
                stm.setString(1, order.getOrderID());
                stm.setString(2, order.getAccountID());
                stm.setString(3, order.getStaffID());
                stm.setString(4, order.getForm_Receipt());
                stm.setString(5, order.getShipperID());
                stm.setDate(6, order.getOrderDate());
                stm.setDate(7, order.getReceiptDate());
                stm.setFloat(8, order.getDiscount());
                stm.setFloat(9, order.getDelivery_charges());
                stm.setFloat(10, order.getTotal_Order());
                stm.setString(11, order.getPayBy());
                stm.setString(12, order.getStatus());

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
