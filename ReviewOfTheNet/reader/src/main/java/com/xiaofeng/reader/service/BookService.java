package com.xiaofeng.reader.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.xiaofeng.reader.entity.Book;

/**
 * 图书服务
 */
public interface BookService {
    /**
     * 分类查询图书
     * @param categoryId 分类编号
     * @param order 排序方式
     * @param page 页号
     * @param rows 每页记录数
     * @return 分页对象
     */
    public IPage<Book> paging(Long categoryId,String order,Integer page,Integer rows);

}
