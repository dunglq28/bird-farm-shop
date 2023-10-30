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

    public List<AccountDTO> ViewAllAccount(int page, String searchValue, int fieldShow)
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
                        + "from Account acc "
                        + "inner join Roles rol on acc.RoleID = rol.RoleID "
                        + "where acc.AccountID like ? and acc.RoleID != 1 "
                        + "or acc.FullName like ? and acc.RoleID != 1 "
                        + "or rol.RoleName like ? and acc.RoleID != 1 "
                        + "Order by acc.RoleID asc "
                        + "OFFSET ? ROWS "
                        + "FETCH FIRST ? ROWS ONLY ";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                stm.setString(2, "%" + searchValue + "%");
                stm.setString(3, "%" + searchValue + "%");
                stm.setInt(4, (page - 1) * fieldShow);
                stm.setInt(5, fieldShow);
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

    ublic int getNumberAllAccountPage(String searchValue, int fieldShow)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select count(*) "
                        + "from Account acc "
                        + "inner join Roles rol on acc.RoleID = rol.RoleID "
                        + "where acc.AccountID like ? and acc.RoleID != 1 "
                        + "or acc.FullName like ? and acc.RoleID != 1 "
                        + "or rol.RoleName like ? and acc.RoleID != 1 ";

                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                stm.setString(2, "%" + searchValue + "%");
                stm.setString(3, "%" + searchValue + "%");
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

    public boolean UpdatedRole(String accountID, int roleID) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "update Account "
                        + "set RoleID = ? "
                        + "where AccountID = ? ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, roleID);
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

    public boolean UpdatedStaffRole(String staffID, boolean status) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "update Staffs "
                        + "set Status = ? "
                        + "where StaffID = ? ";
                stm = con.prepareStatement(sql);
                stm.setBoolean(1, status);
                stm.setString(2, staffID);
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
