package com.company.project.model;

import com.company.project.configurer.JwtConfigurer;
import com.company.project.core.ServiceException;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureException;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 校验 token
 *
 * @program: users
 * @author: root
 * @create: 2018-11-16 11:03
 **/
public class JwtFilter extends GenericFilterBean {

    public void doFilter(final ServletRequest req, final ServletResponse res, final FilterChain chain)
            throws IOException, ServletException {

        final HttpServletRequest request = (HttpServletRequest) req;
        final HttpServletResponse response = (HttpServletResponse) res;

        // 获取自定义 Http request
        final String authHeader = request.getHeader("authorization");

        if ("OPTIONS".equals(request.getMethod())) {
            response.setStatus(HttpServletResponse.SC_OK);
            chain.doFilter(req, res);
        } else {
            if (authHeader == null || !authHeader.startsWith("Bearer ")) {
                throw new ServiceException("token格式不对或为空");
            }

            // 获取 token 有效部分
            final String token = authHeader.substring(7);

            try {
                // 秘钥对比
                final Claims claims = Jwts.parser().setSigningKey(JwtConfigurer.KEY).parseClaimsJws(token).getBody();
                request.setAttribute("claims", claims);
            } catch (final SignatureException e) {
                throw new ServiceException("无效的token");
            }

            chain.doFilter(req, res);
        }
    }
}