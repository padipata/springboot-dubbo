package com.macro.mall.portal.repository;

import com.macro.mall.portal.domain.MemberReadHistory;

import java.util.List;

/**
 * 会员商品浏览历史Repository
 * root on 2018/8/3.
 */
public interface MemberReadHistoryRepository {
    List<MemberReadHistory> findByMemberIdOrderByCreateTimeDesc(Long memberId);

    void save(MemberReadHistory memberReadHistory);

    void delete(List<MemberReadHistory> memberReadHistoryList);
}
