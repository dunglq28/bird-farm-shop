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
                        return "O01";
                    } else {
                        int num = Integer.parseInt(OrderIDMax.substring(1)) + 1;
                        String newOrderID;
                        if (num <= 9) {
                            newOrderID = "O0";
                        } else {
                            newOrderID = "O";
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

    public boolean createOrder(OrderDTO order) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert into Orders ( "
                        + "OrderID, ServiceID, AccountID, StaffID, Form_Receipt, ShipperID, ShipAddress, ShipCity, OrderDate, ReceiptDate, Discount, Delivery_charges, "
                        + "Total_Order, Pay_with, Status "
                        + ") values ( "
                        + "?, ?,  ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? "
                        + ") ";
                stm = con.prepareStatement(sql);
                stm.setString(1, order.getOrderID());
                stm.setInt(2, order.getServiceID());
                stm.setString(3, order.getAccountID());
                stm.setString(4, order.getStaffID());
                stm.setString(5, order.getForm_Receipt());
                stm.setString(6, order.getShipperID());
                stm.setString(7, order.getShipAddress());
                stm.setString(8, order.getShipCity());
                stm.setDate(9, order.getOrderDate());
                stm.setDate(10, order.getReceiptDate());
                stm.setFloat(11, order.getDiscount());
                stm.setFloat(12, order.getDelivery_charges());
                stm.setFloat(13, order.getTotal_Order());
                stm.setString(14, order.getPayBy());
                stm.setString(15, order.getStatus());

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

    public List<OrderDTO> getOrderByAccountID(String accountId, String status_choose, int serID)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        OrderDTO result = null;
        String sql = null;

        try {
            //1.Make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2.Create SQL statement string
                if (status_choose.equals("All")) {
                    sql = "Select OrderID, od.ServiceID, ser.ServiceName, Form_Receipt, OrderDate, Discount, Delivery_charges, Total_Order, Pay_with, Status "
                            + "From Orders od "
                            + "inner join Service ser on ser.ServiceID = od.ServiceID "
                            + "where AccountID = ? and od.ServiceID = ? "
                            + "order by OrderDate desc ";
                } else {
                    sql = "Select OrderID, od.ServiceID, ser.ServiceName, Form_Receipt, OrderDate, Discount, Delivery_charges, Total_Order, Pay_with, Status "
                            + "From Orders od "
                            + "inner join Service ser on ser.ServiceID = od.ServiceID "
                            + "where AccountID = ? and od.ServiceID = ? and Status = ? "
                            + "order by OrderDate desc ";
                }

                //3.Create statement object
                stm = con.prepareStatement(sql);
                stm.setString(1, accountId);
                stm.setInt(2, serID);
                if (!status_choose.equals("All")) {
                    stm.setString(3, status_choose);
                }
                //4.execute-query
                rs = stm.executeQuery();
                //5.process
                while (rs.next()) {
                    String orderID = rs.getString("OrderID");
                    int serviceID = rs.getInt("ServiceID");
                    String serviceName = rs.getString("ServiceName");
                    String form_Receipt = rs.getString("Form_Receipt");
                    Date orderDate = rs.getDate("OrderDate");
                    float discount = rs.getFloat("Discount");
                    float delivery_charges = rs.getFloat("Delivery_charges");
                    float total_Order = rs.getFloat("Total_Order");
                    String pay_with = rs.getString("Pay_with");
                    String status = rs.getString("Status");

                    result = new OrderDTO(orderID, serviceID, serviceName, form_Receipt, orderDate, discount, delivery_charges, total_Order, pay_with, status);
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

    public List<OrderDTO> ViewNewStaffOrders()
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
                        + "where ord.Status = 'Wait for confirmation' ";

                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String orderID = rs.getString("OrderID");
                    String serviceName = rs.getString("ServiceName");
                    String fullname = rs.getString("FullName");
                    Date orderDate = rs.getDate("OrderDate");
                    String Form_Receipt = rs.getString("Form_Receipt");
                    float Total_Order = rs.getFloat("Total_Order");
                    String Pay_with = rs.getString("Pay_with");
                    String status = rs.getString("Status");
                    float discount = rs.getFloat("Discount");
                    float delivery_charges = rs.getFloat("Delivery_charges");
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

    public boolean takeActionOrder(String StaffID, String OrderID, String status) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Update Orders "
                        + "set Status = ?, StaffID = ? "
                        + "where OrderID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, status);
                stm.setString(2, StaffID);
                stm.setString(3, OrderID);
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

    public boolean UpdateStatusOrder(String OrderID, String status) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Update Orders "
                        + "set Status = ? "
                        + "where OrderID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, status);
                stm.setString(2, OrderID);
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
