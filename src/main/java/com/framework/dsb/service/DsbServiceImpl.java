package com.framework.dsb.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.cmm.mapper.DsbMapper;

@Service
public class DsbServiceImpl implements DsbService{
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private DsbMapper dsbMapper;

	@Override
	public List<Map<String, Object>> selectDsbList(Map<String, Object> map) throws Exception {
		return dsbMapper.selectDsbList(map);
	}
	
	@Override
	public int selectEvtCnt() throws Exception {
		return dsbMapper.selectEvtCnt();
	}
	
	@Override
	public int selectIcdCnt() throws Exception {
		return dsbMapper.selectIcdCnt();
	}
	
	@Override
	public int selectErrCnt() throws Exception {
		return dsbMapper.selectErrCnt();
	}
	
	@Override
	public int selectTotIcdCnt() throws Exception {
		return dsbMapper.selectTotIcdCnt();
	}
	
	@Override
	public List<Map<String, Object>> selectServerStat() throws Exception {
		return dsbMapper.selectServerStat();
	}
	
	@Override
	public List<Map<String, Object>> selectNotice() throws Exception {
		return dsbMapper.selectNotice();
	}
	
	@Override
	public List<Map<String, Object>> selectIcdList() throws Exception {
		return dsbMapper.selectIcdList();
	}
	
	@Override
	public List<Map<String, Object>> selecYcnt(Map<String, Object> map) throws Exception {
		return dsbMapper.selecYcnt(map);
	}
	
	@Override
	public List<Map<String, Object>> selectExpList(Map<String, Object> map) throws Exception {
		return dsbMapper.selectExpList(map);
	}
	
	@Override
	public Map<String, Object> selectNoticeDetail(int idx) throws Exception {
		return dsbMapper.selectNoticeDetail(idx);
	}
	
	@Override
	public List<Map<String, Object>> selectPopNotice() throws Exception {
		return dsbMapper.selectPopNotice();
	}
	
	@Override
	public int getAgentStat() throws Exception{
		return dsbMapper.getAgentStat();
	}
	
}	
