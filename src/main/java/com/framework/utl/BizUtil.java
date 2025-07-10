/**
 * @Class Name  : BizUtil.java
 * @Description : 업무 처리 관련 유틸리티
 * @Modification Information
 *
 *    수정일           수정자           수정내용
 * ---------------------------
 * 2019.10.31  정안호          최초 생성
 *
 * @author 공통 서비스 개발팀 정안호
 * @since 2019. 11. 11
 * @version 1.0
 * @see
 *
 */

package com.framework.utl;

import java.security.MessageDigest;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;

public class BizUtil {

    /**
     * 리스트에 해다하는 item 값이 있을경우 true 없을경우 false 를 리턴한다.
     *
     * @param  List<Map<String, Object>> list
     * @param  String item
     * @return boolean isItem
     * @see
     */
    public static boolean isItem(List<Map<String, Object>> list, String itemNm, String item) {

    	boolean isItem = false;
	
		int nLen = 0;
		
		if(null != list) {
			nLen = list.size();			
		}
		
		if(0 < nLen) {
			
			for(int i=0; i<nLen; i++) {
				
				if(item.equals(StringUtil.isNullToString(list.get(i).get(itemNm)))) {
					isItem = true;
					i = nLen;
				}
			}
		}
		
		return isItem;
    }

    /**
     * param이 true 일 경우 Y false 일 경우 N 리턴
     * 
     * @param boolean isRet
     * @return stirng
     * @throws Exception
     */
    public static String isYn(boolean isRet) throws Exception {

    	String isYn = "N";
		if (isRet) {
		    isYn = "Y";
		}
	
		return isYn;
    } 
    
    /**
     * 비밀번호를 암호화하는 기능(복호화가 되면 안되므로 SHA-256 인코딩 방식 적용)
     * 
     * @param password 암호화될 패스워드
     * @param id salt로 사용될 사용자 ID 지정
     * @return
     * @throws Exception
     */
    public static String encryptPassword(String password) throws Exception {
    	return encryptPassword(password, "");
    }
    
    public static String encryptPassword(String password, String id) throws Exception {

    	String str = StringUtil.isNullToString(password, "");
    	
    	if(! "".equals(str)) {
    		
    		byte[] hashValue = null; // 해쉬값
    		
    		MessageDigest md = MessageDigest.getInstance("SHA-256");
    		
    		md.reset();
    		md.update(id.getBytes());
    		
    		hashValue = md.digest(password.getBytes());
    		str = new String(Base64.encodeBase64(hashValue));
    		
    	}
	
		return str;
    }    
    
    /**
     * 로그인여부
     * 
     * @param HttpServletRequest
     * @return boolean
     * @throws Exception
     */
    public static boolean isLogin(HttpServletRequest request) throws Exception {

		boolean isLogin = false;
		
		if(null != request.getSession().getAttribute("loginInfo")) {
			isLogin = true;
		}
		
		return isLogin;
    }
    
    /**
     * 로그아웃
     * 
     * @param HttpServletRequest
     * @return void
     * @throws Exception
     */
    public static void logout(HttpServletRequest request) throws Exception {
		request.getSession().removeAttribute("loginInfo");
		request.getSession().invalidate();
    }
    
}
