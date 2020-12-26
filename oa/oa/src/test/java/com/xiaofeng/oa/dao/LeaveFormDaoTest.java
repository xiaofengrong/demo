package com.xiaofeng.oa.dao;

import com.xiaofeng.oa.entity.LeaveForm;
import com.xiaofeng.oa.utils.MybatisUtils;
import junit.framework.TestCase;
import org.junit.Test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class LeaveFormDaoTest extends TestCase {
    @Test
    public void testInsert() {
        MybatisUtils.executeUpdate(sqlSession->{
            LeaveFormDao dao=sqlSession.getMapper(LeaveFormDao.class);
            LeaveForm form=new LeaveForm();
            form.setEmployeeId(4l);
            form.setFormType(1);
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date startTime=null;
            Date endTime=null;
            try{
                startTime=sdf.parse("2020-03-25 08:00:00");
                endTime=sdf.parse("2020-04-01 18:00:00");
            }catch (Exception ex){
                ex.printStackTrace();
            }

            form.setStartTime(startTime);
            form.setEndTime(endTime);
            form.setReason("回家探亲");
            form.setCreateTime(new Date());
            form.setState("processing");
            dao.insert(form);
            return  null;
        });
    }
    @Test
    public void testSelectByParams() {
        MybatisUtils.executeQuery(sqlSession->{
            LeaveFormDao leaveFormDao=   sqlSession.getMapper(LeaveFormDao.class);
         List<Map> list= leaveFormDao.selectByParams("process",2l);
            System.out.println(list);
            return list;
        });
    }
}