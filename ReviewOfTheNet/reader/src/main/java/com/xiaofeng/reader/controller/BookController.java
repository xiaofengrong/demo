package com.xiaofeng.reader.controller;

import com.xiaofeng.reader.entity.Category;
import com.xiaofeng.reader.service.CategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class BookController {
    @Resource
    private CategoryService categoryService;

    /**
     * 显示首页
     * @return
     */
   @GetMapping("/")
    public ModelAndView showIndex(){
        ModelAndView mav=new ModelAndView("/index");
        List<Category> categoryList= categoryService.selectAll();
        mav.addObject("categoryList",categoryList);
        return  mav;
    }
}
