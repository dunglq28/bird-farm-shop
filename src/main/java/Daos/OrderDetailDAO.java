/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Models.BirdDTO;
import Models.OrderDetailDTO;
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

    private List<OrderDetailDTO> orderDetailList;

    public List<OrderDetailDTO> getOrderTailList() {
        return orderDetailList;
    }

    public List<OrderDetailDTO> getOrderDetailByOrderID(String orderId)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        OrderDetailDTO result = null;
        try {
            //1.Make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2.Create SQL statement string
                String sql = "select bird.Bird_Name, od.Price, od.Quantity_Buy, bird.Image, bird.Color, bird.Age, bird.Gender, cate.Category_Name "
                        + "from Order_Details od "
                        + "inner join Birds bird on bird.BirdID = od.BirdID "
                        + "inner join Category cate on cate.CategoryID = bird.CategoryID "
                        + "where OrderID = ? ";
                //3.Create statement object
                stm = con.prepareStatement(sql);
                stm.setString(1, orderId);
                //4.execute-query
                rs = stm.executeQuery();
                //5.process
                while (rs.next()) {
                    String bird_Name = rs.getString("Bird_Name");
                    float price = rs.getFloat("Price");
                    int quantity_Buy = rs.getInt("Quantity_Buy");
                    String image = rs.getString("Image");
                    String color = rs.getString("Color");
                    String age = rs.getString("Age");
                    String gender = rs.getString("Gender");
                    String cate_Name = rs.getString("Category_Name");
                    result = new OrderDetailDTO(bird_Name, cate_Name, gender, image, color, age, price, quantity_Buy);
                    if (this.orderDetailList == null) {
                        this.orderDetailList = new ArrayList<OrderDetailDTO>();
                    }
                    this.orderDetailList.add(result);
                }
                return this.orderDetailList;

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
