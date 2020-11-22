package tlcb.regex;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author XiaoLei Zhu
 * @Description: 正则表达式
 *  1. Pattern
 *  2. Matcher
 *  3. 分组匹配
 *  4. 非贪婪匹配 后面加 ？；默认使用贪婪匹配，即尽可能多的向后匹配
 *  5. matcher,find 搜索匹配到的单词
 *  6. s.replaceAll("\\s+", " ");
 *  7. 反向引用：把搜索到的制定字符串安规则替换，通过 replaceAll, 采用 $ 符号
 * @date 2020/6/7 10:37 下午
 */
public class RegexDemo {
    public static void main(String[] args) {

        //String regex = "(\\d{3,4})\\-(\\d{7,8})";
        //Pattern p = Pattern.compile(regex);
        //String str = "010-7557888";
        //Matcher matcher = p.matcher(str);
        //if (matcher.matches()) {
        //    String group1 = matcher.group(1);
        //    String group = matcher.group(2);
        //    System.out.println(matcher.group());
        //    System.out.println(group);
        //    System.out.println(group1);
        //    System.out.println("匹配上啦");
        //} else {
        //    System.out.println("匹配不上");
        //}
        //
        //String dateRegex = "(20\\d{2})\\/([0|1]+\\d)\\/([0-3][0-9])";
        //String timeRegex = "([0-2][0-9])\\:([0-6][0-9])\\:([0-6][0-9])";
        //Pattern dateP = Pattern.compile(dateRegex);
        //Pattern timeP = Pattern.compile(timeRegex);
        ////String dateStr = "2020/06/06 14:00:23";
        //String dateStr = "2020/06/09";
        //String timeStr = "14:00:30";
        //Matcher m1 = dateP.matcher(dateStr);
        //Matcher m2 = timeP.matcher(timeStr);
        ////if (m1.matches()) {
        //if (m2.matches()) {
        //    System.out.println(m2.group());
        //    System.out.println(m2.group(1));
        //    System.out.println(m2.group(2));
        //    System.out.println(m2.group(3));
        //    //System.out.println(m1.group(4));
        //    //System.out.println(m1.group(5));
        //    //System.out.println(m1.group(6));
        //}


        //时间匹配
        //DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        //String format = dtf.format(LocalDateTime.now());
        //String dateTimeRegex = "(20\\d{2})\\/([0|1]+\\d)\\/([0-3][0-9])\\s([0-2][0-9])\\:([0-6][0-9])\\:([0-6][0-9])";
        //Pattern dateTimePattern = Pattern.compile(dateTimeRegex);
        //Matcher matcher1 = dateTimePattern.matcher(format);
        //if (matcher1.matches()){
        //    System.out.println(matcher1.group());// 匹配整个字符串
        //    System.out.println(matcher1.group(1));
        //    System.out.println(matcher1.group(2));
        //    System.out.println(matcher1.group(3));
        //    System.out.println(matcher1.group(4));
        //    System.out.println(matcher1.group(5));
        //    System.out.println(matcher1.group(6));
        //}

        //5
        //String s = "the quick brown fox jumps over the lazy dog.";
        //Pattern p = Pattern.compile("\\wo\\w");
        //Matcher m = p.matcher(s);
        //while (m.find()) {//row fox dog
        //    String sub = s.substring(m.start(), m.end());
        //    System.out.println(sub);
        //}

        //6.
        String s = "The     quick\t\t brown   fox  jumps   over the  lazy dog.";
        String r = s.replaceAll("\\s+", " ");
        System.out.println(r); // "The quick brown fox jumps over the lazy dog."

        //7.
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        String format = dtf.format(LocalDateTime.now());
        String dateTimeRegex = "(20\\d{2})\\/([0|1]+\\d)\\/([0-3][0-9])\\s([0-2][0-9])\\:([0-6][0-9])\\:([0-6][0-9])";
        Pattern dateTimePattern = Pattern.compile(dateTimeRegex);
        Matcher m = dateTimePattern.matcher(format);
        System.out.println(format);
        System.out.println(format.replaceAll(dateTimeRegex,"YYY$1MMM"));
        format =  m.replaceAll("YYY$1MMM");
        System.out.println(format);
    }
}
