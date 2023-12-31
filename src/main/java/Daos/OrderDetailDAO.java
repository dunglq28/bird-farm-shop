/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Models.ProductDTO;
import Models.OrderDetailDTO;
import Object.Products;
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

    private List<Products> orderDetailList;

    public List<Products> getOrderTailList() {
        return orderDetailList;
    }

    private List<ProductDTO> ODList;

    public List<ProductDTO> getODList() {
        return ODList;
    }

    public boolean createOrderDetail(OrderDetailDTO orderDetail) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert into Order_Details ( "
                        + "OrderID, ProductID, Price, Quantity_Buy "
                        + ") values ( "
                        + "?, ?, ?, ? "
                        + ") ";
                stm = con.prepareStatement(sql);
                stm.setString(1, orderDetail.getOrderID());
                stm.setString(2, orderDetail.getProductID());
                stm.setFloat(3, orderDetail.getPrice());
                stm.setInt(4, orderDetail.getQuantity_Buy());

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

    public List<Products> getOrderDetailByOrderID(String orderId)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Products result = null;
        try {
            //1.Make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = null;
                //2.Create SQL statement string
                sql = "select product.Product_Name, od.Price, od.Quantity_Buy, product.Image, product.Color, product.Age, product.Gender, "
                        + "product.Quantity_MaleBird ,product.Quantity_FemaleBird, cate.Category_Name "
                        + "from Order_Details od "
                        + "inner join Products product on product.ProductID = od.ProductID "
                        + "inner join Category cate on cate.CategoryID = product.CategoryID "
                        + "where OrderID = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, orderId);
                //4.execute-query
                rs = stm.executeQuery();
                //5.process
                while (rs.next()) {
                    String product_Name = rs.getString("Product_Name");
                    float price = rs.getFloat("Price");
                    int quantity_Buy = rs.getInt("Quantity_Buy");
                    int quantity_MaleBird = rs.getInt("Quantity_MaleBird");
                    int quantity_FemaleBird = rs.getInt("Quantity_FemaleBird");
                    String image = rs.getString("Image");
                    String color = rs.getString("Color");
                    String age = rs.getString("Age");
                    String gender = rs.getString("Gender");
                    String cate_Name = rs.getString("Category_Name");
                    result = new Products(product_Name, cate_Name, age, color, gender, image, quantity_Buy, quantity_MaleBird, quantity_FemaleBird, price);
                    if (this.orderDetailList == null) {
                        this.orderDetailList = new ArrayList<Products>();
                    }
                    this.orderDetailList.add(result);
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
        return this.orderDetailList;
    }

    public Products getOrderDetailProductGenderByOrderID(String orderId, String gender)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Products result = null;
        try {
            //1.Make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = null;
                //2.Create SQL statement string
                sql = "select od.ProductID, od.Price "
                        + "from Order_Details od "
                        + "inner join Products pro on pro.ProductID = od.ProductID "
                        + "where od.OrderID = ? and pro.Gender = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, orderId);
                stm.setString(2, gender);
                //4.execute-query
                rs = stm.executeQuery();
                //5.process
                while (rs.next()) {
                    Products pro = new Products(rs.getString("ProductID"), null, rs.getFloat("Price"));
                    return pro;
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

    public List<Products> getOrderDetailProductByOrderID(String orderId)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1.Make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = null;
                //2.Create SQL statement string
                sql = "select ProductID, Quantity_Buy  "
                        + "from Order_Details "
                        + "where OrderID = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, orderId);
                //4.execute-query
                rs = stm.executeQuery();
                //5.process
                while (rs.next()) {
                    Products pro = new Products(rs.getString("ProductID"), rs.getInt("Quantity_Buy"));
                    if (this.orderDetailList == null) {
                        this.orderDetailList = new ArrayList<Products>();
                    }
                    this.orderDetailList.add(pro);
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
        return this.orderDetailList;
    }

    public List<ProductDTO> getParentProductByOrderID(String orderId)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<ProductDTO> listParent = null;
        try {
            //1.Make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = null;
                //2.Create SQL statement string
                sql = "select pro.ProductID, pro.Product_Name, pro.Gender, od.Price, pro.Image, pro.Color "
                        + "from Order_Details od "
                        + "inner join Products pro on pro.ProductID = od.ProductID "
                        + "where od.OrderID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, orderId);
                //4.execute-query
                rs = stm.executeQuery();
                //5.process
                while (rs.next()) {
                    ProductDTO pro = new ProductDTO(rs.getString("ProductID"), rs.getString("Product_Name"), rs.getString("Color"), rs.getString("Gender"), rs.getString("Image"), rs.getFloat("Price"));
                    if (listParent == null) {
                        listParent = new ArrayList<>();
                    }
                    listParent.add(pro);
                }
                return listParent;
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