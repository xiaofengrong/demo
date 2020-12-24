package com.xiaofeng.oa.service;

import com.xiaofeng.oa.dao.RbacDao;
import com.xiaofeng.oa.dao.UserDao;
import com.xiaofeng.oa.entity.Node;
import com.xiaofeng.oa.entity.User;
import com.xiaofeng.oa.service.exception.BussinessException;

import java.util.List;


public class UserService {
    private UserDao userDao = new UserDao();
    private RbacDao rbacDao = new RbacDao();

    /**
     * 根据前台输入进行登录校验
     *
     * @param username 前台输入的用户名
     * @param password 前台输入的密码
     * @return 校验通过后，包含对应用户数据的User实体类
     * @throws BussinessException L001-用户名不存在 L002-密码错误
     */
    public User checkLogin(String username, String password) {
        //按用户名查询用户
        User user = userDao.selectByUsername(username);
        if (user == null) {
            //抛出用户不存在异常
            throw new BussinessException("L001", "用户名不存在");
        }
        if (!password.equals(user.getPassword())) {
            //密码错误的情况
            throw new BussinessException("L002", "密码错误");
        }
        return user;
    }

    public List<Node> selectNodeByUserId(Long userId) {
        List<Node> nodeList=rbacDao.selectNodeByUserId(userId);
        return nodeList;
    }
}
