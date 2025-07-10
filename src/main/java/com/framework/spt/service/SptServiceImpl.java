package com.framework.spt.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.cmm.mapper.SptMapper;

@Service
public class SptServiceImpl implements SptService{

	Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SptMapper sptMapper;

	@Override
	public List<Map<String, Object>> selectSptList(Map<String, Object> map) throws Exception {
		return sptMapper.selectSptList(map);
	}

	@Override
	public List<Map<String, Object>> selectNotice(Map<String, Object> map) throws Exception {
		return sptMapper.selectNotice(map);
	}

	@Override
	public Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception {
		return sptMapper.selectNoticeDetail(map);
	}
	@Override
	public List<Map<String, Object>> selectNoticeFiles(Map<String, Object> map) throws Exception {
		return sptMapper.selectNoticeFiles(map);
	}

	@Override
	public List<Map<String, Object>> selectFaq(Map<String, Object> map) throws Exception {
		return sptMapper.selectFaq(map);
	}

	@Override
	public Map<String, Object> selectFaqDetail(int idx) throws Exception {
		return sptMapper.selectFaqDetail(idx);
	}

	@Override
	public int updateFaq(Map<String, Object> map) throws Exception{
		return sptMapper.updateFaq(map);
	}

	@Override
	public int deleteFaq(int bbsTxnId) throws Exception{
		return sptMapper.deleteFaq(bbsTxnId);
	}

	@Override
	public int insertFaq(Map<String, Object> map) throws Exception{
		return sptMapper.insertFaq(map);
	}

	@Override
	public String selectMaxIdx() throws Exception {
		return sptMapper.selectMaxIdx();
	}

	@Override
	public int insertNotice(Map<String, Object> map) throws Exception {
		return sptMapper.insertNotice(map);
	}

	@Override
//	public int deleteNotice(int idx) throws Exception{
//		return sptMapper.deleteNotice(idx);
//	}
	
	public int deleteNotice(Map<String, Object> map) throws Exception {
		return sptMapper.deleteNotice(map);
	}
	
	public int deleteNoticeFiles(Map<String, Object> map) throws Exception {
		return sptMapper.deleteNoticeFiles(map);
	}
	
	public int deleteFiles(Map<String, Object> map) throws Exception {
		return sptMapper.deleteFiles(map);
	}

	@Override
	public int updateNotice(Map<String, Object> map) throws Exception{
		return sptMapper.updateNotice(map);
	}

	@Override
	public int insertVoc(Map<String, Object> map) throws Exception{
		return sptMapper.insertVoc(map);
	}

	@Override
	public List<Map<String, Object>> selectVocList(Map<String, Object> map) throws Exception{
		return sptMapper.selectVocList(map);
	}

	@Override
	public int updateViewCnt(int txnId) throws Exception{
		return sptMapper.updateViewCnt(txnId);
	}

	@Override
	public Map<String, Object> selectVocDetail(int txnId) throws Exception{
		return sptMapper.selectVocDetail(txnId);
	}

	@Override
	public int updateVoc(Map<String, Object> map) throws Exception{
		return sptMapper.updateVoc(map);
	}

	@Override
	public int deleteVoc(int txnId) throws Exception{
		return sptMapper.deleteVoc(txnId);
	}

	@Override
	public int updateAns(Map<String, Object> map) throws Exception{
		return sptMapper.updateAns(map);
	}

	@Override
	public Map<String, Object> selectAns(int pId) throws Exception{
		return sptMapper.selectAns(pId);
	}

	@Override
	public List<Map<String, Object>> selectReplList(String txnId) throws Exception{
		return sptMapper.selectReplList(txnId);
	}

	@Override
	public int deleteRepl(Map<String, Object> map) throws Exception {
		return sptMapper.deleteRepl(map);
	}

	@Override
	public int insertRepl(Map<String, Object> map) throws Exception{
		return sptMapper.insertRepl(map);
	}
	
	@Override
	public int insertNoticeFiles(Map<String, Object> map) throws Exception{
		return sptMapper.insertNoticeFiles(map);
	}
	
	@Override
	public List<Map<String, Object>> selectTodoMntcList(Map<String, Object> map) throws Exception{
		return sptMapper.selectTodoMntcList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectTodoCheckInList(Map<String, Object> map) throws Exception{
		return sptMapper.selectTodoCheckInList(map);
	}
}	