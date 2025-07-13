package com.framework.chk.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.framework.chk.service.ChkService;

@SpringBootApplication
@EnableScheduling
public class ChkScheduler {

	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ChkService chkService;
	
	@SuppressWarnings("unchecked")
	@Scheduled(cron = "0 13 16 * * *")
	public void test2() throws Exception {
	    List<Map<String, Object>> ddd2 = chkService.selectSceduleMailList();

//	    List<Map<String, Object>> ddd = removeDuplicatesByKeyValue(ddd2, "mntc_emp_id");

	    SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMdd");
	    SimpleDateFormat outputFormat = new SimpleDateFormat("MM월 dd일");

	    Date today = new Date();

	    // 프로퍼티 파일 경로
	    String propertiesFilePath = "sw/Jreal/src/main/resources/application.properties";

	    // 프로퍼티 파일에서 email 값을 가져옴
	    String username = readEmailIdFromProperties(propertiesFilePath);
	    String password = readEmailPwFromProperties(propertiesFilePath);
	    String host = readEmailHostFromProperties(propertiesFilePath);
	    
	    for (Map<String, Object> row : ddd2) {
	        String to1 = (String) row.get("aset_chrg_emp_id1");
	        String to2 = (String) row.get("aset_chrg_emp_id2");
		    String subject = "만료 예정 계약 안내";
		    
		    // HTML 내용 작성 (예시 데이터 포함)
		    String body = "<html>"
		    	    + "<body style='font-family: Arial, sans-serif;'>"
		    	    + "<h2>만료 예정 계약 안내</h2>"
		    	    + "<p>아래 계약 만료 예정 매물입니다. 확인해주세요.</p>"
		    	    + "<br/>"
		    	    + "<table border='1' style='border-collapse: collapse; width: 100%;'>"
		    	    + "    <thead style='background-color: #f2f2f2;'>"
		    	    + "        <tr>"
		    	    + "            <th style='padding: 8px; text-align: center;'>행정구분</th>"
		    	    + "            <th style='padding: 8px; text-align: center;'>행정동</th>"
		    	    + "            <th style='padding: 8px; text-align: center;'>소재지(지번)</th>"
		    	    + "            <th style='padding: 8px; text-align: center;'>계약담당자(정)</th>"
		    	    + "            <th style='padding: 8px; text-align: center;'>계약담당자(부)</th>"
		    	    + "            <th style='padding: 8px; text-align: center;'>계약일시</th>"
		    	    + "            <th style='padding: 8px; text-align: center;'>임차인명</th>"
		    	    + "            <th style='padding: 8px; text-align: center;'>임차인연락처</th>"
		    	    + "            <th style='padding: 8px; text-align: center;'>계약시작일자</th>"
		    	    + "            <th style='padding: 8px; text-align: center;'>계약종료일자</th>"
		    	    + "            <th style='padding: 8px; text-align: center;'>거래유형</th>"
		    	    + "        </tr>"
		    	    + "    </thead>"
		    	    + "    <tbody>"
		    	    + "        <tr>"
		    	    + "            <td style='padding: 8px; text-align: center;'>" + (String) row.get("aset_clsf_id") + "</td>"
		    	    + "            <td style='padding: 8px; text-align: center;'>" + (String) row.get("aset_clsf_nm") + "</td>"
		    	    + "            <td style='padding: 8px; text-align: center;'>" + (String) row.get("aset_nm") + "</td>"
		    	    + "            <td style='padding: 8px; text-align: center;'>" + (String) row.get("aset_chrg_emp_nm1") + "</td>"
		    	    + "            <td style='padding: 8px; text-align: center;'>" + (String) row.get("aset_chrg_emp_nm2") + "</td>"
		    	    + "            <td style='padding: 8px; text-align: center;'>" + (String) row.get("ctrt_dt") + "</td>"
		    	    + "            <td style='padding: 8px; text-align: center;'>" + (String) row.get("renter_name") + "</td>"
		    	    + "            <td style='padding: 8px; text-align: center;'>" + (String) row.get("renter_cpno") + "</td>"
		    	    + "            <td style='padding: 8px; text-align: center;'>" + (Date) row.get("ctrt_strt_dt") + "</td>"
		    	    + "            <td style='padding: 8px; text-align: center;'>" + (Date) row.get("ctrt_end_dt") + "</td>"
		    	    + "            <td style='padding: 8px; text-align: center;'>" + (String) row.get("contract_type") + "</td>"
		    	    + "        </tr>"
		    	    + "    </tbody>"
		    	    + "</table>"
		    	    + "<br/>"
		    	    + "<p>감사합니다.<br><strong></strong></p>"
		    	    + "<hr>"
		    	    + "<footer style='margin-top: 20px; font-size: 0.9em; color: #555;'>"
		    	    + "<p><strong>(주)부동산중개법인 제이</strong><br>"
		    	    + "본점: 경기도 수원시 팔달구 갓매산로25, 2F<br>"
		    	    + "분사무소 권선점 :경기도 수원시 권선구 세지로112번길 27,1F<br>"
		    	    + "전화 : 031-223-2482<br>"
		    	    + "팩스 : 031-223-2481<br>"
		    	    + "이메일: j_y0324@naver.com</p>"
		    	    + "<p style='color: #888;'>본 메일은 발신 전용입니다. 문의사항은 j_y0324@naver.com로 연락주세요.</p>"
		    	    + "</footer>"
		    	    + "</body>"
		    	    + "</html>";
		    
		    Properties props = new Properties();
		    props.put("mail.smtp.auth", "true");
		    props.put("mail.smtp.starttls.enable", "true");
		    props.put("mail.smtp.host", host);
		    props.put("mail.smtp.port", "587");
		    props.put("mail.smtp.ssl.protocols", "TLSv1.2");

		    Session session = Session.getInstance(props, new javax.mail.Authenticator() {
		        protected PasswordAuthentication getPasswordAuthentication() {
		            return new PasswordAuthentication(username, password);
		        }
		    });

		    try {
		        // 이메일 메시지 생성
		        Message message = new MimeMessage(session);
		        message.setFrom(new InternetAddress(username));
		        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to1));
		        message.setSubject(subject);
		        message.setContent(body, "text/html; charset=utf-8");

		        // 이메일 전송
		        Transport.send(message);
		        
		        // 이메일 메시지 생성
		        Message message2 = new MimeMessage(session);
		        message2.setFrom(new InternetAddress(username));
		        message2.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to2));
		        message2.setSubject(subject);
		        message2.setContent(body, "text/html; charset=utf-8");

		        // 이메일 전송
		        Transport.send(message2);
		        

		        System.out.println("Email sent successfully.");
		    } catch (MessagingException e) {
		        e.printStackTrace(); // 예외를 출력하여 문제 확인
		    }
	    }
	    
	    




	}

	
//    public static List<Map<String, Object>> removeDuplicatesByKeyValue(List<Map<String, Object>> list, String key) {
//        Map<Object, Map<String, Object>> uniqueMap = new LinkedHashMap<>();
//
//        for (Map<String, Object> map : list) {
//            Object keyValue = map.get(key);
//            if (!uniqueMap.containsKey(keyValue)) {
//                uniqueMap.put(keyValue, map);
//            }
//        }
//
//        return new ArrayList<>(uniqueMap.values());
//    }
    
	
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
    
    // 프로퍼티 파일에서 email.host 값을 가져오는 메서드
    private String readEmailHostFromProperties(String propertiesFilePath) throws IOException {
    	try (BufferedReader reader = new BufferedReader(new FileReader(propertiesFilePath))) {
    		String line;
    		while ((line = reader.readLine()) != null) {
    			if (line.startsWith("email.host=")) {
    				return line.substring("email.host=".length()).trim();
    			}
    		}
    	}
    	throw new IOException("email.host not found in properties file");
    }
    
}