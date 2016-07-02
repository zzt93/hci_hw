package mis;

/**
 * Created by zzt on 2/11/16.
 * <p>
 * Usage:
 */
public enum Rank {
    LEVEL0(0, 1, 0, "user", "普通用户"),
    LEVEL1(200, 1 - 0.02, 0, "level1", "等级一"),
    LEVEL2(300, 1 - 0.03, 0, "level2", "等级二"),
    LEVEL3(500, 1 - 0.05, 0, "level3", "等级三"),
    ;

    private final int threshold;
    private final double ratio;
    private final int credit;
    private final String des;
    private final String chi;

    Rank(int threshold, double ratio, int credit, String des, String s) {
        this.threshold = threshold;
        this.ratio = ratio - Default.RESERVE_RATIO;
        this.credit = credit;
        this.des = des;
        this.chi = s;
    }

    public int getThreshold() {
        return threshold;
    }

    public double getRatio() {
        return ratio;
    }

    public int getCredit() {
        return credit;
    }

    public String getDes() {
        return des;
    }

    public String getChi() {
        return chi;
    }
}
