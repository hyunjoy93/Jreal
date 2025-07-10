package com.framework.cmm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CtlMapper {

	public List<Map<String, Object>> selectCtlCorpList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectCtlEmpList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectExlEmpList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectEmpFiles(Map<String, Object> map) throws Exception;
	public Map<String, Object> selectUserInfo(Map<String, Object> map) throws Exception;
	public Map<String, Object> selectUserDetail(Map<String, Object> map) throws Exception;
	
	
	public int insertUser(Map<String, Object> map) throws Exception;
	public int insertExlUser(List<Map<String, Object>> employees) throws Exception;
	public int insertLdapUser(Map<String, Object> map) throws Exception;
	public int idCheck(Map<String, Object> map) throws Exception;
	public int updateUser(Map<String, Object> map) throws Exception;
	public int updateUserFile(Map<String, Object> map) throws Exception;
	public int updateUserPw(Map<String, Object> map) throws Exception;
	public int deleteUser(Map<String, Object> map) throws Exception; 
	public List<Map<String, Object>> selectSmsUserList(Map<String, Object> map) throws Exception;
	public int insertSmsUser(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectSmsList(Map<String, Object> map) throws Exception;
	public int smsUpdateUser(Map<String, Object> map) throws Exception;
	public int insertSmsRule(Map<String, Object> map) throws Exception;
	public int smsUpdate(Map<String, Object> map) throws Exception;
	public int smsDelete(Map<String, Object> map) throws Exception; 
	public int smsUserDelete(Map<String, Object> map) throws Exception; 
	public int deleteEmpFiles(Map<String, Object> map) throws Exception; 
	public int checkCheckIn(Map<String, Object> map) throws Exception; 
	public int checkCheckOut(Map<String, Object> map) throws Exception; 
	public int insertCheckIn(Map<String, Object> map) throws Exception; 
	public int insertCheckOut(Map<String, Object> map) throws Exception; 
}
