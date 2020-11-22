package tlcb.newdate;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;

/**
 * @author XiaoLei Zhu
 * @Description: jdk1.8 日期相关
 * @date 2020/8/16 10:47 下午
 */
public class NewDate {

    public static void main(String[] args) {
        System.out.println(getToday("yyyy/MM/dd"));
    }

    public static String getToday(String pattern) {
        LocalDate localDate = LocalDate.now();
        localDate.with(TemporalAdjusters.firstDayOfMonth());
        DateTimeFormatter dfm = DateTimeFormatter.ofPattern(pattern);
        return dfm.format(localDate);
    }

    public static String getToday() {
        return getToday("yyyy/MM/dd");
    }
}
