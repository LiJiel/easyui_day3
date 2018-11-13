package com.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BaseDao<T> {
    void save(T t);
    void update(T t);
    void delete(String id);
    T queryOne(String id);
    List<T> queryAll();
    //参数1:起始条数  参数2:每页显示记录数
    List<T> queryByPage(@Param("start") Integer start, @Param("rows") Integer rows);
    //总条数
    Long allTotals();
}
