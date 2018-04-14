package com.ccsu.common.base;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/2
 * @Time: 21:21
 * Description: service接口
 */
public interface BaseService<T> {

    /**
     * 增加实体
     * @param entity
     * @throws Exception
     */
    void add(T entity) throws Exception;

    /**
     * 删除实体
     * @param id
     * @throws Exception
     */
    void delete(Integer id) throws Exception;

    /**
     * 更新实体
     * @param entity
     * @throws Exception
     */
    void update(T entity) throws Exception;

    /**
     * 加载实体
     * @param id
     * @return
     * @throws Exception
     */
    T load(Integer id) throws Exception;

    /**
     * 查找所有实体
     * @return
     * @throws Exception
     */
    List<T> findAll(String condition) throws Exception;
}
