package com.framework.dsb.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.framework.cmm.helper.WebControllerHelper;
import com.framework.dsb.service.DsbService;

@Controller
public class DsbController extends WebControllerHelper {
	
	Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private DsbService dsbService; 
	
	/**
	 * Dashboard > 메인
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/dsb/main")
	public ModelAndView main(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);

		// 화면VIEW		
		super.setViewName(mav, map, "dsb/main");
		
		return mav;
	}

	/**
	 * Dashboard > 메인(팝업)
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/dsb/mainDashboard")
	public ModelAndView mainDashboard(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
				
		// 화면VIEW		
		super.setViewName(mav, map, "dsb/mainDashboard");
		
		return mav;
	}
	
	@RequestMapping("/view/dsb/mainOld")
	public ModelAndView mainOld(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);

		// 화면VIEW		
		super.setViewName(mav, map, "dsb/mainOld");
		
		return mav;
	}
	
	/**
	 * Dashboard > 메인(팝업)
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/dsb/mainDashboardOld")
	public ModelAndView mainDashboardOld(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
				
		// 화면VIEW		
		super.setViewName(mav, map, "dsb/mainDashboardOld");
		
		return mav;
	}
	
}
