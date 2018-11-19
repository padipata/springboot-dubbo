package com.company.project.service;

import org.springframework.stereotype.Component;
import com.alibaba.dubbo.config.annotation.Reference;
import com.company.project.model.User;

/**
 * 用户 Dubbo 服务消费者
 * Created by Padipata on 28/02/2017.
 */
@Component
public class UserDubboConsumerService {

    @Reference(version = "1.0.0")
    private UserDubboService userDubboService;

    public void printUser() {
        String nick_name = "土豆";
        User user = userDubboService.findUserByName(nick_name);
        System.out.println(user);
    }
}