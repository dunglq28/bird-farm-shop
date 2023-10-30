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
                        + "OrderID, ServiceID, AccountID, StaffID, Form_Receipt, ShipperID, ShipAddress, ShipCity,PhoneNumber, OrderDate, ReceiptDate, "
                        + "Discount, Delivery_charges, Deposit_Price, Total_Order, Pay_with, Status "
                        + ") values ( "
                        + "?, ?,  ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? "
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
                stm.setString(9, order.getPhoneNumber());
                stm.setDate(10, order.getOrderDate());
                stm.setDate(11, order.getReceiptDate());
                stm.setFloat(12, order.getDiscount());
                stm.setFloat(13, order.getDelivery_charges());
                stm.setFloat(14, order.getDeposit_Price());
                stm.setFloat(15, order.getTotal_Order());
                stm.setString(16, order.getPayBy());
                stm.setString(17, order.getStatus());

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

    public boolean UpdateOrder(String orderID, String foRecp, float deliChar, float totalOrder, String payW)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Update Orders "
                        + "Set Form_Receipt = ?, Delivery_charges = ?, Total_Order = ?, Pay_with = ? "
                        + "Where OrderID = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, foRecp);
                stm.setFloat(2, deliChar);
                stm.setFloat(3, totalOrder);
                stm.setString(4, payW);
                stm.setString(5, orderID);

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
        try {
            //1.Make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2.Create SQL statement string
                String sql = "Select OrderID, od.ServiceID, ser.ServiceName, Form_Receipt, OrderDate, Discount, "
                        + "Delivery_charges, Deposit_Price, Total_Order, Pay_with, Status "
                        + "From Orders od "
                        + "inner join Service ser on ser.ServiceID = od.ServiceID "
                        + "where AccountID = ? and od.ServiceID = ? and Status like ? "
                        + "order by OrderDate desc, OrderID desc ";

                //3.Create statement object
                stm = con.prepareStatement(sql);
                stm.setString(1, accountId);
                stm.setInt(2, serID);
                stm.setString(3, "%" + status_choose + "%");
                //4.execute-query
                rs = stm.executeQuery();
                //5.process
                while (rs.next()) {
                    result = new OrderDTO(rs.getString("OrderID"),
                            rs.getInt("ServiceID"),
                            rs.getString("ServiceName"),
                            rs.getString("Form_Receipt"),
                            rs.getDate("OrderDate"),
                            rs.getFloat("Discount"),
                            rs.getFloat("Delivery_charges"),
                            rs.getFloat("Deposit_Price"),
                            rs.getFloat("Total_Order"),
                            rs.getString("Pay_with"),
                            rs.getString("Status"));
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

    public List<OrderDTO> ViewNewStaffOrders(int page, String searchValue)
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
                        + "where ord.Status = 'Wait for confirmation' and ord.OrderID like ? "
                        + "or ord.Status = 'Wait for confirmation' and acc.FullName like ? "
                        + "Order by ord.OrderDate desc "
                        + "OFFSET ? ROWS "
                        + "FETCH FIRST 10 ROWS ONLY ";

                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                stm.setString(2, "%" + searchValue + "%");
                stm.setInt(3, (page - 1) * 10);
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

    public int getNewOrderPage(String searchValue)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select count(*) "
                        + "from Orders ord "
                        + "inner join Account acc on acc.AccountID = ord.AccountID "
                        + "where ord.Status = 'Wait for confirmation' and ord.OrderID like ? "
                        + "or ord.Status = 'Wait for confirmation' and acc.FullName like ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                stm.setString(2, "%" + searchValue + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    int total = rs.getInt(1);
                    int countPage = total / 10;
                    if (countPage % 10 != 0 && countPage % 2 != 0) {
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

    public int getNumberOfNewOrder()
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select count(*) as 'Number of new order' "
                        + "from Orders  "
                        + "where Status = 'Wait for confirmation' ";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt("Number of new order");
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

    public List<OrderDTO> MyOrders(String StaffID, int serviceID, String status_choose, int page, String searchValue)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        OrderDTO result = null;
        String sql = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {

                sql = "select ord.OrderID, ser.ServiceName,acc.FullName, ord.OrderDate, ord.Status, "
                        + "ord.Pay_with,ord.Form_Receipt, ord.Total_Order, ord.Delivery_charges, ord.Discount "
                        + "from Orders ord "
                        + "inner join Service ser on ord.ServiceID = ser.ServiceID "
                        + "inner join Account acc on acc.AccountID = ord.AccountID "
                        + "where ord.StaffID = ? and ord.ServiceID = ? and ord.Status like ? and ord.OrderID like ? "
                        + "or ord.StaffID = ? and ord.ServiceID = ? and ord.Status like ? and acc.FullName like ? "
                        + "Order by ord.OrderDate desc "
                        + "OFFSET ? ROWS "
                        + "FETCH FIRST 6 ROWS ONLY ";

                stm = con.prepareStatement(sql);
                stm.setString(1, StaffID);
                stm.setInt(2, serviceID);
                stm.setString(3, "%" + status_choose + "%");
                stm.setString(4, "%" + searchValue + "%");
                stm.setString(5, StaffID);
                stm.setInt(6, serviceID);
                stm.setString(7, "%" + status_choose + "%");
                stm.setString(8, "%" + searchValue + "%");
                stm.setInt(9, (page - 1) * 6);
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

    public int getMyOrderPage(String StaffID, int serviceID, String status_choose, String searchValue)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select count(*) "
                        + "From Orders ord "
                        + "inner join Account acc on acc.AccountID = ord.AccountID "
                        + "where ord.StaffID = ? and ord.ServiceID = ? and ord.Status like ? and ord.OrderID like ? "
                        + "or ord.StaffID = ? and ord.ServiceID = ? and ord.Status like ? and acc.FullName like ? ";

                stm = con.prepareStatement(sql);
                stm.setString(1, StaffID);
                stm.setInt(2, serviceID);
                stm.setString(3, "%" + status_choose + "%");
                stm.setString(4, "%" + searchValue + "%");
                stm.setString(5, StaffID);
                stm.setInt(6, serviceID);
                stm.setString(7, "%" + status_choose + "%");
                stm.setString(8, "%" + searchValue + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    int total = rs.getInt(1);
                    int countPage = total / 6;
                    if (countPage % 6 != 0 && countPage % 2 != 0) {
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

    public OrderDTO getOrderByOrderID(String orderID)
            throws SQLException, ClassNotFoundException {

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        OrderDTO result = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select OrderID, ServiceID, Form_Receipt, acc.FullName, StaffID, ShipAddress, ShipCity, PhoneNumber, "
                        + "Delivery_charges, Deposit_Price, Total_Order, OrderDate, ord.Status "
                        + "from Orders ord "
                        + "inner join Account acc on acc.AccountID = ord.AccountID  "
                        + "where OrderID = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, orderID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return result = new OrderDTO(rs.getString("OrderID"),
                            rs.getInt("ServiceID"),
                            rs.getString("FullName"),
                            rs.getString("StaffID"),
                            rs.getString("Form_Receipt"),
                            rs.getString("ShipAddress"),
                            rs.getString("ShipCity"),
                            rs.getString("PhoneNumber"),
                            rs.getDate("OrderDate"),
                            rs.getFloat("Delivery_charges"),
                            rs.getFloat("Deposit_Price"),
                            rs.getFloat("Total_Order"),
                            rs.getString("Status"));
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
        return null;
    }


}

}

