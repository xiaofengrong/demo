package com.xiaofeng.mall.service;

import com.xiaofeng.mall.exception.MallException;
import com.xiaofeng.mall.model.pojo.User;


/**
 * 描述：  UserService
 */
public interface UserService {
    User getUser();
    void register(String userName,  String password) throws MallException;

    User login(String userName, String password) throws MallException;

    void updateInformation(User user) throws MallException;

    boolean checkAdminRole(User user);
}
