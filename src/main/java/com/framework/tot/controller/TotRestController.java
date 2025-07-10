package com.framework.tot.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.framework.cmm.dto.PagingDto;
import com.framework.cmm.helper.WebControllerHelper;
import com.framework.tot.service.TotService;

@RestController
public class TotRestController extends WebControllerHelper{
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private TotService totService;
	

	/**
	 * 통계관리(자산별) 건수
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/tot/totChkAssetList", method=RequestMethod.POST)
	public Map<String, Object> totChkAssetList(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			//자산 list
			super.setList(map, request, "TotChkAssetList", totService.selectTotChkAssetList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 통계관리(업체별) 건수
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/tot/totChkCorpList", method=RequestMethod.POST)
	public Map<String, Object> totChkCorpList(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			//자산 list
			super.setList(map, request, "TotChkCorpList", totService.selectTotChkCorpList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
}
