/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Dell
 */
public class Cart {

     private Map<String, Item> map;

    public Cart() {
        map = new HashMap<>();

    }

    public void add(Item item) {
        String product_id = item.getProduct().getProduct_id();
        if (map.containsKey(product_id)) {
            Item oldItem = map.get(product_id);
            oldItem.setQuantity(oldItem.getQuantity() + item.getQuantity());
        } else {
            map.put(product_id, item);
        }
    }

    public void update(String product_id, int quantity) {
        Item item = map.get(product_id);
        item.setQuantity(quantity);
    }

    public void remove(String product_id) {
        map.remove(product_id);
    }

    public void empty() {
        map.clear();
    }
  public Collection <Item> getItem(){
      return map.values();
  }
   public double getTotal(){
        double total = 0;
        for (Item item: map.values()) {
            total += item.getCost();
        }
        return total;
    }
//   đã sửa ngày 16/03/2023
   public int getCount(){
    int count=0;
    for (Item item: map.values()){
        count+=1;
    }
    return count;
}
}
