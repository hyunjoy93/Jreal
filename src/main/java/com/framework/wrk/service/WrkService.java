package com.framework.wrk.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface WrkService {
	
	public List<Map<String, Object>> selectWrkList(Map<String, Object> map) throws Exception;
	public HashMap<String, Object> detail(Map<String, Object> map) throws Exception;
	
}
