package com.framework.ctl.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.framework.cmm.configuration.Constant;
import com.framework.cmm.dto.PagingDto;
import com.framework.cmm.helper.WebControllerHelper;
import com.framework.ctl.service.CtlService;
import com.framework.opm.service.OpmService;
import com.framework.spt.service.SptService;
import com.framework.utl.BizUtil;
import com.framework.utl.StringUtil;

@RestController
public class CtlRestController extends WebControllerHelper {

	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CtlService ctlService;
	@Autowired
	private OpmService opmService; 
	@Autowired
	private SptService sptService; 

	@Value("${server.mode}")
	String serverMode;
	
	/**
	 * 사용자관리 목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/list", method=RequestMethod.POST)
	public Map<String, Object> list(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 목록 
			super.setPagingList(map, request, pagingDto, "list", ctlService.selectCtlEmpList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}

	/**
	 * 사용자관리 팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/userDetail", method=RequestMethod.POST)
	public Map<String, Object> userDetail(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 목록 
			super.setInfo(map, request, "detail", ctlService.selectUserDetail(map)); // 사용자관리 상세보기 팝업
			
			map.put("apnd_file_trg_id", "E_" + map.get("empId"));
			//사원 정보보안서약서파일
			map.put("apnd_file_sno", 1);
			super.setList(map, request, "EmpFile1", sptService.selectNoticeFiles(map));
			//사원 정보보안서약서파일
			map.put("apnd_file_sno", 2);
			super.setList(map, request, "EmpFile2", sptService.selectNoticeFiles(map));

			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 로그인
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/login", method=RequestMethod.POST)
	public Map<String, Object> login(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 패스워드
			String paramPassWord = StringUtil.isNullToString(map.get("loginPassword"), "");
			
			// 패스워드 SHA256 암호화
			map.put("loginPassword", BizUtil.encryptPassword(paramPassWord));
			
			// 사용자정보
			super.setInfo(map, request, "info", ctlService.selectUserInfo(map));
			
			// 로그인 처리
			if(Constant.SUCCESS_RES_CODE.equals(map.get("resCode"))) {
				request.getSession().setAttribute("loginInfo", map.get("info"));
			}

		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	
	/**
	 * 사용자관리 사용자 추가 팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	
	@RequestMapping(value="/api/ctl/add", method=RequestMethod.POST)
	public Map<String, Object> insertUser(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			// 등록
			super.setResCodeDbIud(map, request, ctlService.insertUser(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 사용자관리 아이디 중복 체크
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/check", method=RequestMethod.POST)
	public Map<String, Object> idCheck(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		int result = ctlService.idCheck(map);
		
		if(result > 0) {
			map.put("idCheckResult", "disable");
		} else {
			map.put("idCheckResult", "able");
		}

		return map;
	}
	
	
	/**
	 * 사용자관리 사용자 수정
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/update", method=RequestMethod.POST)
	public Map<String, Object> updateUser(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 등록
			super.setResCodeDbIud(map, request, ctlService.updateUser(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
	 
		return map;
	}
	
	/**
	 * header 사용자 비밀번호 변경
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	
	@RequestMapping(value="/api/ctl/updateUserPw", method=RequestMethod.POST)
	public Map<String, Object> updateUserPw(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			// 등록
			super.setResCodeDbIud(map, request, ctlService.updateUserPw(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 사용자관리 사용자 삭제
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/delete", method=RequestMethod.POST)
	public Map<String, Object> deleteUser(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 등록
			super.setResCodeDbIud(map, request, ctlService.deleteUser(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
	 
		return map;
	}
	
	/**
	 * sms사용자관리 목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/smsUserList", method=RequestMethod.POST)
	public Map<String, Object> smsUserList(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 목록 
			super.setPagingList(map, request, pagingDto, "smsUserList", ctlService.selectSmsUserList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * sms사용자관리 사용자 추가 팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	
	@RequestMapping(value="/api/ctl/insertSmsUser", method=RequestMethod.POST)
	public Map<String, Object> insertSmsUser(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			// 등록
			super.setResCodeDbIud(map, request, ctlService.insertSmsUser(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * sms사용자관리 목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/smsList", method=RequestMethod.POST)
	public Map<String, Object> smsList(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 목록 
			super.setPagingList(map, request, pagingDto, "smsList", ctlService.selectSmsList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 공지그룹 관리 사용자 수정
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/smsUpdateUser", method=RequestMethod.POST)
	public Map<String, Object> smsUpdateUser(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 등록
			super.setResCodeDbIud(map, request, ctlService.smsUpdateUser(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
	 
		return map;
	}
	
	/**
	 * 공지그룹 관리 사용자 추가 팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	
	@RequestMapping(value="/api/ctl/insertSmsRule", method=RequestMethod.POST)
	public Map<String, Object> insertSmsRule(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			// 등록
			super.setResCodeDbIud(map, request, ctlService.insertSmsRule(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	

	/**
	 * 공지그룹 관리 발송규칙 수정
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/smsUpdate", method=RequestMethod.POST)
	public Map<String, Object> smsUpdate(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 등록
			super.setResCodeDbIud(map, request, ctlService.smsUpdate(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
	 
		return map;
	}
	
	/**
	 * 공지그룹 관리 발송규칙 삭제
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/smsDelete", method=RequestMethod.POST)
	public Map<String, Object> smsDelete(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 등록
			super.setResCodeDbIud(map, request, ctlService.smsDelete(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
	 
		return map;
	}
	
	/**
	 * SMS 사용자관리 발송규칙 삭제
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/smsUserDelete", method=RequestMethod.POST)
	public Map<String, Object> smsUserDelete(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 등록
			super.setResCodeDbIud(map, request, ctlService.smsUserDelete(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
	 
		return map;
	}
	
	/**
	 * 사용자 목록을 엑셀 파일에 저장하고 다운로드합니다.
	 * 
	 * @param List<Map<String, Object>> userList 사용자 목록 데이터
	 * @return 파일 다운로드 경로
	 * @exception Exception
	 */
    @RequestMapping(value = "/api/ctl/excelDownload", method = RequestMethod.POST)
    public ResponseEntity<byte[]> downloadEmpListExcel(@RequestParam Map<String, Object> map) throws Exception {
        try {
            String filePath = "/sw/Jreal/src/main/resources/attach/emp.xlsx";

            // 엑셀 파일 읽기
            FileInputStream fileInputStream = new FileInputStream(filePath);
            Workbook workbook = new XSSFWorkbook(fileInputStream);
            List<Map<String, Object>> employees = ctlService.selectExlEmpList(map);
            List<Map<String, Object>> corps = opmService.selectCorpList(map);
            
            // 사원 헤더 정보
            String[] exheaders = { "emp_id", "emp_nm","corp_ko_nm", "dept_nm", "job_lvl_nm", "intp_no", "celp_no", "auth_grp_nm" };
            
            // 첫 번째 시트에 사원 정보 추가
            Sheet sheet1 = workbook.getSheetAt(0);
            int rowIdx = 1;
            for (Map<String, Object> employee : employees) {
                Row dataRow = sheet1.createRow(rowIdx++);
                for (int i = 0; i < exheaders.length; i++) {
                    Cell dataCell = dataRow.createCell(i);
                    Object value = employee.get(exheaders[i]);
                    if (value != null) {
                        dataCell.setCellValue(value.toString());
                    }
                }
            }
            
            // 업체 헤더 정보
            String[] exheaders2 = { "corp_ko_nm1", "corp_id"};

            // 두 번째 시트를 가져와서 업체 정보 보존
            Sheet sheet2 = workbook.getSheetAt(1);
            int rowIdx2 = 1;
            for (Map<String, Object> corp : corps) {
                Row dataRow = sheet2.createRow(rowIdx2++);
                for (int i = 0; i < exheaders2.length; i++) {
                    Cell dataCell = dataRow.createCell(i);
                    Object value = corp.get(exheaders2[i]);
                    if (value != null) {
                        dataCell.setCellValue(value.toString());
                    }
                }
            }
            
            // 엑셀 파일을 바이트 배열로 변환
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            workbook.write(outputStream);
            byte[] fileContent = outputStream.toByteArray();
            outputStream.close();

            // 파일 이름 생성
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
            String currentTime = dateFormat.format(new Date());
            String fileName = "empData_" + currentTime + ".xlsx";

            // 파일 다운로드를 위한 응답 헤더 설정
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.parseMediaType("application/vnd.ms-excel"));
            headers.setContentDispositionFormData("attachment", fileName);
            headers.setContentLength(fileContent.length);

            return ResponseEntity.ok()
                    .headers(headers)
                    .body(fileContent);
        } catch (Exception ex) {
            // 에러 처리
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    /**
     * 사용자 목록을 업로드합니다.
     * 
     * @param List<Map<String, Object>> userList 사용자 목록 데이터
     * @return 파일 다운로드 경로
     * @exception Exception
     */
    @RequestMapping(value = "/api/ctl/excelUpload", method = RequestMethod.POST)
    public Map<String, Object> uploadEmpListExcel(@RequestParam("file") MultipartFile file, HttpServletRequest request, @RequestParam Map<String, Object> map) throws Exception {
        try {
            InputStream inputStream = file.getInputStream();

            // 엑셀 파일 읽기
            Workbook workbook = new XSSFWorkbook(inputStream);
            Sheet sheet = workbook.getSheetAt(0);

            List<Map<String, Object>> employees = new ArrayList<>();
    		String userId = "";
    		
    		Map<String, Object> userMap = (Map<String, Object>) request.getSession().getAttribute("loginInfo");
    		
    		if(null != userMap) {
    			userId = StringUtil.isNullToString(userMap.get("user_id"));
    		}
    		
            // 데이터 읽기
            for (int rowIndex = 1; rowIndex <= sheet.getLastRowNum(); rowIndex++) {
                Row row = sheet.getRow(rowIndex);
                if (row != null) {
                    Map<String, Object> employee = new HashMap<>();
                    if(StringUtils.isEmpty(getCellValue(row.getCell(0)))) {
                    	continue;
                    }
                    employee.put("emp_id", getCellValue(row.getCell(0)));
                    employee.put("emp_nm", getCellValue(row.getCell(1)));
                    employee.put("corp_nm", getCellValue(row.getCell(2)));
                    employee.put("dept_nm", getCellValue(row.getCell(3)));
                    employee.put("job_lvl_nm", getCellValue(row.getCell(4)));
                    employee.put("intp_no", getCellValue(row.getCell(5)));
                    employee.put("celp_no", getCellValue(row.getCell(6)));
                    employee.put("auth_grp_nm", getCellValue(row.getCell(7)));
//                    employee.put("corp_id", getCellValue(row.getCell(2)));
//                    employee.put("dept_nm", getCellValue(row.getCell(4)));
//                    employee.put("job_lvl_nm", getCellValue(row.getCell(5)));
//                    employee.put("intp_no", getCellValue(row.getCell(6)));
//                    employee.put("celp_no", getCellValue(row.getCell(7)));
//                    employee.put("auth_grp_cd", getCellValue(row.getCell(8)));
                    employee.put("mod_emp_id", userId);

                    employees.add(employee);
                }
            }

            // TODO: employees를 DB에 업로드하는 로직을 구현하십시오.
			// 등록
			super.setResCodeDbIud(map, request, ctlService.insertExlUser(employees));
            // 파일 다운로드 경로 등의 처리를 진행하고, 결과를 반환하십시오.

        } catch (Exception ex) {
			super.setResFail(map, request, ex);
        }
        return map;
    }
    
    
	private Object getCellValue(Cell cell) {
	    if (cell == null) {
	        return null;
	    }
	
	    CellType cellType = cell.getCellType();
	    switch (cellType) {
	        case STRING:
	            return cell.getStringCellValue();
	        case NUMERIC:
	            if (DateUtil.isCellDateFormatted(cell)) {
	                return cell.getDateCellValue();
	            } else {
	                return cell.getNumericCellValue();
	            }
	        case BOOLEAN:
	            return cell.getBooleanCellValue();
	        case FORMULA:
	            return cell.getCellFormula();
	        default:
	            return null;
	    }
	}

	/**
	 * 사원 보안서약서 & 정보보안이수 등록
	 * 
	 * @param Map<String, Object> map
	 * @param MultipartHttpServletRequest request
	 * @exception Exception
	 */
	@RequestMapping(value="api/ctl/fileUpload", headers = ("content-type=multipart/*" ), method = RequestMethod.POST )
	public Map<String, Object> fileProcess(MultipartHttpServletRequest request, HttpServletResponse response,
			@RequestParam("uploadFileMulti") ArrayList<MultipartFile> files,
//			@RequestParam("nticItemSno") String sno,
			@RequestParam() Map<String, Object> map) throws Exception {
		
		super.setInit(map, request);
		
		Boolean success = true;
		String uploadPath = "";
		String savedFileName = "";
		int apnd_file_sno = 0;
		
		// 1. 파일 저장 경로 설정 : 실제 서비스되는 위치(프로젝트 외부에 저장)
		if(!files.isEmpty()) {
			if("sec".equals(map.get("fileType"))) {
				uploadPath = "/sw/Jreal/src/main/webapp/uploadFiles/E/sec/";
				savedFileName = getCurrentDateTime() + "^" + map.get("empId") + "-" + "sec.";
				apnd_file_sno = 1;
			} else {
				uploadPath = "/sw/Jreal/src/main/webapp/uploadFiles/E/edu/";
				savedFileName = getCurrentDateTime() + "^" + map.get("empId") + "-" + "edu.";
				apnd_file_sno = 2;
			}
			
			Map<String, Object> delParam = new HashMap<>();
			delParam.put("apnd_file_trg_id", "E_" + map.get("empId"));
			delParam.put("apnd_file_sno", apnd_file_sno);
			// 여러 개의 파일 이름 저장할 리스트 생성
			ArrayList<String> originalFileNameList = new ArrayList<String>();
			
			int idx = 1;
			for(MultipartFile file :files) {
				// 2. 원본 파일 이름 알아오기
				String originalFileName = file.getOriginalFilename();
				if(!StringUtil.isEmpty(originalFileName)) {
					sptService.deleteFiles(delParam);
					String[] originalSplit = originalFileName.split("\\.");
					
					if(StringUtils.isEmpty(originalFileName)) {
						continue;
					}
					// 파일 이름을 리스트에 추가
					originalFileNameList.add(originalFileName);
					
					// 4. 파일 생성
					File newFile = new File(uploadPath + savedFileName + originalSplit[1]);
					
					// 5. 서버로 전송
					file.transferTo(newFile);
					
					Map<String, Object> fileMap = new HashMap<String, Object>();
					
					fileMap.put("apnd_file_sep_cd", "E");
					fileMap.put("apnd_file_trg_id", "E_" + map.get("empId"));
					fileMap.put("apnd_file_sno", apnd_file_sno);
					fileMap.put("apnd_file_path", uploadPath);
					fileMap.put("apnd_file_nm",savedFileName + originalSplit[1]);
					fileMap.put("user_id", map.get("userId"));
					fileMap.put("emp_id", map.get("empId"));
					
					if(success) {
						int insRes = sptService.insertNoticeFiles(fileMap);
						idx++;
						
						if(apnd_file_sno == 1) {
							fileMap.put("SCRT_PLDG_REG_YN", "Y");
							ctlService.updateUserFile(fileMap);
						} else {
							fileMap.put("EDU_CMPLT_FILE_REG_YN", "Y");
							ctlService.updateUserFile(fileMap);
						}
						if(insRes > 0) {
							map.put("insertFileResult", "successed");
						} else {
							map.put("insertFileResult", "failed");
						}
					}
				}
			}
			
			if(success) {
				map.put("uploadResult", "successed");
			} else {
				map.put("uploadResult", "failed");
			}
		}
		return map;
	}
	
	/**
	 * header 출근
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	
	@RequestMapping(value="/api/ctl/doCheckIn", method=RequestMethod.POST)
	public Map<String, Object> checkIn(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			if("Y".equals(map.get("chkIn"))) {
				int chkInCnt = ctlService.checkCheckIn(map);
				
				if(chkInCnt > 0) {
					map.put("chkYn", "Y");
				}
			} else {
				int chkOutCnt = ctlService.checkCheckOut(map);
				
				if(chkOutCnt > 0) {
					map.put("chkYn", "Y");
				}
				
			}
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	@RequestMapping(value="/api/ctl/insertCheckIn", method=RequestMethod.POST)
	public Map<String, Object> insertCheckIn(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			
			if("Y".equals(map.get("chkIn"))) {
				super.setResCodeDbIud(map, request, ctlService.insertCheckIn(map));
				
			} else {
				super.setResCodeDbIud(map, request, ctlService.insertCheckOut(map));
			}
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
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
	