package com.company.project;

import com.company.project.service.UserDubboConsumerService;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        ConfigurableApplicationContext run = SpringApplication.run(Application.class, args);
        UserDubboConsumerService userService = run.getBean(UserDubboConsumerService.class);
        userService.printUser();
    }
}

