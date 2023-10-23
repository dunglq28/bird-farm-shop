/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Utils.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author hj
 */
public class ServiceDAO {
    public String getServiceNameByID(int serid)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1.Make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2.Create SQL statement string
                String sql = "select * "
                        + "from Service "
                        + "where ServiceID = ? ";
                //3.Create statement object
                stm = con.prepareStatement(sql);
                //4.execute-query
                stm.setInt(1, serid);
                rs = stm.executeQuery();
                //5.process
                while (rs.next()) {
                   return rs.getString("ServiceName");
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
        return null;
    }
}
