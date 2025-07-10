package com.framework.tot.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.cmm.mapper.TotMapper;

@Service
public class TotServiceImpl implements TotService{
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private TotMapper totMapper;

	@Override
	public List<Map<String, Object>> selectTotChkAssetList(Map<String, Object> map) throws Exception {
		return totMapper.selectTotChkAssetList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectTotChkCorpList(Map<String, Object> map) throws Exception {
		return totMapper.selectTotChkCorpList(map);
	}
	
}	

