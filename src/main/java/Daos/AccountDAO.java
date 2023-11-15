package Daos;

import Models.AccountDTO;
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

public class AccountDAO implements Serializable {

    public AccountDTO checkExistEmail(String email) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select AccountID, FullName, RoleName "
                        + "From Account "
                        + "inner join Roles on Account.RoleID = Roles.RoleID "
                        + "Where Email like ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + email + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String AccountID = rs.getString("AccountID");
                    String FullName = rs.getString("FullName");
                    String roleName = rs.getString("RoleName");
                    AccountDTO account = new AccountDTO(AccountID, FullName, roleName);
                    return account;
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

    public AccountDTO checkExistFaceBook(String accountID) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select AccountID, FullName, RoleName "
                        + "From Account "
                        + "inner join Roles on Account.RoleID = Roles.RoleID "
                        + "Where AccountID like ? and Status = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + accountID + "%");
                stm.setBoolean(2, true);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String AccountID = rs.getString("AccountID");
                    String FullName = rs.getString("FullName");
                    String roleName = rs.getString("RoleName");
                    AccountDTO account = new AccountDTO(AccountID, FullName, roleName);
                    return account;
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

    public String createAccountID() throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select MAX(CAST(SUBSTRING(AccountID,2,LEN(AccountID)) AS INT)) as 'AccountID'  "
                        + "From Account "
                        + "Where AccountID like ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, "A" + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    int AccountIDMax = rs.getInt("AccountID");
                    if (AccountIDMax == 0) {
                        return "A01";
                    } else {
                        int num = AccountIDMax + 1;
                        String newOrderID;
                        if (num <= 9) {
                            newOrderID = "A0";
                        } else {
                            newOrderID = "A";
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

    public boolean createAccount(AccountDTO account) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert into Account ( "
                        + "AccountID, Password, FullName, Email, Date_created, CreateBy, RoleID, Status "
                        + ") values ( "
                        + "?, ?, ?, ?, ?, ?, ?, ? "
                        + ") ";
                stm = con.prepareStatement(sql);
                stm.setString(1, account.getAccountID());
                stm.setString(2, account.getPassword());
                stm.setString(3, account.getFullName());
                stm.setString(4, account.getEmail());
                stm.setDate(5, account.getDate_created());
                stm.setString(6, account.getCreateBy());
                stm.setInt(7, account.getRoleID());
                stm.setBoolean(8, true);
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

    public boolean updatePasswordByEmail(String email, String password)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Update Account "
                        + "Set Password = ? "
                        + "Where Email = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, password);
                stm.setString(2, email);
                int effectRows = stm.executeUpdate();
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

    public AccountDTO getAccountByEmail(String email) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        AccountDTO account = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select AccountID, FullName, RoleName, Password "
                        + "From Account "
                        + "inner join Roles on Account.RoleID = Roles.RoleID "
                        + "Where Email = ? and Status = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, email);
                stm.setBoolean(2, true);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String AccountID = rs.getString("AccountID");
                    String FullName = rs.getString("FullName");
                    String roleName = rs.getString("RoleName");
                    String passWord = rs.getString("Password");
                    return account = new AccountDTO(AccountID, FullName, roleName, passWord);
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

    public boolean updatePasswordByAccountID(String id, String password)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Update Account "
                        + "Set Password = ? "
                        + "Where AccountID = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, password);
                stm.setString(2, id);
                int effectRows = stm.executeUpdate();
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

    public AccountDTO getAccountByID(String ID) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        AccountDTO account = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select acc.AccountID, acc.FullName, acc.Email "
                        + "from Account acc inner join Roles rol on "
                        + "acc.RoleID = rol.RoleID "
                        + "where acc.AccountID = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, ID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String AccountID = rs.getString("AccountID");
                    String FullName = rs.getString("FullName");
                    String Email = rs.getString("Email");
                    return account = new AccountDTO(AccountID, FullName, Email);
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

    private List<AccountDTO> accountList;

    public List<AccountDTO> getAccountList() {
        return accountList;
    }

    public List<AccountDTO> getAdminEmail() throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        AccountDTO account = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select Email "
                        + "From Account "
                        + "Where RoleID = 1 ";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    account = new AccountDTO(rs.getString("Email"));
                    if (this.accountList == null) {
                        this.accountList = new ArrayList<AccountDTO>();
                    }
                    this.accountList.add(account);
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

    public List<AccountDTO> ViewAllAccount(int page, String searchValue, int fieldShow, String account)
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
                        + "where acc.AccountID like ? and acc.RoleID != 1 and acc.AccountID != ? "
                        + "or acc.FullName like ? and acc.RoleID != 1 and acc.AccountID != ? "
                        + "or rol.RoleName like ? and acc.RoleID != 1 and acc.AccountID != ? "
                        + "Order by acc.RoleID asc "
                        + "OFFSET ? ROWS "
                        + "FETCH FIRST ? ROWS ONLY ";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                stm.setString(2, account);
                stm.setString(3, "%" + searchValue + "%");
                stm.setString(4, account);
                stm.setString(5, "%" + searchValue + "%");
                stm.setString(6, account);
                stm.setInt(7, (page - 1) * fieldShow);
                stm.setInt(8, fieldShow);
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

    public int getNumberAllAccountPage(String searchValue, int fieldShow)
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
