package com.framework.spt.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.framework.cmm.dto.PagingDto;
import com.framework.cmm.helper.WebControllerHelper;
import com.framework.spt.service.SptService;

@RestController
public class SptRestController extends WebControllerHelper{

	Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SptService sptService;

	/**
	 * 목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/list", method=RequestMethod.POST)
	public Map<String, Object> list(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);

			//공지사항
			super.setList(map, request, "NoticeList", sptService.selectNotice(map));

		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}

	/**
	 * 상세팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/noticeDetail", method=RequestMethod.POST)
	public Map<String, Object> detail(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);

			//공지사항 상세
			super.setInfo(map, request, "NoticeDetail", sptService.selectNoticeDetail(map));
			//공지사항 파일상세
			super.setList(map, request, "NoticeFiles", sptService.selectNoticeFiles(map));

		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}

	/**
	 * 공지사항 삭제
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */

	@RequestMapping(value="/api/spt/deleteNotice", method=RequestMethod.POST)
	public Map<String, Object> deleteNotice(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

//		super.setInit(map, request);
//
//		int txnId = Integer.parseInt(String.valueOf(map.get("txn_id")));
//
//		int delRes = sptService.deleteNotice(txnId);
//
//		if(delRes > 0) {
//			map.put("deleteResult", "successed");
//		} else {
//			map.put("deleteResult", "failed");
//		}
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 등록
			super.setResCodeDbIud(map, request, sptService.deleteNotice(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		
		return map;
		
		
	}
//	@RequestMapping(value="/api/spt/delete", method=RequestMethod.POST)
//	public Map<String, Object> delete(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
//
//		super.setInit(map, request);
//
//		int idx = Integer.parseInt(String.valueOf(map.get("idx")));
//
//		int delRes = sptService.deleteNotice(idx);
//
//		if(delRes > 0) {
//			map.put("deleteResult", "successed");
//		} else {
//			map.put("deleteResult", "failed");
//		}
//		return map;
//	}

	/**
	 * 공지사항 수정
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/update", method=RequestMethod.POST)
	public Map<String, Object> update(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		super.setInit(map, request);

		int updRes = sptService.updateNotice(map);

		if(updRes > 0) {
			map.put("updateResult", "successed");
		} else {
			map.put("updateResult", "failed");
		}
		return map;
	}

	/**
	 * VOC 등록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/registVoc", method=RequestMethod.POST)
	public Map<String, Object> registVoc(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		super.setInit(map, request);

		int insRes = sptService.insertVoc(map);

		if(insRes > 0) {
			map.put("insertResult", "successed");
		} else {
			map.put("insertResult", "failed");
		}
		return map;
	}
	/**
	 * 공지사항 파일 업로드 및 공지사항 등록
	 * 
	 * @param Map<String, Object> map
	 * @param MultipartHttpServletRequest request
	 * @exception Exception
	 */
	@RequestMapping(value="api/spt/faqFileUpload", headers = ("content-type=multipart/*" ), method = RequestMethod.POST )
	public Map<String, Object> fileProcess(MultipartHttpServletRequest request, HttpServletResponse response,
			@RequestParam("uploadFileMulti") ArrayList<MultipartFile> files,
//			@RequestParam("nticItemSno") String sno,
			@RequestParam() Map<String, Object> map) throws Exception {
		
		super.setInit(map, request);
		
		Boolean success = false;
	    String id = request.getParameter("id");
	    String user_id = request.getParameter("user_id");
	    String bbm_titl = request.getParameter("bbm_titl");
	    String bbm_ctnt = request.getParameter("bbm_ctnt");
	    
		String bbmIdx = sptService.selectMaxIdx();
		int Iidx = 0;
		if(!StringUtils.isEmpty(bbmIdx)) {
			Iidx = Integer.parseInt(bbmIdx) + 1;
			bbmIdx = "N_" + Iidx;
		} else {
			bbmIdx = "N_100";
		}
		map.put("idx", bbmIdx);
		map.put("bbm_titl", bbm_titl);
		map.put("bbm_ctnt", bbm_ctnt);
		
		try {
			int insRes = sptService.insertNotice(map);
		} catch (Exception e) {
			
		}
		
		// 1. 파일 저장 경로 설정 : 실제 서비스되는 위치(프로젝트 외부에 저장)
		String uploadPath = "/sw/Jreal/src/main/webapp/uploadFiles/N/";
		// 마지막에 / 있어야함
		
		// 여러 개의 파일 이름 저장할 리스트 생성
		ArrayList<String> originalFileNameList = new ArrayList<String>();
		
		int idx = 1;
		for(MultipartFile file :files) {
			// 2. 원본 파일 이름 알아오기
			String originalFileName = file.getOriginalFilename();
			
			if(StringUtils.isEmpty(originalFileName)) {
				continue;
			}
			// 파일 이름을 리스트에 추가
			originalFileNameList.add(originalFileName);
			
			// 3. 파일 이름이 중복되지 않도록 파일 이름 변경 : 서버에 저장할 이름
			
			String savedFileName =  getCurrentDateTime() + "^" + originalFileName;
			
			// 4. 파일 생성
			File newFile = new File(uploadPath + savedFileName);
			
			// 5. 서버로 전송
			file.transferTo(newFile);
			
			success = true;
			
			Map<String, Object> fileMap = new HashMap<String, Object>();
			
			fileMap.put("apnd_file_sep_cd", "N");
			fileMap.put("apnd_file_trg_id", bbmIdx);
			fileMap.put("apnd_file_sno", idx);
			fileMap.put("apnd_file_path", uploadPath);
			fileMap.put("apnd_file_nm", savedFileName);
			fileMap.put("user_id", user_id);
			
			if(success) {
				int insRes = sptService.insertNoticeFiles(fileMap);
				idx++;
				if(insRes > 0) {
					map.put("insertFileResult", "successed");
				} else {
					map.put("insertFileResult", "failed");
				}
			}
		}
		
		if(success) {
			map.put("uploadResult", "successed");
		} else {
			map.put("uploadResult", "failed");
		}
		
		return map;
	}
	/**
	 * 공지사항 파일 업로드 및 공지사항 수정
	 * 
	 * @param Map<String, Object> map
	 * @param MultipartHttpServletRequest request
	 * @exception Exception
	 */
	@RequestMapping(value="api/spt/noticeUpdate", headers = ("content-type=multipart/*" ), method = RequestMethod.POST )
	public Map<String, Object> noticeUpdateNfileUpload(MultipartHttpServletRequest request, HttpServletResponse response,
			@RequestParam("updateFileMulti") ArrayList<MultipartFile> files,
			@RequestParam() Map<String, Object> map) throws Exception {
		
		super.setInit(map, request);
		
		Boolean success = false;
		String bbmIdx = request.getParameter("bbm_id_mod");
		String user_id = request.getParameter("user_id_mod");
		String bbm_titl = request.getParameter("bbm_titl_mod");
		String bbm_ctnt = request.getParameter("bbm_ctnt_mod");
		
		map.put("bbm_id_mod", bbmIdx);
		map.put("user_id_mod", user_id);
		map.put("bbm_titl_mod", bbm_titl);
		map.put("bbm_ctnt_mod", bbm_ctnt);
		
		try {
			int updRes = sptService.updateNotice(map);
		} catch (Exception e) {
			
		}
		
		// 1. 파일 저장 경로 설정 : 실제 서비스되는 위치(프로젝트 외부에 저장)
		String uploadPath = "/sw/Jreal/src/main/webapp/uploadFiles/N/";
		// 마지막에 / 있어야함
		
		// 여러 개의 파일 이름 저장할 리스트 생성
		ArrayList<String> originalFileNameList = new ArrayList<String>();
		if(!files.isEmpty()) {
			int idx = 1;
			for(MultipartFile file :files) {
				
				// 2. 원본 파일 이름 알아오기
				String originalFileName = file.getOriginalFilename();
				
				if(StringUtils.isEmpty(originalFileName)) {
					continue;
				}
				Map<String, Object> delParam = new HashMap<>();
				delParam.put("apnd_file_trg_id", bbmIdx);
				delParam.put("apnd_file_sno", idx);
				sptService.deleteFiles(delParam);
				
				// 파일 이름을 리스트에 추가
				originalFileNameList.add(originalFileName);
				
				// 3. 파일 이름이 중복되지 않도록 파일 이름 변경 : 서버에 저장할 이름
				
				String savedFileName =  getCurrentDateTime() + "^" + originalFileName;
				
				// 4. 파일 생성
				File newFile = new File(uploadPath + savedFileName);
				
				// 5. 서버로 전송
				file.transferTo(newFile);
				
				success = true;
				
				Map<String, Object> fileMap = new HashMap<String, Object>();
				
				fileMap.put("apnd_file_sep_cd", "N");
				fileMap.put("apnd_file_trg_id", bbmIdx);
				fileMap.put("apnd_file_sno", idx);
				fileMap.put("apnd_file_path", uploadPath);
				fileMap.put("apnd_file_nm", savedFileName);
				fileMap.put("user_id", user_id);
				
				if(success) {
					int insRes = sptService.insertNoticeFiles(fileMap);
					idx++;
					if(insRes > 0) {
						map.put("updateFileResult", "successed");
					} else {
						map.put("updateFileResult", "failed");
					}
				}
			}
		}
		
		if(success) {
			map.put("uploadResult", "successed");
		} else {
			map.put("uploadResult", "failed");
		}
		
		return map;
	}
	
	public static String getCurrentDateTime() {
		Date today = new Date();
		Locale currentLocale = new Locale("KOREAN", "KOREA");
		String pattern = "yyyyMMddHHmmss"; //hhmmss로 시간,분,초만 뽑기도 가능
		SimpleDateFormat formatter = new SimpleDateFormat(pattern,
				currentLocale);
		return formatter.format(today);
	}

//	@RequestMapping(value="/api/spt/faqFileDownload", method=RequestMethod.POST)
//	public void download(
//			@RequestParam() Map<String, Object> map,
//			HttpServletRequest request, 
//			HttpServletResponse response) throws IOException {
//		
//	    String path = "C:/dev/e-visitor/src/main/webapp/uploadFiles/N/";
//	    
//	    String fileId = request.getParameter("apnd_file_trg_id");
//	    String fileIdSplit[] = fileId.split("-");
//	    
//	    Map<String, Object> param = new HashMap<String, Object>();
//	    
//	    param.put("apnd_file_trg_id", fileIdSplit[0]);
//	    param.put("apnd_file_sno", fileIdSplit[1]);
//	    
//	    List fileList = null;
//		try {
//			fileList = sptService.selectNoticeFiles(param);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		try {
//	    Map<String, Object> fileMap = (Map<String, Object>) fileList.get(0);
//	    
//        String originFileName = URLDecoder.decode(fileMap.get("apnd_file_nm").toString(), "UTF-8");
//        String onlyFileName = originFileName.substring(originFileName.lastIndexOf("-") + 1);
//	    
//	    String pathFile = path + originFileName;
//	    
////        File file = new File(pathFile);
//
//		//경로에 있는 파일 찾기
//		File f = new File(pathFile);
//		// 다운로드를 위한 헤더 생성
//		response.setHeader("Content-Type", "application/octet-stream;");
//		response.setHeader("Content-Disposition", "attachment;filename=\"" + onlyFileName + "\";");
//		response.setHeader("Content-Transfer-Encoding", "binary;");
//		response.setContentLength((int) f.length()); // 진행율
//		response.setHeader("Pragma", "no-cache;");
//		response.setHeader("Expires", "-1;");
//		// 저장된 파일을 응답객체의 스트림으로 내보내기,  resp의 outputStream에  해당파일을 복사
//		FileUtils.copyFile(f, response.getOutputStream());
//		response.getOutputStream().close();
//	}catch (IOException e) {
//		response.reset();
//		response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500
//    }
//}
	
	/**
	 * 상세팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/vocDetail", method=RequestMethod.POST)
	public Map<String, Object> vocDetail(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);

			int txnId = Integer.parseInt(String.valueOf(map.get("txn_id")));

			// VOC 조회수 +1
			sptService.updateViewCnt(txnId);

			//VOC 상세
			super.setInfo(map, request, "vocDetail", sptService.selectVocDetail(txnId));

		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}

	/**
	 * VOC 수정
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/updateVoc", method=RequestMethod.POST)
	public Map<String, Object> updateVoc(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		super.setInit(map, request);

		int updRes = sptService.updateVoc(map);

		if(updRes > 0) {
			map.put("updateResult", "successed");
		} else {
			map.put("updateResult", "failed");
		}
		return map;
	}

	/**
	 * VOC 삭제
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/deleteVoc", method=RequestMethod.POST)
	public Map<String, Object> deleteVoc(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		super.setInit(map, request);

		int txnId = Integer.parseInt(String.valueOf(map.get("txn_id")));

		int delRes = sptService.deleteVoc(txnId);

		if(delRes > 0) {
			map.put("deleteResult", "successed");
		} else {
			map.put("deleteResult", "failed");
		}
		
		return map;
	}

	/**
	 * VOC 답변 등록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/updateAns", method=RequestMethod.POST)
	public Map<String, Object> updateAns(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		super.setInit(map, request);

		int updRes = sptService.updateAns(map);

		if(updRes > 0) {
			map.put("insertResult", "successed");
		} else {
			map.put("insertResult", "failed");
		}
		return map;
	}

	/**
	 * 공지사항 답변 댓글 리스트
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/getreplyList", method=RequestMethod.POST)
	public Map<String, Object> getreplyList(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			String txnId = map.get("txnId").toString();
			
			//답변 목록
			super.setList(map, request, "replyList", sptService.selectReplList(txnId));

		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;	
	}

	/**
	 * VOC 답변 댓글삭제
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/deleteRepl", method=RequestMethod.POST)
	public Map<String, Object> deleteRepl(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			
			// 초기화
			super.setInit(map, request);		
			// 등록
			super.setResCodeDbIud(map, request, sptService.deleteRepl(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		
		return map;
		
	}

	/**
	 * VOC 답변 댓글등록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/insertRepl", method=RequestMethod.POST)
	public Map<String, Object> insertRepl(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		super.setInit(map, request);
		
		String bbmIdx = sptService.selectMaxIdx();
		int Iidx = 0;
		if(!StringUtils.isEmpty(bbmIdx)) {
			Iidx = Integer.parseInt(bbmIdx) + 1;
			bbmIdx = "N_" + Iidx;
		} else {
			bbmIdx = "N_100";
		}
		map.put("bbmIdx", bbmIdx);
		
		int insRes = sptService.insertRepl(map);
		
		if(insRes > 0) {
			map.put("insertResult", "successed");
		} else {
			map.put("insertResult", "failed");
		}
		return map;
	}

	/**
	 * 목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/mntcList", method=RequestMethod.POST)
	public Map<String, Object> mntcList(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);

			//공지사항
			super.setList(map, request, "MntcList", sptService.selectTodoMntcList(map));

		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/spt/checkInList", method=RequestMethod.POST)
	public Map<String, Object> checkInList(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			//공지사항
			super.setList(map, request, "checkInList", sptService.selectTodoCheckInList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		
		return map;
	}
	
}