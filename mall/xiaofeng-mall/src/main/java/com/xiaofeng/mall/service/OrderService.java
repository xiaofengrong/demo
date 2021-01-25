package com.xiaofeng.mall.service;

import com.github.pagehelper.PageInfo;
import com.xiaofeng.mall.model.request.CreateOrderReq;
import com.xiaofeng.mall.model.vo.OrderVO;

/**
 * 描述：   订单Service
 */
public interface OrderService {
    String create(CreateOrderReq createOrderReq);

    OrderVO detail(String orderNo);

    PageInfo listForCustomer(Integer pageNum, Integer pageSize);

    void cancel(String orderNo);

    String qrcode(String orderNo);

    PageInfo listForAdmin(Integer pageNum, Integer pageSize);

    void pay(String orderNo);

    void delivered(String orderNo);

    void finish(String orderNo);
}
