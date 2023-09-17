/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Models.CustomerDTO;
import Utils.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author hj
 */
public class CustomerDAO {

    public boolean createCustomer(CustomerDTO customer) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert into Customers ( "
                        + "CustomerID, AccountID, FullName, Gender, Email, Phone_Number, Address, City, DOB, Date_created, Status "
                        + ") values ( "
                        + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? "
                        + ") ";
                stm = con.prepareStatement(sql);
                stm.setString(1, customer.getCustomerID());
                stm.setString(2, customer.getAccountID());
                stm.setString(3, customer.getFullName());
                stm.setString(4, customer.getGender());
                stm.setString(5, customer.getEmail());
                stm.setString(6, customer.getPhone_Number());
                stm.setString(7, customer.getAddress());
                stm.setString(8, customer.getCity());
                stm.setDate(9, customer.getDOB());
                stm.setDate(10, customer.getDate_created());
                stm.setBoolean(11, true);
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
