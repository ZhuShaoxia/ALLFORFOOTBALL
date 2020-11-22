package tlcb.pattern.principle.dependencyinversion;

/**
 * @author XiaoLei Zhu
 * @Description:
 * @date 2020/6/3 10:46 下午
 */
public class Test {
    public static void main(String[] args) {
        //1. 接口方法注入
        Study study = new Study();
        study.study(new JavaCourse());
        study.study(new PYCourse());

        //2. 构造方法注入
        Study s = new Study(new JavaCourse());

        //3. set 方法注入
    }
}
