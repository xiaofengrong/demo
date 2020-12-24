package com.xiaofeng.oa.dao;

import com.xiaofeng.oa.entity.Employee;

public interface EmployeeDao {
    public Employee selectById(Long employeeId);
}
