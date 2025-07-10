package com.framework.cmm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TotMapper {

	public List<Map<String, Object>> selectTotChkAssetList(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> selectTotChkCorpList(Map<String, Object> map) throws Exception;
	
}
