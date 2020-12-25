package com.xiaofeng.oa.dao;

import com.xiaofeng.oa.entity.Employee;
import com.xiaofeng.oa.entity.LeaveForm;
import com.xiaofeng.oa.utils.MybatisUtils;
import junit.framework.TestCase;
import org.junit.Test;

public class EmployeeDaoTest extends TestCase {
    @Test
    public void testSelectLeader() {
        Employee employee2=(Employee)MybatisUtils.executeQuery(sqlSession->{
            EmployeeDao employeeDao= sqlSession.getMapper(EmployeeDao.class);
            Employee employee=employeeDao.selectById(2l);
            System.out.println(employee.getEmployeeId());
            Employee employee1=employeeDao.selectLeader(employee);
            System.out.println(employee1.getEmployeeId());
            return employee1;
        });
        System.out.println(employee2.getEmployeeId());
    }
}