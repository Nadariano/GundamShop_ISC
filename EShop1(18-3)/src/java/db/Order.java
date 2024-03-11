/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Date;

/**
 *
 * @author User
 */
public class Order {

    private int order_id;
    private String order_date;
    private int account_id;
    private double totalMoney;
    private String order_note;
    private String paymentMethod;

    public Order() {
    }

    public Order(int order_id, String order_date, int account_id, double totalMoney, String order_note, String paymentMethod) {
        this.order_id = order_id;
        this.order_date = order_date;
        this.account_id = account_id;
        this.totalMoney = totalMoney;
        this.order_note = order_note;
        this.paymentMethod = paymentMethod;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getOrder_date() {
        return order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public String getOrder_note() {
        return order_note;
    }

    public void setOrder_note(String order_note) {
        this.order_note = order_note;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

  
   
}
