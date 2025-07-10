<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- HEADER -->
<c:import url="/link/pageLink?link=/inc/header" />

<!-- NAV -->
<c:import url="/link/pageLink?link=/inc/nav" />

<!-- CONTENTS -->
<section class="section">

	<div class="conHead">

		<ol class="breadcrumb">
			<li><a href="" class="home">Home</a></li>
			<li>관제운영관리</li>
			<li>공지그룹 관리</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">공지그룹 관리</h2>
		</div>

	</div><!--//conHead-->

	<div class="conBody cols">

		<article class="panel" style="width:42%;">

			<div class="headline">
				<h3 class="mainTitle">SMS 사용자 관리</h3>
			</div>

			<div class="result">

				<div class="control">

					<span class="count">
						<select class="select sm">
							<option>25</option>
							<option>50</option>
							<option>75</option>
							<option>100</option>
							<option>200</option>
							<option>300</option>
						</select>
						<i>화면에 표시할 리스트 갯수</i>
					</span>

					<div class="btns">
						<button type="button" class="bt bg secondary" id="test-bt-popup1">사용자추가</button>
					</div>

				</div><!--//control-->
				
				<!-- SMS 사용자 관리 -->
				<!-- GRID -->
				<div class="tui-grid"">
					<div id="gridUser"></div>
				</div>	
	            <!-- PAGING -->
				<div id="divPagingUser" class="control">
					<span class="count"></span>	
					<div class="pages"></div>
				</div>

			</div><!--//result-->

		</article><!--//panel-->

		<article class="panel"  style="width:48%;">

			<div class="headline">
				<h3 class="mainTitle">SMS 발송규칙</h3>
			</div>

			<div class="result">

				<div class="control">

					<span class="count">
						<select class="select sm">
							<option>25</option>
							<option>50</option>
							<option>75</option>
							<option>100</option>
							<option>200</option>
							<option>300</option>
						</select>
						<i>화면에 표시할 리스트 갯수</i>
					</span>

					<div class="btns">
						<button type="button" class="bt bg secondary" id="test-bt-popup2">발송규칙 추가</button>
					</div>

				</div><!--//control-->
				
				
				<!-- SMS 발송규칙 -->
				<!-- GRID -->
				<div class="tui-grid">
					<div id="gridSms"></div>
				</div>	
	            <!-- PAGING -->
				<div id="divPagingSms" class="control">
					<span class="count"></span>	
					<div class="pages"></div>
				</div>	

			</div><!--//result-->

		</article><!--//panel-->

	</div><!--//conBody-->

</section>




<!-- [팝업] 사용자추가 -->
<article class="popup hide" id="test-popup1">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">사용자추가</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody">

			<table class="field">
				<colgroup>
					<col width="100px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>ZABBIX IP</th>
						<td><input type="text" class="input" value="" id="popSmsZabbixIp"></td>
					</tr>
					<tr>
						<th>그룹</th>
						<td><input type="text" class="input" value="" id="popSmsUserDepart"></td>
					</tr>
					<tr>
						<th>사번</th>
						<td><input type="text" class="input" value="" id="popSmsUserId"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" class="input" value="" id="popSmsUserName"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" class="input" value="" id="popSmsUserPhone"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" class="input" value="" id="popSmsUserMail"></td>
					</tr>
				</tbody>
			</table>

		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary" id="btnUserSave">저장</button>
				<button type="button" class="bt max bd btClose">취소</button>
			</div>
		</div>

	</div>
</article>	
<!--// [팝업] 사용자추가 -->




<!-- [팝업] SMS발송규칙추가 -->
<article class="popup hide" id="test-popup2">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">SMS발송규칙추가</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody">

			<table class="field">
				<colgroup>
					<col width="100px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>ZABBIX IP</th>
						<td><input type="text" class="input" value="" id="smsAddZabbixIp"></td>
					</tr>
					<tr>
						<th>호스트 그룹명</th>
						<td><input type="text" class="input" value="" id="smsAddHostGroupName"></td>
					</tr>
					<tr>
						<th>호스트 명</th>
						<td><input type="text" class="input" value="" id="smsAddHostName"></td>
					</tr>
					<tr>
						<th>호스트 IP</th>
						<td><input type="text" class="input" value="" id="smsAddHostIp"></td>
					</tr>
					<tr>
						<th>이벤트등급</th>
						<td><input type="text" class="input" value="" id="smsAddEventLevel"></td>
					</tr>
					<tr>
						<th>사번</th>
						<td><input type="text" class="input" value="" id="smsAddUserId"></td>
					</tr>
					<tr>
						<th>그룹</th>
						<td><input type="text" class="input" value="" id="smsAddGroupName"></td>
					</tr>
				</tbody>
			</table>

		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary" id="btnSmsAddSave">저장</button>
				<button type="button" class="bt max bd btClose">취소</button>
			</div>
		</div>

	</div>
</article>	
<!--// [팝업] SMS발송규칙추가 -->


<!-- [팝업] 사용자 수정-->
<article class="popup hide" id="test-popup3">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">SMS 사용자 수정</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody">

			<table class="field">
				<colgroup>
					<col width="100px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>ZABBIX IP</th>
						<td><input type="text" class="input xl" value="" id="userZabbixIp"></td>
					</tr>
					<tr>
						<th>그룹</th>
						<td><input type="text" class="input" value="" id="userDepart"></td>
					</tr>
					<tr>
						<th>사번</th>
						<td><input type="text" class="input" value="" id="userId"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" class="input" value="" id="userName"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" class="input" value="" id="userPhone"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" class="input" value="" id="userMail"></td>
					</tr>
				</tbody>
			</table>

		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary" id="updUserSave">저장</button>
				<button type="button" class="bt max bd btClose" id="updUserCancleAndClose">취소</button>
			</div>
		</div>

	</div>
</article>	


<!-- [팝업] 발송규칙 수정-->
<article class="popup hide" id="test-popup4">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">SMS 발송규칙 수정</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody">

			<table class="field">
				<colgroup>
					<col width="100px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>ZABBIX IP</th>
						<td><input type="text" class="input xl" value="" id="smsZabbixIp"></td>
					</tr>
					<tr>
						<th>호스트 그룹명</th>
						<td><input type="text" class="input" value="" id="smsHostGroupName"></td>
					</tr>
					<tr>
						<th>호스트 명</th>
						<td><input type="text" class="input" value="" id="smsHostName"></td>
					</tr>
					<tr>
						<th>호스트 IP</th>
						<td><input type="text" class="input" value="" id="smsHostIp"></td>
					</tr>
					<tr>
						<th>이벤트등급</th>
						<td><input type="text" class="input" value="" id="smsEventLevel"></td>
					</tr>
					<tr>
						<th>사번</th>
						<td><input type="text" class="input" value="" id="smsUserId"></td>
					</tr>
					<tr>
						<th>그룹</th>
						<td><input type="text" class="input" value="" id="smsGroupName"></td>
					</tr>
				</tbody>
			</table>

		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary" id="updSmsSave">저장</button>
				<button type="button" class="bt max bd btClose" id="updSmsCancleAndClose">취소</button>
			</div>
		</div>

	</div>
</article>	
	
<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/footer" />

<script type="text/javaScript">


$(function(){

	// 초기화
	fnInit();
	
	// 팝업테스트
	$('#test-bt-popup1').click(function(){
		$('#test-popup1').removeClass('hide');
	});
	$('#test-bt-popup2').click(function(){
		$('#test-popup2').removeClass('hide');
	});
	
	
	// 사용자 추가
	$("#test-bt-popup1").on("click", function(e){
		fnStopEvent(e);
		$("#popSmsZabbixIp").val("");
		$("#popSmsUserDepart").val("");
		$("#popSmsUserId").val("");
		$("#popSmsUserName").val("");
		$("#popSmsUserPhone").val("");
		$("#popSmsUserMail").val("");
		$('#test-popup1').removeClass('hide');		
	});
	
	// 사용자 추가 팝업에서 저장 버튼 클릭
	$("#btnUserSave").on("click", function(e){
		fnStopEvent(e);
		console.log("팝업-저장 click");
		
		var param = {
				popSmsZabbixIp : $("#popSmsZabbixIp").val()
			  , popSmsUserDepart : $("#popSmsUserDepart").val()
			  , popSmsUserId : $("#popSmsUserId").val()	
			  , popSmsUserName : $("#popSmsUserName").val()
			  , popSmsUserPhone : $("#popSmsUserPhone").val()
			  , popSmsUserMail : $("#popSmsUserMail").val()
		}
		
		console.log(param);
		
		fnAjax("<c:url value='/api/ctl/insertSmsUser'/>", param, function(data){
			if(successResCode == data.resCode) {
				alert("사용자가 추가되었습니다.");
				// 리스트 새로고침
				fnList("1");
				$(".btClose").click();
			} else {
				alert("사용자 추가에 실패했습니다.");
			}
		});
			
	});
	
	
	// 발송규칙 추가
	$("#test-bt-popup2").on("click", function(e){
		fnStopEvent(e);
		
		$("#smsAddZabbixIp").val("");
		$("#smsAddHostGroupName").val("");
		$("#smsAddHostName").val("");
		$("#smsAddHostIp").val("");
		$("#smsAddEventLevel").val("");
		$("#smsAddUserId").val("");
		$("#smsAddGroupName").val("");
		$('#test-popup2').removeClass('hide');		
	});
	
	// 발송규칙 추가 팝업에서 저장 버튼 클릭
	$("#btnSmsAddSave").on("click", function(e){
		fnStopEvent(e);
		console.log("발송규칙추가 click");
		
		var param = {
				smsAddZabbixIp : $("#smsAddZabbixIp").val()
			  , smsAddHostGroupName : $("#smsAddHostGroupName").val()
			  , smsAddHostName : $("#smsAddHostName").val()	
			  , smsAddHostIp : $("#smsAddHostIp").val()
			  , smsAddEventLevel : $("#smsAddEventLevel").val()
			  , smsAddUserId : $("#smsAddUserId").val()
			  , smsAddGroupName : $("#smsAddGroupName").val()
		}
		
		console.log("발송규칙추가 >>>>>>> "+ JSON.stringify(param));
		
		fnAjax("<c:url value='/api/ctl/insertSmsRule'/>", param, function(data){
			if(successResCode == data.resCode) {
				alert("SMS 발송규칙이 추가되었습니다.");
				// 리스트 새로고침
				fnList("1");
				$(".btClose").click();
			} else {
				alert("SMS 발송규칙 추가에 실패했습니다.");
			}
		});
			
	});

	
	// 사용자 수정
	$(document).on("click", ".sms-user-update", function(e){
		fnStopEvent(e);
		var cell = gridObj["gridUser"].getFocusedCell();
		console.log("sms-user-update cell==>" + cell.rowKey);
		var updUserData = fnNullChangeBlank(gridObj["gridUser"].getRow(cell.rowKey));
		console.log("수정할 데이터 >>>>> " + JSON.stringify(updUserData));
		
		$("#userZabbixIp").val(updUserData.zabbix_ip);
		$("#userDepart").val(updUserData.user_depart);
		$("#userId").val(updUserData.user_id);
		$("#userId").prop("disabled", true);
		$("#userName").val(updUserData.user_name);
		$("#userPhone").val(updUserData.user_phone);
		$("#userMail").val(updUserData.user_mail);
		$('#test-popup3').removeClass('hide');	
		
	});
		
	// 사용자 수정 팝업에서 저장 버튼 클릭
	$("#updUserSave").on("click", function(e){
		fnStopEvent(e);
		console.log("수정-저장 click");
		
			var param = {
					smsUserZabbixIp : $("#userZabbixIp").val()
				  , smsUserDepart : $("#userDepart").val()
				  , smsUserId : $("#userId").val()	
				  , smsUserName : $("#userName").val()
				  , smsUserPhone : $("#userPhone").val()
				  , smsUserMail : $("#userMail").val()
			}
			
			console.log(param);
			
			fnAjax("<c:url value='/api/ctl/smsUpdateUser'/>", param, function(data){
				if(successResCode == data.resCode) {
					alert("SMS 사용자 정보가 수정되었습니다.");
					// 리스트 새로고침
					fnList("1");
					$(".btClose").click();
				} else {
					alert("SMS 사용자 정보 수정에 실패했습니다.");
				}
			});
				
	});
	
	
	// 발송규칙 수정
	$(document).on("click", ".sms-update", function(e){
		fnStopEvent(e);
		var cell = gridObj["gridSms"].getFocusedCell();
		console.log("sms-update cell==>" + cell.rowKey);
		var updUserData = fnNullChangeBlank(gridObj["gridSms"].getRow(cell.rowKey));
		console.log("수정할 데이터 >>>>> " + JSON.stringify(updUserData));
		
		$("#smsZabbixIp").val(updUserData.zabbix_ip);
		$("#smsHostGroupName").val(updUserData.host_group_name);
		$("#smsHostName").val(updUserData.host_name);
		$("#smsHostIp").val(updUserData.host_ip);
		$("#smsEventLevel").val(updUserData.event_level);
		$("#smsUserId").val(updUserData.user_id);
		$("#smsUserId").prop("disabled", true);
		$("#smsGroupName").val(updUserData.group_name);
		$('#test-popup4').removeClass('hide');	
		
	});

	// 발송규칙 수정 팝업에서 저장 버튼 클릭
	$("#updSmsSave").on("click", function(e){
		fnStopEvent(e);
		console.log("수정-저장 click");
		
		var param = {
				smsZabbixIp : $("#smsZabbixIp").val()
			  , smsHostGroupName : $("#smsHostGroupName").val()
			  , smsHostName : $("#smsHostName").val()	
			  , smsHostIp : $("#smsHostIp").val()
			  , smsEventLevel : $("#smsEventLevel").val()
			  , smsUserId : $("#smsUserId").val()
			  , smsGroupName : $("#smsGroupName").val()
		}
			
			console.log(param);
			
			fnAjax("<c:url value='/api/ctl/smsUpdate'/>", param, function(data){
				if(successResCode == data.resCode) {
					alert("발송규칙 정보가 수정되었습니다.");
					// 리스트 새로고침
					fnList("1");
					$(".btClose").click();
				} else {
					alert("발송규칙 정보 수정에 실패했습니다.");
				}
			});
				
	});
	
	
	// SMS 사용자 삭제
	$(document).on("click", ".sms-user-delete", function(e){
		fnStopEvent(e);
		var cell = gridObj["gridUser"].getFocusedCell();
		console.log("sms-user-delete cell==>" + cell.rowKey);	
		var user_id = fnNullChangeBlank(gridObj["gridUser"].getValue(cell.rowKey, "user_id"));
		console.log("del user_id==>" + user_id);	
		
		var param = {
				delUserId : user_id
		}
		
		console.log(param);
		
 		fnAjax("<c:url value='/api/ctl/smsUserDelete'/>", param, function(data){
			if(successResCode == data.resCode) {
				alert("사용자 삭제에 성공했습니다.");
				// 리스트 새로고침
				fnList("1");
			} else {
				alert("사용자 삭제에 실패했습니다.");
			}
		});
	});
	
	
	// SMS 발송규칙 삭제
	$(document).on("click", ".sms-delete", function(e){
		fnStopEvent(e);
		var cell = gridObj["gridSms"].getFocusedCell();
		console.log("sms-delet cell==>" + cell.rowKey);	
		var user_id = fnNullChangeBlank(gridObj["gridSms"].getValue(cell.rowKey, "user_id"));
		console.log("del user_id==>" + user_id);	
		
		var param = {
				delUserId : user_id
		}
		
		console.log(param);
		
 		fnAjax("<c:url value='/api/ctl/smsDelete'/>", param, function(data){
			if(successResCode == data.resCode) {
				alert("발송규칙 삭제에 성공했습니다.");
				// 리스트 새로고침
				fnList("1");
			} else {
				alert("발송규칙 삭제에 실패했습니다.");
			}
		});
	});
	
	
	
});

/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){
	
	// InitGnbLnb
	fnInitGnbLnb(8, 2, 8, 2);
	
	// 그리드 초기화
	fnInitGrid();
	
	//공통
	fnCommon();
	
	// 리스트 조회
	fnList("1");
	
}


/**********************************************************
 * 초기화(그리드)
 **********************************************************/
function fnInitGrid(){
	
	// 사용자관리 그리드 컬럼 정보
	var columnsData1 = [
		  {header:'ZABBIX IP', name:'zabbix_ip', sortable:true, filter:'select', width:80, align:'center'}
		, {header:'그룹', name:'user_depart', sortable:true, filter:'select', width:70, align:'center'}
		, {header:'사번', name:'user_id', sortable:true, filter:'select', width:80, align:'center'}
		, {header:'이름', name:'user_name', sortable:true, filter:'select', width:80, align:'center'}
        , {header:'전화번호', name:'user_phone', sortable:true, filter:'select', width:100, align:'center'}
        , {header:'이메일', name:'user_mail', sortable:true, filter:'select', width:140, align:'center'}		 
		, {header:'수정', name:'sms_user_upd', width:244, align:'center'}
	];
	
	// 사용자관리 그리드 생성
	fnDrawGrid("00", "gridUser", columnsData1);
	
	
	// 발송규칙 그리드 컬럼 정보
	var columnsData2 = [
		  {header:'ZABBIX IP', name:'zabbix_ip', sortable:true, filter:'select', width:80, align:'center'}
		, {header:'호스트 그룹명', name:'host_group_name', sortable:true, filter:'select', width:90, align:'center'}
		, {header:'호스트 명', name:'host_name', sortable:true, filter:'select', width:90, align:'center'}
		, {header:'호스트 IP', name:'host_ip', sortable:true, filter:'select', width:80, align:'center'}
        , {header:'이벤트 등급', name:'event_level', sortable:true, filter:'select', width:80, align:'center'}
        , {header:'사번', name:'user_id', sortable:true, filter:'select', width:90, align:'center'}	
        , {header:'그룹', name:'group_name', sortable:true, filter:'select', width:100, align:'center'}
		, {header:'수정', name:'sms_upd_del', width:254, align:'center'}
	];
	
	// 발송규칙 그리드 생성
	fnDrawGrid("00", "gridSms", columnsData2);
	
}


 /**********************************************************
  * 리스트(그리드) 조회
  **********************************************************/
function fnList(slcPageNo){
	 
	 // 파라미터 설정
	 var params = {
			 pageSize : $("#slcPageSize").val(),
			 pageNavi : "5",
			 pageNo : slcPageNo
	 };
	 console.log(params);
	 
	 //사용자 관리
	 // 그리드에 뿌려질 리스트 조회
	 fnAjax("<c:url value='/api/ctl/smsUserList'/>", params, function(data){
		 
		 if(successResCode = data.resCode){ //조회성공
			 
			// SET 리스트전체건수
			$("#listTotalCount").val(data.total_count);
		 	
		 	// RESET DATA(그리드에 데이터 입력)
		 	gridObj["gridUser"].resetData(data.smsUserList);
		 	gridObj["gridUser"].hideColumn('_checked');
		 	//사용자일때 수정 컬럼 hide
		 	if(loginUserGroup == "사용자"){
		 		gridObj["gridUser"].hideColumn('sms_user_upd');
		 		
		 	}

		 } else { //조회실패
			// 경고메세지
			fnErrorMsg(failResMsg);
		 }
	 });
	 
	 //발송규칙
	 fnAjax("<c:url value='/api/ctl/smsList'/>", params, function(data){
		 
		 if(successResCode = data.resCode){ //조회성공
			 
			// SET 리스트전체건수
			$("#listTotalCount").val(data.total_count);
		 	
		 	// RESET DATA(그리드에 데이터 입력)
		 	gridObj["gridSms"].resetData(data.smsList);
		 	gridObj["gridUser"].hideColumn('_checked');
		 	//사용자일때 수정삭제 컬럼 hide
		 	if(loginUserGroup == "사용자"){
		 		gridObj["gridSms"].hideColumn('sms_upd_del');
		 		
		 	}

		 } else { 
			//조회실패
			fnErrorMsg('조회에 실패했습니다');
		 }
	 });
	 
 }

</script>