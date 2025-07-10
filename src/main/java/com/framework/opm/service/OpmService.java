package com.framework.opm.service;

import java.util.List;
import java.util.Map;

public interface OpmService {

	public List<Map<String, Object>> selectAsetClsfList(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectCorpList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectCorpEmpList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectCorpAsetList(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> selectAsetList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectAsetList2(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectTaxList(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectMntcList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectMntcDtInfo(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> selectCorpInfo(Map<String, Object> map) throws Exception;
	public Map<String, Object> selectAsetInfo(Map<String, Object> map) throws Exception;
	public Map<String, Object> selectMntcInfo(Map<String, Object> map) throws Exception;
//	public Map<String, Object> selectMntcDupChk(Map<String, Object> map) throws Exception;

	public int selectMntcDupChk(Map<String, Object> map) throws Exception;
	public int selectMntcDupChk2(Map<String, Object> map) throws Exception;
	
	public int insertCorp(Map<String, Object> map) throws Exception;
	public int insertExlItem(List<Map<String, Object>> items) throws Exception;
	public int insertAsetExlItem(List<Map<String, Object>> items) throws Exception;
	public int updateCorp(Map<String, Object> map) throws Exception;
	public int deleteCorp(Map<String, Object> map) throws Exception;
	
	public int insertAset(Map<String, Object> map) throws Exception;
	public int updateAset(Map<String, Object> map) throws Exception;
	public int deleteAset(Map<String, Object> map) throws Exception;
	
	public int insertMntc(Map<String, Object> map) throws Exception;
	public int updateMntc(Map<String, Object> map) throws Exception;
	public int deleteMntc(Map<String, Object> map) throws Exception;
	
	public int checkDplAset(Map<String, Object> map) throws Exception;

}
