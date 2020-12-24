package com.xiaofeng.oa.dao;

import com.xiaofeng.oa.entity.Notice;
import com.xiaofeng.oa.utils.MybatisUtils;
import junit.framework.TestCase;
import org.junit.Test;

import java.util.Date;

public class NoticeDaoTest extends TestCase {
    @Test
    public void testInsert() {
        MybatisUtils.executeUpdate(sqlSession->{
            NoticeDao dao=sqlSession.getMapper(NoticeDao.class);
            Notice notice=new Notice();
            notice.setReceiverId(1l);
            notice.setContent("审批成功");
            notice.setCreateTime(new Date());
            dao.insert(notice);
            return null;
        });
    }
}