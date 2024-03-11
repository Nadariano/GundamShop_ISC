/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 *
 * @author User
 */
public class OrderFacade {

    public int addOrder(User user, Cart cart, String order_note, String paymentMethod, int discountRate) throws SQLException {
        //int order_id=0;
        LocalDateTime curDateTime = LocalDateTime.now();
        String datetime = curDateTime.toString();
        //Táº¡o connection Ä‘á»ƒ káº¿t ná»‘i vÃ o DBMS
        Connection con = DB.getConnection();
        //Táº¡o Ä‘á»‘i tÆ°á»£ng PreparedStatemenT
        PreparedStatement stm = con.prepareStatement("INSERT INTO ORDERS (ORDER_DATE, ACCOUNT_ID, TOTALMONEY, ORDER_NOTE, PAYMENTMETHOD) VALUES (?, ?, ?, ?, ?);");
        stm.setString(1, datetime);
        stm.setInt(2, user.getAccountId());
        Double total = cart.getTotal();
        //Tinh total sau khi tru cho discount
        Double finalTotal = total - total * discountRate / 100;
        stm.setDouble(3, finalTotal);
        stm.setString(4, order_note);
        stm.setString(5, paymentMethod);
        stm.executeUpdate();
        //láº¥y order_id cá»§a order vá»«a add
        PreparedStatement stm1 = con.prepareStatement("select top 1 ORDER_ID from ORDERS order by ORDER_ID desc");
        ResultSet rs = stm1.executeQuery();
        int order_id = 0;
        if (rs.next()) {
            order_id = rs.getInt("order_id");
            for (Item i : cart.getItem()) {
                PreparedStatement stm2 = con.prepareStatement("INSERT INTO ORDERDETAILS (ORDER_ID, PRODUCT_ID, QUANTITY, UNITPRICE) VALUES (?, ?, ?, ?);");
                stm2.setInt(1, order_id);
                stm2.setString(2, i.getProduct().getProduct_id());
                stm2.setInt(3, i.getQuantity());
                stm2.setDouble(4, i.getProduct().getPrice());
                stm2.executeUpdate();
            }
        }
        //ÄÃ³ng káº¿t ná»‘i
        con.close();
        return order_id;
    }

    public Order read(int oId) throws SQLException {
        Order order = null;
        //Táº¡o connection Ä‘á»ƒ káº¿t ná»‘i vÃ o DBMS
        Connection con = DB.getConnection();
        //Táº¡o Ä‘á»‘i tÆ°á»£ng PreparedStatement
        PreparedStatement stm = con.prepareStatement("select * from ORDERS where ORDER_ID= ?");
        stm.setInt(1, oId);
        //Thá»±c thi lá»‡nh sql
        ResultSet rs = stm.executeQuery();
        //Load dá»¯ liá»‡u vÃ o Ä‘á»‘i tÆ°á»£ng toy náº¿u cÃ³
        if (rs.next()) {
            order = new Order();
            order.setOrder_date(rs.getString("ORDER_DATE"));
            order.setTotalMoney(rs.getDouble("TOTALMONEY"));
            order.setOrder_note(rs.getString("ORDER_NOTE"));
            order.setPaymentMethod(rs.getString("PAYMENTMETHOD"));
        }
        //ÄÃ³ng káº¿t ná»‘i
        con.close();
        return order;
    }

    public List<OrderDetail> readAllProducts(int oId) throws SQLException {
        List<OrderDetail> olist = null;
        Connection con = DB.getConnection();
        PreparedStatement stm = con.prepareStatement("select * from ORDERDETAILS where ORDER_ID = ?");
        stm.setInt(1, oId);
        ResultSet rs = stm.executeQuery();
        olist = new ArrayList<>();
        while (rs.next()) {
            OrderDetail od = new OrderDetail();
            od.setProduct_id(rs.getString("PRODUCT_ID"));
            od.setUnitPrice(rs.getDouble("UNITPRICE"));
            od.setQuantity(rs.getInt("QUANTITY"));
            olist.add(od);
        }
        con.close();
        return olist;
    }

}
