package com.company.project.service;

import com.company.project.core.Service;
import com.company.project.model.User;

/**
 * 用户 Dubbo 服务层
 *
 * Created by Padipata on 2018/11/10.
 */
public interface UserDubboService {
    /**
     * 根据用户名，查询用户信息
     *
     * @param nick_name
     */
    User findUserByName(String nick_name);
}