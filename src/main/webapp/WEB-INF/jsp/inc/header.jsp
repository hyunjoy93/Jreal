<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, viewport-fit=cover">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>(주)제이부동산중개법인 업무포탈</title>
	
<!-- [Favicons] -->
<link href="<c:url value='/img/favicon.png' />" rel="icon">
<%-- <link href="<c:url value='/img/apple-touch-icon.png' />" rel="apple-touch-icon"> --%>
	
<!--[CSS]-->
<link rel="stylesheet" href="<c:url value='/css/jquery-ui.css' />"/>
<%-- <link rel="stylesheet" href="<c:url value='/css/jquery.nestable.css' />"/> --%>
<link rel="stylesheet" href="<c:url value='/css/style.css' />"/>
<link rel="stylesheet" href="<c:url value='/css/tui-grid.css' />"/>	
<link rel="stylesheet" href="<c:url value='/css/grid-style.css' />"/>
<link rel="stylesheet" href="<c:url value='/css/font-awesome.css' />"/>

<!--[JS]-->
<script type="text/javaScript">
<!--

//공통 객체, 그리드 객체, 성공응답코드, 시스템메세지, 
var cmmObj = new Array();
cmmObj["isLogin"] = true;
cmmObj["isDisabledUser"] = true;

var gridObj = new Array();
var valObj = new Array();
var isLogin = ${isLogin};
var successResCode = "${successResCode}";
var failResCode = "${failResCode}";
var noChangeDataResCode = "${noChangeDataResCode}";
var successResMsg = "${successResMsg}";
var failResMsg = "${failResMsg}";
var noChangeDataResMsg = "${noChangeDataResMsg}";
var longLogoutMsg = "${longLogoutMsg}";
var defaultDate = "${defaultDate}";
var logoutUrl = "<c:url value='/view/ctl/logout' />";
var loginUserId = "${loginInfo.user_id}";
var loginUserName = "${loginInfo.user_name}";
var loginUserGroup = "${loginInfo.user_group}";
var loginUserPswd = "${loginInfo.user_pswd}";
var navTrue = false;


//-->
</script>
<script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
<script src="<c:url value='/js/jquery-ui.min.js' />"></script>
<script src="<c:url value='/js/chart.min.js' />"></script>
<script src="<c:url value='/js/common.js' />"></script>
<script src="<c:url value='/js/tui-grid.js' />"></script>
<script src="<c:url value='/js/jquery.nestable.js' />"></script>
<script src="<c:url value='/js/crypto.js' />"></script>
<script src="<c:url value='/js/biz.js' />"></script>

</script>

</head>
	
<body>
<div id="app" class="container">

<header class="header">
	
<!--	<button type="button" class="btMenu on"><i>좌측메뉴열닫기</i></button>-->

	<h1 class="logo"><a href="/view/dsb/main"></a></h1>

	<nav class="gnb">
		<ul class="mainMenu">
			<li class="hide">
				<a href="/view/dsb/main" class="menu">Dashboard</a>	
			</li>
 			<li>
				<a href="javascript:fnPostSend('<c:url value="/view/opm/subOpmCorp" />', {viewType:'10'})" class="menu">운영관리</a>
				<ul class="subMenu">
					<li><a href="javascript:fnPostSend('<c:url value="/view/opm/subOpmCorp"       />', {viewType:'00'})" class="menu">업체관리 </a></li>
					<li><a href="javascript:fnPostSend('<c:url value="/view/ctl/subControlMember" />', {viewType:'00'})" class="menu">사원관리</a></li>
					<li><a href="javascript:fnPostSend('<c:url value="/view/opm/subOpmAsset"      />', {viewType:'00'})" class="menu">매물관리 </a></li>
					<li><a href="javascript:fnPostSend('<c:url value="/view/opm/subOpmAsset2"      />', {viewType:'00'})" class="menu">집합건물매물관리 </a></li>
					<li><a href="javascript:fnPostSend('<c:url value="/view/opm/subOpmMntc"       />', {viewType:'00'})" class="menu">계약관리 </a></li>
<!--				    <li><a href="javascript:fnPostSend('<c:url value="/view/opm/subOpmTax"       />', {viewType:'00'})" class="menu">계산서요청 </a></li>-->
				</ul>
			</li>
<!--			<li>-->
<!--				<a href="<c:url value='/view/chk/subChkStat' />" class="menu">점검관리</a>-->
<!--				<ul class="subMenu">-->
<!--					<li><a href="javascript:fnPostSend('<c:url value='/view/chk/subChkStat' />'  , {viewType:'00'})" class="menu">요청현황</a></li>-->
<!--					<li><a href="javascript:fnPostSend('<c:url value='/view/chk/subChkReq' />', {viewType:'00'})" class="menu">점검요청</a></li>-->
<!--					<li><a href="javascript:fnPostSend('<c:url value='/view/chk/subChkRslt' />'  , {viewType:'00'})" class="menu">점검결과</a></li>-->
<!--				</ul>-->
<!--			</li>-->
 			<li>
				<a href="<c:url value='/view/tot/subTotChkAsset' />" class="menu">통계관리</a>
				<ul class="subMenu">
					<li><a href="<c:url value='/view/tot/subTotChkAsset' />" class="menu">실적통계(행정분류별)</a></li>
					<li><a href="<c:url value='/view/tot/subTotChkCorp' />" class="menu">실적통계(업체별)</a></li>
				</ul>
			</li>
 			<li>
				<a href="<c:url value='/view/set/subSetAsetClsf' />" class="menu">환경설정</a>
				<ul class="subMenu">
					<li><a href="<c:url value='/view/set/subSetAsetClsf'/>" class="menu">행정분류</a></li>
<!--					<li><a href="<c:url value='/view/set/subSetChkForm' />" class="menu">점검양식</a></li>-->
					<li><a href="<c:url value='/view/set/subSetCommCd'  />" class="menu">공통코드</a></li>
				</ul>
			</li>
			<li>
				<a href="<c:url value='/view/spt/subSupportNotice' />" class="menu">공지사항</a>
				<ul class="subMenu">
					<li><a href="<c:url value='/view/spt/subSupportNotice' />" class="menu">공지사항</a></li>
				</ul>
			</li>
			<li>
				<a href="<c:url value='/view/spt/subTodoList' />" class="menu">업무관리</a>
				<ul class="subMenu">
					<li><a href="javascript:fnPostSend('<c:url value='/view/spt/subTodoList' />'  , {viewType:'00'})" class="menu">나의업무현황</a></li>
					<li><a href="javascript:fnPostSend('<c:url value='/view/spt/subOrgList' />'  , {viewType:'00'})" class="menu">조직도</a></li>
				</ul>
			</li>
		</ul>
		<ul class="navBtn">
			<button type="button" class="bt bg checkin" id="btnCheckIn">출근</button>
			<button type="button" class="bt bg checkout" id="btnCheckOut">퇴근</button>
	    </ul>
	</nav>

	<div class="user">
		<div class="userName"><span class="pic"></span>${loginInfo.emp_nm}</div>
		<div class="userMenu">
			<a href="<c:url value='/view/ctl/logout' />" class="menu">로그아웃</a>
			<a id="pwChange" class="menu">비밀번호변경</a>
		</div>
	</div>

<script type="text/javascript">
	 $('#pwChange').click(function(e) {
		    var html = `
		        <article class="popup hide" id="userPwChangePopup">
		            <div class="popBox">
		                <div class="conHead">
		                    <h5 class="popTitle">비밀번호변경</h5>
		                    <button type="button" class="btClose"><i>닫기</i></button>
		                </div>
		    
		                <div class="conBody">
		                    <table class="field">
		                        <colgroup>
		                            <col width="90px">
		                            <col width="*">
		                        </colgroup>
		                        <tbody>
		                            <tr>
		                                <th>현재 비밀번호</th>
		                                <td><input type="password" class="input" id="currentPassword"></td>
		                            </tr>
		                            <tr>
		                                <th>신규 비밀번호</th>
		                                <td><input type="password" class="input" id="newPassword"></td>
		                            </tr>
		                            <tr>
		                                <th>비밀번호 확인</th>
		                                <td><input type="password" class="input" id="confirmPassword"></td>
		                            </tr>
		                        </tbody>
		                    </table>
		                </div>
		                <p class="pwChnInfo">※ 비밀번호는 8자리이상, 특수문자와 대문자 포함 필수.</p>		    
		                <div class="conFoot">
		                    <div class="btns">
		                        <button type="button" class="bt max bg primary" id="changePwBtn">저장</button>
		                        <button type="button" class="bt max bd btClose">취소</button>
		                    </div>
		                </div>
		            </div>
		        </article>
		    `;
		 
		 $('.section').append(html);
		 $('#userPwChangePopup').removeClass('hide');
		/* POPUP CLOSE */
		$('.popup .btClose').click(function(){
			$(this).parents('.popup').addClass('hide');

		});
		
		$('#changePwBtn').click(function(e) {
			e.preventDefault();
			
			var passWordInput = '';
			
			// 비밀번호변경 logic promise 처리 (보안강화)
			encryptPassword($('#currentPassword').val())
			    .then(result => {
			    	  // 비밀번호 정규식
			    	  const regex = /^(?=.*[A-Z])(?=.*[!@#$%^&*])(?=.*[0-9])(?=.*[a-zA-Z]).{8,}$/;
					  if( result != loginUserPswd) {
						  alert("현재 사용중인 패스워드가 일치하지 않습니다. 관리자에게 문의해주세요.");
					  } else if ( $('#newPassword').val() != $('#confirmPassword').val()) {
					  	  alert("새 비밀번호와 비밀번호 확인이 서로 일치하지 않습니다. 다시 한번 확인해주세요. ");
					  } else if (!regex.test($('#confirmPassword').val())) {
						  alert("비밀번호는 8자리이상, 특수문자와 대문자를 포함해야 합니다. 다시 입력해주세요.")
					  } else {
							// 비밀번호변경 이중처리
							encryptPassword($('#confirmPassword').val())
							    .then(pswd => {
									fnAjax("<c:url value='/api/ctl/updateUserPw'/>", {empId: loginUserId, pswd: pswd}, function(data) {
										if(successResCode == data.resCode){
											alert("비밀번호가 변경되었습니다. 변경된 비밀번호로 다시 로그인해주세요.\n로그인페이지로 이동합니다.");
											window.location.href="<c:url value='/view/ctl/logout' />";
										} else {
											alert("비밀번호가 변경에 실패하였습니다. 관리자에게 문의해주세요.");
										}
									});
							    });
					  }
			    })
			    .catch(error => {
			        console.error(error); // 오류 처리
			    });
			
		});
		
		
	 });
	 
	 $('#btnCheckIn').click(function(e) {
	 	e.preventDefault();
		fnAjax("<c:url value='/api/ctl/doCheckIn'/>", {empId: loginUserId, chkIn:"Y"}, function(data) {
			if(data.chkYn == "Y") {
				if(confirm("이미 출근처리 되었어요. 현재시간으로 업데이트 할까요?")) {
					fnAjax("<c:url value='/api/ctl/insertCheckIn'/>", {empId: loginUserId, chkIn:"Y"}, function(data) {
						alert("출근처리 완료되었습니다.")
					});
				}
			} else {
				fnAjax("<c:url value='/api/ctl/insertCheckIn'/>", {empId: loginUserId, chkIn:"Y"}, function(data) {
					alert("출근처리 완료되었습니다.")
				});
			}
		});
	 });
	 
	 $('#btnCheckOut').click(function(e) {
	 	e.preventDefault();
		fnAjax("<c:url value='/api/ctl/doCheckIn'/>", {empId: loginUserId, chkIn:"N"}, function(data) {
			if(data.chkYn == "Y") {
				if(confirm("이미 퇴근처리 되었어요. 현재시간으로 업데이트 할까요?")) {
					fnAjax("<c:url value='/api/ctl/insertCheckIn'/>", {empId: loginUserId, chkIn:"N"}, function(data) {
						alert("퇴근처리 완료되었습니다.")
					});
				}
			} else {
				fnAjax("<c:url value='/api/ctl/insertCheckIn'/>", {empId: loginUserId, chkIn:"N"}, function(data) {
					alert("퇴근처리 완료되었습니다.")
				});
			}
		});
	 });
	 
	 
</script>

</header>