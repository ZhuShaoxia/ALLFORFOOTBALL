package tlcb.pattern.singleton;

/**
 * 静态内部类
 */
public class InnerClassSingleton {
    private InnerClassSingleton() {

    }

    private static class innerSingleton {
        private final static InnerClassSingleton INSTANCE = new InnerClassSingleton();
    }

    public static InnerClassSingleton getInstance() {
        return innerSingleton.INSTANCE;
    }

}
