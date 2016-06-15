package vo;

/**
 * Created by zzt on 6/15/16.
 * <p>
 * <h3></h3>
 */
public class OldInfo {

    private int oldCount;
    private double oldTotal;

    public OldInfo(int quantity, double total) {
        oldCount = quantity;
        oldTotal = total;
    }

    public int getOldCount() {
        return oldCount;
    }

    public double getOldTotal() {
        return oldTotal;
    }
}
