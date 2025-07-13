package com.framework.set.controller;

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
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.framework.cmm.dto.PagingDto;
import com.framework.cmm.helper.WebControllerHelper;
import com.framework.set.service.SetService;
import com.framework.utl.StringUtil;

@RestController
public class SetRestController extends WebControllerHelper{
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SetService setService;
	
	/**
	 * 자산분류목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/set/asetClsfList", method=RequestMethod.POST)
	public Map<String, Object> asetClsfList(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			//자산 list
			super.setList(map, request, "asetClsfList", setService.selectSetAssetClsfList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}


	/**
	 * 점검양식 목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/set/chkFormList", method=RequestMethod.POST)
	public Map<String, Object> chkFormList(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			//자산 list
			super.setPagingList(map, request, pagingDto, "chkFormList", setService.selectSetChkFormList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 점검항목 목록 
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/set/chkItemList", method=RequestMethod.POST)
	public Map<String, Object> chkItemList(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			//자산 list
			super.setPagingList(map, request, pagingDto, "chkItemList", setService.selectSetChkItemList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		
		return map;
	}
	


	/**
	 * 점검양식 팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/set/chkFormInfo", method=RequestMethod.POST)
	public Map<String, Object> chkFormInfo(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 목록 
			super.setInfo(map, request, "info", setService.selectChkFormInfo(map)); // 점검양식 수정 팝업
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	/**
	 * 점검양식 팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/set/chkItemInfo", method=RequestMethod.POST)
	public Map<String, Object> chkItemInfo(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 목록 
			super.setInfo(map, request, "itemInfo", setService.selectChkItemInfo(map)); // 점검양식 수정 팝업
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	
	/**
	 * 점검양식 추가 팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	
	@RequestMapping(value="/api/set/insertChkForm", method=RequestMethod.POST)
	public Map<String, Object> insertChkForm(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			// 등록
			super.setResCodeDbIud(map, request, setService.insertChkForm(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}

	/**
	 * 점검양식 수정
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/set/updateChkForm", method=RequestMethod.POST)
	public Map<String, Object> updateChkForm(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 등록
			super.setResCodeDbIud(map, request, setService.updateChkForm(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
	 
		return map;
	}
	
	/**
	 * 점검양식 삭제
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/set/deleteChkForm", method=RequestMethod.POST)
	public Map<String, Object> deleteChkForm(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 등록
			super.setResCodeDbIud(map, request, setService.deleteChkForm(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
	 
		return map;
	}
	

	/**
	 * 점검항목 추가
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/set/insertChkItem", method=RequestMethod.POST)
	public Map<String, Object> insertChkItem(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			// 등록
			super.setResCodeDbIud(map, request, setService.insertChkItem(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}

	/**
	 * 점검 항목 수정
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/set/updateChkItem", method=RequestMethod.POST)
	public Map<String, Object> updateChkItem(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 수정
			super.setResCodeDbIud(map, request, setService.updateChkItem(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
	 
		return map;
	}
	/**
	 * 점검항목 삭제
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/set/deleteChkItem", method=RequestMethod.POST)
	public Map<String, Object> deleteChkItem(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 삭제
			super.setResCodeDbIud(map, request, setService.deleteChkItem(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
	 
		return map;
	}


	/**
	 * 공통코드목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/set/commcdlist", method=RequestMethod.POST)
	public Map<String, Object> commcdlist(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			//공통코드 list
			super.setList(map, request, "CommCdList", setService.selectSetCommCdList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 공통코드상세목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/set/commcdDetailList", method=RequestMethod.POST)
	public Map<String, Object> commcdDetailList(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			//공통코드상세 list
			super.setPagingList(map, request, pagingDto, "CommCdDetailList", setService.selectSetCommCdDtlList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		
		return map;
	}


	/**
	 * 자산분류 추가
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/set/insertAsetClsf", method=RequestMethod.POST)
	public Map<String, Object> insertAsetClsf(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			// 등록
			super.setResCodeDbIud(map, request, setService.insertAsetClsf(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}

	/**
	 * 자산분류 수정	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/set/updateAsetClsf", method=RequestMethod.POST)
	public Map<String, Object> updateAsetClsf(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			// 등록
			super.setResCodeDbIud(map, request, setService.updateAsetClsf(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}

	/**
	 * 자산분류 삭제
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/set/deleteAsetClsf", method=RequestMethod.POST)
	public Map<String, Object> deleteAsetClsf(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			// 등록
			super.setResCodeDbIud(map, request, setService.deleteAsetClsf(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}

	/**
	 * 자산점검 양식을 엑셀 파일에 저장하고 다운로드합니다.
	 * 
	 * @return 파일 다운로드 경로
	 * @exception Exception
	 */
    @RequestMapping(value = "/api/set/excelDownload", method = RequestMethod.POST)
    public ResponseEntity<byte[]> downloadEmpListExcel(@RequestParam Map<String, Object> map) throws Exception {
        try {
            String filePath = "/sw/Jreal/src/main/resources/attach/chkFormItem.xlsx";

            // 엑셀 파일 읽기
            FileInputStream fileInputStream = new FileInputStream(filePath);
            Workbook workbook = new XSSFWorkbook(fileInputStream);
            Sheet sheet = workbook.getSheetAt(0);
            List<Map<String, Object>> items = setService.selectSetChkItemList(map);
            List<Map<String, Object>> forms = setService.selectSetChkFormList(map);
            // 헤더 정보
            String[] exheaders = { "chk_form_id", "chk_form_nm", "chk_item_id", "chk_item_nm", "chk_crtr_desc"};

            // 데이터 행 생성
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
            
            // 업체 헤더 정보
            String[] exheaders2 = { "chk_form_id", "chk_form_nm"};

            // 두 번째 시트를 가져와서 업체 정보 보존
            Sheet sheet2 = workbook.getSheetAt(1);
            int rowIdx2 = 1;
            for (Map<String, Object> form : forms) {
                Row dataRow = sheet2.createRow(rowIdx2++);
                for (int i = 0; i < exheaders2.length; i++) {
                    Cell dataCell = dataRow.createCell(i);
                    Object value = form.get(exheaders2[i]);
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
            String fileName = "chkFormItem_" + currentTime + ".xlsx";

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
     * 점검양식 목록을 업로드합니다.
     * 
     * @param List<Map<String, Object>> userList 사용자 목록 데이터
     * @return 파일 다운로드 경로
     * @exception Exception
     */
    @RequestMapping(value = "/api/set/excelUpload", method = RequestMethod.POST)
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
                if (row != null && !StringUtils.isEmpty(getCellValue(row.getCell(0))) ) {
                    Map<String, Object> item = new HashMap<>();
                    item.put("chk_form_id", getCellValue(row.getCell(0)));
                    item.put("chk_item_id", getCellValue(row.getCell(2)));
                    item.put("chk_item_nm", getCellValue(row.getCell(3)));
                    item.put("chk_crtr_desc", getCellValue(row.getCell(4)));
                    item.put("use_yn", "Y");
                    item.put("mod_emp_id", userId);
                    items.add(item);
                }
            }

            // TODO: items를 DB에 업로드하는 로직을 구현하십시오.
			// 등록
			super.setResCodeDbIud(map, request, setService.insertExlItem(items));
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
