/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

/**
 *
 * @author User
 */
public class OrderDetail {

    private int order_id;
    private String product_id;
    private int quantity;
    private double unitPrice;

    public OrderDetail() {
    }

    public OrderDetail(int order_id, String product_id, int quantity, double unitPrice) {
        this.order_id = order_id;
        this.product_id = product_id;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

}
