package tlcb.pattern.singleton;

public class SingletonTest {
    public static void main(String[] args) {
//        HungrySingleton instance = HungrySingleton.getInstance();
//        System.out.println(HungrySingleton.getInstance());
//        System.out.println(HungrySingleton.getInstance());
        System.out.println(LazySingleton.getInstance());
        System.out.println(LazySingleton.getInstance());
        System.out.println(LazySingleton.getInstance());
        System.out.println(EnumInstance.INSTANCE);

    }
}
