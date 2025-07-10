package com.framework.cmm.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.framework.cmm.helper.WebControllerHelper;
import com.framework.utl.BizUtil;

@Controller
public class CommonController extends WebControllerHelper {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * index 페이지 호출
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/")
	public String init(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{
		
		String viewPage = "lgn/login";
		
		// 로그인여부
		if(BizUtil.isLogin(request)) {
			viewPage = "dsb/main";
		}else {
			
			// 로그아웃
			BizUtil.logout(request);
		}
		
		return viewPage;
	}
	
	/**
	 * JSP 호출작업만 처리하는 공통 함수
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/link/pageLink")
	public String moveToPage(@RequestParam("link") String linkPage) throws Exception{
		return linkPage;
	}
	
}
