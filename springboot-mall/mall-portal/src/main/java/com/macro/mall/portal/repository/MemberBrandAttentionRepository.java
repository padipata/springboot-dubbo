package com.macro.mall.portal.repository;

import com.macro.mall.portal.domain.MemberBrandAttention;

import java.util.List;

/**
 * 会员关注Repository
 * root on 2018/8/2.
 */
public interface MemberBrandAttentionRepository {
    MemberBrandAttention findByMemberIdAndBrandId(Long memberId, Long brandId);

    int deleteByMemberIdAndBrandId(Long memberId, Long brandId);

    List<MemberBrandAttention> findByMemberId(Long memberId);

    void save(MemberBrandAttention memberBrandAttention);
}
