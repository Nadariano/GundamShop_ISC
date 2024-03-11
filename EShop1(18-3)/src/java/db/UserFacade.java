/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

/**
 *
 * @author Dell
 */
public class UserFacade {

    public int totalAccount() throws SQLException {
        int total = 0;
        //Tạo connection để kết nối vào DBMS
        Connection con = DB.getConnection();
        //Tạo đối tượng PreparedStatement
        Statement stm = con.createStatement();
        //Thực thi lệnh sql
        ResultSet rs = stm.executeQuery("SELECT COUNT(ACCOUNT_ID) as Total FROM ACCOUNT");
        //Load dữ liệu vào đối tượng toy nếu có
        if (rs.next()) {
            total = rs.getInt("Total");
        }
        con.close();
        return total;
    }

    public User login(String email, String accountpass) throws SQLException {
        User user = null;
        Connection con = DB.getConnection();
        PreparedStatement stm = con.prepareStatement("select * from account where email= ? and accountpass= ?");
        stm.setString(1, email);
        stm.setString(2, accountpass);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            user = new User();
            user.setAccountId(rs.getInt("ACCOUNT_ID"));
            user.setEmail(rs.getString("EMAIL"));
            user.setAccountPass(rs.getString("ACCOUNTPASS"));
            user.setAccountName(rs.getString("ACCOUNT_NAME"));
            user.setAccountPhone(rs.getString("ACCOUNT_PHONE"));
            user.setAccountAddress(rs.getString("ACCOUNT_ADDRESS"));
            user.setRoleId(rs.getBoolean("ROLE_ID"));
        }
        con.close();
        return user;
    }

    public User register(String email, String accountpass, String accountName, String accountPhone, String accountAddress) throws SQLException {
        User user = null;
        Connection con = DB.getConnection();
        PreparedStatement stm = con.prepareStatement("INSERT INTO Account VALUES (?, ?, ?, ?, ?, 0);");
        stm.setString(1, email);
        stm.setString(2, accountpass);
        stm.setString(3, accountName);
        stm.setString(4, accountPhone);
        stm.setString(5, accountAddress);
        int count = stm.executeUpdate();
        con.close();
        return user;
    }

    public User checkEmail(String email) throws SQLException {
        User user = null;
        Connection con = DB.getConnection();
        PreparedStatement stm = con.prepareStatement("select * from account where email= ?");
        stm.setString(1, email);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            user = new User();
            user.setAccountId(rs.getInt("ACCOUNT_ID"));
            user.setEmail(rs.getString("EMAIL"));
            user.setAccountPass(rs.getString("ACCOUNTPASS"));
            user.setAccountName(rs.getString("ACCOUNT_NAME"));
            user.setAccountPhone(rs.getString("ACCOUNT_PHONE"));
            user.setAccountAddress(rs.getString("ACCOUNT_ADDRESS"));
            user.setRoleId(rs.getBoolean("ROLE_ID"));
        }
        con.close();
        return user;
    }

    public User forgetpass(String email, String accountPhone) throws SQLException {
        User user = null;
        Connection con = DB.getConnection();
        PreparedStatement stm = con.prepareStatement("select * from account where email= ? and account_phone= ?");
        stm.setString(1, email);
        stm.setString(2, accountPhone);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            user = new User();
            user.setAccountId(rs.getInt("ACCOUNT_ID"));
            user.setEmail(rs.getString("EMAIL"));
            user.setAccountPass(rs.getString("ACCOUNTPASS"));
            user.setAccountName(rs.getString("ACCOUNT_NAME"));
            user.setAccountPhone(rs.getString("ACCOUNT_PHONE"));
            user.setAccountAddress(rs.getString("ACCOUNT_ADDRESS"));
            user.setRoleId(rs.getBoolean("ROLE_ID"));
        }
        con.close();
        return user;
    }

    public User changepassword(String accountpass, String email) throws SQLException {
        User user = null;
        Connection con = DB.getConnection();
        PreparedStatement stm = con.prepareStatement("UPDATE account set accountpass =? where email = ?");
        stm.setString(1, accountpass);
        stm.setString(2, email);
        int count = stm.executeUpdate();
        con.close();
        return user;
    }

    public void update(User user) throws SQLException {
        //Tạo connection để kết nối vào DBMS
        Connection con = DB.getConnection();
        //Tạo đối tượng PreparedStatement
        PreparedStatement stm = con.prepareStatement("update ACCOUNT set EMAIL = ?, ACCOUNTPASS = ?, ACCOUNT_NAME = ?, ACCOUNT_PHONE = ?, ACCOUNT_ADDRESS = ? where ACCOUNT_ID = ?");
        stm.setString(1, user.getEmail());
        stm.setString(2, user.getAccountPass());
        stm.setString(3, user.getAccountName());
        stm.setString(4, user.getAccountPhone());
        stm.setString(5, user.getAccountAddress());
        stm.setInt(6, user.getAccountId());
        //Thực thi lệnh sql
        int count = stm.executeUpdate();
        //Đóng kết nối
        con.close();
    }

}
