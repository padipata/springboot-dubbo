package com.company.project.web;

import com.company.project.configurer.JwtConfigurer;
import com.company.project.core.Result;
import com.company.project.core.ResultGenerator;
import com.company.project.core.ServiceException;
import com.company.project.model.User;
import com.company.project.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by CodeGenerator on 2018/11/10.
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

    // 默认过期时间2天
    private final static int expiresSecond = 172800000;

    @PostMapping
    public Result add(@RequestBody User user) {
        userService.save(user);
        return ResultGenerator.genSuccessResult();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        userService.deleteById(id);
        return ResultGenerator.genSuccessResult();
    }

    @PutMapping
    public Result update(@RequestBody User user) {
        userService.update(user);
        return ResultGenerator.genSuccessResult();
    }

    /**
     * 通过 id 获取用户信息
     *
     * @param id 用户id
     * @return Json
     */
    @GetMapping("/getUserInfo/{id}")
    public Result detail(@PathVariable Integer id) {
        User user = userService.findById(id);
        return ResultGenerator.genSuccessResult(user);
    }

    /**
     * 获取用户列表
     *
     * @param page 当前页数
     * @param size 每页条数
     * @return Array
     */
    @GetMapping("/getUserList")
    public Result list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<User> list = userService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.genSuccessResult(pageInfo);
    }

    /**
     * 用户登录
     *
     * @param user 用户信息
     * @return token
     */
    @PostMapping("/login")
    public Result login(@RequestBody User user) {
        if (user.getNickName().equals("") || user.getNickName() == null
                || user.getPassword().equals("") || user.getPassword() == null)
            throw new ServiceException("请输入正确的账号密码！");

        //添加Token过期时间
        long nowMillis = System.currentTimeMillis();
        Date now = new Date(nowMillis);
        long expMillis = nowMillis + expiresSecond;
        Date exp = new Date(expMillis);

        // 根据用户id 生成 token
        String jwtToken = "Bearer " + Jwts.builder()
                .setSubject(user.getNickName()).claim("roles", "member")
                .setIssuedAt(new Date())
                .signWith(SignatureAlgorithm.HS256, JwtConfigurer.KEY)
                .setExpiration(exp)
                .compact();

        return ResultGenerator.genSuccessResult(jwtToken);
    }

}
