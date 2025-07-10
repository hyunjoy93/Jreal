package com.framework.ctl.controller;

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
public class CtlController extends WebControllerHelper {

	Logger log = LoggerFactory.getLogger(this.getClass());

	/**
	 * 로그아웃
	 * 
	 * @return ModelAndView
	 * @exception Exception
	 */
	@RequestMapping("/view/ctl/logout")
	public ModelAndView logout(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request)
			throws Exception {

		// 로그아웃
		BizUtil.logout(request);

		// 화면VIEW
		super.setViewName(mav, map, "lgn/login");

		return mav;
	}

	/**
	 * 관제 운영 관리 > 사용자 관리
	 * 
	 * @return ModelAndView
	 * @exception Exception
	 */
	@RequestMapping("/view/ctl/subControlMember")
	public ModelAndView subControlMember(ModelAndView mav, @RequestParam Map<String, Object> map,
			HttpServletRequest request) throws Exception {

		// 초기화
		super.setInit(mav, map, request);

		// 화면VIEW
		super.setViewName(mav, map, "ctl/subControlMember");

		return mav;
	}

	/**
	 * 관제 운영 관리 > 공지그룹 관리(SMS, Email)
	 * 
	 * @return ModelAndView
	 * @exception Exception
	 */
	@RequestMapping("/view/ctl/subControlContact")
	public ModelAndView subControlNotice(ModelAndView mav, @RequestParam Map<String, Object> map,
			HttpServletRequest request) throws Exception {

		// 초기화
		super.setInit(mav, map, request);

		// 화면VIEW
		super.setViewName(mav, map, "ctl/subControlContact");

		return mav;
	}

}
