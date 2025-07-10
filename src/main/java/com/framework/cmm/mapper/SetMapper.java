package com.framework.cmm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SetMapper {

	public List<Map<String, Object>> selectSetAssetClsfList(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectSetChkFormList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectSetChkItemList(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> selectChkFormInfo(Map<String, Object> map) throws Exception;
	public Map<String, Object> selectChkItemInfo(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectSetCommCdList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectSetCommCdDtlList(Map<String, Object> map) throws Exception;

	public int insertChkForm(Map<String, Object> map) throws Exception;
	public int updateChkForm(Map<String, Object> map) throws Exception;
	public int deleteChkForm(Map<String, Object> map) throws Exception;
	
	public int insertChkItem(Map<String, Object> map) throws Exception;
	public int insertExlItem(List<Map<String, Object>> items) throws Exception;
	public int updateChkItem(Map<String, Object> map) throws Exception;
	public int deleteChkItem(Map<String, Object> map) throws Exception;
	
	public int insertAsetClsf(Map<String, Object> map) throws Exception;
	public int updateAsetClsf(Map<String, Object> map) throws Exception;
	public int deleteAsetClsf(Map<String, Object> map) throws Exception;
}
