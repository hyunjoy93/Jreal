package com.framework.utl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

public class ExcelUtil {
	
	// 각 셀의 데이터타입에 맞게 값 가져오기
	public static String getCellValue(XSSFCell cell) {

		String value = "";
		
		if(cell == null){
			return value;
		}

		switch (cell.getCellType()) {
			case STRING:
				value = cell.getStringCellValue();
				break;
			case NUMERIC:
				value = (int) cell.getNumericCellValue() + "";
				break;
			default:
				break;
		}
		return value;
	}

	// 엑셀파일의 데이터 목록 가져오기
	public static List<Map<String, Object>> getListData(MultipartFile file, String[] headerInfo) {

		List<Map<String, Object>> excelList = new ArrayList<>();
		
		try {
			OPCPackage opcPackage = OPCPackage.open(file.getInputStream());

			@SuppressWarnings("resource")
			XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);

			// 첫번째 시트
			XSSFSheet sheet = workbook.getSheetAt(0);
			
			int rowIndex = 0;
			int columnIndex = 0;

			// 첫번째 행(0)은 컬럼 명이기 때문에 두번째 행(1) 부터 검색
			for (rowIndex = 1; rowIndex < sheet.getLastRowNum() + 1; rowIndex++) {
				Map<String, Object> map = new HashMap<String, Object>();
				
				XSSFRow row = sheet.getRow(rowIndex);

				int cells = headerInfo.length-1;

				for (columnIndex = 0; columnIndex <= cells; columnIndex++) {
					XSSFCell cell = row.getCell(columnIndex);

					
					Map<String, Object> excelValidation = inputValCheck(headerInfo[columnIndex], getCellValue(cell));
					
					if(excelValidation.get("chkFlag").equals("fail")) {
						excelValidation.put("errPos", rowIndex+"행 "+columnIndex+"열 ");
						
						excelList.clear();
						excelList.add(excelValidation);
						
						return excelList;
					}

					map.put(headerInfo[columnIndex], getCellValue(cell));
					//System.out.println(rowIndex + " 행 : " + columnIndex+ " 열 = " + getCellValue(cell));
				}
				excelList.add(map);
			}

		} catch (InvalidFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return excelList;
	}
	
	// 파일 값 유효성 체크
	public static Map<String, Object> inputValCheck(String colNm, String val) {
		
		Map<String, Object> resMap = new HashMap<>();
		
		String res = "success";
		String errMsg = "";
		
		switch(colNm) {
			case "zone":
				if(val.getBytes().length > 100) {
					res = "fail";
					errMsg = "zone오류";
				}
				break;
			case "loc_nm":
				if(val.getBytes().length > 250) {
					res = "fail";
					errMsg = "위치정보 값 오류";
				}
				break;
			case "datacenter_nm":
				if(val.getBytes().length > 40) {
					res = "fail";
					errMsg = "층/실 값 오류";
				}
				break;
			case "rack_location":
				if(val.getBytes().length > 40) {
					res = "fail";
					errMsg = "상면정보 값 오류";
				}
				break;
			case "own_dept_nm":
				if(val.getBytes().length > 50) {
					res = "fail";
					errMsg = "담당운영팀 값 오류";
				}
				break;
			case "center_nm":
				if(val.getBytes().length > 60) {
					res = "fail";
					errMsg = "센터명 값 오류";
				}
				break;
			case "equnr":
				if(val.getBytes().length > 30) {
					res = "fail";
					errMsg = "설비번호 값 오류";
				}
				break;
			case "host_nm":
				if(val.getBytes().length > 200) {
					res = "fail";
					errMsg = "HOST명 값 오류";
				}
				break;
			case "mgmt_ip":
				if(val.getBytes().length > 100) {
					res = "fail";
					errMsg = "SNMP/IPMI IP 주소 값 오류";
				}
				break;
			case "std_cd":
				if(val.getBytes().length > 8) {
					res = "fail";
					errMsg = "표준서비스 코드 값 오류";
				}
				break;
			case "std_nm":
				if(val.getBytes().length > 120) {
					res = "fail";
					errMsg = "표준서비스명 값 오류";
				}
				break;
			case "e_std_cd":
				if(val.getBytes().length > 8) {
					res = "fail";
					errMsg = "단위서비스 코드 값 오류";
				}
				break;
			case "e_std_nm":
				if(val.getBytes().length > 120) {
					res = "fail";
					errMsg = "단위서비스명 값 오류";
				}
				break;
			case "svc_usage":
				if(val.getBytes().length > 81) {
					res = "fail";
					errMsg = "운영/개발 값 오류";
				}
				break;
			case "platform":
				if(val.getBytes().length > 80) {
					res = "fail";
					errMsg = "플랫폼 값 오류";
				}
				break;
			case "platform_ver":
				if(val.getBytes().length > 50) {
					res = "fail";
					errMsg = "플랫폼버전 값 오류";
				}
				break;
			case "os":
				if(val.getBytes().length > 80) {
					res = "fail";
					errMsg = "OS 값 오류";
				}
				break;
			case "os_ver":
				if(val.getBytes().length > 50) {
					res = "fail";
					errMsg = "OS버전 값 오류";
				}
				break;
			case "usage":
				if(val.getBytes().length > 10) {
					res = "fail";
					errMsg = "용도 값 오류";
				}
				break;
			case "hw_yn":
				if(!(val.equals("Y") || val.equals("N") || val.equals(""))) {
					res = "fail";
					errMsg = "HW관제대상 값 오류";
				}
				break;
			case "csw_yn":
				if(!(val.equals("Y") || val.equals("N") || val.equals(""))) {
					res = "fail";
					errMsg = "CSW관제대상 값 오류";
				}
				break;
			case "os_yn":
				if(!(val.equals("Y") || val.equals("N") || val.equals(""))) {
					res = "fail";
					errMsg = "OS관제대상 값 오류";
				}
				break;
		}
		//System.out.println("res:: "+res +" ||| errMsg:: "+errMsg);
		
		resMap.put("chkFlag", res);
		resMap.put("errMsg", errMsg);
		
		return resMap;
	}
	
	// csv파일의 데이터 목록 가져오기
	public static List<Map<String, Object>> getCsvData(MultipartFile file, String[] headerInfo) {

		List<Map<String, Object>> excelList = new ArrayList<Map<String,Object>>();
		
		try {
			String line;
			BufferedReader br = new BufferedReader(new InputStreamReader(file.getInputStream(),"EUC-KR"));
			
			br.readLine();
			
			while((line=br.readLine()) != null) {
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				for(var i=0;i<headerInfo.length;i++) {
					if(i >= line.split(",").length) {
						map.put(headerInfo[i], "");
					}
					else {
						Map<String, Object> excelValidation = inputValCheck(headerInfo[i], line.split(",")[i]);
												
						if(excelValidation.get("chkFlag").equals("fail")) {							
							excelList.clear();
							excelList.add(excelValidation);
							
							return excelList;
						}
						map.put(headerInfo[i], line.split(",")[i]);
						//System.out.println( " 행 : " + i+ " 열 = " + line.split(",")[i]);
					}
				}
				excelList.add(map);
			}
			br.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return excelList;
	}
}
