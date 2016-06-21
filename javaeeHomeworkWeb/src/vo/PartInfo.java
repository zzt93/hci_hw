package vo;

/**
 * Created by zzt on 6/15/16.
 * <p>
 * <h3></h3>
 */
public class PartInfo {

    private int newCount;
    private double newTotal;

    public PartInfo(int quantity, double total) {
        newCount = quantity;
        newTotal = total;
    }

    public int getNewCount() {
        return newCount;
    }

    public double getNewTotal() {
        return newTotal;
    }
}
