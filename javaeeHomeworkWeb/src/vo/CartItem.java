package vo;

/**
 * Created by zzt on 6/14/16.
 * <p>
 * <h3></h3>
 */
public class CartItem {

    private int did;
    private int num = 1;
    private String name;
    private double price;

    public CartItem(int did, String name, double price) {
        this.did = did;
        this.name = name;
        this.price = price;
    }

    public int getDid() {
        return did;
    }

    public int getNum() {
        return num;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CartItem cartItem = (CartItem) o;

        return did == cartItem.did;

    }

    @Override
    public int hashCode() {
        return did;
    }
}
