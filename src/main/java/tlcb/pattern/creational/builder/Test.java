package tlcb.pattern.creational.builder;

/**
 * @author XiaoLei Zhu
 * @Description:
 * @date 2020/6/6 10:14 上午
 */
public class Test {
    public static void main(String[] args) {
        Course course = new Course.Builder()
                .setId(1)
                .setName("语文课")
                .setStartName("8:00")
                .setEndTime("8:45")
                .build();
        System.out.println(course);
    }
}
