package com.macro.mall.portal.service;

import com.macro.mall.model.UmsMemberReceiveAddress;

import java.util.List;

/**
 * 用户地址管理Service
 * root on 2018/8/28.
 */
public interface UmsMemberReceiveAddressService {
    /**
     * 添加收货地址
     */
    int add(UmsMemberReceiveAddress address);

    /**
     * 删除收货地址
     */
    int delete(Long id);

    /**
     * 修改收货地址
     */
    int update(Long id, UmsMemberReceiveAddress address);

    /**
     * 返回当前用户的收货地址
     */
    List<UmsMemberReceiveAddress> list();

    /**
     * 获取地址详情
     */
    UmsMemberReceiveAddress getItem(Long id);

    /**
     * 获取默认地址信息
     */
    UmsMemberReceiveAddress getDefaultItem();

    /**
     * 设为默认地址
     */
    int setDefault(Long id);
}
