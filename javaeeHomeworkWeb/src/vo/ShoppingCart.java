package vo;

import java.io.Serializable;
import java.util.HashMap;

/**
 * Created by zzt on 6/14/16.
 * <p>
 * <h3></h3>
 */
public class ShoppingCart implements Serializable{

    private HashMap<Integer, CartItem> items = new HashMap<>();
    private int quantity = 0;
    private double total = 0;
    private int bid;

    public ShoppingCart(int branchNum) {
        bid = branchNum;
    }

    public int getBid() {
        return bid;
    }


    public HashMap<Integer, CartItem> getItems() {
        return items;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getTotal() {
        return total;
    }

    public void addItem(CartItem item) {
        items.put(item.getDid(), item);
        quantity++;
        total += item.getPrice();
    }

    public void removeItem(int did) {
        final CartItem remove = items.remove(did);
        quantity--;
        total -= remove.getPrice();
    }


    public double updateItem(int did, int newNum) {
        final CartItem cartItem = items.get(did);
        assert cartItem != null;
        final int old = cartItem.getNum();
        cartItem.setNum(newNum);
        final int gap = newNum - old;
        quantity += gap;
        total += (gap * cartItem.getPrice());
        return newNum * cartItem.getPrice();
    }

    public double getPriceById(int did) {
        return items.get(did).getPrice();
    }
}
