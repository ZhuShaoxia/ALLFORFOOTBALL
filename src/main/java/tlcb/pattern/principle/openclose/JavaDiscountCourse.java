package tlcb.pattern.principle.openclose;

/**
 * @author XiaoLei Zhu
 * @Description:
 * @date 2020/6/3 10:39 下午
 */
public class JavaDiscountCourse extends JavaCourse {

    public JavaDiscountCourse(Integer id, String name, Double price) {
        super(id, name, price);
    }

    /**
     * 获取原价
     *
     * @return
     */
    public Double getOriginalPrice() {
        return super.getPrice();
    }

    /**
     * 获取折扣价格
     *
     * @return
     */
    public Double getDiscountPrice() {
        return getDiscountPrice(0.8d);
    }

    public Double getDiscountPrice(double discount) {
        return super.getPrice() * discount;
    }

}
