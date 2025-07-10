package com.framework.chk.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.cmm.mapper.ChkMapper;

@Service
public class ChkServiceImpl implements ChkService{
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ChkMapper chkMapper;

	@Override
	public List<Map<String, Object>> selectChkReqInfo(Map<String, Object> map) throws Exception {
		return chkMapper.selectChkReqInfo(map);
	}

	@Override
	public List<Map<String, Object>> selectChkStatList(Map<String, Object> map) throws Exception {
		return chkMapper.selectChkStatList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectChkReqList(Map<String, Object> map) throws Exception {
		return chkMapper.selectChkReqList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectChkRsltFormOption(Map<String, Object> map) throws Exception {
		return chkMapper.selectChkRsltFormOption(map);
	}
	
	@Override
	public List<Map<String, Object>> selectChkRsltFormList(Map<String, Object> map) throws Exception {
		return chkMapper.selectChkRsltFormList(map);
	}

	@Override
	public List<Map<String, Object>> selectChkRsltList(Map<String, Object> map) throws Exception {
		return chkMapper.selectChkRsltList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectRsltReportList(Map<String, Object> map) throws Exception {
		return chkMapper.selectRsltReportList(map);
	}
	
	@Override
	public Map<String, Object> selectChkApvlInfo(Map<String, Object> map) throws Exception {
		return chkMapper.selectChkApvlInfo(map);
	}
	
	
	@Override
	public List<Map<String, Object>> selectChkReqCorpList(Map<String, Object> map) throws Exception {
		return chkMapper.selectChkReqCorpList(map);
	}

	@Override
	public List<Map<String, Object>> selectChkReqAsetList(Map<String, Object> map) throws Exception {
		return chkMapper.selectChkReqAsetList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectChkReqMailList(Map<String, Object> map) throws Exception {
		return chkMapper.selectChkReqMailList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectSceduleMailList() throws Exception {
		return chkMapper.selectSceduleMailList();
	}
	
	@Override
	public int selectChkReqMax() throws Exception {
		return chkMapper.selectChkReqMax();
	}

	@Override
	public int insertChkReq(Map<String, Object> map) throws Exception {
		return chkMapper.insertChkReq(map);
	}
	
	@Override
	public int insertChkAsetReq(Map<String, Object> map) throws Exception {
		return chkMapper.insertChkAsetReq(map);
	}
	
	@Override
	public int insertChkAsignBuReq(Map<String, Object> map) throws Exception {
		return chkMapper.insertChkAsignBuReq(map);
	}
	
	@Override
	public int insertChkAsignJungReq(Map<String, Object> map) throws Exception {
		return chkMapper.insertChkAsignJungReq(map);
	}
	
	@Override
	public int deleteChkRslt(Map<String, Object> map) throws Exception {
		return chkMapper.deleteChkRslt(map);
	}
	@Override
	public int insertChkRslt(List<Map<String, Object>> gridData) throws Exception {
		return chkMapper.insertChkRslt(gridData);
	}
	@Override
	public int updateChkRslt(Map<String, Object> map) throws Exception {
		return chkMapper.updateChkRslt(map);
	}
	
	@Override
	public int updateChkReqApvl(Map<String, Object> map) throws Exception {
		return chkMapper.updateChkReqApvl(map);
	}	
	
	@Override
	public int deleteChkReq(Map<String, Object> map) throws Exception {
		return chkMapper.deleteChkReq(map);
	}

}	

