package com.framework.chk.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.framework.chk.service.ChkService;
import com.framework.cmm.dto.PagingDto;
import com.framework.cmm.helper.WebControllerHelper;

@RestController
public class ChkRestController extends WebControllerHelper{
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ChkService chkService;

	/**
	 * 점검현황목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/chk/chkStatList", method=RequestMethod.POST)
	public Map<String, Object> chkStatList(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			//점검현황 list
			super.setList(map, request, "ChkStatlist", chkService.selectChkStatList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 결재처리 정보 조회
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/chk/chkApvlInfo", method=RequestMethod.POST)
	public Map<String, Object> chkApvlInfo(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			//점검현황 list
			super.setInfo(map, request, "info", chkService.selectChkApvlInfo(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 결재처리 저장
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/chk/updateChkReqApvl", method=RequestMethod.POST)
	public Map<String, Object> updateChkReqApvl(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 수정
			super.setResCodeDbIud(map, request, chkService.updateChkReqApvl(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		
		return map;
	}
	
	/**
	 * 점검요청목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/chk/chkRequstList", method=RequestMethod.POST)
	public Map<String, Object> chkRequstList(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			//점검요청 업체 List
			super.setList(map, request, "chkRequstCorpList", chkService.selectChkRequstCorpList(map));
			
			//점검요청 자산 list
			super.setList(map, request, "chkRequstAsetList", chkService.selectChkRequstAsetList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		
		return map;
	}
	
	/**
	 * 점검요청저장(chk_req)
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/chk/chkRequstSave", method=RequestMethod.POST)
	public Map<String, Object> chkRequstSave(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			int  maxSno = chkService.selectChkRequstMax();
			
			map.put("sno", maxSno+1);
			
			// 등록
			super.setResCodeDbIud(map, request, chkService.insertChkReq(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		
		return map;
	}
	
	/**
	 * 점검요청자산저장(chk_req_aset)
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/chk/chkRequstAsetSave", method=RequestMethod.POST)
	public Map<String, Object> chkRequstAsetSave(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			int  maxSno = chkService.selectChkRequstMax();
			map.put("sno", maxSno+1);
			
			// 등록
			super.setResCodeDbIud(map, request, chkService.insertChkAsetReq(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		
		return map;
	}
	
	/**
	 * 점검요청결재자저장(chk_req_aset)
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/chk/chkRequstAsignSave", method=RequestMethod.POST)
	public Map<String, Object> chkRequstAsignSave(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			// 등록
			super.setResCodeDbIud(map, request, chkService.insertChkAsetReq(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		
		return map;
	}
	
}
