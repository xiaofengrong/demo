package com.xiaofeng.mall.service.impl;

import com.xiaofeng.mall.model.dao.UserMapper;
import com.xiaofeng.mall.model.pojo.User;
import com.xiaofeng.mall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 描述：  UserService实现类
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Override
    public User getUser() {
        return userMapper.selectByPrimaryKey(2);
    }
}
