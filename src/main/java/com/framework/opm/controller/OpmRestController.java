package com.framework.opm.controller;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.framework.cmm.dto.PagingDto;
import com.framework.cmm.helper.WebControllerHelper;
import com.framework.opm.service.OpmService;
import com.framework.utl.StringUtil;

@RestController
public class OpmRestController extends WebControllerHelper{
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private OpmService opmService;
	
	/**
	 * 업체목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/corp/corpList", method=RequestMethod.POST)
	public Map<String, Object> corpList(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			//업체 list
			super.setPagingList(map, request, pagingDto, "corpList", opmService.selectCorpList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}

	/**
	 * 업체직원정보목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/corp/corpEmpList", method=RequestMethod.POST)
	public Map<String, Object> corpEmplist(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			//업체직원정보목록
			super.setPagingList(map, request, pagingDto, "corpEmpList", opmService.selectCorpEmpList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 보유자산목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/corp/corpAsetList", method=RequestMethod.POST)
	public Map<String, Object> corpAsetList(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			//자산 list
			super.setPagingList(map, request, pagingDto, "corpAsetList", opmService.selectCorpAsetList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}


	/**
	 * 업체관리 팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/corp/corpInfo", method=RequestMethod.POST)
	public Map<String, Object> corpInfo(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 목록 
			super.setInfo(map, request, "info", opmService.selectCorpInfo(map)); // 업체관리 상세보기 팝업
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	/**
	 * 업체관리 업체 추가 팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	
	@RequestMapping(value="/api/corp/add", method=RequestMethod.POST)
	public Map<String, Object> insertCorp(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			// 등록
			super.setResCodeDbIud(map, request, opmService.insertCorp(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 업체관리 업체정보 수정
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/corp/update", method=RequestMethod.POST)
	public Map<String, Object> updateCorp(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 등록
			super.setResCodeDbIud(map, request, opmService.updateCorp(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
	 
		return map;
	}
	
	/**
	 * 업체관리 업체정보 삭제
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/corp/delete", method=RequestMethod.POST)
	public Map<String, Object> deleteCorp(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 등록
			super.setResCodeDbIud(map, request, opmService.deleteCorp(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
	 
		return map;
	}
	
	
	/**
	 * 자산목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/aset/asetList", method=RequestMethod.POST)
	public Map<String, Object> asetList(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			//자산 list
			super.setPagingList(map, request, pagingDto, "asetList", opmService.selectAsetList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 자산목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/aset/asetList2", method=RequestMethod.POST)
	public Map<String, Object> asetList2(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			//자산 list
			super.setPagingList(map, request, pagingDto, "asetList", opmService.selectAsetList2(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		
		return map;
	}
	
	/**
	 * 계산서목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/aset/taxList", method=RequestMethod.POST)
	public Map<String, Object> taxList(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			//자산 list
			super.setPagingList(map, request, pagingDto, "taxList", opmService.selectTaxList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		
		return map;
	}



	/**
	 * 자산관리 팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/aset/asetInfo", method=RequestMethod.POST)
	public Map<String, Object> asetInfo(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 목록 
			super.setInfo(map, request, "info", opmService.selectAsetInfo(map)); // 업체관리 상세보기 팝업
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	/**
	 * 자산관리 자산 추가 팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	
	@RequestMapping(value="/api/aset/add", method=RequestMethod.POST)
	public Map<String, Object> insertAset(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			// 등록
			super.setResCodeDbIud(map, request, opmService.insertAset(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 자산관리 자산정보 수정
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/aset/update", method=RequestMethod.POST)
	public Map<String, Object> updateAset(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 등록
			super.setResCodeDbIud(map, request, opmService.updateAset(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
	 
		return map;
	}
	
	/**
	 * 자산관리 자산정보 삭제
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/aset/delete", method=RequestMethod.POST)
	public Map<String, Object> deleteAset(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 등록
			super.setResCodeDbIud(map, request, opmService.deleteAset(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
	 
		return map;
	}
	
	
	/**
	 * 유지보수 계약 목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/mntc/mntcList", method=RequestMethod.POST)
	public Map<String, Object> mntcList(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// list
			super.setList(map, request, "mntcList", opmService.selectMntcList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}



	/**
	 * 유지보수 게약 정보 팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/mntc/mntcInfo", method=RequestMethod.POST)
	public Map<String, Object> mntcInfo(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 목록 
			super.setInfo(map, request, "info", opmService.selectMntcInfo(map)); // 유지보수 계약 수정 팝업
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	

	/**
	 * 신규 추가 시 유지보수 게약 기간 내 중복 자산 체크
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/mntc/mntcDupChk", method=RequestMethod.POST)
	public Map<String, Object> mntcDupChk(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		int result = opmService.selectMntcDupChk(map);
		
		map.put("dupCnt",result);

		return map;
	}
	

	/**
	 * 수정 시 유지보수 게약 기간 내 중복 자산 체크
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/mntc/mntcDupChk2", method=RequestMethod.POST)
	public Map<String, Object> mntcDupChk2(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		int result = opmService.selectMntcDupChk2(map);
		
		map.put("dupCnt",result);

		return map;
	}
//	
//	
//	@RequestMapping(value="/api/mntc/mntcDupChk", method=RequestMethod.POST)
//	public Map<String, Object>  mntcDupChk(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {
//
//		try {
//			// 초기화
//			super.setInit(map, request);
//			
//			super.setResCodeDbIud(map, request, opmService.selectMntcDupChk(map));
//			
//			// 목록 
////			super.setResCodeDbIud(map, request, "mntcDupChk", opmService.selectMntcDupChk(map)); // 유지보수 게약 기간 내 중복 자산 체크
//			
//		}catch(Exception ex) {
//			super.setResFail(map, request, ex);
//		}
//
//		return map;
//	}
	
	/**
	 * 유지보수 계약 추가 팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	
	@RequestMapping(value="/api/mntc/add", method=RequestMethod.POST)
	public Map<String, Object> insertMntc(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			String mntc_ctrt_sno = map.get("popMntcCtrtSno").toString();
			int mntcCtrtSno = Integer.parseInt(mntc_ctrt_sno);
			
			map.put("mntcCtrtSno", mntcCtrtSno);
			// 등록
			super.setResCodeDbIud(map, request, opmService.insertMntc(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 유지보수 계약 정보 수정
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/mntc/update", method=RequestMethod.POST)
	public Map<String, Object> updateMntc(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);
			
			String mntc_ctrt_sno = map.get("mntcCtrtSno").toString();
			int mntcCtrtSno = Integer.parseInt(mntc_ctrt_sno);
			
			map.put("mntcCtrtSno", mntcCtrtSno);
			
			// 등록
			super.setResCodeDbIud(map, request, opmService.updateMntc(map));
			
			
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
	@RequestMapping(value="/api/mntc/delete", method=RequestMethod.POST)
	public Map<String, Object> deleteMntc(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 등록
			super.setResCodeDbIud(map, request, opmService.deleteMntc(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
	 
		return map;
	}

	/**
	 * 업체정보 양식을 엑셀 파일에 저장하고 다운로드합니다.
	 * 
	 * @param List<Map<String, Object>> userList 사용자 목록 데이터
	 * @return 파일 다운로드 경로
	 * @exception Exception
	 */
    @RequestMapping(value = "/api/opm/excelDownload", method = RequestMethod.POST)
    public ResponseEntity<byte[]> downloadCorpListExcel(@RequestParam Map<String, Object> map) throws Exception {
        try {
            String filePath = "sw/Jreal/src/main/resources/attach/corp.xlsx";

            // 엑셀 파일 읽기
            FileInputStream fileInputStream = new FileInputStream(filePath);
            Workbook workbook = new XSSFWorkbook(fileInputStream);
            Sheet sheet = workbook.getSheetAt(0);
            List<Map<String, Object>> items = opmService.selectCorpList(map);
            // 헤더 정보
            String[] exheaders = { "corp_id", "corp_ko_nm1", "corp_en_nm" , "corp_no", "biz_reg_no", "rep_nm", "addr", "rep_telno", "mntc_corp_yn"};


            // 첫 번째 시트에 사원 정보 추가
            int rowIdx = 1;
            // 데이터 추가
            for (Map<String, Object> item : items) {
                Row dataRow = sheet.createRow(rowIdx++);
                for (int i = 0; i < exheaders.length; i++) {
                    Cell dataCell = dataRow.createCell(i);
                    Object value = item.get(exheaders[i]);
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
            String fileName = "corp_" + currentTime + ".xlsx";

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
	 * 매물정보를 엑셀 파일에 저장하고 다운로드합니다.
	 * 
	 * @param List<Map<String, Object>> userList 사용자 목록 데이터
	 * @return 파일 다운로드 경로
	 * @exception Exception
	 */
    @RequestMapping(value = "/api/aset/excelDownload", method = RequestMethod.POST)
    public ResponseEntity<byte[]> downloadEmpListExcel(@RequestParam Map<String, Object> map) throws Exception {
        try {
            String filePath = "sw/Jreal/src/main/resources/attach/aset.xlsx";

            // 엑셀 파일 읽기
            FileInputStream fileInputStream = new FileInputStream(filePath);
            Workbook workbook = new XSSFWorkbook(fileInputStream);
            List<Map<String, Object>> items = opmService.selectAsetList(map);
            List<Map<String, Object>> asetClafs = opmService.selectAsetClsfList(map);
            // 헤더 정보
            String[] exheaders = { "aset_clsf_id", "aset_clsf_nm", "aset_nm", "owner_man_cpno", "owner_woman_cpno", "owner_cpno", "building_use", "trade_type"};

            // 첫 번째 시트에 자산 정보 추가
            Sheet sheet1 = workbook.getSheetAt(0);
            int rowIdx = 1;
            for (Map<String, Object> item : items) {
                Row dataRow = sheet1.createRow(rowIdx++);
                for (int i = 0; i < exheaders.length; i++) {
                    Cell dataCell = dataRow.createCell(i);
                    Object value = item.get(exheaders[i]);
                    if (value != null) {
                        dataCell.setCellValue(value.toString());
                    }
                }
            }
            
            // 자산분류 헤더 정보
            String[] exheaders2 = { "aset_clsf_nm", "aset_clsf_id"};

            // 두 번째 시트를 가져와서 자산분류 정보 보존
            Sheet sheet2 = workbook.getSheetAt(1);
            int rowIdx2 = 1;
            for (Map<String, Object> asetClsf : asetClafs) {
                Row dataRow = sheet2.createRow(rowIdx2++);
                for (int i = 0; i < exheaders2.length; i++) {
                    Cell dataCell = dataRow.createCell(i);
                    Object value = asetClsf.get(exheaders2[i]);
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
            String fileName = "asetData_" + currentTime + ".xlsx";

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
     * 집합건물 매물정보를 엑셀 파일에 저장하고 다운로드합니다.
     * 
     * @param List<Map<String, Object>> userList 사용자 목록 데이터
     * @return 파일 다운로드 경로
     * @exception Exception
     */
    @RequestMapping(value = "/api/aset/excelDownload2", method = RequestMethod.POST)
    public ResponseEntity<byte[]> downloadEmpListExcel2(@RequestParam Map<String, Object> map) throws Exception {
    	try {
    		String filePath = "sw/Jreal/src/main/resources/attach/aset2.xlsx";
    		
    		// 엑셀 파일 읽기
    		FileInputStream fileInputStream = new FileInputStream(filePath);
    		Workbook workbook = new XSSFWorkbook(fileInputStream);
    		List<Map<String, Object>> items = opmService.selectAsetList2(map);
    		List<Map<String, Object>> asetClafs = opmService.selectAsetClsfList(map);
    		// 헤더 정보
    		String[] exheaders = { "aset_clsf_id", "aset_clsf_nm", "aset_nm", "building_nm", "owner_man_cpno", "owner_woman_cpno", "owner_cpno", "building_use", "trade_type"};
    		
    		// 첫 번째 시트에 자산 정보 추가
    		Sheet sheet1 = workbook.getSheetAt(0);
    		int rowIdx = 1;
    		for (Map<String, Object> item : items) {
    			Row dataRow = sheet1.createRow(rowIdx++);
    			for (int i = 0; i < exheaders.length; i++) {
    				Cell dataCell = dataRow.createCell(i);
    				Object value = item.get(exheaders[i]);
    				if (value != null) {
    					dataCell.setCellValue(value.toString());
    				}
    			}
    		}
    		
    		// 자산분류 헤더 정보
    		String[] exheaders2 = { "aset_clsf_nm", "aset_clsf_id"};
    		
    		// 두 번째 시트를 가져와서 자산분류 정보 보존
    		Sheet sheet2 = workbook.getSheetAt(1);
    		int rowIdx2 = 1;
    		for (Map<String, Object> asetClsf : asetClafs) {
    			Row dataRow = sheet2.createRow(rowIdx2++);
    			for (int i = 0; i < exheaders2.length; i++) {
    				Cell dataCell = dataRow.createCell(i);
    				Object value = asetClsf.get(exheaders2[i]);
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
    		String fileName = "asetData_" + currentTime + ".xlsx";
    		
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
     * 업체정보 목록을 업로드합니다.
     * 
     * @return 파일 다운로드 경로
     * @exception Exception
     */
    @RequestMapping(value = "/api/opm/excelUpload", method = RequestMethod.POST)
    public Map<String, Object> uploadEmpListExcel(@RequestParam("file") MultipartFile file, HttpServletRequest request, @RequestParam Map<String, Object> map) throws Exception {
        try {
            InputStream inputStream = file.getInputStream();

            // 엑셀 파일 읽기
            Workbook workbook = new XSSFWorkbook(inputStream);
            Sheet sheet = workbook.getSheetAt(0);

            List<Map<String, Object>> items = new ArrayList<>();
    		String userId = "";
    		
    		Map<String, Object> userMap = (Map<String, Object>) request.getSession().getAttribute("loginInfo");
    		
    		if(null != userMap) {
    			userId = StringUtil.isNullToString(userMap.get("user_id"));
    		}
    		
            // 데이터 읽기
            for (int rowIndex = 1; rowIndex <= sheet.getLastRowNum(); rowIndex++) {
                Row row = sheet.getRow(rowIndex);
                if (row != null && getCellValue(row.getCell(0)) != null) {
                    Map<String, Object> item = new HashMap<>();
                    item.put("corp_id", getCellValue(row.getCell(0)));
                    item.put("corp_ko_nm", getCellValue(row.getCell(1)));
                    item.put("corp_en_nm", getCellValue(row.getCell(2)));
                    item.put("corp_no", getCellValue(row.getCell(3)));
                    item.put("biz_reg_no", getCellValue(row.getCell(4)));
                    item.put("rep_nm", getCellValue(row.getCell(5)));
                    item.put("addr", getCellValue(row.getCell(6)));
                    item.put("rep_telno", getCellValue(row.getCell(7)));
                    item.put("mntc_corp_yn", getCellValue(row.getCell(8)));
                    item.put("mod_emp_id", userId);
                    items.add(item);
                }
            }

            // TODO: items를 DB에 업로드하는 로직을 구현하십시오.
			// 등록
			super.setResCodeDbIud(map, request, opmService.insertExlItem(items));
            // 파일 다운로드 경로 등의 처리를 진행하고, 결과를 반환하십시오.

        } catch (Exception ex) {
			super.setResFail(map, request, ex);
        }
        return map;
    }
    
    /**
     * 자산정보 목록을 업로드합니다.
     * 
     * @return 파일 다운로드 경로
     * @exception Exception
     */
    @RequestMapping(value = "/api/aset/excelUpload", method = RequestMethod.POST)
    public Map<String, Object> uploadAsetListExcel(@RequestParam("file") MultipartFile file, HttpServletRequest request, @RequestParam Map<String, Object> map) throws Exception {
        try {
            InputStream inputStream = file.getInputStream();

            // 엑셀 파일 읽기
            Workbook workbook = new XSSFWorkbook(inputStream);
            Sheet sheet = workbook.getSheetAt(0);

            List<Map<String, Object>> items = new ArrayList<>();
    		String userId = "";
    		
    		Map<String, Object> userMap = (Map<String, Object>) request.getSession().getAttribute("loginInfo");
    		
    		if(null != userMap) {
    			userId = StringUtil.isNullToString(userMap.get("user_id"));
    		}
    		
    		// 데이터 읽기
    		for (int rowIndex = 1; rowIndex <= sheet.getLastRowNum(); rowIndex++) {
    		    Row row = sheet.getRow(rowIndex);
    		    if (row != null && getCellValue(row.getCell(0)) != null) {
    		        Map<String, Object> item = new HashMap<>();
    		        
    		        item.put("aset_clsf_id", getCellValue(row.getCell(1)));
    		        item.put("aset_nm", getCellValue(row.getCell(2)));
    		        
    		        int duplCnt =  opmService.checkDplAset(item);
    		        
    		        if(duplCnt < 1) {
    		        	item.put("owner_man_cpno", getCellValue(row.getCell(3)));
    		        	item.put("owner_woman_cpno", getCellValue(row.getCell(4)));
    		        	item.put("owner_cpno", getCellValue(row.getCell(5)));
    		        	item.put("building_use", getCellValue(row.getCell(6)));
    		        	item.put("trade_type", getCellValue(row.getCell(7)));
                        item.put("mod_emp_id", userId);
                        item.put("reg_emp_id", userId);
        		        items.add(item);
    		        }
    		    }
    		}

            // TODO: items를 DB에 업로드하는 로직을 구현하십시오.
			// 등록
			super.setResCodeDbIud(map, request, opmService.insertAsetExlItem(items));
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
	
}
