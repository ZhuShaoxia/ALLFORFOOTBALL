package com.ccsu.work;

import org.junit.Before;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2019/3/24
 * @Time: 16:52
 * Description:
 */
@DisplayName("JunitSampleTest")
public class JunitSampleTest {

    private String name;

    @Before
    public void before() {
        name = "zhuxiaolei";
    }


    @Test
    @DisplayName("Assertions methods")
    public void testUsingJunitAssertThat() {
        String s = name;
        Assertions.assertTrue(s.startsWith("zhu"));
        Assertions.assertTrue(s.endsWith("lei"));
        Assertions.assertEquals(10, s.length());
    }
}
