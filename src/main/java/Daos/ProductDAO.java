/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Models.ProductDTO;
import Utils.DBHelper;
import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author hj
 */
public class ProductDAO implements Serializable {

    private List<ProductDTO> productList;

    public List<ProductDTO> getProductList() {
        return productList;
    }

    public List<ProductDTO> getPagingByCreateDateDesc(int index, String product_typeID, String searchValue, int fieldShow)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select ProductID, Product_Name, cate.Category_Name, Product_TypeID, Image, Age, Color, Gender, "
                        + "Quantity_Available, Quantity_MaleBird, Quantity_FemaleBird, Price, Discount, Quantity_Sold, Status "
                        + "from Products "
                        + "inner join Category cate on Products.CategoryID =  cate.CategoryID "
                        + "where Product_TypeID like ? and Product_Name like ? and Status = 'true'  "
                        + "or Product_TypeID like ? and cate.Category_Name like ?  and Status = 'true'  "
                        + "or Product_TypeID like ? and ProductID like ? and Status = 'true' "
                        + "Order by Product_TypeID asc, Date_created desc "
                        + "OFFSET ? ROWS "
                        + "FETCH FIRST ? ROWS ONLY";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + product_typeID + "%");
                stm.setString(2, "%" + searchValue + "%");
                stm.setString(3, "%" + product_typeID + "%");
                stm.setString(4, "%" + searchValue + "%");
                stm.setString(5, "%" + product_typeID + "%");
                stm.setString(6, "%" + searchValue + "%");
                stm.setInt(7, (index - 1) * fieldShow);
                stm.setInt(8, fieldShow);
                rs = stm.executeQuery();
                while (rs.next()) {
                    ProductDTO result = new ProductDTO(rs.getString("ProductID"),
                            rs.getString("Product_Name"),
                            rs.getString("Category_Name"),
                            rs.getInt("Product_TypeID"),
                            rs.getString("Age"),
                            rs.getString("Color"),
                            rs.getString("Gender"),
                            rs.getString("Image"),
                            rs.getInt("Quantity_MaleBird"),
                            rs.getInt("Quantity_FemaleBird"),
                            rs.getInt("Quantity_Available"),
                            0,
                            rs.getInt("Quantity_Sold"),
                            rs.getFloat("Price"),
                            rs.getFloat("Discount"),
                            rs.getBoolean("Status"));
                    if (this.productList == null) {
                        this.productList = new ArrayList<ProductDTO>();
                    }
                    this.productList.add(result);
                }
                return this.productList;
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

    public int getNumberPage(String product_typeID, String searchValue, int fieldShow)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select count(*) "
                        + "From Products "
                        + "inner join Category cate on Products.CategoryID =  cate.CategoryID "
                        + "where Product_TypeID like ? and Product_Name like ? and Status = 'true' "
                        + "or Product_TypeID like ? and cate.Category_Name like ?  and Status = 'true' "
                        + "or Product_TypeID like ? and ProductID like ? and Status = 'true' ";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + product_typeID + "%");
                stm.setString(2, "%" + searchValue + "%");
                stm.setString(3, "%" + product_typeID + "%");
                stm.setString(4, "%" + searchValue + "%");
                stm.setString(5, "%" + product_typeID + "%");
                stm.setString(6, "%" + searchValue + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    int total = rs.getInt(1);
                    int countPage = total / fieldShow;
                    if (countPage % fieldShow != 0 && countPage % 2 != 0) {
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

    public List<ProductDTO> viewAllProduct(int index, String product_typeID, String searchValue, int fieldShow)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select ProductID, Product_Name, cate.Category_Name, Product_TypeID, Image, Age, Color, Gender, "
                        + "Quantity_Available, Quantity_AreMating, Quantity_MaleBird, Quantity_FemaleBird, Price, Discount, Quantity_Sold, Status "
                        + "from Products "
                        + "inner join Category cate on Products.CategoryID =  cate.CategoryID "
                        + "where Product_TypeID like ? and Product_Name like ? "
                        + "or Product_TypeID like ? and cate.Category_Name like ? "
                        + "or Product_TypeID like ? and ProductID like ? "
                        + "Order by Product_TypeID asc, Date_created desc "
                        + "OFFSET ? ROWS "
                        + "FETCH FIRST ? ROWS ONLY";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + product_typeID + "%");
                stm.setString(2, "%" + searchValue + "%");
                stm.setString(3, "%" + product_typeID + "%");
                stm.setString(4, "%" + searchValue + "%");
                stm.setString(5, "%" + product_typeID + "%");
                stm.setString(6, "%" + searchValue + "%");
                stm.setInt(7, (index - 1) * fieldShow);
                stm.setInt(8, fieldShow);
                rs = stm.executeQuery();
                while (rs.next()) {
                    ProductDTO result = new ProductDTO(rs.getString("ProductID"),
                            rs.getString("Product_Name"),
                            rs.getString("Category_Name"),
                            rs.getInt("Product_TypeID"),
                            rs.getString("Age"),
                            rs.getString("Color"),
                            rs.getString("Gender"),
                            rs.getString("Image"),
                            rs.getInt("Quantity_MaleBird"),
                            rs.getInt("Quantity_FemaleBird"),
                            rs.getInt("Quantity_Available"),
                            rs.getInt("Quantity_AreMating"),
                            rs.getInt("Quantity_Sold"),
                            rs.getFloat("Price"),
                            rs.getFloat("Discount"),
                            rs.getBoolean("Status"));
                    if (this.productList == null) {
                        this.productList = new ArrayList<ProductDTO>();
                    }
                    this.productList.add(result);
                }
                return this.productList;
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

    public int getNumberPageAllProduct(String product_typeID, String searchValue, int fieldShow)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select count(*) "
                        + "From Products "
                        + "inner join Category cate on Products.CategoryID =  cate.CategoryID "
                        + "where Product_TypeID like ? and Product_Name like ? "
                        + "or Product_TypeID like ? and cate.Category_Name like ?  "
                        + "or Product_TypeID like ? and ProductID like ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + product_typeID + "%");
                stm.setString(2, "%" + searchValue + "%");
                stm.setString(3, "%" + product_typeID + "%");
                stm.setString(4, "%" + searchValue + "%");
                stm.setString(5, "%" + product_typeID + "%");
                stm.setString(6, "%" + searchValue + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    int total = rs.getInt(1);
                    int countPage = total / fieldShow;
                    if (countPage % fieldShow != 0 && countPage % 2 != 0) {
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

    public int getNumberOfProduct()
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select count(*) "
                        + "From Products ";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
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

    public List<ProductDTO> getProductByName(String product_name)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1.Make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2.Create SQL statement string
                String sql = "Select * "
                        + "From Products "
                        + "Where Product_Name like ? and Product_TypeID = 1 and Status = 'true' ";
                //3.Create statement object
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + product_name + "%");
                //4.execute-query
                rs = stm.executeQuery();
                //5.process
                while (rs.next()) {
                    String productID = rs.getString("ProductID");
                    String product_Name = rs.getString("Product_Name");
                    int categoryID = rs.getInt("CategoryID");
                    String image = rs.getString("Image");
                    String age = rs.getString("Age");
                    String color = rs.getString("Color");
                    String gender = rs.getString("Gender");
                    int quantity = rs.getInt("Quantity_Available");
                    float price = rs.getFloat("Price");
                    float discount = rs.getFloat("Discount");
                    String characteristics = rs.getString("Characteristics");
                    String detail = rs.getString("Detail");
                    Date date_created = rs.getDate("Date_created");
                    boolean status = rs.getBoolean("Status");

                    ProductDTO dto = new ProductDTO(productID, product_Name, categoryID, age, color,
                            gender, image, quantity, price,
                            characteristics, detail, date_created, discount, status);

                    if (this.productList == null) {
                        this.productList = new ArrayList<ProductDTO>();

                    }
                    this.productList.add(dto);
                }
                return this.productList;
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

    public ProductDTO getProductByID(String id)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select * "
                        + "From Products "
                        + "inner join Category cate on Products.CategoryID =  cate.CategoryID "
                        + "Where ProductID = ? and Status = 'true' ";
                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    ProductDTO product = new ProductDTO(
                            rs.getString("ProductID"),
                            rs.getString("Product_Name"),
                            rs.getInt("CategoryID"),
                            rs.getString("Category_Name"),
                            rs.getInt("Product_TypeID"),
                            rs.getString("Dad_Bird_ID"),
                            rs.getString("Mom_Bird_ID"),
                            rs.getString("Age"),
                            rs.getString("Color"),
                            rs.getString("Gender"),
                            rs.getString("Image"),
                            rs.getInt("Quantity_MaleBird"),
                            rs.getInt("Quantity_FemaleBird"),
                            rs.getInt("Quantity_Available"),
                            rs.getInt("Quantity_Sold"),
                            rs.getFloat("Price"),
                            rs.getString("Characteristics"),
                            rs.getString("Detail"),
                            rs.getDate("Date_created"),
                            rs.getFloat("Discount"),
                            rs.getBoolean("Status"));
                    return product;
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

    public ProductDTO getAllQuantityByProductID(String id)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select ProductID, Quantity_Available, Quantity_AreMating, Quantity_Sold "
                        + "From Products "
                        + "Where ProductID = ? and Status = 'true' ";
                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    ProductDTO product = new ProductDTO(
                            rs.getString("ProductID"),
                            rs.getInt("Quantity_Available"),
                            rs.getInt("Quantity_AreMating"),
                            rs.getInt("Quantity_Sold"));
                    return product;
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

    public boolean updateQuantityAfterOrder(int quantity_available, int quantity_AreMating, int quantity_sold, String birdID)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            //1. Make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. create SQL statement string
                String sql = "Update Products "
                        + "Set Quantity_Available = ?, Quantity_AreMating = ?, Quantity_Sold = ? "
                        + "Where productID = ? and Status = 'true' ";
                //3. Create statement object
                stm = con.prepareStatement(sql);
                stm.setInt(1, quantity_available);
                stm.setInt(2, quantity_AreMating);
                stm.setInt(3, quantity_sold);
                stm.setString(4, birdID);
                //4. Excute query
                int effectRows = stm.executeUpdate();
                //5. Process
                if (effectRows > 0) {
                    return true;
                }
            } // end of connection has opend

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

    public List<ProductDTO> getBirdByGender(String gender, int cateID, int quantity)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        this.productList = new ArrayList<ProductDTO>();
        try {
            //1.Make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2.Create SQL statement string
                String sql = "select ProductID , Product_Name, Image, Age, Color, Gender, Quantity_Available, Quantity_AreMating, Quantity_Sold, Price, Discount "
                        + "from Products "
                        + "where Gender = ? and Age in('Adult', 'Mature', 'Young') and Quantity_Available >= ? "
                        + "and CategoryID = ? and Status = 'true' ";
                //3.Create statement object
                stm = con.prepareStatement(sql);
                //4.execute-query
                stm.setString(1, gender);
                stm.setInt(2, quantity);
                stm.setInt(3, cateID);
                rs = stm.executeQuery();
                //5.process
                while (rs.next()) {
                    ProductDTO dto = new ProductDTO(rs.getString("ProductID"),
                            rs.getString("Product_Name"),
                            rs.getString("Age"),
                            rs.getString("Color"),
                            rs.getString("Gender"),
                            rs.getString("Image"),
                            rs.getInt("Quantity_Available"),
                            rs.getInt("Quantity_AreMating"),
                            rs.getInt("Quantity_Sold"),
                            rs.getFloat("Price"),
                            rs.getFloat("Discount"));
                    this.productList.add(dto);
                }
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
        return this.productList;
    }

    public String createProductID() throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select MAX(CAST(SUBSTRING(ProductID,2,LEN(ProductID)) AS INT)) as 'ProductID'  "
                        + "From Products "
                        + "Where ProductID like ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, "B" + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    int ProductIDMax = rs.getInt("ProductID");
                    if (ProductIDMax == 0) {
                        return "B01";
                    } else {
                        int num = ProductIDMax + 1;
                        String newProductID;
                        if (num <= 9) {
                            newProductID = "B0";
                        } else {
                            newProductID = "B";
                        }

                        return newProductID.concat(String.valueOf(num));
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

    public boolean createProduct(ProductDTO product) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert into Products ( "
                        + "ProductID, Product_Name, CategoryID, Product_TypeID, Dad_Bird_ID, Mom_Bird_ID, Image, Age, Color, Gender, "
                        + "Quantity_Available, Quantity_AreMating, Quantity_Sold, Quantity_MaleBird, Quantity_FemaleBird, Price, "
                        + "Discount, Characteristics, Detail, Date_created, Status "
                        + ") values ( "
                        + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? "
                        + ") ";
                stm = con.prepareStatement(sql);
                stm.setString(1, product.getProductID());
                stm.setString(2, product.getProduct_Name());
                stm.setInt(3, product.getCategoryID());
                stm.setInt(4, product.getProduct_TypeID());
                stm.setString(5, product.getDad_Bird_ID());
                stm.setString(6, product.getMom_Bird_ID());
                stm.setString(7, product.getImage());
                stm.setString(8, product.getAge());
                stm.setString(9, product.getColor());
                stm.setString(10, product.getGender());
                stm.setInt(11, product.getQuantity_Available());
                stm.setInt(12, product.getQuantity_AreMating());
                stm.setInt(13, product.getQuantity_Sold());
                stm.setInt(14, product.getQuantity_MaleBird());
                stm.setInt(15, product.getQuantity_FemaleBird());
                stm.setFloat(16, product.getPrice());
                stm.setFloat(17, product.getDiscount());
                stm.setString(18, product.getCharacteristics());
                stm.setString(19, product.getDetail());
                stm.setDate(20, product.getDate_created());
                stm.setBoolean(21, true);
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

    public boolean DeleteProductByProductID(String proID) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Delete "
                        + "From Products "
                        + "Where ProductID = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, proID);
                int effecRows = stm.executeUpdate();
                if (effecRows > 0) {
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

    public boolean updateProduct(ProductDTO pro)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            //1. Make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. create SQL statement string
                String sql = "Update Products "
                        + "Set Product_Name = ?, Dad_Bird_ID = ?, Mom_Bird_ID = ?, Image = ?, Age = ?, Color = ?, Gender = ?, "
                        + "Quantity_Available = ?, Quantity_MaleBird = ?, Quantity_FemaleBird = ?, Price = ?, Discount = ?, "
                        + "Characteristics = ?, Detail = ? "
                        + "Where ProductID = ? ";
                //3. Create statement object
                stm = con.prepareStatement(sql);
                stm.setString(1, pro.getProduct_Name());
                stm.setString(2, pro.getDad_Bird_ID());
                stm.setString(3, pro.getMom_Bird_ID());
                stm.setString(4, pro.getImage());
                stm.setString(5, pro.getAge());
                stm.setString(6, pro.getColor());
                stm.setString(7, pro.getGender());
                stm.setInt(8, pro.getQuantity_Available());
                stm.setInt(9, pro.getQuantity_MaleBird());
                stm.setInt(10, pro.getQuantity_FemaleBird());
                stm.setFloat(11, pro.getPrice());
                stm.setFloat(12, pro.getDiscount());
                stm.setString(13, pro.getCharacteristics());
                stm.setString(14, pro.getDetail());
                stm.setString(15, pro.getProductID());
                int effectRows = stm.executeUpdate();
                //5. Process
                if (effectRows > 0) {
                    return true;
                }
            } // end of connection has opend

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

    public boolean UpdateProductStatus(String productID, boolean status) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "update Products "
                        + "set Status = ? "
                        + "where ProductID = ?";
                stm = con.prepareStatement(sql);
                stm.setBoolean(1, status);
                stm.setString(2, productID);
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
