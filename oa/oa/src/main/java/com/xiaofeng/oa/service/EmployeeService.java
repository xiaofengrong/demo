package com.xiaofeng.oa.service;

import com.xiaofeng.oa.dao.EmployeeDao;
import com.xiaofeng.oa.entity.Employee;
import com.xiaofeng.oa.utils.MybatisUtils;

public class EmployeeService  {
    public Employee selectById(Long employeeId){
      return (Employee)  MybatisUtils.executeQuery(sqlSession->{
          EmployeeDao employeeDao=  sqlSession.getMapper(EmployeeDao.class);
         return employeeDao.selectById(employeeId);
        });
    }
}
