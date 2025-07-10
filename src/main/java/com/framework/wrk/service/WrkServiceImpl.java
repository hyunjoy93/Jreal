package com.framework.wrk.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.cmm.mapper.WrkMapper;

@Service
public class WrkServiceImpl implements WrkService{
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private WrkMapper wrkMapper;

	@Override
	public List<Map<String, Object>> selectWrkList(Map<String, Object> map) throws Exception {
		return wrkMapper.selectWrkList(map);
	}
	
	@Override
	public HashMap<String, Object> detail(Map<String, Object> map) throws Exception {
		return wrkMapper.detail(map);
	}
	
}	
