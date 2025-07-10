package com.framework.chk.controller;

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
public class ChkController extends WebControllerHelper {
	
	Logger log = LoggerFactory.getLogger(this.getClass());

	/**
	 * 점검관리 > 점검현황
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/chk/subChkStat")
	public ModelAndView subChkStat(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "chk/subChkStat");
		
		return mav;
	}
	
	/**
	 * 점검관리 > 점검요청
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/chk/subChkReq")
	public ModelAndView subChkReq(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{
		
		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "chk/subChkReq");
		
		return mav;
	}
	
	/**
	 * 점검관리 > 점검결과
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/chk/subChkRslt")
	public ModelAndView subChkRslt(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{
		
		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "chk/subChkRslt");
		
		return mav;
	}
	
	
}
