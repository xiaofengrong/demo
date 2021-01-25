package com.xiaofeng.mall.model.dao;

import com.xiaofeng.mall.model.pojo.Order;
import io.swagger.models.auth.In;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    Order selectByOrderNo(@Param("orderNo") String orderNo);

    List<Order> selectForCustomer(@Param("userId") Integer userId);

    List<Order> selectAllForAdmin();
}