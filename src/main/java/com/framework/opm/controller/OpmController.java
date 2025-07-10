package com.framework.opm.controller;

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
public class OpmController extends WebControllerHelper {
	
	Logger log = LoggerFactory.getLogger(this.getClass());

	/**
	 * 운영관리 > 업체관리
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/opm/subOpmCorp")
	public ModelAndView subOpmCorp(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "opm/subOpmCorp");
		
		return mav;
	}

	
	/**
	 * 운영관리 > 매물관리
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/opm/subOpmAsset")
	public ModelAndView subOpmAsset(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "opm/subOpmAsset");
		
		return mav;
	}
	
	/**
	 * 운영관리 > 집합건물매물관리
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/opm/subOpmAsset2")
	public ModelAndView subOpmAsset2(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{
		
		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "opm/subOpmAsset2");
		
		return mav;
	}

	
	/**
	 * 운영관리 > 계약관리
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/opm/subOpmMntc")
	public ModelAndView subOpmMntc(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "opm/subOpmMntc");
		
		return mav;
	}
	
	
	/**
	 * 운영관리 > 계산서요청
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/opm/subOpmTax")
	public ModelAndView subOpmTax(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{
		
		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "opm/subOpmTax");
		
		return mav;
	}
}
