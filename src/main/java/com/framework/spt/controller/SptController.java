package com.framework.spt.controller;

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
public class SptController extends WebControllerHelper {

	Logger log = LoggerFactory.getLogger(this.getClass());

	/**
	 * Support > VOC
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/spt/subSupportNotice")
	public ModelAndView subSupportNotice(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);

		// 화면VIEW		
		super.setViewName(mav, map, "spt/subSupportNotice");

		return mav;
	}
	/**
	 * 업무관리 > 나의업무현황
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/spt/subTodoList")
	public ModelAndView subTodoList(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{
		
		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "spt/subTodoList");
		
		return mav;
	}

	/**
	 * Support > FAQ
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/spt/subSupportFaq")
	public ModelAndView subSupportFaq(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);

		// 화면VIEW		
		super.setViewName(mav, map, "spt/subSupportFaq");

		return mav;
	}

	/**
	 * Support > 공지사항
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/spt/subSupportNoticeBak")
	public ModelAndView subSupportNoticeBak(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);

		// 화면VIEW		
		super.setViewName(mav, map, "spt/subSupportNoticeBak");

		return mav;
	}

}