package com.macro.mall.mapper;

import com.macro.mall.dto.PmsProductCategoryWithChildrenItem;

import java.util.List;

/**
 * 商品分类自定义Dao
 * root on 2018/5/25.
 */
public interface PmsProductCategoryDao {
    List<PmsProductCategoryWithChildrenItem> listWithChildren();
}
