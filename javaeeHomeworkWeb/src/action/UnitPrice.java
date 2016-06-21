package action;

import com.opensymphony.xwork2.ActionSupport;
import interceptor.SessionManagement;
import vo.ShoppingCart;

import javax.servlet.http.HttpSession;

/**
 * Created by zzt on 6/21/16.
 * <p>
 * <h3></h3>
 */
public class UnitPrice extends ActionSupport{
    private int did;
    private double price;

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public ShoppingCart getCart() {
        HttpSession session = SessionManagement.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute(CartAction.CART);
        if (cart == null) {
            cart = new ShoppingCart();
            session.setAttribute(CartAction.CART, cart);
        }
        return cart;
    }

    public String cartGetPrice() throws Exception {
        final ShoppingCart cart = getCart();
        price = cart.getPriceById(did);
        return SUCCESS;
    }

}
