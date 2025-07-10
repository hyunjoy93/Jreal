/**********************************************************
 * 공통
 **********************************************************/
function fnCommon(){
	if((cmmObj['isLogin']) && (! isLogin)){
		alert(longLogoutMsg);
		fnFormSubmit("hiddenFrm", logoutUrl);
	}
	if((cmmObj['isDisabledUser']) && ("사용자" == loginUserGroup) ){
		$(".disabledUser").each(function(i, item){
			$(this).prop('disabled', true);
		});
		$(".disabledOperator").each(function(i, item){
			$(this).prop('disabled', true);
		});		
	}	
	$.datepicker.setDefaults({
	    closeText: "닫기",
	    prevText: "이전",
	    nextText: "다음",
	    currentText: "오늘",
	    monthNames: ["1월","2월","3월","4월","5월","6월",
	                 "7월","8월","9월","10월","11월","12월"],
	    monthNamesShort: ["1월","2월","3월","4월","5월","6월",
	                      "7월","8월","9월","10월","11월","12월"],
	    dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
	    dayNamesShort: ["일","월","화","수","목","금","토"],
	    dayNamesMin: ["일","월","화","수","목","금","토"],
	    weekHeader: "주",
		changeMonth: true, // 월을 드롭다운으로 선택
		changeYear: true,  // 년도를 드롭다운으로 선택
		yearRange: "c-1:c+10", // 현재 년도에서 -10년, +10년 범위 설정 (원하는 범위로 조정 가능)
	    dateFormat: "yy-mm-dd",  // 한국식 날짜 포맷
	    firstDay: 0,
	    isRTL: false,
	    showMonthAfterYear: true,
//	    yearSuffix: "년"
	});

	// 모든 datepicker 요소에 적용
	$(".datepicker").datepicker();
}
/**********************************************************
 * 초기화(메뉴)
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
 * 그리드 테마
 **********************************************************/
function fnGridApplyTheme(){
	tui.Grid.applyTheme('custom', {
		row:{
			hover:{
				background: 'rgba(11,94,215,0.1)'
			}
		},
		cell: {
			header: {
				background: '#fff'
			},
			evenRow: {
				background: '#fff'
			},
			oddRow: {
				background: 'rgba(46,54,67,0.05)'
			}
		}
	});
}
/**********************************************************
 * 그리드 생성
 **********************************************************/
function fnDrawGrid(gridType, gridId, colunmsData){
	var tmpGrid = null;
	if('00' == gridType){
		tmpGrid = new tui.Grid({
			el: document.getElementById(gridId),
	        scrollX: true,
	        scrollY: true,
	        bodyHeight: 'fitToParent',
            rowHeight: 'auto',
            minRowHeight: 36,     
	        rowHeaders: ['checkbox'],
	        columns: colunmsData,
	        columnOptions: {resizable: true},
//	        draggable: true,
	        contextMenu: null
		});
	}else if('01' == gridType){
		tmpGrid = new tui.Grid({
			el: document.getElementById(gridId),
	        scrollX: true,
	        scrollY: true,
	        bodyHeight: 'fitToParent',
            rowHeight: 'auto',
            minRowHeight: 36,     
	        rowHeaders: ['checkbox'],
	        columns: colunmsData,
	        columnOptions: {resizable: true},
//	        draggable: true,
			columnOptions: {
			  frozenCount: 3,
			  frozenBorderWidth: 2,
			}
		});
	}else if('02' == gridType){
		tmpGrid = new tui.Grid({
			el: document.getElementById(gridId),
	        scrollX: false,
	        scrollY: true,
	        bodyHeight: 'fitToParent',
            rowHeight: 'auto',	 
            minRowHeight: 36,     
	        columns: colunmsData,
	        contextMenu : null,
	        copyOption : {
				 useFormattedValue: true,
   				 useListItemText: true
			}
		});
	}else if('03' == gridType){
		tmpGrid = new tui.Grid({
			el: document.getElementById(gridId),
	        scrollX: true,
	        scrollY: true,
	        bodyHeight: 'fitToParent',
	        rowHeaders: ['rowNum'],
	        columns: colunmsData,
	        columnOptions: {resizable: true},
//	        draggable: true,
	        contextMenu : null
		});
	}else if('04' == gridType){
		tmpGrid = new tui.Grid({
			el: document.getElementById(gridId),
	        scrollX: false,
	        scrollY: true,
	        bodyHeight: 'fitToParent',
            rowHeight: 'auto',
            minRowHeight: 36,     
	        rowHeaders: ['rowNum'],
	        columns: colunmsData,
	        contextMenu: null,
	        pageOptions: {
			    useClient: true,
			    type: 'scroll',
			    perPage: 50
			  }
		});		
	}else if('05' == gridType){
		tmpGrid = new tui.Grid({
			el: document.getElementById(gridId),
	        scrollX: true,
	        scrollY: true,
	        bodyHeight: 'fitToParent',
            rowHeight: 'auto',
            minRowHeight: 36,     
	        rowHeaders: ['checkbox'],
	        columns: colunmsData,
	        columnOptions: {resizable: true},
//	        draggable: true,
	        contextMenu: null
		});
	}else if('06' == gridType){
		tmpGrid = new tui.Grid({
			el: document.getElementById(gridId),
	        scrollX: false,
	        scrollY: true,
	        bodyHeight: 'fitToParent',
            rowHeight: 'auto',
            minRowHeight: 36,     
	        rowHeaders: ['rowNum'],
	        columns: colunmsData,
	        contextMenu: null,
	        pageOptions: {
			    useClient: true,
			    type: 'scroll',
			    perPage: 50
			  }
		});		
	}else if('07' == gridType){
		tmpGrid = new tui.Grid({
			el: document.getElementById(gridId),
	        scrollX: false,
	        scrollY: true,
            rowHeight: 'auto',	 
            bodyHeight: 400,
            minRowHeight: 5,
	        columnOptions: {resizable: true},
	        columns: colunmsData,
	        contextMenu : null,
			rowHeaders: [
			    {
			        type: 'checkbox', // 체크박스 타입
			        header: `<div>선택</div>` // 헤더 체크박스 숨기기
			    }
			],
	        copyOption : {
				 useFormattedValue: true,
   				 useListItemText: true
			}
		});	
		
		// 체크박스 클릭 이벤트
		tmpGrid.on('check', (ev) => {
		    const allRows = tmpGrid.getRowCount();
		    // 선택한 행을 제외한 나머지 행 체크 해제
		    for (let i = 0; i < allRows; i++) {
		        if (i !== ev.rowKey) {
		            tmpGrid.uncheck(i); // 다른 행들의 체크박스 해제
		        }
		    }
		});
		
	}
    // 그리드 테마
	fnGridApplyTheme();

	gridObj[gridId] = tmpGrid;
}
/**********************************************************
 * SET Pagenation 리스트
 **********************************************************/
function fnPagenation(data, fnCall){
	
	var pHtml = "<span class='count'>";
	
	if(0 < data.totalCount){
		pHtml += "현재 페이지 <b>" + data.pageNo + "</b> <i>/</i> 전체 <b>" + data.finalPageNo + "</b> 페이지";
	}else{
		pHtml += "현재 페이지 <b>1</b> <i>/</i> 전체 <b>1</b> 페이지";
	}
	pHtml += "</span>";
	
	pHtml += "<div class='pages'>";
	
	if(0 < data.totalCount){
		
		var prevDisabled = " hide";
		if("Y" == data.prevYn){
			prevDisabled = "";
		}
		
		var nextDisabled = " hide";
		if("Y" == data.nextYn){
			nextDisabled = "";
		}
		
		pHtml += "<button type='button' onclick='javascript:" + fnCall + "(\""+data.firstPageNo+"\")' class='btPrev end" + prevDisabled + "'>처음 페이지</button>";
		pHtml += "<button type='button' onclick='javascript:" + fnCall + "(\""+data.prevPageNo+"\")' class='btPrev" + prevDisabled + "'>이전 페이지</button>";
		
		for(var i=data.startPageNo; i<=data.endPageNo; i++){
			if(i==data.pageNo){
				pHtml += "<a href='javascript:" + fnCall + "(\""+i+"\")' class='pg on'>"+i+"</a>";
			}else{
				pHtml += "<a href='javascript:" + fnCall + "(\""+i+"\")' class='pg'>"+i+"</a>";
			}
		}

		pHtml += "<button type='button' onclick='javascript:" + fnCall + "(\""+data.nextPageNo+"\")' class='btNext" + nextDisabled + "'>다음 페이지</button>";
		pHtml += "<button type='button' onclick='javascript:" + fnCall + "(\""+data.finalPageNo+"\")' class='btNext end" + nextDisabled + "'>마지막 페이지</button>";
	}
	
	pHtml += "</div>";
	
	$("#divPaging").html(pHtml);
}
/**********************************************************
 * 현재일시
 **********************************************************/
function fnNowDateTime(){
	var now = new Date();
	var nowDateTime = now.getFullYear()
					+ fnLpad(String((now.getMonth()+1)), 2 , "0")
					+ fnLpad(String(now.getDate()), 2 , "0")
					+ fnLpad(String(now.getHours()), 2 , "0")
					+ fnLpad(String(now.getMinutes()), 2 , "0")
					+ fnLpad(String(now.getSeconds()), 2 , "0");	
	return nowDateTime;
}	
/**********************************************************
 * 현재일시
 **********************************************************/
function fnNowDateTimeUnderScore(){
	var now = new Date();
	var nowDateTime = now.getFullYear()
					+ fnLpad(String((now.getMonth()+1)), 2 , "0")
					+ fnLpad(String(now.getDate()), 2 , "0")+"_"
					+ fnLpad(String(now.getHours()), 2 , "0")
					+ fnLpad(String(now.getMinutes()), 2 , "0")
					+ fnLpad(String(now.getSeconds()), 2 , "0");	
	return nowDateTime;
}
/**********************************************************
 * 기본 메세지
 **********************************************************/
function fnDefaultMsg(data){
	if(successResCode == data.resCode){
		fnInfoMsg(data.resMsg);
	}else if(noChangeDataResCode == data.resCode){
		fnWarnMsg(data.resMsg);
	}else if(successResCode == data.resCode){
		fnErrorMsg(data.resMsg);
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
 * 에러 메세지
 **********************************************************/
function fnErrorMsg(msg){
	alert(msg);
}
/**********************************************************
 * 이벤트 중지
 **********************************************************/
function fnStopEvent(e) {
	e.preventDefault();
}
/**********************************************************
 * Valator 필수입력id
 **********************************************************/
function fnValidatorRequir(eleNm, eleId, focusId, msg){
	if($("#" +eleId).val() == ""){
		fnErrorMsg(msg);
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
		fnErrorMsg(msg);
		$("#" +focusId).focus();
		return true;
	}else{
		return false;
	}
}
/**********************************************************
 * Validator 최소길이
 **********************************************************/
function fnValidatorMinLen(eleNm, eleId, focusId, msg, minLen){
	if(minLen > $("#" +eleId).val().length){
		fnErrorMsg(msg);
		$("#" +focusId).focus();
		return true;
	}else{
		return false;
	}
}
/**********************************************************
 * Validator DateTime
 **********************************************************/
function fnValidatorDateTime(eleStartDateId, eleStartTimeId, eleEndDateId, eleEndTimeId){
	var bRet = true;
	var startDateTime = "";
	var endDateTime = "";
	var startDate = $("#" + eleStartDateId).val();
	var startTime = $("#" + eleStartTimeId).val();
	var endDate = $("#" + eleEndDateId).val();
	var endTime = $("#" + eleEndTimeId).val();

	if(("" != fnNullChangeBlank(startDate)) && ("" != fnNullChangeBlank(endDate))){
		
		if("" == fnNullChangeBlank(startTime)){
			startTime = "00:00:00";
		}
		
		if("" == fnNullChangeBlank(endTime)){
			endTime = "23:59:59";
		}
		
		var start = new Date(startDate + " " + startTime);
		var end = new Date(endDate + " " + endTime);
		
		if ( ((end.getTime() - start.getTime())/1000) < 0 ){
			alert("종료일(시)은 시작일(시) 보다 클 수 없습니다.");
			bRet = false;
		}else{
			startDateTime = startDate + " " + startTime;
			endDateTime = endDate + " " + endTime;
		}
	} else if(("" != fnNullChangeBlank(startDate)) && ("" == fnNullChangeBlank(endDate))){
		alert("종료일을 입력해주세요.");
	} else if(("" == fnNullChangeBlank(startDate)) && ("" != fnNullChangeBlank(endDate))){
		alert("시작일을 입력해주세요."); 
	}

	valObj["validator"] = bRet;
	valObj["startDateTime"] = startDateTime;
	valObj["endDateTime"] = endDateTime;	
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
			fnErrorMsg("시스템 장애 입니다.\n담당자에게 문의 바랍니다.");
		}
	});
};
/**********************************************************
 * POST SIBMIT
 **********************************************************/
function fnPostSend(actionUrl, params) {
	method = "post"; // 전송 방식 기본값을 POST로
	    
	var form = document.createElement("form");
	form.setAttribute("method", method);
	form.setAttribute("action", actionUrl);
	 
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
 * FORM ACTION
 **********************************************************/
function fnFormSubmit(formId, actionUrl){
	$("#" +formId).attr("action", actionUrl);
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
function fnNullChangeBlank(value){
	return fnNullChange(value,"");
} 
/**********************************************************
 * DEFAULT NULL 값 정의
 **********************************************************/
function fnNullChange(value,text){
	if(fnIsNull(value)){
		return text;
	}else{return value;}
}
/**********************************************************
 * NULL 체크
 **********************************************************/
function fnIsNull(obj){
	return (typeof obj === "undefined" || obj ==null || obj =="" || obj == "undefined")? true : false;
}
/**********************************************************
 * LPAD
 **********************************************************/
function fnLpad(str, padLength, padString){
  var nLen = str.length;
  while(str.length < padLength){
	  str = padString + str;
  }
  return str;
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

$(document).ready(function() {
    $('#searchStr').keypress(function(event) {
        // 엔터 키를 눌렀을 때
        if (event.which === 13) {
            event.preventDefault(); // 기본 동작(새로고침) 방지
            $('#btnSearch').click(); // 서치 버튼 클릭
            $(this).val($(this).val())
        }
    });
});

// Base64 인코딩 함수
function base64Encode(input) {
  const encodedString = btoa(String.fromCharCode(...new Uint8Array(input)));
  return encodedString;
}

// 비밀번호 암호화
async function encryptPassword(password) {
  if (password !== "") {
    const hashedPassword = b64_sha256(password) + '=';
    return hashedPassword;
  } else {
    return "";
  }
}