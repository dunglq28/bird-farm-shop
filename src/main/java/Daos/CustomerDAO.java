package Daos;

import Models.CustomerDTO;
import Utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerDAO implements Serializable {

    public String createCustomerID() throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select MAX(CAST(SUBSTRING(CustomerID,2,LEN(CustomerID)) AS INT)) as 'CustomerID'  "
                        + "From Customers "
                        + "Where CustomerID like ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, "C" + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    int CustomerIDMax = rs.getInt("CustomerID");
                    if (CustomerIDMax == 0) {
                        return "C01";
                    } else {
                        int num = CustomerIDMax + 1;
                        String newOrderID;
                        if (num <= 9) {
                            newOrderID = "C0";
                        } else {
                            newOrderID = "C";
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
                stm.setDate(9, customer.getdOB());
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

    public CustomerDTO getCustomerByAccountID(String accountId)
            throws SQLException, ClassNotFoundException {

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        CustomerDTO result = null;
        try {
            //1.Make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2.Create SQL statement string
                String sql = "Select * "
                        + "from Customers "
                        + "Where AccountID = ? ";
                //3.Create statement object
                stm = con.prepareStatement(sql);
                stm.setString(1, accountId);
                //4.execute-query
                rs = stm.executeQuery();
                //5.process
                if (rs.next()) {
                    return result = new CustomerDTO(rs.getString("CustomerID"),
                            rs.getString("AccountID"),
                            rs.getString("FullName"),
                            rs.getString("Gender"),
                            rs.getString("Email"),
                            rs.getString("Phone_Number"),
                            rs.getString("Address"),
                            rs.getString("City"),
                            rs.getString("District"),
                            rs.getDate("DOB"),
                            rs.getDate("Date_created"),
                            rs.getBoolean("Status"));
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
        return result;
    }

    public CustomerDTO updateCustomer(String fullName, String phoneNumber, String address, String city, String district, String accountId)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        CustomerDTO result = null;
        try {
            //1. Make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. create SQL statement string
                String sql = "Update Customers "
                        + "Set FullName = ?, Phone_Number = ?, Address = ? , City = ?, District = ? "
                        + "Where AccountID = ? ";
                //3. Create statement object
                stm = con.prepareStatement(sql);
                stm.setString(1, fullName);
                stm.setString(2, phoneNumber);
                stm.setString(3, address);
                stm.setString(4, city);
                stm.setString(5, district);
                stm.setString(6, accountId);
                //4. Excute query
                int effectRows = stm.executeUpdate();
                //5. Process
                if (effectRows > 0) {
                    return result = new CustomerDTO(fullName, phoneNumber, address, city, district);
                } // end of connection has opend
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
}
