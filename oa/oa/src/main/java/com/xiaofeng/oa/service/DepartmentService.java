package com.xiaofeng.oa.service;

import com.xiaofeng.oa.dao.DepartmentDao;
import com.xiaofeng.oa.entity.Department;
import com.xiaofeng.oa.utils.MybatisUtils;

public class DepartmentService {
    public Department selectById(Long departmentId){
      return (Department)  MybatisUtils.executeQuery(sqlSession->{
          DepartmentDao departmentDao=  sqlSession.getMapper(DepartmentDao.class);
         return departmentDao.selectById(departmentId);
        });
    }
}
