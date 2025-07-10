package com.framework.cmm.interceptor;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.framework.cmm.configuration.Constant;
import com.framework.utl.BizUtil;

@SuppressWarnings("deprecation")
@Component
@PropertySource("classpath:application.properties")
public class LoggerInterceptor  extends HandlerInterceptorAdapter {

	Logger log = LoggerFactory.getLogger(this.getClass());

    private ResourceLoader resourceLoader;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.debug("====================================== preHandle ======================================");
        boolean isNext = true;

        String reqUrl = request.getRequestURI();
        log.debug("####### Request URI #######" + reqUrl + "#######");

        boolean isLogin = BizUtil.isLogin(request);
        request.setAttribute("isLogin", isLogin);

        request.setAttribute("successResCode", Constant.SUCCESS_RES_CODE);
        request.setAttribute("failResCode", Constant.FAIL_RES_CODE);
        request.setAttribute("noChangeDataResCode", Constant.NO_CHANGE_DATA_RES_CODE);
        request.setAttribute("successResMsg", Constant.SUCCESS_RES_MSG);
        request.setAttribute("failResMsg", Constant.FAIL_RES_MSG);
        request.setAttribute("noChangeDataResMsg", Constant.NO_CHANGE_DATA_RES_MSG);
        request.setAttribute("longLogoutMsg", Constant.LONG_LOGOUT_MSG);
        request.setAttribute("defaultDate", Constant.DEFAULT_DATE);

        log.debug("####### isLogin #######" + isLogin + "#######");

        return isNext;
    }

    // 파일을 읽어오는 메서드
    private String readFile(String filePath) throws IOException {
        StringBuilder content = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                content.append(line);
            }
        }
        return content.toString().trim();
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        log.debug("====================================== postHandle ======================================");
    }
}