package tlcb.pattern.principle.dependencyinversion;

/**
 * @author XiaoLei Zhu
 * @Description:
 * @date 2020/6/3 10:45 下午
 */
public class Study {

    private ICourse course;

    public Study() {
    }

    public Study(ICourse course) {
        this.course = course;
    }

    public void study(ICourse course) {
        course.study();
    }

    public void setCourse(ICourse course) {
        this.course = course;
    }
}
