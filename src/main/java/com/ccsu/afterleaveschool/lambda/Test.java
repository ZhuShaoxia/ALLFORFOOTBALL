package com.ccsu.afterleaveschool.lambda;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2020/2/8
 * @Time: 16:53
 * Description:
 */
public class Test {
    public static void main(String[] args) {
        List<Person> personList = new ArrayList<>();
        personList.add(new Person("zhuxiaolei", "1", 25));
        personList.add(new Person("zhuxiaobin", "1", 27));
        personList.add(new Person("zhuxiaodong", "1", 31));
        personList.add(new Person("zhuxiaogang", "1", 20));
        personList.add(new Person("zhuxiaodan", "2", 22));
        personList.add(new Person("zhuxiaoling", "2", 23));
        personList.add(new Person("zhuxiaohong", "2", 29));

        //1. 匿名内部类
        Collections.sort(personList, new Comparator<Person>() {
            @Override
            public int compare(Person o1, Person o2) {
                return o1.getAge() - o2.getAge();
            }
        });

        //2. lambda 表达式
        Collections.sort(personList, (o1, o2) -> o1.getAge() - o2.getAge());

        //3. 静态方法引用
        Collections.sort(personList, Person::compare);

        //4. 实例方法的引用
        PersonUtil personUtil = new PersonUtil();
        Collections.sort(personList, personUtil::compare);
        System.out.println(personList);

        //5. 构造方法引用:绑定函数式接口
        IPerson iPerson = Person::new;
        Person person = iPerson.initPerson("zhuxiaolei", "1", 25);
        System.out.println(person);

    }

}

class Person {
    private String name;
    private String gender;
    private int age;


    public static int compare(Person p1, Person p2) {
        return p1.getAge() - p2.getAge();
    }

    public Person() {
    }

    public Person(String name, String gender, int age) {
        this.name = name;
        this.gender = gender;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "Person{" +
                "name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", age=" + age +
                '}';
    }
}

class PersonUtil {
    public int compare(Person p1, Person p2) {
        return p1.getName().hashCode() - p2.getName().hashCode();
    }
}

interface IPerson {
    //抽象方法
    Person initPerson(String name, String gender, int age);
}