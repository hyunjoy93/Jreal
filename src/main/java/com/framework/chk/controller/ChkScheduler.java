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
	@Scheduled(cron = "0 35 14 * * *")
	public void test2() throws Exception {
	    List<Map<String, Object>> ddd2 = chkService.selectSceduleMailList();

//	    List<Map<String, Object>> ddd = removeDuplicatesByKeyValue(ddd2, "mntc_emp_id");

	    SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMdd");
	    SimpleDateFormat outputFormat = new SimpleDateFormat("MM월 dd일");

	    Date today = new Date();

	    // 프로퍼티 파일 경로
	    String propertiesFilePath = "C:\\dev\\E-Manager\\src\\main\\resources\\application.properties";

	    // 프로퍼티 파일에서 email 값을 가져옴
	    String username = readEmailIdFromProperties(propertiesFilePath);
	    String password = readEmailPwFromProperties(propertiesFilePath);
	    String host = readEmailHostFromProperties(propertiesFilePath);

	    String to = "j_y0324@naver.com";
	    String subject = "만료 예정 계약 안내";

	    // HTML 내용 작성 (예시 데이터 포함)
	    String body = "<html>"
	            + "<body style='font-family: Arial, sans-serif;'>"
	            + "<h2 style='color: #4CAF50;'>만료 예정 계약 안내</h2>"
	            + "<p>아래 계약 만료 예정 매물입니다. 확인해주세요.</p>"
	            + "<table border='1' style='border-collapse: collapse; width: 100%;'>"
	            + "    <thead style='background-color: #f2f2f2;'>"
	            + "        <tr>"
	            + "            <th style='padding: 8px; text-align: left;'>계약번호</th>"
	            + "            <th style='padding: 8px; text-align: left;'>계약자명</th>"
	            + "            <th style='padding: 8px; text-align: left;'>만료일</th>"
	            + "        </tr>"
	            + "    </thead>"
	            + "    <tbody>"
	            + "        <tr>"
	            + "            <td style='padding: 8px;'>CN12345</td>"
	            + "            <td style='padding: 8px;'>홍길동</td>"
	            + "            <td style='padding: 8px;'>2024년 01월 15일</td>"
	            + "        </tr>"
	            + "        <tr>"
	            + "            <td style='padding: 8px;'>CN67890</td>"
	            + "            <td style='padding: 8px;'>김철수</td>"
	            + "            <td style='padding: 8px;'>2024년 02월 28일</td>"
	            + "        </tr>"
	            + "    </tbody>"
	            + "</table>"
	            + "<p>감사합니다.<br><strong>CatchTable 팀</strong></p>"
	            + "<hr>"
	            + "<footer style='margin-top: 20px; font-size: 0.9em; color: #555;'>"
	            + "<p><strong>CatchTable</strong><br>"
	            + "주소: 서울특별시 강남구 테헤란로 123<br>"
	            + "전화: 02-1234-5678<br>"
	            + "이메일: support@catchtable.com</p>"
	            + "<p style='color: #888;'>본 메일은 발신 전용입니다. 문의사항은 고객센터로 연락주세요.</p>"
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
	        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
	        message.setSubject(subject);
	        message.setContent(body, "text/html; charset=utf-8");

	        // 이메일 전송
	        Transport.send(message);

	        System.out.println("Email sent successfully.");
	    } catch (MessagingException e) {
	        e.printStackTrace(); // 예외를 출력하여 문제 확인
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