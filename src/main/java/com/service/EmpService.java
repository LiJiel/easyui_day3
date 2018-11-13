package com.service;

import com.entity.Emp;

import java.util.List;

public interface EmpService {
    void save(Emp emp);
    List<Emp> queryByPage(Integer page,Integer rows);
    long allTotals();
    void delete(String id);
    Emp queryById(String id);
    void update(Emp emp);
}
