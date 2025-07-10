/**********************************************************
 * GNB-LNB
 **********************************************************/
function fnInitGnbLnb(depth1, depth2, depth3, depth4){
	if(depth1>0)
	{
		$('.gnb .mainMenu > li:eq('+( depth1-1 )+') > .menu').addClass('on');
		if(depth2>0)
		{
			$('.gnb .mainMenu > li:eq('+( depth1-1 )+') > .subMenu > li:eq('+( depth2-1 )+') > .menu').addClass('on');
		}
	}
	if(depth3>0)
	{
		$('.lnb .mainMenu > li:eq('+( depth3-1 )+') > .menu').addClass('on');
		if(depth4>0)
		{
			$('.lnb .mainMenu > li:eq('+( depth3-1 )+') > .subMenu > li:eq('+( depth4-1 )+') > .menu').addClass('on');
		}
	}
}
/**********************************************************
 * 안내 메세지
 **********************************************************/
function fnInfoMsg(msg){
	alert(msg);
}
/**********************************************************
 * 경고 메세지
 **********************************************************/
function fnWarnMsg(msg){
	alert(msg);
}
/**********************************************************
 * 이벤트 중지
 **********************************************************/
function fnStopEvent(e) {
	e.preventDefault();
}
/**********************************************************
 * Validator 필수입력
 **********************************************************/
function fnValidatorRequir(eleNm, eleId, focusId, msg){
	if($("#" +eleId).val() == ""){
		fnWarnMsg(msg);
		$("#" +focusId).focus();
		return true;
	}else{
		return false;
	}
}
/**********************************************************
 * Validator 고정길이
 **********************************************************/
function fnValidatorFixLen(eleNm, eleId, focusId, msg, fixLen){
	if(fixLen != $("#" +eleId).val().length){
		fnWarnMsg(msg);
		$("#" +focusId).focus();
		return true;
	}else{
		return false;
	}
}
/**********************************************************
 * Validator 고정길이
 **********************************************************/
function fnValidatorMinLen(eleNm, eleId, focusId, msg, minLen){
	if(minLen > $("#" +eleId).val().length){
		fnWarnMsg(msg);
		$("#" +focusId).focus();
		return true;
	}else{
		return false;
	}
}
/**********************************************************
 * 공백제거
 **********************************************************/
function fnTrim(str){
    return str.replace(/^\s+|\s+$/g, "");
}
/**********************************************************
 * 문자치환
 **********************************************************/
function fnReplaceAll(str, src, repl){
     if(src == repl){return str;}
     while(str.indexOf(src) != -1) {
        str = str.replace(src, repl);
     }
     return str;
}
/**********************************************************
 * 업무용 ajax
 **********************************************************/
var fnAjax = function(sendUrl, sendData, callBack) {
	$.ajax({
		type:"post",
		url:sendUrl,
		data:sendData,
		dataType:"json",
		success: function(data){
			if(typeof callBack === "function") {
				callBack(data);
			}
		},error:function(error, request, status){
			fnWarnMsg("시스템 장애 입니다.\n담당자에게 문의 바랍니다.");
		}
	});
};
/**********************************************************
 * POST SIBMIT
 **********************************************************/
function fnPostSend(path, params) {
	method = "post"; // 전송 방식 기본값을 POST로
	    
	var form = document.createElement("form");
	form.setAttribute("method", method);
	form.setAttribute("action", path);
	 
	for(var key in params) {
	   var hiddenField = document.createElement("input");
	   hiddenField.setAttribute("type", "hidden");
	   hiddenField.setAttribute("name", key);
	   hiddenField.setAttribute("value", params[key]);
	 
	   form.appendChild(hiddenField);
	}
	 
	document.body.appendChild(form);
	form.submit();
}
/**********************************************************
 * 메뉴이동(메뉴번호)
 **********************************************************/
function fnGoMenu(menuNo){
	fnFormSubmit("menuFrm", menuNo);
}
/**********************************************************
 * FORM ACTION(메뉴번호)
 **********************************************************/
function fnFormSubmit(formId, menuNo){
	$("#" +formId).attr("action", "/adm/" + menuNo);
	$("#" +formId).submit();
}
/**********************************************************
 * 팝업오픈
 **********************************************************/
function fnPopupOpen(menuNo) {
	$(".popupView" + menuNo).show();
	$("#popup" + menuNo).show();
}
/**********************************************************
 * 팝업닫기
 **********************************************************/
function fnPopupClose(menuNo) {
	$(".popupView" + menuNo).hide();
	$("#popup" + menuNo).hide();	
}
/**********************************************************
 * NULL IS BLANK
 **********************************************************/
function nullChangeBlank(value){
	return nullChange(value,"");
} 
/**********************************************************
 * DEFAULT NULL 값 정의
 **********************************************************/
function nullChange(value,text){
	if(isNull(value)){
		return text;
	}else{return value;}
}
/**********************************************************
 * NULL 체크
 **********************************************************/
function isNull(obj){
	return (typeof obj === "undefined" || obj ==null || obj =="" || obj == "undefined")? true : false;
}

/**********************************************************
 * 입력값에 특정 문자(chars) 포함 개수
 **********************************************************/
function fnInputCharsCnt(str, chars) {
	var cnt = 0
	
	var nStrLen = 0;
	var nCharsLen = 0;
	
    if(str != null){
    	var nStrLen = str.length;
    }
    
    if(chars != null){
    	var nCharsLen = chars.length;
    }
	
    if((0 < nStrLen) && 0 < ( nCharsLen)){
    	for (var j=0; j<nStrLen; j++) {
        	for (var i=0; i<nCharsLen; i++) {   
        		 if (str.charAt(j) == chars.charAt(i)) {
        			 cnt++;
        		 }
        	}
    	}
    }

    return cnt;
}
/**********************************************************
 * GET KEYCODE
 **********************************************************/
function fnGetEventKeyCode(e) {
    var keyCode = 0;
    try {
        if(e.which) {
            keyCode = e.which;
        } else {
            keyCode = window.event.keyCode;
        }
    } catch (e) {}

    return keyCode;
}
/**********************************************************
 * 회원 아이디 입력가능 문자
 **********************************************************/
function fnInputId(e, obj) {
    var keyCode = fnGetEventKeyCode(e);
    if((keyCode >= 48 && keyCode <= 57)  || // 숫자
       (keyCode >= 97 && keyCode <= 122)    // 소문자 
       )
    {    	
    	return true;
    } else{
        return fnStopEvent(e);
     }
}
/**********************************************************
 * 회원 비밀번호 입력가능 문자
 **********************************************************/
function fnInputPwd(e, obj) {
    var keyCode = fnGetEventKeyCode(e);
    if((keyCode >= 48 && keyCode <= 57)  || // 숫자
       (keyCode >= 97 && keyCode <= 122) || // 소문자 
       (keyCode >= 65 && keyCode <= 90)  ||  // 대문자
       (keyCode == 126 || // ~
        keyCode == 33  || // !
        keyCode == 64  || // @
        keyCode == 35  || // #
        keyCode == 36  || // $
        keyCode == 37  || // %
        keyCode == 94  || // ^
        keyCode == 38  || // &
        keyCode == 42  || // *
        keyCode == 40  || // (
        keyCode == 41  || // )
        keyCode == 95  || // _
        keyCode == 43  || // +
        keyCode == 61     // =
       ))
    {    	
    	return true;
    } else{
        return fnStopEvent(e);
     }
}
/**********************************************************
 * 회원 아이디 유효성 체크
 **********************************************************/
function fnValidatorId(eleId){
	var bRet = true;
	var idVal = $("#" +eleId).val();
	var nidLen = idVal.length;
	var nNumberCnt = fnInputCharsCnt(idVal, "1234567890");

	if(0 == nNumberCnt){
		bRet = false;
	}else if(nidLen == nNumberCnt){
		bRet = false;
	}else{
		bRet = true;
	}

	return bRet;
}
/**********************************************************
 * 회원 비밀번호 유효성 체크
 **********************************************************/
function fnValidatorPwd(eleId){
	var bRet = true;
	var pwdVal = $("#" +eleId).val();
	var nPwdLen = pwdVal.length;
	var nSpecialCnt = fnInputCharsCnt(pwdVal, "~!@#$%^&*()+=");
	var nNumberCnt = fnInputCharsCnt(pwdVal, "1234567890");

	if(0 == nSpecialCnt){
		bRet = false;
	}else if(0 == nNumberCnt){
		bRet = false;
	}else if(nPwdLen == (nSpecialCnt + nNumberCnt)){
		bRet = false;
	}else{
		bRet = true;
	}

	return bRet;
}
/**********************************************************
 * 월의 마지막 일자 가져오기
 **********************************************************/
function lastday(calyear, calmonth){
	var monthDays = new Array(31, 28, 31, 30, 31, 30, 31, 31,30, 31, 30, 31);
	if (((calyear % 4 == 0) && (calyear % 100 != 0)) || (calyear % 400 == 0))
	monthDays[1] = 29;
	var nDays = parseInt(monthDays[calmonth - 1], 10);
	return nDays;
}