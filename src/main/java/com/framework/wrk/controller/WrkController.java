package com.framework.wrk.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.framework.cmm.helper.WebControllerHelper;

@Controller
public class WrkController extends WebControllerHelper {
	
	Logger log = LoggerFactory.getLogger(this.getClass());

	/**
	 * 작업관리 > 작업 리스트
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/wrk/subWorkList")
	public ModelAndView subWorkList(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "wrk/subWorkList");
		
		return mav;
	}
	
	/**
	 * 작업관리 > 예외 등록
	 * 
	 * @return string
	 * @exception Exception
	 
	@RequestMapping("/view/wrk/subWorkException")
	public ModelAndView subWorkException(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "wrk/subWorkException");
		
		return mav;
	}
	*/

}
