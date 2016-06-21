package vo;

/**
 * Created by zzt on 6/15/16.
 * <p>
 * <h3></h3>
 */
public class PartInfo {

    private int newCount;
    private double newTotal;
    private double lineSum;

    public PartInfo(int quantity, double total, double lineSum) {
        newCount = quantity;
        newTotal = total;
        this.lineSum = lineSum;
    }

    public int getNewCount() {
        return newCount;
    }

    public double getNewTotal() {
        return newTotal;
    }

    public double getLineSum() {
        return lineSum;
    }
}
