package com.xiaofeng.reader.service.impl;

import com.xiaofeng.reader.entity.Category;
import com.xiaofeng.reader.service.CategoryService;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class CategoryServiceImplTest extends TestCase {
    @Resource
    private CategoryService categoryService;
    @Test
    public void testSelectAll() {
       List<Category> list= categoryService.selectAll();
        System.out.println(list);
    }
}