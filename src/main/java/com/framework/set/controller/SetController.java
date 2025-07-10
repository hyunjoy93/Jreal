package com.framework.set.controller;

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
public class SetController extends WebControllerHelper {
	
	Logger log = LoggerFactory.getLogger(this.getClass());

	/**
	 * 환경설정 > 자산분류
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/set/subSetAsetClsf")
	public ModelAndView subSetAsetClsf(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "set/subSetAsetClsf");
		
		return mav;
	}
	
	/**
	 * 환경설정 > 점검양식
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/set/subSetChkForm")
	public ModelAndView subSetChkForm(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "set/subSetChkForm");
		
		return mav;
	}
	
	/**
	 * 환경설정 > 공통코드
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/set/subSetCommCd")
	public ModelAndView subSetCommCd(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "set/subSetCommCd");
		
		return mav;
	}
}
