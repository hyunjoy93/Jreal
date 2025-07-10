package com.framework.tot.controller;

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
public class TotController extends WebControllerHelper {
	
	Logger log = LoggerFactory.getLogger(this.getClass());

	/**
	 * 통계관리 > 점검통계(자산별)
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/tot/subTotChkAsset")
	public ModelAndView subTotChkAsset(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "tot/subTotChkAsset");
		
		return mav;
	}
	
	/**
	 * 통계관리 > 점검통계(업체별)
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/tot/subTotChkCorp")
	public ModelAndView subTotChkCorp(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "tot/subTotChkCorp");
		
		return mav;
	}
}
