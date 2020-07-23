package tlcb.pattern.singleton;

/**
 * Effective 强烈推荐写法
 * 1）线程安全问题。因为Java虚拟机在加载枚举类的时候会使用ClassLoader的方法，这个方法使用了同步代码块来保证线程安全。
 * 2）避免反序列化破坏对象，因为枚举的反序列化并不通过反射实现。
 */
public enum EnumInstance {
    INSTANCE("zhu");

    private EnumInstance(String a) {
        this.object = a ;
    }

    private Object object;

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }

    private EnumInstance getInstance() {
        return EnumInstance.INSTANCE;
    }
}
