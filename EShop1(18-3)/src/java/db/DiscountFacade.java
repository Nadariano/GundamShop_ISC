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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class DiscountFacade {
    public Discount readVoucher(String discountId) throws SQLException {
        Discount discount = null;
        Connection con = DB.getConnection();
        PreparedStatement stm = con.prepareStatement("select * from discount where discountid = ?");
        stm.setString(1,  discountId);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            discount = new Discount();
            discount.setDiscountId(rs.getString("DISCOUNTID"));
            discount.setDiscountRate(rs.getInt("DISCOUNTRATE"));            
        }
        con.close();
        return discount;
    }
    public void empty(){
        
    }
}
