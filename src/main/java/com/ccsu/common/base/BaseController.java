package com.ccsu.common.base;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/3
 * @Time: 10:04
 * Description:
 */
public interface BaseController<T> {
    String add(T entity);
    String update(T entity);
    T findById(Integer id);
    List<T> findAll();

}
