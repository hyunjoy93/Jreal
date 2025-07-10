package com.framework.ctl.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.cmm.mapper.CtlMapper;
import com.framework.cmm.mapper2.EtcMapper;

@Service
public class CtlServiceImpl implements CtlService{
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CtlMapper ctlMapper;

	@Override
	public List<Map<String, Object>> selectCtlCorpList(Map<String, Object> map) throws Exception {
		return ctlMapper.selectCtlCorpList(map);
	}
	@Override
	public List<Map<String, Object>> selectCtlEmpList(Map<String, Object> map) throws Exception {
		return ctlMapper.selectCtlEmpList(map);
	}
	@Override
	public List<Map<String, Object>> selectExlEmpList(Map<String, Object> map) throws Exception {
		return ctlMapper.selectExlEmpList(map);
	}
	
	@Override
	public Map<String, Object> selectUserInfo(Map<String, Object> map) throws Exception {
		return ctlMapper.selectUserInfo(map);
	}
	
	@Override
	public Map<String, Object> selectUserDetail(Map<String, Object> map) throws Exception {
		return ctlMapper.selectUserDetail(map);
	}
	
	@Override
	public int insertUser(Map<String, Object> map) throws Exception {
		return ctlMapper.insertUser(map);
	}
	
	@Override
	public int insertExlUser(List<Map<String, Object>> employees) throws Exception {
		return ctlMapper.insertExlUser(employees);
	}

	@Override
	public int insertLdapUser(Map<String, Object> map) throws Exception {
		return ctlMapper.insertLdapUser(map);
	}
	
	@Override
	public int idCheck(Map<String, Object> map) throws Exception {
		return ctlMapper.idCheck(map);
	}
	
	@Override
	public int updateUser(Map<String, Object> map) throws Exception {
		return ctlMapper.updateUser(map);
	}
	
	@Override
	public int updateUserFile(Map<String, Object> map) throws Exception {
		return ctlMapper.updateUserFile(map);
	}
	
	@Override
	public int updateUserPw(Map<String, Object> map) throws Exception {
		return ctlMapper.updateUserPw(map);
	}

	@Override
	public int deleteUser(Map<String, Object> map) throws Exception {
		return ctlMapper.deleteUser(map);
	}
	
	@Override
	public List<Map<String, Object>> selectSmsUserList(Map<String, Object> map) throws Exception {
		return ctlMapper.selectSmsUserList(map);
	}
	
	@Override
	public int insertSmsUser(Map<String, Object> map) throws Exception {
		return ctlMapper.insertSmsUser(map);
	}
	
	@Override
	public List<Map<String, Object>> selectSmsList(Map<String, Object> map) throws Exception {
		return ctlMapper.selectSmsList(map);
	}
	
	@Override
	public int smsUpdateUser(Map<String, Object> map) throws Exception {
		return ctlMapper.smsUpdateUser(map);
	}
	
	@Override
	public int insertSmsRule(Map<String, Object> map) throws Exception {
		return ctlMapper.insertSmsRule(map);
	}
	
	@Override
	public int smsUpdate(Map<String, Object> map) throws Exception {
		return ctlMapper.smsUpdate(map);
	}

	@Override
	public int smsDelete(Map<String, Object> map) throws Exception {
		return ctlMapper.smsDelete(map);
	}
	
	@Override
	public int smsUserDelete(Map<String, Object> map) throws Exception {
		return ctlMapper.smsUserDelete(map);
	}
	
	@Override
	public int deleteEmpFiles(Map<String, Object> map) throws Exception {
		return ctlMapper.deleteEmpFiles(map);
	}
	
	@Override
	public int checkCheckIn(Map<String, Object> map) throws Exception {
		return ctlMapper.checkCheckIn(map);
	}
	
	@Override
	public int checkCheckOut(Map<String, Object> map) throws Exception {
		return ctlMapper.checkCheckOut(map);
	}
	
	@Override
	public int insertCheckIn(Map<String, Object> map) throws Exception {
		return ctlMapper.insertCheckIn(map);
	}
	
	@Override
	public int insertCheckOut(Map<String, Object> map) throws Exception {
		return ctlMapper.insertCheckOut(map);
	}
	
}	
