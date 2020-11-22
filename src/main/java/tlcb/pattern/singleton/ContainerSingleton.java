package tlcb.pattern.singleton;

import org.apache.commons.lang3.StringUtils;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author XiaoLei Zhu
 * @Description: 容器单例对象
 * @date 2020/5/27 9:08 下午
 */
public class ContainerSingleton {
    // 非线程安全
    private static Map<String, Object> singletonMap = new HashMap<String, Object>();

    private static Map<String,Object> singletonConcurrentMap = new ConcurrentHashMap<>();

    //线程安全 容易造成同步锁
    private static Map<String, Object> singletonTable = new HashMap<String, Object>();
    private ContainerSingleton() {

    }

    public static void putInstance(String key, Object value) {
        if (StringUtils.isEmpty(key) && value != null) {
            if (!singletonMap.containsKey(key)) {
                singletonMap.put(key, value);
            }
        }
    }

    public static Object getInstance(String key) {
        return singletonMap.get(key);
    }
}
