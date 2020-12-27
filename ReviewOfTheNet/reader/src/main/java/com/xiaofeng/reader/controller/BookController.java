package com.xiaofeng.reader.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.xiaofeng.reader.entity.Book;
import com.xiaofeng.reader.entity.Category;
import com.xiaofeng.reader.service.BookService;
import com.xiaofeng.reader.service.CategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class BookController {
    @Resource
    private CategoryService categoryService;
    @Resource
    private BookService bookService;
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

    /**
     * 分页查询图书列表
     * @param categoryId  分类编号
     * @param order 排序方式
     * @param p 页号
     * @return  分页对象
     */
    @GetMapping("/books")
    @ResponseBody
    public IPage<Book> selectBook(Long categoryId,String order,Integer p){
       if (p==null){
           p=1;
       }
        IPage<Book>  pageObject=   bookService.paging(categoryId,order,p,10);
       return  pageObject;
    }
}
