package com.framework.tot.service;

import java.util.List;
import java.util.Map;

public interface TotService {

	public List<Map<String, Object>> selectTotChkAssetList(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectTotChkCorpList(Map<String, Object> map) throws Exception;
	
}
