package com.framework.cmm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChkMapper {

	public List<Map<String, Object>> selectChkReqInfo(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectChkStatList(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> selectChkReqList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectChkRsltFormList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectChkRsltFormOption(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectChkRsltList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectRsltReportList(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> selectChkReqCorpList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectChkReqAsetList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectChkReqMailList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectSceduleMailList() throws Exception;

	public Map<String, Object> selectChkApvlInfo(Map<String, Object> map) throws Exception;
	
	public int selectChkReqMax() throws Exception;

	public int insertChkReq(Map<String, Object> map) throws Exception;
	public int insertChkAsetReq(Map<String, Object> map) throws Exception;
	public int insertChkAsignBuReq(Map<String, Object> map) throws Exception;
	public int insertChkAsignJungReq(Map<String, Object> map) throws Exception;
	public int deleteChkRslt(Map<String, Object> map) throws Exception;
	public int insertChkRslt(List<Map<String, Object>> gridData) throws Exception;
	public int updateChkRslt(Map<String, Object> map) throws Exception;
	
	public int updateChkReqApvl(Map<String, Object> map) throws Exception;
	
	public int deleteChkReq(Map<String, Object> map) throws Exception;
}
