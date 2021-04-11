/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datdq.daos;

import datdq.dtos.UserDTO;
import datdq.utilities.DB_Utils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author Asus
 */
public class UserDAO implements Serializable {

    public UserDTO checkLogin(String id, String password) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        UserDTO dto = null;

        try {
            con = DB_Utils.makeConnection();
            if (con != null) {
                String sql = "SELECT isAdmin,name,id FROM tblUser WHERE id = ? COLLATE Latin1_General_CS_AI"
                        + " AND password = ? COLLATE Latin1_General_CS_AI";
                ps = con.prepareStatement(sql);
                ps.setString(1, id);
                ps.setString(2, password);
                rs = ps.executeQuery();
                if (rs.next()) {
                    boolean isAdmin = rs.getBoolean("isAdmin");
                    String name = rs.getString("name");                    
                    dto = new UserDTO(id, "", name, isAdmin, "");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return dto;
    }
    
    
}
