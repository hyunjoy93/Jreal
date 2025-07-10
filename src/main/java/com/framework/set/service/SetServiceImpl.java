package com.framework.set.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.cmm.mapper.SetMapper;

@Service
public class SetServiceImpl implements SetService{
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SetMapper setMapper;

	@Override
	public List<Map<String, Object>> selectSetAssetClsfList(Map<String, Object> map) throws Exception {
		return setMapper.selectSetAssetClsfList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectSetChkFormList(Map<String, Object> map) throws Exception {
		return setMapper.selectSetChkFormList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectSetChkItemList(Map<String, Object> map) throws Exception {
		return setMapper.selectSetChkItemList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectSetCommCdList(Map<String, Object> map) throws Exception {
		return setMapper.selectSetCommCdList(map);
	}

	@Override
	public List<Map<String, Object>> selectSetCommCdDtlList(Map<String, Object> map) throws Exception {
		return setMapper.selectSetCommCdDtlList(map);
	}
	
	@Override
	public int insertChkForm(Map<String, Object> map) throws Exception {
		return setMapper.insertChkForm(map);
	}
	
	@Override
	public int updateChkForm(Map<String, Object> map) throws Exception {
		return setMapper.updateChkForm(map);
	}
	
	@Override
	public int deleteChkForm(Map<String, Object> map) throws Exception {
		return setMapper.deleteChkForm(map);
	}
	
	@Override
	public int insertChkItem(Map<String, Object> map) throws Exception {
		return setMapper.insertChkItem(map);
	}
	
	@Override
	public int insertExlItem(List<Map<String, Object>> items) throws Exception {
		return setMapper.insertExlItem(items);
	}
	
	@Override
	public int updateChkItem(Map<String, Object> map) throws Exception {
		return setMapper.updateChkItem(map);
	}
	
	@Override
	public int deleteChkItem(Map<String, Object> map) throws Exception {
		return setMapper.deleteChkItem(map);
	}

	@Override
	public Map<String, Object> selectChkFormInfo(Map<String, Object> map) throws Exception {
		return setMapper.selectChkFormInfo(map);
	}

	@Override
	public Map<String, Object> selectChkItemInfo(Map<String, Object> map) throws Exception {
		return setMapper.selectChkItemInfo(map);
	}
	

	
	@Override
	public int insertAsetClsf(Map<String, Object> map) throws Exception {
		return setMapper.insertAsetClsf(map);
	}
	
	@Override
	public int updateAsetClsf(Map<String, Object> map) throws Exception {
		return setMapper.updateAsetClsf(map);
	}
	
	@Override
	public int deleteAsetClsf(Map<String, Object> map) throws Exception {
		return setMapper.deleteAsetClsf(map);
	}
	
	
}	

