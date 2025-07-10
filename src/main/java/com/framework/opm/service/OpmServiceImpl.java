package com.framework.opm.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.cmm.mapper.OpmMapper;

@Service
public class OpmServiceImpl implements OpmService{
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private OpmMapper opmMapper;

	@Override
	public List<Map<String, Object>> selectAsetClsfList(Map<String, Object> map) throws Exception {
		return opmMapper.selectAsetClsfList(map);
	}
	@Override
	public List<Map<String, Object>> selectCorpList(Map<String, Object> map) throws Exception {
		return opmMapper.selectCorpList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectCorpEmpList(Map<String, Object> map) throws Exception {
		return opmMapper.selectCorpEmpList(map);
	}

	@Override
	public List<Map<String, Object>> selectCorpAsetList(Map<String, Object> map) throws Exception {
		return opmMapper.selectCorpAsetList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectAsetList(Map<String, Object> map) throws Exception {
		return opmMapper.selectAsetList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectAsetList2(Map<String, Object> map) throws Exception {
		return opmMapper.selectAsetList2(map);
	}
	
	@Override
	public List<Map<String, Object>> selectTaxList(Map<String, Object> map) throws Exception {
		return opmMapper.selectTaxList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectMntcList(Map<String, Object> map) throws Exception {
		return opmMapper.selectMntcList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectMntcDtInfo(Map<String, Object> map) throws Exception {
		return opmMapper.selectMntcDtInfo(map);
	}

	@Override
	public Map<String, Object> selectCorpInfo(Map<String, Object> map) throws Exception {
		return opmMapper.selectCorpInfo(map);
	}
	
	@Override
	public Map<String, Object> selectAsetInfo(Map<String, Object> map) throws Exception {
		return opmMapper.selectAsetInfo(map);
	}
	
	@Override
	public Map<String, Object> selectMntcInfo(Map<String, Object> map) throws Exception {
		return opmMapper.selectMntcInfo(map);
	}
	
	@Override
	public int selectMntcDupChk(Map<String, Object> map) throws Exception {
		return opmMapper.selectMntcDupChk(map);
	}
	
	@Override
	public int selectMntcDupChk2(Map<String, Object> map) throws Exception {
		return opmMapper.selectMntcDupChk2(map);
	}
	
	@Override
	public int insertCorp(Map<String, Object> map) throws Exception {
		return opmMapper.insertCorp(map);
	}

	@Override
	public int insertExlItem(List<Map<String, Object>> items) throws Exception {
		return opmMapper.insertExlItem(items);
	}
	
	@Override
	public int insertAsetExlItem(List<Map<String, Object>> items) throws Exception {
		return opmMapper.insertAsetExlItem(items);
	}
	
	@Override
	public int updateCorp(Map<String, Object> map) throws Exception {
		return opmMapper.updateCorp(map);
	}
	
	@Override
	public int deleteCorp(Map<String, Object> map) throws Exception {
		return opmMapper.deleteCorp(map);
	}
	
	@Override
	public int insertAset(Map<String, Object> map) throws Exception {
		return opmMapper.insertAset(map);
	}
	
	@Override
	public int updateAset(Map<String, Object> map) throws Exception {
		return opmMapper.updateAset(map);
	}
	
	@Override
	public int deleteAset(Map<String, Object> map) throws Exception {
		return opmMapper.deleteAset(map);
	}
	
	@Override
	public int insertMntc(Map<String, Object> map) throws Exception {
		return opmMapper.insertMntc(map);
	}
	
	@Override
	public int updateMntc(Map<String, Object> map) throws Exception {
		return opmMapper.updateMntc(map);
	}
	
	@Override
	public int deleteMntc(Map<String, Object> map) throws Exception {
		return opmMapper.deleteMntc(map);
	}
	
	@Override
	public int checkDplAset(Map<String, Object> map) throws Exception {
		return opmMapper.checkDplAset(map);
	}

}	

