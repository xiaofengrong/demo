package com.xiaofeng.mall.controller;

import com.github.pagehelper.PageInfo;
import com.xiaofeng.mall.common.ApiRestResponse;
import com.xiaofeng.mall.service.OrderService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * 描述：   订单后台管理Controller
 */
@RestController
public class OrderAdminController {
    @Autowired
    OrderService orderService;

    @ApiOperation("后台管理列表")
    @GetMapping("/admin/order/list")
    public ApiRestResponse listForAdmin(@RequestParam Integer pageNum, @RequestParam Integer pageSize) {
        PageInfo pageInfo = orderService.listForAdmin(pageNum, pageSize);
        return ApiRestResponse.success(pageInfo);
    }

    @ApiOperation("管理员订单发货")
    @GetMapping("/admin/order/delivered")
    public ApiRestResponse delivered(@RequestParam String orderNo) {
        orderService.delivered(orderNo);
        return ApiRestResponse.success();
    }
    @ApiOperation("完结订单")
    @PostMapping("/order/finish")
    public ApiRestResponse finish(@RequestParam String orderNo) {
      orderService.finish(orderNo);
        return ApiRestResponse.success();
    }
}
