package com.framework.chk.service;

import java.util.List;
import java.util.Map;

public interface ChkService {

	public List<Map<String, Object>> selectChkStatList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectChkRequstList(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> selectChkRequstCorpList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectChkRequstAsetList(Map<String, Object> map) throws Exception;

	public Map<String, Object> selectChkApvlInfo(Map<String, Object> map) throws Exception;
	
	public int selectChkRequstMax() throws Exception;

	public int insertChkReq(Map<String, Object> map) throws Exception;
	public int insertChkAsetReq(Map<String, Object> map) throws Exception;
	public int updateChkReqApvl(Map<String, Object> map) throws Exception;
	
}
