package com.xiaofeng.oa.service;


import com.xiaofeng.oa.entity.Node;
import com.xiaofeng.oa.entity.User;
import org.junit.Test;

import java.util.List;

public class UserServiceTest {
    private UserService userService=new UserService();
    @Test
    public void checkLogin1() {
        userService.checkLogin("uu","1234");
    }
    @Test
    public void checkLogin2() {
        userService.checkLogin("m8","1234");
    }
    @Test
    public void checkLogin3() {
       User user= userService.checkLogin("m8","test");
        System.out.println(user.getUsername()+":"+user.getPassword());
    }
    @Test
    public void selectNodeByUserId(){
        List<Node> list=userService.selectNodeByUserId(1l);
        System.out.println(list);
    }
}