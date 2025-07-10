<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- HEADER -->
<c:import url="/link/pageLink?link=/inc/popHeader" />

<!-- CONTENTS -->
<div id="app" class="container">
	
<section class="section login">

	<div class="box">
		<div class="conHead">
<!--			<h1 class="logo"></h1>-->
		</div>

		<div class="conBody">
			<h2 class="pageTitle">Login</h2>

			<form id="loginFrm" name="loginFrm" method="post">
				<input id="loginId" type="text" name="loginId" class="input id" placeholder="USER ID(사번)">
				<input id="loginPassword" type="password" name="loginPassword" class="input pw" placeholder="PASSWORD">
				<span class="check"><input type="checkbox" id="checkId" checked="true"><label>아이디저장</label></span>
				<a id="btnLogin" class="bt bg secondary">LOGIN</a>
			</form>
		</div>
	</div>

</section>

<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/footer" />

<script type="text/javaScript">
<!--

$(function(){

	// 저장된 쿠키값 가져오기 (없으면 공백)
	deleteCookie("key");
    var key = getCookie("key");
    $("#loginId").val(key); 
    
    if($("#loginId").val() != ""){ 
        $("#checkId").attr("checked", true); 
    }
    
	// 엔터 키로 로그인
	$("#loginPassword").on("keyup", function(e) {
		fnStopEvent(e);
    	if($("#loginPassword :focus") && e.key == "Enter"){
			$("#btnLogin").click();
   		}
	});
	
	// 이벤트(로그인버튼)
	$("#btnLogin").on("click", function(e){
		
		fnStopEvent(e);

		// Valator 필수입력
		if(fnValidatorRequir("USER ID(사번)", "loginId", "loginId", "USER ID(사번)을 입력해주세요.")) return;
		if(fnValidatorRequir("PASSWORD", "loginPassword", "loginPassword", "PASSWORD를 입력해주세요.")) return;
		
		// 로그인
		var params = {
			loginId : $("#loginId").val(),
			loginPassword : $("#loginPassword").val()
		};
		
		fnAjax("<c:url value='/api/ctl/login'/>", params, function(data) {
			if(successResCode == data.resCode){	
				if(data.info.user_group == '승인대기') {
					fnErrorMsg("ID 사용 승인 대기중 입니다. 관리자에게 문의하세요.");
				} else {
					fnFormSubmit("loginFrm", "<c:url value='/view/dsb/main'/>");
				}
			}else{
				fnErrorMsg("로그인 정보가 일치 하지 않습니다.");
			}
			
		});
			
	});
	
    $("#checkId").change(function(){ 
        if($("#checkId").is(":checked")){ 
        	if(confirm("이 PC에 로그인 정보를 저장하시겠습니까? PC방 등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해 주십시오.")){
        		setCookie("key", $("#loginId").val(), 7);
        	}
        }else{
        	// 아이디저장 체크 해제 시
            deleteCookie("key");
        }
    });
     
    // 아이디저장을 체크한 상태에서 ID를 입력하는 경우에도 쿠키 저장
    $("#loginId").keyup(function(){ 
        if($("#checkId").is(":checked")){
            setCookie("key", $("#loginId").val(), 7); 
        }
    });
    
    $("#ldapCheckId").change(function(){ 
    	
        if($("#ldapCheckId").is(":checked")) { 
        	$("#ldapCheckIdTxt").text("");
        	$("#ldapCheckIdTxt").text("사번ID로그인");
        } else {
        	$("#ldapCheckIdTxt").text("");
        	$("#ldapCheckIdTxt").text("로컬ID로그인");        	
        }
    	
    });

});
/**********************************************************
 * 쿠키 저장하기
 **********************************************************/
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
/**********************************************************
 * 쿠키 삭제하기
 **********************************************************/ 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
/**********************************************************
 * 쿠키 가져오기
 **********************************************************/
function getCookie(cookieName){
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

//-->
</script>