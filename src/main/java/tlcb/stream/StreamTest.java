package tlcb.stream;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * @author XiaoLei Zhu
 * @Description:
 * @date 2020/7/2 10:49 下午
 */
public class StreamTest {
    public static void main(String[] args) {
        List<Person> personList = initPerson();
        Stream<Person> personStream = personList.stream()
                .filter(person -> person.getAge() > 5);
        //.forEach(System.out::println);
        //.map(person -> person.getName() + ":" + person.getAge())
        List<Person> collect = personStream.collect(Collectors.toList());
        System.out.println(collect);
    }

    public static List<Person> initPerson() {
        List<Person> personList = new ArrayList<>(30);
        for (int i = 0; i < 30; i++) {
            Person p = new Person("zhuxiaolei" + i, new Random().nextInt(10));
            personList.add(p);
        }
        //System.out.println(personList);
        return personList;
    }
}

class Person {
    private String name;
    private Integer age;

    public Person(String name, Integer age) {
        this.name = name;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "Person{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }
}
