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

  

    

}
