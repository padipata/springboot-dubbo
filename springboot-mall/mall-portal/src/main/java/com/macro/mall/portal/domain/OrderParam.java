package com.macro.mall.portal.domain;

import lombok.Getter;
import lombok.Setter;

/**
 * 生成订单时传入的参数
 * root on 2018/8/30.
 */
@Getter
@Setter
public class OrderParam {
    //收货地址id
    private Long memberReceiveAddressId;
    //优惠券id
    private Long couponId;
    //使用的积分数
    private Integer useIntegration;
    //支付方式
    private Integer payType;

    private Integer offline ;// 0 送货 1 自取
    private String  content;
    private String cartId;
    private String cartIds;
    private String type; // 1 商品详情 2 勾选购物车 3全部购物车的商品

    String page;
    String formId;
    String platform ="2";


}
