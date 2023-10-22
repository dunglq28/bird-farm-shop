package Daos;

import Models.OrderDTO;
import Models.StaffDTO;
import Utils.DBHelper;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StaffDAO {

    public StaffDTO getStaffByAccountID(String accountId)
            throws SQLException, ClassNotFoundException {

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        StaffDTO result = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select sta.StaffID, sta.Name, sta.Email, "
                        + "sta.Phone_Number, sta.DOB, sta.Gender, "
                        + "sta.ManagerID, sta.AccountID, sta.Date_created, sta.Status "
                        + "from Staffs sta inner join Account acc on "
                        + "sta.AccountID = acc.AccountID "
                        + "where acc.AccountID = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, accountId);
                rs = stm.executeQuery();
                if (rs.next()) {
                    return result = new StaffDTO(
                            rs.getString("StaffID"),
                            rs.getString("Name"),
                            rs.getString("Email"),
                            rs.getString("Phone_Number"),
                            rs.getString("DOB"),
                            rs.getString("Gender"),
                            rs.getString("ManagerID"),
                            rs.getString("AccountID"),
                            rs.getDate("Date_created"),
                            rs.getBoolean("Status"));
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

    private List<OrderDTO> orderList;

    public List<OrderDTO> getOrderList() {
        return orderList;
    }

    public List<OrderDTO> MyOrders(String StaffID)
            throws SQLException, ClassNotFoundException {

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        OrderDTO result = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select ord.OrderID, ser.ServiceName, "
                        + "ord.OrderDate, ord.Status, ord.Pay_with, "
                        + "ord.Form_Receipt, ord.Total_Order, "
                        + "ord.Discount, ord.Delivery_charges "
                        + "from Orders ord inner join Service ser on "
                        + "ord.ServiceID = ser.ServiceID inner join Account acc on "
                        + "acc.AccountID = ord.AccountID inner join Staffs sta on "
                        + "ord.StaffID = sta.StaffID "
                        + "where sta.StaffID = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, StaffID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String orderID = rs.getString("OrderID");
                    String serviceName = rs.getString("ServiceName");
                    Date orderDate = rs.getDate("OrderDate");
                    String status = rs.getString("Status");
                    String Form_Receipt = rs.getString("Form_Receipt");
                    float Total_Order = rs.getFloat("Total_Order");
                    float discount = rs.getFloat("Discount");
                    float delivery_charges = rs.getFloat("Delivery_charges");
                    String Pay_with = rs.getString("Pay_with");
                    result = new OrderDTO(orderID, serviceName, Form_Receipt,
                            orderDate, Total_Order, Pay_with, status, discount, delivery_charges);
                    if (this.orderList == null) {
                        this.orderList = new ArrayList<OrderDTO>();
                    }
                    this.orderList.add(result);
                }
                return this.orderList;
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

    public List<OrderDTO> ViewAllStaffOrders()
            throws SQLException, ClassNotFoundException {

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        OrderDTO result = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select ord.OrderID, ser.ServiceName, "
                        + "ord.OrderDate, ord.Status, ord.Pay_with, "
                        + "ord.Form_Receipt, ord.Total_Order, "
                        + "ord.Delivery_charges, ord.Discount "
                        + "from Orders ord inner join Service ser on "
                        + "ord.ServiceID = ser.ServiceID inner join Account acc on "
                        + "acc.AccountID = ord.AccountID "
                        + "where ord.Status = 'Wait for confirmation'";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String orderID = rs.getString("OrderID");
                    String serviceName = rs.getString("ServiceName");
                    Date orderDate = rs.getDate("OrderDate");
                    String Form_Receipt = rs.getString("Form_Receipt");
                    float Total_Order = rs.getFloat("Total_Order");
                    String Pay_with = rs.getString("Pay_with");
                    String status = rs.getString("Status");
                    float discount = rs.getFloat("Discount");
                    float delivery_charges = rs.getFloat("Delivery_charges");
                    result = new OrderDTO(orderID, serviceName, Form_Receipt,
                            orderDate, Total_Order, Pay_with, status, discount, delivery_charges);
                    if (this.orderList == null) {
                        this.orderList = new ArrayList<OrderDTO>();
                    }
                    this.orderList.add(result);
                }
                return this.orderList;
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
