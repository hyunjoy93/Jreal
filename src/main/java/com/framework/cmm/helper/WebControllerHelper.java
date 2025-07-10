package com.framework.cmm.helper;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;

import com.framework.cmm.configuration.Constant;
import com.framework.cmm.dto.PagingDto;
import com.framework.utl.DateUtil;
import com.framework.utl.StringUtil;

public class WebControllerHelper {

	Logger log = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * 일반 Controller에서 공통으로 사용하는 함수
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @exception Exception
	 */
	@SuppressWarnings("unchecked")
	public void setInit(ModelAndView mav, Map<String, Object> map, HttpServletRequest request) throws Exception{
		
		mav.addObject("toDay", DateUtil.formatDate(DateUtil.getToday(), "-"));
		
		for (Map.Entry<String, Object> entry : map.entrySet()){
		    mav.addObject(entry.getKey(), entry.getValue());
		}
		
		String userId = "";
		String userName = "";
		String userGroup = "";
		String userPswd = "";
		String userCorp = "";
		
		Map<String, Object> userMap = (Map<String, Object>) request.getSession().getAttribute("loginInfo");

//		// 로그인 정보 확인용
//		for (Map.Entry<String, Object> pair : userMap.entrySet()){
//		    System.out.println("key :: " + pair.getKey());
//		    System.out.println("value :: " + pair.getValue());
//		}	
		
		if(null != userMap) {
			userId = StringUtil.isNullToString(userMap.get("user_id"));
			userName = StringUtil.isNullToString(userMap.get("user_name"));
			userGroup = StringUtil.isNullToString(userMap.get("user_group"));
			userPswd = StringUtil.isNullToString(userMap.get("user_pswd"));
			userCorp = StringUtil.isNullToString(userMap.get("user_corp"));
		}
		
		map.put("userId", userId);
		map.put("userName", userName);
		map.put("userGroup", userGroup);
		map.put("userPswd", userPswd);
		map.put("userCorp", userCorp);

		log.debug("====================================== setInit ======================================" + "\n" + mav.toString());
	}
	
	/**
	 * Rest Controller에서 공통으로 사용하는 함수
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @exception Exception
	 */
	@SuppressWarnings("unchecked")
	public void setInit(Map<String, Object> map, HttpServletRequest request) throws Exception{
		
		String userId = "";
		String userName = "";
		String userGroup = "";
		String userPswd = "";
		String userCorp = "";
		
		Map<String, Object> userMap = (Map<String, Object>) request.getSession().getAttribute("loginInfo");
		
		if(null != userMap) {
			userId = StringUtil.isNullToString(userMap.get("user_id"));
			userName = StringUtil.isNullToString(userMap.get("user_name"));
			userGroup = StringUtil.isNullToString(userMap.get("user_group"));
			userPswd = StringUtil.isNullToString(userMap.get("user_pswd"));
			userCorp = StringUtil.isNullToString(userMap.get("user_corp"));
		}
		
		map.put("userId", userId);
		map.put("userName", userName);
		map.put("userGroup", userGroup);
		map.put("userPswd", userPswd);
		map.put("userCorp", userCorp);
		
		log.debug("====================================== setInit ======================================" + "\n" + map.toString());
	}
	
    /**
     * 페이지 정보를 저장하는 함수
     *
     * @param ModelAndView mav
     * @param Map<String, Object> map 
	 * @param String viewName
	 * @return void
     */	
	public void setViewName(ModelAndView mav, Map<String, Object> map, String viewName) {
		mav.addObject("paramMap", map);
		mav.setViewName(viewName);

		log.debug("====================================== setViewName ======================================" + "\n" + map.toString());
	}

    /**
     * 페이징을 생성한다.
     *
     * @param Map<String, Object> map 
     * @param String addObjectName
	 * @param PagingDto pagingDto
	 * @return void
     */	
	public void setPagingMake(Map<String, Object> map, String addObjectName, PagingDto pagingDto) {
		pagingDto.makePaging(map, addObjectName);
		map.put("paging", pagingDto);
	}
	
	/**
	 * 리스트를 MAP 에 저장하는 함수
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @param PagingDto pagingDto
	 * @param nTotCnt 전체개수
	 * @param String listObjName
	 * @param List<Map<String, Object>> list
	 * @return void
	 * @exception Exception
	 */
	public void setPagingList(Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto, String listObjName, List<Map<String, Object>> list) throws Exception{
		map.put("pageNo", StringUtil.zeroConvert(map.get("pageNo"), Constant.DEFAULT_PAGE_NO));
		map.put("pageSize", StringUtil.zeroConvert(map.get("pageSize"), Constant.DEFAULT_PAGE_SIZE));	
		map.put("naviSize", StringUtil.zeroConvert(map.get("naviSize"), Constant.DEFAULT_NAVI_SIZE));
		setList(map, request, listObjName, list);
		setPagingMake(map, listObjName, pagingDto);
	}

	/**
	 * 리스트를 MAP 에 저장하는 함수
	 * 
	 * @param Map<String, Object> map
	 * @param String addObjectName
	 * @param List<Map<String, Object>> list
	 * @return void
	 * @exception Exception
	 */
	public void setList(Map<String, Object> map, HttpServletRequest request, String addObjectName,  List<Map<String, Object>> list) throws Exception{
		
		int nListSize = 0;
		if(null != list) {
			nListSize = list.size();
		}
		
		int totalCount = 0;
		String nowDateTime = "";
		String addThirtyTime = "";
		
		if(0 < nListSize) {
			totalCount = StringUtil.zeroConvert(StringUtil.isNullToString(list.get(0).get("total_count")));
			nowDateTime = StringUtil.isNullToString(list.get(0).get("now_date_time"));
			addThirtyTime = StringUtil.isNullToString(list.get(0).get("add_thirty_time"));
		}
		
		map.put(addObjectName, list);
		map.put("total_count", totalCount);
		map.put("now_date_time", nowDateTime);
		map.put("add_thirty_time", addThirtyTime);
		
		setResSuccess(map, request);	
	}
	
    /**
	 * Info를 MAP 에 저장하는 함수
     *
     * @param ModelAndView mav
	 * @param String addObjectName
	 * @param Map<String, Object> info
	 * @return void
     */	
	public void setInfo(Map<String, Object> map, HttpServletRequest request, String addObjectName, Map<String, Object> info) throws Exception{
		map.put(addObjectName, info);
		if(null == info) {
			setResFail(map, request, Constant.DEFAULT_NO_DATA);
		}else {
			setResSuccess(map, request);
		}
	}	
	
	/**
	 * DB 등록, 수정, 삭제 시 응담코드 저장
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @exception Exception
	 */
	public void setResCodeDbIud(Map<String, Object> map, HttpServletRequest request, int resultCnt) throws Exception{
		map.put("resCnt", resultCnt);
		if(1 <= resultCnt) {
			setResSuccess(map, request);
		}else {
			setResNoChangeData(map, request, Constant.NO_CHANGE_DATA_RES_MSG);
		}
	}
	
	/**
	 * 응답성공처리
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @exception Exception
	 */
	public void setResSuccess(Map<String, Object> map, HttpServletRequest request) throws Exception{
		map.put("resCode", Constant.SUCCESS_RES_CODE);
		map.put("resMsg", Constant.SUCCESS_RES_MSG);
		log.debug("====================================== setResSuccess ======================================" + "\n" + map.toString());
	}	
	
	/**
	 * 응답실패처리
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @exception Exception
	 */
	public void setResFail(Map<String, Object> map, HttpServletRequest request, Exception ex) throws Exception{
		map.put("resCode", Constant.FAIL_RES_CODE);
		map.put("resMsg", ex.getMessage());
		log.debug("====================================== setResFail ======================================" + "\n" + map.toString());
		
	}
	
	public void setResFail(Map<String, Object> map, HttpServletRequest request, String msg) throws Exception{
		map.put("resCode", Constant.FAIL_RES_CODE);
		map.put("resMsg", msg);
		log.debug("====================================== setResFail ======================================" + "\n" + map.toString());
		
	}
	
	/**
	 * 변경된DATA없음
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @exception Exception
	 */	
	public void setResNoChangeData(Map<String, Object> map, HttpServletRequest request, String msg) throws Exception{
		map.put("resCode", Constant.NO_CHANGE_DATA_RES_CODE);
		map.put("resMsg", msg);
		log.debug("====================================== setResNotChangeData ======================================" + "\n" + map.toString());
		
	}
	
}
