package tlcb;


import com.sun.org.slf4j.internal.Logger;
import com.sun.org.slf4j.internal.LoggerFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author XiaoLei Zhu
 * @Description: Jdbc 工具类
 * @date 2020/6/29 11:10 下午
 */
public class JDBCUtil {
    private final static Logger logger = LoggerFactory.getLogger(JDBCUtil.class);
    private Connection connection;
    private PreparedStatement ps;
    private ResultSet resultSet;

    public void query(String sql, Object... args) throws SQLException {
        for (Object arg : args) {
            ps.setObject(1, arg);
            connection.prepareStatement(sql);
        }
    }

    public static void releaseResource(AutoCloseable... args) {
        try {
            for (AutoCloseable arg : args) {
                if (arg != null) {
                    arg.close();
                }
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
    }

    public static void main(String[] args) {
        int count = 0;
        int num = 0;
        count = count++;
        //for (int i = 0; i <= 100; i++) {
        //    num = num + i;
        //    count = count++;
        //    System.out.println(count);
        //}
    }
}
