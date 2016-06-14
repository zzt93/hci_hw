package vo;

import java.util.HashMap;
import java.util.HashSet;

/**
 * Created by zzt on 6/14/16.
 * <p>
 * <h3></h3>
 */
public class ShoppingCart {

    private HashSet<CartItem> items = new HashSet<>();
    private int quantity = 0;
    private double total = 0;

    public HashSet<CartItem> getItems() {
        return items;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getTotal() {
        return total;
    }
}
