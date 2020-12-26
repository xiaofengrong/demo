package com.xiaofeng.oa.dao;

import com.xiaofeng.oa.entity.Notice;

import java.util.List;

public interface NoticeDao {
    public void insert(Notice notice);
    public List<Notice> selectByReceiverId(Long receiverId);
}
