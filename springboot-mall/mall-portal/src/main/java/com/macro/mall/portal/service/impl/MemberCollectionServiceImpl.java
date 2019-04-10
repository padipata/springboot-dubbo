//package com.macro.mall.portal.service.impl;
//
//import com.macro.mall.model.UmsMember;
//import com.macro.mall.portal.domain.MemberProductCollection;
////import com.macro.mall.portal.repository.MemberProductCollectionRepository;
//import com.macro.mall.portal.service.MemberCollectionService;
//import com.macro.mall.portal.service.UmsMemberService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import java.util.Date;
//import java.util.List;
//
///**
// * 会员收藏Service实现类
// * root on 2018/8/2.
// */
//@Service
//public class MemberCollectionServiceImpl implements MemberCollectionService {
//    @Autowired
//    private MemberProductCollectionRepository productCollectionRepository;
//    @Autowired
//    private UmsMemberService memberService;
//    @Override
//    public int addProduct(MemberProductCollection productCollection) {
//        int count = 0;
//        MemberProductCollection findCollection = productCollectionRepository.findByMemberIdAndProductId(
//                productCollection.getMemberId(), productCollection.getProductId());
//        if (findCollection == null) {
//            UmsMember umsMember = memberService.getCurrentMember();
//            productCollection.setCreateTime(new Date());
//            productCollection.setMemberIcon(umsMember.getIcon());
//            productCollection.setMemberNickname(umsMember.getNickname());
//            productCollectionRepository.save(productCollection);
//            count = 1;
//        }else {
//            return productCollectionRepository.deleteByMemberIdAndProductId(productCollection.getMemberId(), productCollection.getProductId());
//        }
//        return count;
//    }
//
//    @Override
//    public int deleteProduct(Long memberId, Long productId) {
//        return productCollectionRepository.deleteByMemberIdAndProductId(memberId, productId);
//    }
//
//    @Override
//    public List<MemberProductCollection> listProduct(Long memberId,int type) {
//        return productCollectionRepository.findByMemberIdAndType(memberId,type);
//    }
//}
