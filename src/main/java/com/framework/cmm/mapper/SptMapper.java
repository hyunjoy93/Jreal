package com.framework.cmm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SptMapper {

	public List<Map<String, Object>> selectSptList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectNotice(Map<String, Object> map) throws Exception;
	public Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectNoticeFiles(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectFaq(Map<String, Object> map) throws Exception;
	public Map<String, Object> selectFaqDetail(int idx) throws Exception;
	
	public int insertFaq(Map<String, Object> map) throws Exception;
	public int updateFaq(Map<String, Object> map) throws Exception;
	public int deleteFaq(int bbstxnId) throws Exception;
	public String selectMaxIdx() throws Exception;
	
	public int insertNotice(Map<String, Object> map) throws Exception;
//	public int deleteNotice(int idx) throws Exception;
	public int deleteNotice(Map<String, Object> map) throws Exception;
	public int deleteNoticeFiles(Map<String, Object> map) throws Exception;
	public int deleteFiles(Map<String, Object> map) throws Exception;
	public int updateNotice(Map<String, Object> map) throws Exception;
	
	public int insertVoc(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectVocList(Map<String, Object> map) throws Exception;
	public int updateViewCnt(int txnId) throws Exception;
	public Map<String, Object> selectVocDetail(int txnId) throws Exception;
	public int updateVoc(Map<String, Object> map) throws Exception;
	public int deleteVoc(int txnId) throws Exception;
	
	public int updateAns(Map<String, Object> map) throws Exception;
	public Map<String, Object> selectAns(int pId) throws Exception;
	public List<Map<String, Object>> selectReplList(String txnId) throws Exception;
	public int deleteRepl(Map<String, Object> map) throws Exception;
//	public int deleteRepl(int replId) throws Exception;
	public int insertRepl(Map<String, Object> map) throws Exception;
	
	public int insertNoticeFiles(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectTodoMntcList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectTodoCheckInList(Map<String, Object> map) throws Exception;

}