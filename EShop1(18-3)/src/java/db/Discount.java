/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

/**
 *
 * @author Dell
 */
public class Discount {
    private String discountId;
    private int discountRate;

    public Discount() {
    }

    public Discount(String discountId, int discountRate) {
        this.discountId = discountId;
        this.discountRate = discountRate;
    }

    public String getDiscountId() {
        return discountId;
    }

    public void setDiscountId(String discountId) {
        this.discountId = discountId;
    }

    public int getDiscountRate() {
        return discountRate;
    }

    public void setDiscountRate(int discountRate) {
        this.discountRate = discountRate;
    }
    
    
    
}
