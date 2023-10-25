package Daos;

import Models.AccountDTO;
import Models.OrderDTO;
import Utils.DBHelper;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {

    private List<AccountDTO> accountList;

    public List<AccountDTO> getaccountList() {
        return accountList;
    }

    public List<AccountDTO> ViewAllAccount()
            throws SQLException, ClassNotFoundException {

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        AccountDTO result = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select acc.AccountID, acc.FullName, rol.RoleName, "
                        + "acc.Email, acc.Date_created, acc.CreateBy, acc.Status "
                        + "from Account acc inner join Roles rol on "
                        + "acc.RoleID = rol.RoleID ";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String AccountID = rs.getString("AccountID");
                    String FullName = rs.getString("FullName");
                    String RoleName = rs.getString("RoleName");
                    Date Date_created = rs.getDate("Date_created");
                    boolean Status = rs.getBoolean("Status");
                    String Email = rs.getString("Email");
                    String CreateBy = rs.getString("CreateBy");
                    result = new AccountDTO(AccountID, FullName, Email, Date_created, CreateBy, RoleName, Status);
                    if (this.accountList == null) {
                        this.accountList = new ArrayList<AccountDTO>();
                    }
                    this.accountList.add(result);
                }
                return this.accountList;
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

     public boolean UpdatedStatus(String accountID, boolean status) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "update Account "
                        + "set Status = ? "
                        + "where AccountID = ?";
                stm = con.prepareStatement(sql);
                stm.setBoolean(1, status);
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
}
