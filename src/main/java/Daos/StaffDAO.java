package Daos;

import Models.CustomerDTO;
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

    public List<OrderDTO> MyOrders(String StaffID, int serviceID)
            throws SQLException, ClassNotFoundException {

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        OrderDTO result = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select ord.OrderID, ser.ServiceName,acc.FullName, ord.OrderDate, ord.Status, "
                        + "ord.Pay_with,ord.Form_Receipt, ord.Total_Order, ord.Delivery_charges, ord.Discount "
                        + "from Orders ord "
                        + "inner join Service ser on ord.ServiceID = ser.ServiceID "
                        + "inner join Account acc on acc.AccountID = ord.AccountID "
                        + "where ord.StaffID = ? and ord.ServiceID = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, StaffID);
                stm.setInt(2, serviceID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String orderID = rs.getString("OrderID");
                    String serviceName = rs.getString("ServiceName");
                    String fullname = rs.getString("FullName");
                    Date orderDate = rs.getDate("OrderDate");
                    String status = rs.getString("Status");
                    String Form_Receipt = rs.getString("Form_Receipt");
                    float Total_Order = rs.getFloat("Total_Order");
                    float discount = rs.getFloat("Discount");
                    float delivery_charges = rs.getFloat("Delivery_charges");
                    String Pay_with = rs.getString("Pay_with");
                    result = new OrderDTO(orderID, serviceName, fullname, Form_Receipt,
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

    public boolean UpdateStaff(String accountID) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "update Staffs "
                        + "set Status = ? "
                        + "where StaffID = ?";
                stm = con.prepareStatement(sql);
                stm.setBoolean(1, false);
                stm.setString(2, accountID);
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

    public List<OrderDTO> GetDestroyListStaffOrders(String StaffID)
            throws SQLException, ClassNotFoundException {

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        OrderDTO result = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select ord.OrderID, ord.StaffID, ord.Status "
                        + "from Staffs sta inner join Orders ord "
                        + "on sta.StaffID = ord.StaffID "
                        + "where ord.StaffID = ? and ord.Status = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, StaffID);
                stm.setString(2, "Processing");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String orderID = rs.getString("OrderID");
                    String Staffid = rs.getString("StaffID");
                    String Status = rs.getString("Status");
                    result = new OrderDTO(orderID, Staffid, Status);
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

    public String createStafftID() throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select MAX(StaffID) as 'StaffID' "
                        + "From Staffs "
                        + "Where StaffID like ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, "S" + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String StaffIDMax = rs.getString("StaffID");
                    if (StaffIDMax == null) {
                        return "S01";
                    } else {
                        int num = Integer.parseInt(StaffIDMax.substring(1)) + 1;
                        String newOrderID;
                        if (num <= 9) {
                            newOrderID = "S0";
                        } else {
                            newOrderID = "S";
                        }

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

    public boolean createStaff(StaffDTO staff) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert into Staffs( "
                        + "StaffID, Name, Email, AccountID, ManagerID, Date_created, Status "
                        + ") values ( "
                        + "?, ?, ?, ?, ?, ?, ? "
                        + ")";
                stm = con.prepareStatement(sql);
                stm.setString(1, staff.getStaffID());
                stm.setString(2, staff.getName());
                stm.setString(3, staff.getEmail());
                stm.setString(4, staff.getAccountID());
                stm.setString(5, staff.getManagerID());
                stm.setDate(6, staff.getDate_created());
                stm.setBoolean(7, true);

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