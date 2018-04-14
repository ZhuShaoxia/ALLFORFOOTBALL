package com.ccsu.common.base;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/2
 * @Time: 21:22
 * Description: 基础dao接口,定义公共的接口方法
 */
public interface BaseDao<T> {

    /**
     * 保存实体
     *
     * @param entity
     */
    void save(T entity) throws Exception;

    /**
     * 删除实体
     *
     * @param id
     */
    void delete(Integer id) throws Exception;

    /**
     * 查找实体
     *
     * @param id
     * @return
     */
    T findById(Integer id) throws Exception;

    /**
     * 更新实体
     *
     * @param entity
     */
    void update(T entity) throws Exception;

    /**
     * 查询所有的实体
     *
     * @return
     */
    List<T> findAll(String condition) throws Exception;
}
