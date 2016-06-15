package action;

import com.opensymphony.xwork2.ActionSupport;
import interceptor.SessionManagement;
import vo.CartItem;
import vo.OldInfo;
import vo.ShoppingCart;

import javax.servlet.http.HttpSession;

/**
 * Created by zzt on 6/15/16.
 * <p>
 * <h3></h3>
 */
public class CartAction extends ActionSupport {
    static final String CART = "cart";

    private int did;
    private int num = 1;
    private String name;
    private double price;

    private OldInfo info;

    public OldInfo getInfo() {
        return info;
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

    public void setDid(int did) {
        this.did = did;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public ShoppingCart getCart() {
        HttpSession session = SessionManagement.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute(CART);
        if (cart == null) {
            cart = new ShoppingCart();
        }
        info = new OldInfo(cart.getQuantity(), cart.getTotal());
        return cart;
    }

    public String cartAdd() throws Exception {
        final ShoppingCart cart = getCart();
        cart.addItem(new CartItem(did, name, price));
        return SUCCESS;
    }

    public String cartRemove() throws Exception {
        final ShoppingCart cart = getCart();
        cart.removeItem(did);
        return SUCCESS;
    }

    public String cartUpdateNumber() throws Exception {
        final ShoppingCart cart = getCart();
        cart.updateItem(did, num);
        return SUCCESS;
    }

    public String cartClear() throws Exception {
        SessionManagement.getSession().setAttribute(CART, null);
        return SUCCESS;
    }
}
