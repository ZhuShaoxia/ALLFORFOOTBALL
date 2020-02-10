package com.ccsu.afterleaveschool.properties;

import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.Properties;
import java.util.ResourceBundle;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/7/10
 * @Time: 10:35
 * Description:读取配置文件的方式
 * 参考网站：https://www.cnblogs.com/apache-x/p/5340241.html
 */
public class ReadPropertiesMain {

    /**
     * 方式一:根据类加载器获得属性配置文件
     */
    public void loadPropertiesByClassLoader() throws IOException {
        Properties properties = new Properties();
        InputStream inputStream = ReadPropertiesMain.class.getClassLoader().getResourceAsStream("jdbc.properties");
        properties.load(inputStream);
        String property = properties.getProperty("jdbc.driver");
        System.out.println(property);
    }

    /**
     * 方式二：根据系统类加载器获得属性配置文件
     *
     * @throws IOException
     */
    public void loadPropertiesBySystemClassLoader() throws IOException {
        InputStream systemResourceAsStream = ClassLoader.getSystemResourceAsStream("jdbc.properties");
        Properties properties = new Properties();
        properties.load(systemResourceAsStream);
        String property = properties.getProperty("jdbc.driver");
        System.out.println(property);
    }

    /**
     * 第三种方式:Java资源绑定ResourceBundle
     * 操作简单 优先推荐此种方式
     */
    public void loadPropertiesByResourceBundle() {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("jdbc");
        Enumeration<String> keys = resourceBundle.getKeys();
        while (keys.hasMoreElements()) {
            String key = keys.nextElement();
            System.out.println(key + "=" + resourceBundle.getString(key));

        }
    }
    public static void main(String[] args) throws IOException {
        ReadPropertiesMain propertiesMain = new ReadPropertiesMain();
        //propertiesMain.loadPropertiesByResourceBundle();
        //propertiesMain.loadPropertiesBySystemClassLoader();
        propertiesMain.loadPropertiesByClassLoader();
    }
}
