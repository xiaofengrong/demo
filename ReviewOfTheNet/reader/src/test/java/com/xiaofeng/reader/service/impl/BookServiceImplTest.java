package com.xiaofeng.reader.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.xiaofeng.reader.entity.Book;
import com.xiaofeng.reader.service.BookService;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class BookServiceImplTest extends TestCase {
    @Resource
    private BookService bookService;
    @Test
    public void testPaging() {
     IPage<Book> pageObject= bookService.paging(2l,"quantity",2,10);
        List<Book> records = pageObject.getRecords();
        for(Book b:records){
            System.out.println(b.getBookId()+":"+b.getBookName());
        }
        System.out.println("总页数:"+pageObject.getPages());
        System.out.println("总记录数:"+pageObject.getTotal());
    }
}