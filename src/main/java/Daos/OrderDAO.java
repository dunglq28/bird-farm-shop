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
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

    private List<OrderDTO> orderList;

    public List<OrderDTO> getOrderList() {
        return orderList;
    }

    public List<OrderDTO> getOrderByAccountID(String accountId)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        OrderDTO result = null;
        try {
            //1.Make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2.Create SQL statement string
                String sql = "Select OrderID, Form_Receipt, OrderDate, Discount, Delivery_charges, Total_Order, Pay_with, Status "
                        + "From Orders "
                        + "where AccountID = ? ";
                //3.Create statement object
                stm = con.prepareStatement(sql);
                stm.setString(1, accountId);
                //4.execute-query
                rs = stm.executeQuery();
                //5.process
                while (rs.next()) {
                    String orderID = rs.getString("OrderID");
                    String form_Receipt = rs.getString("Form_Receipt");
                    Date orderDate = rs.getDate("OrderDate");
                    float discount = rs.getFloat("Discount");
                    float delivery_charges = rs.getFloat("Delivery_charges");
                    float total_Order = rs.getFloat("Total_Order");
                    String pay_with = rs.getString("Pay_with");
                    String status = rs.getString("Status");

                    result = new OrderDTO(orderID, form_Receipt, orderDate, discount, delivery_charges, total_Order, pay_with, status);
                    if (this.orderList == null) {
                        this.orderList = new ArrayList<OrderDTO>();
                    }
                    this.orderList.add(result);
                }
                return this.orderList;

            }//end connection has opened

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
