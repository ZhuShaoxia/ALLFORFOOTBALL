package com.ccsu.afterleaveschool.equalsAndHashCode;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2020/2/14
 * @Time: 17:24
 * Description:
 */
public class BigCar extends Car {
    private int count;

    public BigCar(int batch) {
        super(batch);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof BigCar)) return false;
        if (!super.equals(o)) return false;

        BigCar bigCar = (BigCar) o;

        return count == bigCar.count;
    }

    @Override
    public int hashCode() {
        int result = super.hashCode();
        result = 31 * result + count;
        return result;
    }
}
