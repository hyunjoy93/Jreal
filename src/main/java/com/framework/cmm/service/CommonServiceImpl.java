package com.framework.cmm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.cmm.mapper.CommonMapper;

@Service
public class CommonServiceImpl implements CommonService{
	
	@Autowired
	private CommonMapper commonMapper;

	@Override
	public List<Map<String, Object>> selectComnCode(Map<String, Object> map) throws Exception {
		return commonMapper.selectComnCode(map);
	}

	@Override
	public Map<String, Object> selectEtcComnCode(Map<String, Object> map) throws Exception {
		return commonMapper.selectEtcComnCode(map);
	}
	
	@Override
	public List<Map<String, Object>> selectAuthMenu(Map<String, Object> map) throws Exception {		
		return commonMapper.selectAuthMenu(map);
	}

	@Override
	public int insertMgrActHist(Map<String, Object> map) throws Exception {
		
		int nInsCnt = 0;
		
		int nUptCnt = commonMapper.updateTblInfo(map);
		
		if(0 < nUptCnt) {
			nInsCnt = commonMapper.insertMgrActHist(map);
		}
		
		return nInsCnt;
	}

	@Override
	public List<Map<String, Object>> selectMgrActHist(Map<String, Object> map) throws Exception {
		return commonMapper.selectMgrActHist(map);

	}

	@Override
	public String selectNextId(Map<String, Object> map) throws Exception {
		return  commonMapper.selectNextId(map);
	}
	
	@Override
	public int updateNextId(Map<String, Object> map) throws Exception {
		return  commonMapper.updateNextId(map);
	}

	@Override
	public int updateComnCode(Map<String, Object> map) throws Exception {
		return commonMapper.updateComnCode(map);
	}
	
}	

