package com.xiaofeng.reader.service;

import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class TestServiceTest extends TestCase {
    @Resource
    private  TestService testService;
    @Test
    public void testBatchImport() {
        testService.batchImport();
        System.out.println("批量导入成功");
    }
}

