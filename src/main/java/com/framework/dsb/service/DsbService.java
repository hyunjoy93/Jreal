package com.framework.dsb.service;

import java.util.List;
import java.util.Map;

public interface DsbService {
	
	public List<Map<String, Object>> selectDsbList(Map<String, Object> map) throws Exception;
	public int selectEvtCnt() throws Exception;
	public int selectIcdCnt() throws Exception;
	public int selectErrCnt() throws Exception;
	public int selectTotIcdCnt() throws Exception;
	public List<Map<String, Object>> selectServerStat() throws Exception;
	public List<Map<String, Object>> selectNotice() throws Exception;
	public List<Map<String, Object>> selectIcdList() throws Exception;
	public List<Map<String, Object>> selecYcnt(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectExpList(Map<String, Object> map) throws Exception;
	public Map<String, Object> selectNoticeDetail(int idx) throws Exception;
	public List<Map<String, Object>> selectPopNotice() throws Exception;
	public int getAgentStat() throws Exception;
	
}
