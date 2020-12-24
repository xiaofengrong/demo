package com.xiaofeng.oa.dao;

import com.xiaofeng.oa.entity.ProcessFlow;
import com.xiaofeng.oa.utils.MybatisUtils;
import junit.framework.TestCase;
import org.junit.Test;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ProcessFlowDaoTest extends TestCase {
    @Test
    public void testInsert() {
        MybatisUtils.executeUpdate(sqlSession->{
            ProcessFlowDao dao=sqlSession.getMapper(ProcessFlowDao.class);
            ProcessFlow processFlow=new ProcessFlow();
            processFlow.setFormId(41l);
            processFlow.setOperatorId(3l);
            processFlow.setAction("apply");
            processFlow.setResult("approved");
            processFlow.setReason("同意");
            processFlow.setCreateTime(new Date());
            Date auditTime=null;
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try{
                auditTime=sdf.parse("2020-11-11 12:01:00");
            }catch(Exception ex){
                ex.printStackTrace();
            }
            processFlow.setAuditTime(auditTime);
            processFlow.setOrderNo(1);
            processFlow.setState("process");
            processFlow.setIsLast(0);
            dao.insert(processFlow);
            return null;
        });
    }
}