package com.xiaofeng.oa.service;

import com.xiaofeng.oa.dao.NoticeDao;
import com.xiaofeng.oa.entity.Notice;
import com.xiaofeng.oa.utils.MybatisUtils;

import java.util.List;

public class NoticeService {
    /**
     * 查询指定员工的系统消息
     * @param receiverId
     * @return 最近100条消息列表
     */
    public List<Notice> getNoticeList(Long receiverId){
        return (List<Notice>)MybatisUtils.executeQuery(sqlSession->{
            NoticeDao noticeDao=sqlSession.getMapper(NoticeDao.class);
          return noticeDao.selectByReceiverId(receiverId);
        });
    }
}
