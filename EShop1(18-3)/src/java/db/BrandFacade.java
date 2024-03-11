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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class BrandFacade {

    public List<Brand> select() throws SQLException {
        List<Brand> list = null;
        //Tạo connection để kết nối vào DBMS
        Connection con = DB.getConnection();
        //Tạo đối tượng statement
        Statement stm = con.createStatement();
        //Thực thi lệnh SELECT
        ResultSet rs = stm.executeQuery("select * from brand");
        list = new ArrayList<>();
        while (rs.next()) {
            Brand brand = new Brand();
            brand.setBrand_id(rs.getInt("brand_id"));
            brand.setBrandName(rs.getString("brandName"));
            list.add(brand);
        }
        con.close();
        return list;
    }

    public void create(Brand brand) throws SQLException {
        Connection con = DB.getConnection();
        PreparedStatement stm = con.prepareStatement("insert into brand values (?,?)");
        stm.setInt(1, brand.getBrand_id());
        stm.setString(2, brand.getBrandName());
        int count = stm.executeUpdate();
        con.close();
    }

    public Brand read(int brand_id) throws SQLException {
        Brand brand = null;
        Connection con = DB.getConnection();
        PreparedStatement stm = con.prepareStatement("select * from brand where brand_id = ?");
        stm.setInt(1, brand_id);
        ResultSet rs = stm.executeQuery();

        if (rs.next()) {
            brand = new Brand();
            brand.setBrand_id(rs.getInt("brand_id"));
            brand.setBrandName(rs.getString("brandName"));

        }
        con.close();
        return brand;

    }

    public void update(Brand brand) throws SQLException {
        Connection con = DB.getConnection();
        PreparedStatement stm = con.prepareStatement("update brand set name= ? where id= ?");
        stm.setString(1, brand.getBrandName());
        stm.setInt(2, brand.getBrand_id());
        int count = stm.executeUpdate();
        con.close();
    }

    public void delete(int brand_id) throws SQLException {
        Connection con = DB.getConnection();
        PreparedStatement stm = con.prepareStatement("delete from brand where brand_id= ?");
        stm.setInt(1, brand_id);
        int count = stm.executeUpdate();
        con.close();
    }
}
