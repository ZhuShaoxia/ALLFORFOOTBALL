package tlcb.pattern.singleton;

/**
 * 懒汉式
 * 第一次使用的时候加载
 * 双重检查懒汉式
 */
public class LazySingleton {
    private static volatile LazySingleton lazySingleton = null;

    private LazySingleton() {

    }

    /**
     * 双重检查懒汉式
     *
     * @return
     */
    public static LazySingleton getInstance() {
        if (lazySingleton == null) {
            synchronized (LazySingleton.class) {
                if (lazySingleton == null) {
                    lazySingleton = new LazySingleton();
                }
            }
        }
        return lazySingleton;
    }

    /**
     * 同步方法的懒汉式
     * @return
     */
    public synchronized LazySingleton getLazySingleton() {
        if (lazySingleton == null) {
            lazySingleton = new LazySingleton();
        }
        return lazySingleton;
    }
}
