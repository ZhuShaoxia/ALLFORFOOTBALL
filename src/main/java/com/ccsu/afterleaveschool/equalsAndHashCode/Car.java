package com.ccsu.afterleaveschool.equalsAndHashCode;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2020/2/14
 * @Time: 17:13
 * Description:
 */
public class Car {
    private int batch;

    private Car() {

    }

    public Car(int batch) {
        this.batch = batch;
    }

    @Override
    public String toString() {
        return "Car{" +
                "batch=" + batch +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Car)) return false;

        Car car = (Car) o;

        return batch == car.batch;
    }

    @Override
    public int hashCode() {
        return batch;
    }

    public static void main(String[] args) {
        Car c1 = new Car(1);
        Car c2 = new Car(1);
        Car c3 = new Car(1);
        System.out.println(c1.equals(c1));
        System.out.println(c1.equals(c2));
        System.out.println(c1.equals(null));
        System.out.println(c2.equals(c3));

    }
}
