package com.framework.cmm.mapper2;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EtcMapper {

	public List<Map<String, Object>> selectCtlEmpList(Map<String, Object> map) throws Exception;
	public Map<String, Object> selectUserInfo(Map<String, Object> map) throws Exception;
	public int insertUser(Map<String, Object> map) throws Exception;
	public int idCheck(Map<String, Object> map) throws Exception;
	public int updateUser(Map<String, Object> map) throws Exception;
	public int deleteUser(Map<String, Object> map) throws Exception; 
}
