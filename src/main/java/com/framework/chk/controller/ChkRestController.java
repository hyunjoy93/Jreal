package com.framework.chk.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.chk.service.ChkService;
import com.framework.cmm.dto.PagingDto;
import com.framework.cmm.helper.WebControllerHelper;
import com.framework.spt.service.SptService;

@SuppressWarnings("deprecation")
@Component
@PropertySource("classpath:application.properties")
@RestController
public class ChkRestController extends WebControllerHelper{
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ChkService chkService;
	@Autowired
	private SptService sptService; 

    private ResourceLoader resourceLoader;
	
	/**
	 * 점검현황 > 점검요청정보 목록 
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/chk/chkReqInfo", method=RequestMethod.POST)
	public Map<String, Object> chkReqInfo(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			//점검현황 list
			super.setList(map, request, "chkReqInfo", chkService.selectChkReqInfo(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 점검현황목록 
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/chk/chkStatList", method=RequestMethod.POST)
	public Map<String, Object> chkStatList(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			//점검현황 list
			super.setList(map, request, "chkStatList", chkService.selectChkStatList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	

	
	/**
	 * 점검요청목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/chk/chkReqList", method=RequestMethod.POST)
	public Map<String, Object> chkReqList(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			//점검요청 업체 List
			super.setList(map, request, "chkReqCorpList", chkService.selectChkReqCorpList(map));
			
			//점검요청 자산 list
			super.setList(map, request, "chkReqAsetList", chkService.selectChkReqAsetList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		
		return map;
	}
	
	/**
	 * 점검결과 등록 팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/chk/chkRstlFormList", method=RequestMethod.POST)
	public Map<String, Object> chkRstlList(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			//점검결과 등록 list
			super.setList(map, request, "chkRstlFormList", chkService.selectChkRsltFormList(map));
			
			//점검양식 옵션 list
			super.setList(map, request, "selectChkRsltFormOption", chkService.selectChkRsltFormOption(map));
			
			map.put("apnd_file_trg_id", "C_" + map.get("rsltchkReqSno") + "^" + map.get("rsltAsetId"));
			
			//점검결과등록 파일
			super.setList(map, request, "ChkRsltFiles", sptService.selectNoticeFiles(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		
		return map;
	}
	
	/**
	 * 결재처리 정보 조회
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/chk/chkApvlInfo", method=RequestMethod.POST)
	public Map<String, Object> chkApvlInfo(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			//점검현황 list
			super.setInfo(map, request, "info", chkService.selectChkApvlInfo(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 결재처리 저장
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/chk/updateChkReqApvl", method=RequestMethod.POST)
	public Map<String, Object> updateChkReqApvl(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 수정
			super.setResCodeDbIud(map, request, chkService.updateChkReqApvl(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		
		return map;
	}
	
	/**
	 * 점검요청저장(chk_req)
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/chk/chkReqSave", method=RequestMethod.POST)
	public Map<String, Object> chkRequstSave(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			Integer maxSno = chkService.selectChkReqMax();
			
			
			map.put("sno", maxSno+1);
			
			ArrayList asetList = new ArrayList<>();
			
			String[] splitData = map.get("asetList").toString().split(",");
			
			for(int i=0; i < splitData.length; i++) {
				asetList.add(splitData[i]);
			}
			
			map.put("asetIds", asetList);
			
			// 점검요청 메인 등록
			super.setResCodeDbIud(map, request, chkService.insertChkReq(map));
			
			// 점검요청 자산정보 등록
			super.setResCodeDbIud(map, request, chkService.insertChkAsetReq(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		
        // 프로퍼티 파일 경로
        String propertiesFilePath = "/sw/Jreal/src/main/resources/application.properties";

        // 프로퍼티 파일에서 email 값을 가져옴
        String username = readEmailIdFromProperties(propertiesFilePath);
		String password = readEmailPwFromProperties(propertiesFilePath);
		String host = readEmailHostFromProperties(propertiesFilePath);
		
		List<Map<String, Object>> ddd2 = chkService.selectChkReqMailList(map);
		
		List<Map<String, Object>> ddd = removeDuplicatesByKeyValue(ddd2, "emp_id");
		
        String inputDateStr = map.get("vistPlanDt").toString();
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMdd");
        SimpleDateFormat outputFormat = new SimpleDateFormat("MM월 dd일");
        Date date = inputFormat.parse(inputDateStr);
        String visitDtMsg = outputFormat.format(date);
		
        Date inputDate = inputFormat.parse(inputDateStr);
        Date today = new Date();

        long timeDiff = inputDate.getTime() - today.getTime();
        long daysDiff = timeDiff / (24 * 60 * 60 * 1000);

        System.out.println("일수 차이: " + daysDiff + "일");
        
        String chkSepCdMsg = "";
        String chkSprtTypeCdMsg = "";
        
        String chkSepCd = map.get("chkSepCd").toString();
        String chkSprtTypeCd = map.get("chkSprtTypeCd").toString();
        
        String chkReqCtnt = map.get("chkReqCtnt").toString();
        
        if("V".equals(chkSprtTypeCd)) {
        	chkSprtTypeCdMsg = "현장방문";
        } else if ("R".equals(chkSprtTypeCd)) {
        	chkSprtTypeCdMsg = "원격지원";
        }
        
        if("2".equals(chkSepCd)) {
        	chkSepCdMsg = "장애 점검을 " + chkSprtTypeCdMsg + "으로 요청합니다.";
        } else if ("3".equals(chkSepCd)) {
        	chkSepCdMsg = "긴급 점검을 " + chkSprtTypeCdMsg + "으로 요청합니다.";
        } else if ("1".equals(chkSepCd)) {
        	chkSepCdMsg = "정기 점검이 " + chkSprtTypeCdMsg + "으로 예정되어 있습니다.";
        }
        
        if("1".equals(chkSepCd) && daysDiff >= 7) {
        	return map;
        } else {
        	for(int i=0; i<ddd.size(); i++) {
        		
			    String to = ddd.get(i).get("emp_id").toString();
//        		String to = "bbtellmt@naver.com";
        		String subject = "";
        		
                if("1".equals(chkSepCd)) {
                	subject = "[" + map.get("userCorp") + "]" + visitDtMsg + " 정기점검 요청 안내";
                } else if ("3".equals(chkSepCd)) {
                	subject = "[" + map.get("userCorp") + "] 긴급점검 요청안내";
                } else if ("2".equals(chkSepCd)) {
                	subject = "[" + map.get("userCorp") + "] 장애점검 요청안내";;
                }	
        		
        		String body = "안녕하세요. " + map.get("userCorp") +" "+ map.get("userName") + " 입니다.\n"
        				+ visitDtMsg +" "+ chkSepCdMsg + "\n"
        				+ "점검내용은 " + chkReqCtnt + " 입니다.\n"
        				+ "점검 관련하여 문의사항은 연락주시기 바랍니다.";
        		
        		Properties props = new Properties();
        		props.put("mail.smtp.auth", "true");
        		props.put("mail.smtp.starttls.enable", "true");
        		props.put("mail.smtp.host", host); // Hiworks SMTP 서버 호스트 주소
        		props.put("mail.smtp.port", "587"); // Hiworks SMTP 서버 포트
        		
        		Session session = Session.getInstance(props,
        				new javax.mail.Authenticator() {
        			protected PasswordAuthentication getPasswordAuthentication() {
        				return new PasswordAuthentication(username, password);
        			}
        		});
        		
        		try {
        			// 초기화
        			super.setInit(map, request);
        			Message message = new MimeMessage(session);
        			message.setFrom(new InternetAddress(username));
        			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        			message.setSubject(subject);
        			message.setText(body);
        			
        			Transport.send(message);
        			
        			System.out.println("Email sent successfully.");
        			setResSuccess(map, request);
        		} catch (MessagingException e) {
        			super.setResFail(map, request, e);
        		}
        	}
        	return map;
        }
	}
	
    private String readEmailHostFromProperties(String propertiesFilePath) {
		// TODO Auto-generated method stub
		return null;
	}

	public static List<Map<String, Object>> removeDuplicatesByKeyValue(List<Map<String, Object>> list, String key) {
        Map<Object, Map<String, Object>> uniqueMap = new LinkedHashMap<>();

        for (Map<String, Object> map : list) {
            Object keyValue = map.get(key);
            if (!uniqueMap.containsKey(keyValue)) {
                uniqueMap.put(keyValue, map);
            }
        }

        return new ArrayList<>(uniqueMap.values());
    }
	
    // 프로퍼티 파일에서 email.id 값을 가져오는 메서드
    private String readEmailIdFromProperties(String propertiesFilePath) throws IOException {
        try (BufferedReader reader = new BufferedReader(new FileReader(propertiesFilePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.startsWith("email.id=")) {
                    return line.substring("email.id=".length()).trim();
                }
            }
        }
        throw new IOException("email.id not found in properties file");
    }
    
    // 프로퍼티 파일에서 email.pw 값을 가져오는 메서드
    private String readEmailPwFromProperties(String propertiesFilePath) throws IOException {
    	try (BufferedReader reader = new BufferedReader(new FileReader(propertiesFilePath))) {
    		String line;
    		while ((line = reader.readLine()) != null) {
    			if (line.startsWith("email.pw=")) {
    				return line.substring("email.pw=".length()).trim();
    			}
    		}
    	}
    	throw new IOException("email.pw not found in properties file");
    }
    
	/**
	 * 점검요청자산저장(chk_req_aset)
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/chk/chkRequstAsetSave", method=RequestMethod.POST)
	public Map<String, Object> chkRequstAsetSave(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			int  maxSno = chkService.selectChkReqMax();
			map.put("sno", maxSno+1);
			
			// 등록
			super.setResCodeDbIud(map, request, chkService.insertChkAsetReq(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		
		return map;
	}
	
	/**
	 * 점검요청결재자저장(chk_req_aset)
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/chk/chkRequstAsignSave", method=RequestMethod.POST)
	public Map<String, Object> chkRequstAsignSave(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			// 등록
			super.setResCodeDbIud(map, request, chkService.insertChkAsetReq(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		
		return map;
	}
	
	/**
	 * 점검결과저장(chk_rslt)
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/chk/insertChkRslt", method=RequestMethod.POST)
	public Map<String, Object> insertChkRslt(@RequestParam("gridData") String gridDataParam, @RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			 
			// 등록
			super.setResCodeDbIud(map, request, chkService.deleteChkRslt(map));
			
			
		    List<Map<String, Object>> gridData = new ArrayList<>();
		    if (gridDataParam != null && !gridDataParam.isEmpty()) {
		        gridData = new ObjectMapper().readValue(gridDataParam, new TypeReference<List<Map<String, Object>>>() {});
		    }

			// 등록
			super.setResCodeDbIud(map, request, chkService.insertChkRslt(gridData));
			
			// 완료일 찍기
			super.setResCodeDbIud(map, request, chkService.updateChkRslt(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		
		return map;
	}
	

	
	/**
	 * 점검결과목록 
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/chk/chkRsltList", method=RequestMethod.POST)
	public Map<String, Object> chkRsltList(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			//점검현황 list
			super.setList(map, request, "chkRsltList", chkService.selectChkRsltList(map));

			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 점검결과보고서 목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/chk/chkRsltReportList", method=RequestMethod.POST)
	public Map<String, Object> chkRsltReportList(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			//점검현황 list
			super.setList(map, request, "chkRstlReportList", chkService.selectRsltReportList(map));
			
			map.put("apnd_file_trg_id", "C_" + map.get("chk_req_sno") + "^" + map.get("aset_id"));
			
			//점검결과등록 파일
			super.setList(map, request, "ChkRsltFiles", sptService.selectNoticeFiles(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		
		return map;
	}
	

	
	/**
	 * 유지보수 계약정보 삭제
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/chk/delete", method=RequestMethod.POST)
	public Map<String, Object> deleteChkReq(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 등록
			super.setResCodeDbIud(map, request, chkService.deleteChkReq(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
	 
		return map;
	}
	

	/**
	 * 점검결과 등록 파일 업로드
	 * 
	 * @param Map<String, Object> map
	 * @param MultipartHttpServletRequest request
	 * @exception Exception
	 */
	@RequestMapping(value="api/chk/fileUpload", headers = ("content-type=multipart/*" ), method = RequestMethod.POST )
	public Map<String, Object> fileProcess(MultipartHttpServletRequest request, HttpServletResponse response,
			@RequestParam("uploadFileMulti") ArrayList<MultipartFile> files,
			@RequestParam() Map<String, Object> map) throws Exception {
		
		super.setInit(map, request);
		
		Boolean success = false;
	    String chk_req_sno = map.get("chk_req_sno").toString();
	    String aset_id = map.get("aset_id").toString();
		
		// 1. 파일 저장 경로 설정 : 실제 서비스되는 위치(프로젝트 외부에 저장)
		String uploadPath = "/sw/Jreal/src/main/webapp/uploadFiles/C/";
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
			
			Map<String, Object> delParam = new HashMap<>();
			delParam.put("apnd_file_trg_id", "C_" + chk_req_sno + "^" + aset_id);
			delParam.put("apnd_file_sno", 1);
			
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
			
			fileMap.put("apnd_file_sep_cd", "C");
			fileMap.put("apnd_file_trg_id", "C_" + chk_req_sno + "^" + aset_id);
			fileMap.put("apnd_file_sno", 1);
			fileMap.put("apnd_file_path", uploadPath);
			fileMap.put("apnd_file_nm", savedFileName);
			fileMap.put("user_id", map.get("userId"));
			
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
	
	public static String getCurrentDateTime() {
		Date today = new Date();
		Locale currentLocale = new Locale("KOREAN", "KOREA");
		String pattern = "yyyyMMddHHmmss"; //hhmmss로 시간,분,초만 뽑기도 가능
		SimpleDateFormat formatter = new SimpleDateFormat(pattern,
				currentLocale);
		return formatter.format(today);
	}	
	
}
