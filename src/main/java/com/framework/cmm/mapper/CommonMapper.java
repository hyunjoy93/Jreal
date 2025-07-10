package com.framework.cmm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommonMapper {

	public List<Map<String, Object>> selectComnCode(Map<String, Object> map) throws Exception;
	public Map<String, Object> selectEtcComnCode(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectAuthMenu(Map<String, Object> map) throws Exception;
	public int updateTblInfo(Map<String, Object> map) throws Exception;
	public int insertMgrActHist(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectMgrActHist(Map<String, Object> map) throws Exception;
	public String selectNextId(Map<String, Object> map) throws Exception;
	public int updateNextId(Map<String, Object> map) throws Exception;
	public int updateComnCode(Map<String, Object> map) throws Exception;

}
