package tlcb.pattern.creational.builder;

/**
 * @author XiaoLei Zhu
 * @Description:
 * @date 2020/6/4 11:49 下午
 */
public class Course {
    private Integer id;
    private String name;
    private String startTime;
    private String endTime;

    private Course() {
    }

    public Course(Builder builder) {
        this.id = builder.id;
        this.name = builder.name;
        this.startTime = builder.startName;
        this.endTime = builder.endTime;
    }

    static class Builder {
        private Integer id;
        private String name;
        private String startName;
        private String endTime;

        public Builder setId(Integer id) {
            this.id = id;
            return this;
        }

        public Builder setName(String name) {
            this.name = name;
            return this;
        }

        public Builder setStartName(String startName) {
            this.startName = startName;
            return this;
        }

        public Builder setEndTime(String endTime) {
            this.endTime = endTime;
            return this;
        }

        public Course build() {
            return new Course(this);
        }
    }

    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                '}';
    }
}
