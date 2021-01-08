package com.xiaofeng.reader.controller;

import com.xiaofeng.reader.entity.Category;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class TestController {
    @GetMapping("/test/t1")
    public ModelAndView test1() {
        ModelAndView mav = new ModelAndView("/test");
       return mav;
    }
}
