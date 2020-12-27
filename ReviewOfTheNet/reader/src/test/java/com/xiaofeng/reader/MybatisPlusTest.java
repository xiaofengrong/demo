package com.xiaofeng.reader;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xiaofeng.reader.mapper.TestMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MybatisPlusTest {
    @Resource
    private TestMapper testMapper;
    @Test
    public void testInsert(){
        com.xiaofeng.reader.entity.Test test=new   com.xiaofeng.reader.entity.Test();
        test.setContent("Mybatis Plus测试");
        testMapper.insert(test);
    }
    @Test
    public void testUpdate(){
        com.xiaofeng.reader.entity.Test test=   testMapper.selectById(42);
        test.setContent("Mybatis Plus测试1");
        testMapper.updateById(test);
    }
    @Test
    public void testDelete(){
        testMapper.deleteById(42);
    }
    @Test
    public void testSelect(){
        QueryWrapper<com.xiaofeng.reader.entity.Test> queryWrapper=new QueryWrapper<com.xiaofeng.reader.entity.Test>();
//        queryWrapper.eq("id",37);//id等于5
        queryWrapper.gt("id",5);//id大于5
      List<com.xiaofeng.reader.entity.Test> list= testMapper.selectList(queryWrapper);
        System.out.println(list.get(0).getContent());
    }
}
