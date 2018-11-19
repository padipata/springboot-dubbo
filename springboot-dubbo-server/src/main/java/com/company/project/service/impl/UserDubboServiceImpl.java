package com.company.project.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.company.project.model.User;
import com.company.project.service.UserDubboService;

// 注册为 Dubbo 服务
@Service(version = "1.0.0")
public class UserDubboServiceImpl implements UserDubboService {
    public User findUserByName(String nick_name) {
        return new User();
    }
}
