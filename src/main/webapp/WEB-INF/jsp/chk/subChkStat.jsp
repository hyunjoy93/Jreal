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
			<li>점검관리</li>
			<li>요청현황</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">요청현황</h2>
		</div>

	</div><!--//conHead-->

	<div class="conBody">

		<div class="search">

			<div class="box">
				<form>
					<table class="field">
						<tbody>
							<tr>
								<th>검색어</th>
								<td>
									<select class="select md" id="searchType">
										<option value="reqEmpNm">요청자</option>
										<option value="chkSepNm">점검구분</option>
										<option value="chkReqCtnt">점검요청내용</option>
									</select>
									<input type="text" class="input xxl" value="" placeholder="검색어입력" id="searchStr">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				<div class="btns">
					<button type="button" class="bt bg primary" id="btnSearch">검색</button>
				</div>
			</div>

		</div><!--//search-->

		<div class="result gridFlex">

			<div class="verticalFlex">
				<table class="field" >
					<colgroup>
						<col width="100px">
						<col width="*">
					</colgroup>
					<tbody>
						<tr >
							<td style="padding-right: 0;">  
								<button type="button" class="bt bg secondary fr" id="moveChkReq">점검요청등록 화면이동</button>
							</td>
						</tr>
					</tbody>
				</table>
				<!-- grid -->
				<div class="tui-grid" style="height: 95%;">
					<div id="grid"></div>
				</div>
			</div><!--//control-->
			<div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
			<!-- GRID -->
			<div class="verticalFlex" style="margin-right:1px;">
				<table  class="field">
					<colgroup>
						<col width="100px">
						<col width="*">
					</colgroup>
					<tbody>
						<tr hidden="true">
							<th align='center'>점검요청ID</th>
							<td>
							  <input type="text" class="input" value="" id="chkReqSno">
							</td>
						</tr>
						<tr>
							<th align='center'>점검요청내용</th>
							<td>
							  <input type="text" class="input" value="" id="chkReqCtnt"  readonly style="font-size:12px; font-weight: 600;">
							</td>
							<td style="padding-right: 3px;" aligh="right">
								<button type="button" class="bt bg secondary fr" id="insertChkRslt" onlick>점검결과등록</button>
							</td>
						</tr>						
					</tbody>
				</table>
				<!-- GRID2 -->
				<div class="tui-grid"  style="height:95%;">
					<div id="grid2"></div>
				</div>
			</div>
			
		</div><!--//result-->

	</div><!--//pageBody-->

</section>

<!-- [팝업] 자산상세-->
<article class="popup hide" id="asetDtlPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 id="popTitle" class="popTitle">자산상세</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody cols">

			<div class="panel fix">
				<table class="field">
					<colgroup>
						<col width="80px">
						<col width="400px">
					</colgroup>
				<tbody>
					<tr hidden="true">
						<th>자산ID</th>
						<td><input type="text" class="input" value="" id="asetId" ></td>
					</tr>
					<tr>
						<th>자산명</th>
						<td><input type="text" class="input" value="" id="asetNm" readonly></td>
					</tr>
					<!-- 회사명은 select 박스로 corp 테이블에서 조회해서 보여줘야 함, 한글명만 보여주고 ID는 HIDDEN으로 처리 필요-->
					 
					<tr>
						<th>자산분류</th>
						<td>
							<input id="asetClsfId" hidden="true">
							<input type="text" class="input" value="" id="asetClsfNm" readonly>
						</td>
					</tr> 
					<tr>
						<th>자산상태</th>
						<td>
							<select class="select md" id="asetStusSepCd" readonly>
								<option value="U" selected>사용</option>
								<option value="B">백업</option>
								<option value="L">가용</option>
								<option value="S">창고</option>
								<option value="A">폐기</option>
								<option value="D">데모</option>
							</select>
						</td>
					</tr>
<!-- 					<tr> -->
<!-- 						<th>담당자(정)</th> -->
<!-- 						<td> -->
<!-- 							<input id="chrgEmpId1" hidden="true"> -->
<!-- 							<input type="text" class="input xl" value="" id="chrgEmpNm2" readonly> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th>담당자(부)</th> -->
<!-- 						<td> -->
<!-- 							<input id="chrgEmpId2" hidden="true"> -->
<!-- 							<input type="text" class="input xl" value="" id="chrgEmpNm1" readonly> -->
<!-- 						</td> -->
<!-- 					</tr> -->
					<tr>
						<th>보안등급</th>
						<td>
							<select class="select md" id="scrtRatCd" readonly>
								<option value="0" selected>없음</option>
								<option value="1">1등급</option>
								<option value="2">2등급</option>
								<option value="3">3등급</option>
								<option value="4">4등급</option>
								<option value="5">5등급</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>제조회사</th>
						<td><input type="text" class="input" value="" id="muftCorpNm" readonly></td>
					</tr>
					<tr>
						<th>자산모델</th>
						<td><input type="text" class="input" value="" id="asetMdlNm" readonly></td>
					</tr>
					<tr>
						<th>설치장소</th>
						<td><input type="text" class="input" value="" id="instlPlce" readonly></td>
					</tr>
					<tr>
						<th>용도</th>
						<td><input type="text" class="input" value="" id="prpsDesc" readonly></td>
					</tr>
				</tbody>
			</table>

		</div><!--//panel-->

			<div class="panel fix">
				<table class="field">
					<colgroup>
						<col width="100px">
						<col width="*">
					</colgroup>
					<tbody>
					<tr>
						<th>CPU</th>
						<td><input type="text" class="input" value="" id="cpuSpd" readonly></td>
					</tr>
					<tr>
						<th>MEMORY</th>
						<td><input type="text" class="input" value="" id="memoryVol" readonly></td>
					</tr> 
					<tr>
						<th>HDD</th>
						<td><input type="text" class="input" value="" id="hddVol" readonly></td>
					</tr>
					<tr>
						<th>OS</th>
						<td><input type="text" class="input" value="" id="osVer" readonly></td>
					</tr>
					<tr>
						<th>IP</th>
						<td><input type="text" class="input" value="" id="ipAddr" readonly></td>
					</tr>
					<tr>
						<th>도입일자</th>
						<td><input id="intdDt" type="text" class="input date" placeholder="도입일" readonly></td>
					</tr>
					<tr>
						<th>도입비용</th>
						<td><input type="text" class="input" value="" id="intdCost" text-align="right" readonly></td>
					</tr>
					<tr>
						<th>비고</th>
						<td><input type="textarea" class="input" value="" id="note" readonly></td>
					</tr>
				</tbody>
			</table>

		</div><!--//panel-->
      </div>
	</div>
</article>	

<!-- [팝업] 결재 승인/반려 popup -->
<article class="popup hide" id="apvlPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">결재처리</h5>
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
						<th>점검요청일련번호</th>
						<td><input type="text" class="input" value="" id="popChkReqSno"></td>
					</tr>
					<tr>
						<th>결재자번호</th>
						<td><input type="text" class="input" value="" id="popApvlPrcSeqno"></td>
					</tr>
					<tr>
						<th>결재구분</th>
						<td>
							<span class="check"><input id="F" type="radio" name="popApvlPrcSepCd" value="F" ><label>승인</label></span>
							<span class="check"><input id="C" type="radio" name="popApvlPrcSepCd" value="C" ><label>반려</label></span>
						</td>
					</tr>
					<tr>
						<th>전달내용</th>
						<td><input type="text" class="textarea" value="" id="popSendCtnt"></td>
					</tr>
				</tbody>
			</table>

		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary" id="btnSave">저장</button>
				<button type="button" class="bt max bd btClose" id="btnCancleAndClose">취소</button>
			</div>
		</div>

	</div>
</article>

<!-- [팝업] 점검결과등록화면 -->
<article class="popup hide" id="chkRstlFormListPopup" >
	<div class="popBox" >

		<div class="conHead">
			<h5 class="popTitle" id="chkRstlTitle">점검결과등록</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody">
			  <input type="hidden" value="" id="rsltAsetId">
			  <input type="hidden" value="" id="rsltchkReqSno">
			<table class="field">
				<colgroup>
					<col width="90px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>자산명</th>
						<td colspan="3">
						  <input type="text" class="input" value="" id="rsltAsetNm" style ="width: 675px;" readonly>
						</td>
					</tr>
					<tr>
						<th>점검양식</th>
						<td><select class="select md" id="selectChkFormId"></select></td>
						<th>점검일자</th>
						<td><input id="rsltChkDt" type="text" class="input date" placeholder="점검일자" readonly> </td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td id="fileInitY">
							<form id="chkFiles" action="api/chk/fileUpload" method="post" enctype="multipart/form-data" target="chkFiles">
						    	<p><input type="file" class="custom-file-input" id="secSignFile" name="uploadFileMulti"></p>
						    </form>
						</td>
						<td id="fileInitN" COLSPAN="3">
						    <p><a download class="row" id="downFileUp" style="color:blue;"></a><button class="fiClose" style="float: right;" id="fileInit1"><i>파일초기화</i></button></p>
						</td>					
					</tr>
				</tbody>
			</table>
			
			<div class="tui-grid" id="formGrid" style="width:810px; height:400px ">
				<div id="grid3"></div>
			</div>
		
		</div><!--//result-->
		
		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary" id="btnSaveRslt">저장</button>
				<button type="button" class="bt max bd btClose" id="btnCancleAndClose">취소</button>
			</div>
		</div>

	</div>


</article>	

<iframe id="chkFiles" name="chkFiles" style="display:none"></iframe>

<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/footer" />

<script type="text/javaScript">


$(function(){  // === $(document).ready
	// 초기화
	fnInit();
	
	// 엔터키 검색 시 refresh 되는것 막기
	$('form').submit(function(e){
		fnStopEvent(e);
		e.preventDefault();
	});

	// 자산상세 팝업 호출
 	$(document).on("click","#asetInfo", function(e){	
		 		
 		fnStopEvent(e);
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		var cell = gridObj["grid2"].getFocusedCell();	
 		var asetId = gridObj["grid2"].getValue(cell.rowKey, "aset_id", true); 	
 		 		
 		fnPopupData(asetId);
		$("#asetId").prop("disabled", true);
		// 레이어팝업 보updateEmpPopup
		$('#asetDtlPopup').removeClass('hide');
		
		var asetDtlData = fnNullChangeBlank(gridObj["grid2"].getRow(cell.rowKey));
		console.log("수정할 데이터 >>>>> " + JSON.stringify(asetDtlData));
	});

	// 결재자(부) 팝업 호출
 	$(document).on("click","#apvl_1", function(e){	
		 		
 		fnStopEvent(e);
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		var cell          = gridObj["grid"].getFocusedCell();	
 		var chkReqSno     = gridObj["grid"].getValue(cell.rowKey, "chk_req_sno", true); 
 		var apvlPrcSeqno  = "1"; 
 		var apvlPrcSepCd1 = gridObj["grid"].getValue(cell.rowKey, "apvl_prc_sep_cd_1", true); 	
 		 		 		
 		fnPopupApvlData(chkReqSno,apvlPrcSeqno,apvlPrcSepCd1);

		$("#chkReqSno").prop("disabled", true);
		$("#apvlPrcSeqno").prop("disabled", true);
		$("#apvlPrcSepCd1").prop("disabled", true);
		
		// 레이어팝업 보updateEmpPopup
		$('#apvlPopup').removeClass('hide');
		
		var apvlData = fnNullChangeBlank(gridObj["grid"].getRow(cell.rowKey));
		console.log("수정할 데이터 >>>>> " + JSON.stringify(apvlData));
	});

	// 결재자(정) 팝업 호출
 	$(document).on("click","#apvl_2", function(e){	
		 		
 		fnStopEvent(e);
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		var cell          = gridObj["grid"].getFocusedCell();	
 		var chkReqSno     = gridObj["grid"].getValue(cell.rowKey, "chk_req_sno", true); 
 		var apvlPrcSeqno  = "2"; 
 		var apvlPrcSepCd1 = gridObj["grid"].getValue(cell.rowKey, "apvl_prc_sep_cd_1", true); 	
 		 		
 		fnPopupApvlData(chkReqSno,apvlPrcSeqno,apvlPrcSepCd1);

		$("#chkReqSno").prop("disabled", true);
		$("#apvlPrcSeqno").prop("disabled", true);
		$("#apvlPrcSepCd1").prop("disabled", true);
		
		// 레이어팝업 보updateEmpPopup
		$('#apvlPopup').removeClass('hide');
		
		var apvlData = fnNullChangeBlank(gridObj["grid"].getRow(cell.rowKey));
		console.log("수정할 데이터 >>>>> " + JSON.stringify(apvlData));
	});	

	// 결재처리 수정 팝업에서 저장 버튼 클릭
	$("#btnSave").on("click", function(e){
		fnStopEvent(e);
		console.log("수정-저장 click");
		
		var param = {
				chkReqSno    : $("#popChkReqSno").val()
			  , apvlPrcSeqno : $("#popApvlPrcSeqno").val()
			  , apvlPrcSepCd : $("input:radio[name='popApvlPrcSepCd']:checked").val()
			  , sendCtnt     : $("#popSendCtnt").val()
			  , modEmpId     : loginUserId
		}
		
		console.log(param);
		
		fnAjax("<c:url value='/api/chk/updateChkReqApvl'/>", param, function(data){
			if(successResCode == data.resCode) {
				alert("결재처리가 등록되었습니다.");
				// 리스트 새로고침
				fnList("1");
				$(".btClose").click();
			} else {
				alert("결재처리 수정에 실패했습니다.");
			}
		});
				
	});

	// 업체정보 삭제
	$(document).on("click", ".chkReq-delete", function(e){
		fnStopEvent(e);
		var cell = gridObj["grid"].getFocusedCell();
		console.log("corp-delete cell==>" + cell.rowKey);	
		
		
		var chkReqSno = fnNullChangeBlank(gridObj["grid"].getValue(cell.rowKey, "chk_req_sno"));
		console.log("del chkReqSno ==>" + chkReqSno);	
				
		var param = {
				chkReqSno : chkReqSno
		}
		
		console.log(param);
		
		if (!confirm("정말 삭제하시겠습니까?")) {
	        // 취소(아니오) 버튼 클릭 시 이벤트
			alert("삭제 취소되었습니다.");
	    } else {
	        // 확인(예) 버튼 클릭 시 이벤트
	    	fnAjax("<c:url value='/api/chk/delete'/>", param, function(data){
				if(successResCode == data.resCode) {
					alert("점검요청정보 삭제에 성공했습니다.");
					// 리스트 새로고침
					fnList("1");
				} else {
					alert("점검요청정보 삭제에 실패했습니다.");
				}
			});
	    }
	});
	
	// 검색 조건 입력 후 조회
	$("#btnSearch").on("click", function(e){
		fnStopEvent(e);
		fnList("1");
	});
	
 	// 엔터 키로 검색
    $("#keyword").on("keyup", function(e) {
    	fnStopEvent(e);
    	console.log(e.key);
         if($("#keyword :focus") && e.key == "Enter"){
			$("#btnSearch").click();
        }
    });
	
	// 점검요청등록 화면 이동 이벤트
	$("#moveChkReq").on("click", function(e){
		
		fnPostSend("<c:url value='/view/chk/subChkReq' />", {incidentYn:'Y'});
		
// 		window.location.href="<c:url value='/view/chk/subChkReq' />";
	});

	// 점검결과등록 화면 이동 이벤트
	$("#insertChkRslt").on("click", function(e){
 		fnStopEvent(e);
		var nextParam  = gridObj["grid"].getFocusedCell();
	    var chk_sep_nm = gridObj["grid"].getValue(nextParam.rowKey,"chk_sep_nm", true);
	    
	    if('정기' == chk_sep_nm) {
	    	$('#selectChkFormId').val("1");
	    } else {
	    	$('#selectChkFormId').val("2");
	    }
	    
		// tuigrid에서 체크된 행 가져오기
		var checkedRows = gridObj["grid2"].getCheckedRows();

		// 선택된 행의 개수 확인
		var checkedRowCount = checkedRows.length;

		var firstCheckedRow = {};
		
		// 선택된 행이 2개 이상인 경우 알림 처리
		if (checkedRowCount >= 2) {
		  alert("2개 이상의 행을 선택할 수 없습니다.");
		} else if (checkedRowCount == 1) {
		    firstCheckedRow = checkedRows[0];
		} else {
		  // 선택된 행이 없는 경우 처리
		  alert("점검결과를 작성할 자산을 선택해주세요.");
		}
		
	    let chkReqSno = firstCheckedRow.chk_req_sno;
	    let asetId    = firstCheckedRow.aset_id;
	    let asetNm    = firstCheckedRow.aset_nm.split('<')[0];
	    let chkDt     = firstCheckedRow.chk_dt;
	   	    
	    var currentDate = new Date();
	    var year  = currentDate.getFullYear();
	    var month = ('0' + (currentDate.getMonth() + 1)).slice(-2);
	    var day   = ('0' + currentDate.getDate()).slice(-2);
	    

	    var formattedDate = year + '-' + month + '-' + day;
	    	    
	    if ( chkDt === null ) {
	    	chkDt = formattedDate;
	    };
	    	    	    
		let param = {
			chk_req_sno : chkReqSno,
			aset_id     : asetId,
			aset_nm     : asetNm,
			chk_dt      : chkDt
		};
		
		fnList3(param);

	});
	
	$("#selectChkFormId").on("change", function() {
	    fnList3();
	});
	
	$('.fiClose').click(function(e) {
		$('#fileInitN').hide();
		$('#fileInitY').show();
	});
	
	$("#btnSaveRslt").on("click", function() {
 		  var cell = gridObj["grid3"].getFocusedCell();	
	      gridObj["grid3"].finishEditing(cell.rowKey,"chk_rslt_desc");
		  
		  var gridData = gridObj["grid3"].getData(); // grid3의 데이터를 가져옵니다.
		  
		  var chk_req_sno = $("#rsltchkReqSno").val();
		  var aset_id = $("#rsltAsetId").val();
		  var chk_dt = $("#rsltChkDt").val().replace(/-/g, "");
		  
		  var paramList = [];
		  var loginUser = "${loginInfo.user_id}";

		  for(var idx in gridData) {
			  var item = gridData[idx];
	          var paramMap = {
					    chk_form_id: item.chk_form_id,
					    chk_item_id: item.chk_item_id,
					    chk_req_sno: chk_req_sno,
					    aset_id: aset_id,
					    chk_item_nm: item.chk_item_nm,
					    chk_crtr_desc: item.chk_crtr_desc,
					    chk_rslt_desc: item.chk_rslt_desc,
					    user_id: loginUser
			  };
			  paramList.push(paramMap);
		  }
		  
		  let form = new FormData($("#chkFiles")[0]);
		  
		  form.append("chk_req_sno", chk_req_sno);
		  form.append("aset_id", aset_id);
		  
		  let apiUrl = "/api/chk/fileUpload";
		  $.ajax({
			  url : apiUrl,
			  type : "POST",
			  data : form,
			  dataType: "json",
			  processData: false,
			  contentType: false,
			  enctype : 'multipart/form-data',
			  success: function(result) {
			  	  
			  },
              error: function(xhr, status, error) {
                  // Handle the error response
                  alert("파일 업로드에 실패했습니다.: " + error);
              }
		  });
		  
		  
		  var param = {
				 gridData : JSON.stringify(paramList),
				 chk_req_sno : chk_req_sno,
				 aset_id : aset_id,
				 chk_dt  : chk_dt
		  }
		  
		  fnAjax("<c:url value='/api/chk/insertChkRslt'/>", param, function(data){
		    	if(successResCode == data.resCode) {
					  alert("점검결과가 정상적으로 등록되었습니다.\n결재자에게 결재승인을 요청해주세요.");
					  $(".btClose").click();
					  //우측 그리드 리프레쉬 필요 (2023-06-27)
					  $('#grid2').empty();
					  // 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
			  
			    	  let cell = gridObj["grid"].getFocusedCell();
			
					  let chkReqSno  = gridObj["grid"].getValue(cell.rowKey,"chk_req_sno" , true);
					  let chkReqCtnt = gridObj["grid"].getValue(cell.rowKey,"chk_req_ctnt", true);
			
					  let srchParam = {
						  chkReqSno : chkReqSno
					  };
			
					  $('#chkReqSno').val(chkReqSno);
					  $('#chkReqCtnt').val(chkReqCtnt);
			
					  detailSearch(srchParam);
				} else {
					alert("점검결과등록에 실패하였습니다 관리자에게 문의해주세요.");
				}
		  });
		  
		  console.log(gridData); // 가져온 데이터를 콘솔에 출력하거나 원하는 작업을 수행합니다.
		  
		  
	});
	 
	// 점검항목 내용 그리드
	$(document).on( "click", "#grid .tui-grid-table tbody tr td", function(e) {
		
		$('#grid2').empty();
		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴

		let cell = gridObj["grid"].getFocusedCell();

		let chkReqSno   = gridObj["grid"].getValue(cell.rowKey,"chk_req_sno" , true);
		let chkReqCtnt  = gridObj["grid"].getValue(cell.rowKey,"chk_req_ctnt", true);
		let loginUserId = gridObj["grid"].getValue(cell.rowKey,"login_user_id", true);
		let loginUserGroup = gridObj["grid"].getValue(cell.rowKey,"login_user_group", true);

		let param = {
			chkReqSno   : chkReqSno,
			loginUserId : loginUserId,
			loginUserGroup : loginUserGroup
		};

		$('#chkReqSno').val(chkReqSno);
		$('#loginUserId').val(loginUserId);
		$('#loginUserGroup').val(loginUserGroup);
		$('#chkReqCtnt').val('[요청번호 : ' + chkReqSno + '] ' + chkReqCtnt);

		detailSearch(param);

	});
	
	var grid3Obj = gridObj["grid3"];
	
	$(grid3Obj).on('editingStart', (ev) => {
		  const columnName = ev.columnName;
		  if (columnName === 'description') {
		    const editor = ev.editor;
		    editor.setValue(ev.value);
		    editor.on('change', (event) => {
		      editor.setValue(event.target.value);
		    });
		  }
	});
});

	/**********************************************************
	 * 초기화
	 **********************************************************/
	function fnInit() {

		// 메뉴 초기화
		fnInitGnbLnb(3, 1, 3, 1);
		
		// 그리드 초기화
		fnInitGrid();
		fnInitGrid2();
		makeSelect();
		
		//공통
		fnCommon();

		// 리스트 조회
		fnList("1");
// 		fnList2("1");

		// 팝업화면 초기화
		//fnInitPopup();
	}

	/**********************************************************
	 * 초기화(그리드)
	 **********************************************************/
	function fnInitGrid() {

		// 그리드 컴럼 정보
		var columnsData = [ {
			header : '방문예정일',
			name : 'vist_plan_dt',
			align : 'center',
			width : 80, 
			sortable: true
		}, {
			header : '점검구분',
			name : 'chk_sep_nm',
			align : 'center',
			width : 60
		}, {
			header : '점검요청내용',
			name : 'chk_req_ctnt'
		}, {
			header : '점검지원',
			name : 'chk_sprt_type_nm',
			align : 'center',
			width : 60
		}, {
			header : '계약일련번호',
			name : 'mntc_ctrt_sno',
			align : 'center',
			width : 80, 
			sortable: true,
			hidden : true
		}, {
			header : '요청번호',
			name : 'chk_req_sno',
			align : 'center',
			width : 60, 
			sortable: true
		}, {
			header : '요청일',
			name : 'req_dt',
			align : 'center',
			width : 80, 
			sortable: true
		}, {
			header : '요청자', 
			name : 'req_emp_nm',
			align : 'center',
			width : 100
		}, {
			header : '결재자(부)',
			name : 'apvl1_emp_nm',
			width : 100,
			hidden : true
		}, {
			header : '결재자(부)_결재상태',
			name : 'apvl_prc_sep_cd_1',
			width : 100,
			hidden : true
		}, {
			header : '결재자(정)',
			name : 'apvl2_emp_nm',
			width : 100,
			hidden : true
		}, {
			header : '결재자(정)_결재상태',
			name : 'apvl_prc_sep_cd_2',
			width : 150,
			hidden : true
		}, {
			header : '결재상태',
			name : 'apvl_prc_sep_nm',
			align : 'center',
			width : 80,
			hidden : true
		}, {
			header : '변경',
			name : 'btn_upd_del',
			align : 'center',
			width : 80
		}, {
			header : 'chk_req_sno',
			name : 'chk_req_sno',
			hidden : true
		}, {
			header : 'login_user_id',
			name : 'login_user_id',
			hidden : true
		}, {
			header : 'login_user_group',
			name : 'login_user_group',
			hidden : true
		}, {
			header : 'reg_emp_id',
			name : 'reg_emp_id',
			hidden : true
		} ];

		// 그리드 생성
		fnDrawGrid("03", "grid", columnsData);
	}
	function makeSelect() {
	    var output = [];

	    fnAjax("<c:url value='/api/chk/chkRstlFormList'/>", {}, function(data){
	        if(successResCode == data.resCode) {
	            var selectChkRsltFormOption  = data.selectChkRsltFormOption;

	            for(var idx in selectChkRsltFormOption) {
	                var chkRstlFormMap = {
	                    cd: selectChkRsltFormOption[idx].chk_form_id,
	                    nm: selectChkRsltFormOption[idx].chk_form_nm
	                };

	                output.push('<option value="' + chkRstlFormMap.cd + '">' + chkRstlFormMap.nm + '</option>');
	            }

	            $("#selectChkFormId").html(output.join(''));
	            
	        } else {
	            alert('점검양식을 먼저 등록해주세요.');
	            $("#selectChkFormId").empty();
	        }
	    });
	}
	/**********************************************************
	 * 초기화(그리드)
	 **********************************************************/
	function fnInitGrid2() {

		// 그리드 컴럼 정보
		var columnsData = [ {
			header : '자산명',
			name : 'aset_nm',
			width : 180
		}, {
			header : '유지보수업체',
			name : 'mntc_corp_ko_nm',
			align : 'center',
			width : 100
		}, {
			header : '유지보수담당자',
			name : 'mntc_emp_nm',
			align : 'center',
			width : 100
		}, {
			header : '점검일',
			name : 'chk_dt',
			align : 'center',
			width : 80
		}, {
			header : '결과등록',
			name : 'rslt_reg_yn',
			align : 'center',
			width : 70
		}, {
			header : '파일등록',
			name : 'file_reg_yn',
			align : 'center',
			width : 70
		}, {
			header : '결재자(부)',
			name : 'apvl_emp_nm_1',
			align : 'center',
			width : 80
		}, {
			header : '결재자(정)',
			name : 'apvl_emp_nm_2',
			align : 'center',
			width : 80
		}, {
			header : '최종승인일',
			name : 'cmpl_dt',
			align : 'center',
			width : 80
		}, {
			header : 'chk_req_sno',
			name : 'chk_req_sno',
			hidden : true
		}, {
			header : 'aset_id',
			name : 'aset_id',
			hidden : true
		} ];

		// 그리드 생성
		fnDrawGrid("05", "grid2", columnsData);
	}

	/**********************************************************
	 * 리스트(그리드) 조회
	 **********************************************************/
	function fnList(slcPageNo) {


		var params = {
			searchType  : $("#searchType option:selected").val(),
			searchStr   : $("#searchStr").val(),
			loginUserId : loginUserId,
			loginUserGroup : loginUserGroup
			
		};

		// GRID 리스트 조회
		fnAjax("<c:url value='/api/chk/chkReqInfo'/>", params, function(data) {
			
			if (successResCode == data.resCode) {
				// RESET DATA(그리드)
				gridObj["grid"].resetData(data.chkReqInfo);

			} else {
				// 경고메세지
				alert('조회에 실패했습니다.');
			}
		});
	}

	/**********************************************************
	 * 리스트(그리드) 조회
	 **********************************************************/
	function fnList2(slcPageNo) {
		
		var params = {
			searchType  : $("#searchType option:selected").val(),
			searchStr   : $("#searchStr").val(),
			loginUserId : loginUserId,
			loginUserGroup : loginUserGroup
		};
		

		// GRID 리스트 조회
		fnAjax("<c:url value='/api/chk/chkStatList'/>", params, function(data) {

			if (successResCode == data.resCode) {
				// RESET DATA(그리드)
				gridObj["grid2"].resetData(data.ChkStatList);

			} else {
				// 경고메세지
				fnWarnMsg('조회에 실패했습니다.');
			}
		});
	}

	/**********************************************************
	 * 점검결과등록 조회
	 **********************************************************/
	function fnList3(param) {
		
		$('#grid3').empty();
		
		fnInitGrid3();
		$('#chkRstlFormListPopup').removeClass('hide');
		
		if(param) {
			$("#rsltchkReqSno").val(param.chk_req_sno);
			$("#rsltAsetId").val(param.aset_id);
			$("#rsltAsetNm").val(param.aset_nm);
			$("#rsltChkDt").val(param.chk_dt);
		}
		
		var params =  {
				chkFormId     : $("#selectChkFormId").val(),
				rsltchkReqSno : $("#rsltchkReqSno").val(),
				rsltAsetId    : $("#rsltAsetId").val()
		}
		
    	fnAjax("<c:url value='/api/chk/chkRstlFormList'/>", params, function(data){
			if(successResCode == data.resCode) {
				
				gridObj["grid3"].resetData(data.chkRstlFormList);
				
				$('#downFileUp').text('');
				$('#downFileUp').prop('name', '');
				$('#downFileUp').removeClass('downFiles');
				$('#downFileUp').prop('href', '');
				
				if(data.ChkRsltFiles.length < 1) {
					$('#fileInitN').hide();
					$('#fileInitY').show();
				} else {
					$('#fileInitN').show();
					$('#fileInitY').hide();
					var fileName = data.ChkRsltFiles[0].apnd_file_nm.split('^');
					$('#downFileUp').text(fileName[1]);
					
					$('#downFileUp').prop('name', data.ChkRsltFiles[0].apnd_file_trg_id + '-' + data.ChkRsltFiles[0].apnd_file_sno)
					$('#downFileUp').addClass('downFiles');
					
					var filePath = '../../uploadFiles/C/' + data.ChkRsltFiles[0].apnd_file_nm;
					
					$('#downFileUp').prop('href', filePath);
				}
				
				
			} else {
				alert("양식 조회에 실패했습니다.");
			}
		});
	}
	
	/**********************************************************
	 * 자산관리 수정 데이터 조회
	 **********************************************************/
	function fnPopupData(asetId) {

		var param = {
			asetId : asetId
		};

		$("#asetStusSepCd").prop("disabled", true);
		$("#scrtRatCd").prop("disabled", true);
		$("#intdDt").prop("disabled", true);

		fnAjax("<c:url value='/api/aset/asetInfo'/>", param, function(data) {
			if (successResCode == data.resCode) {

				$("#asetId").val(data.info.aset_id);
				$("#asetNm").val(data.info.aset_nm);
				$("#asetClsfId").val(data.info.aset_clsf_id);
				$("#stusSepCd").val(data.info.stus_sep_cd);
				$("#asetStusSepCd").val(data.info.aset_stus_sep_cd);
				$("#chrgEmpId1").val(data.info.chrg_emp_id1);
				$("#chrgEmpId2").val(data.info.chrg_emp_id2);
				$("#scrtRatCd").val(data.info.scrt_rat_cd);
				$("#muftCorpNm").val(data.info.muft_corp_nm);
				$("#asetMdlNm").val(data.info.aset_mdl_nm);
				$("#cpuSpd").val(data.info.cpu_spd);
				$("#memoryVol").val(data.info.memory_vol);
				$("#hddVol").val(data.info.hdd_vol);
				$("#osVer").val(data.info.os_ver);
				$("#ipAddr").val(data.info.ip_addr);
				$("#intdDt").val(data.info.intd_dt);
				$("#instlPlce").val(data.info.instl_plce);
				$("#intdCost").val(data.info.intd_cost);
				$("#prpsDesc").val(data.info.prps_desc);
				$("#note").val(data.info.note);
				$('#regEmpId').val(loginUserId);
			} else {
				alert("자산정보 조회에 실패했습니다.");
			}
		});
	}

	/**********************************************************
	 * 자산관리 수정 데이터 조회
	 **********************************************************/
	function fnPopupApvlData(chkReqSno, apvlPrcSeqno, apvlPrcSepCd) {

		var param = {
			chkReqSno : chkReqSno,
			apvlPrcSeqno : apvlPrcSeqno,
			apvlPrcSepCd : apvlPrcSepCd
		};

		fnAjax("<c:url value='/api/chk/chkApvlInfo'/>", param, function(data) {
			if (successResCode == data.resCode) {

				$("#popChkReqSno").val(data.info.chk_req_sno);
				$("#popApvlPrcSeqno").val(data.info.apvl_prc_seqno);

				if (data.info.apvl_prc_sep_cd != null
						|| data.info.apvl_prc_sep_cd != "") {
					$("input:radio[name='popApvlPrcSepCd']").filter(':checked')
							.prop('checked', false);
					$("input:radio[name='popApvlPrcSepCd']").filter(
							'#' + data.info.apvl_prc_sep_cd).prop('checked',
							true);
				}
				$("#popSendCtnt").val(data.info.send_ctnt);
			} else {
				alert("결재처리정보 조회에 실패했습니다.");
			}
		});
	}

	function detailSearch(param) {

		/**********************************************************
		 * 초기화(그리드)
		 **********************************************************/
		function fnInitGrid2() {

			// 코드 상세 리스트 조회
			fnList2("1");

			// 그리드 컴럼 정보
			var columnsData = [ {
				header : '자산명',
				name : 'aset_nm',
				width : 180
			}, {
				header : '유지보수업체',
				name : 'mntc_corp_ko_nm',
				align : 'center',
				width : 100
			}, {
				header : '유지보수담당자',
				name : 'mntc_emp_nm',
				align : 'center',
				width : 100
			}, {
				header : '점검일',
				name : 'chk_dt',
				align : 'center',
				width : 80
			}, {
				header : '결과등록',
				name : 'rslt_reg_yn',
				align : 'center',
				width : 70
			}, {
				header : '파일등록',
				name : 'file_reg_yn',
				align : 'center',
				width : 70
			}, {
				header : '결재자(부)',
				name : 'apvl_emp_nm_1',
				align : 'center',
				width : 80
			}, {
				header : '결재자(정)',
				name : 'apvl_emp_nm_2',
				align : 'center',
				width : 80
			}, {
				header : '최종승인일',
				name : 'cmpl_dt',
				align : 'center',
				width : 80
			}, {
				header : 'chk_req_sno',
				name : 'chk_req_sno',
				hidden : true
			} ];

			// 그리드 생성
			fnDrawGrid("05", "grid2", columnsData);

			/**********************************************************
			 * 리스트(그리드) 조회
			 **********************************************************/
			function fnList2(slcPageNo) {


				var params = {
					searchType  : $("#searchType option:selected").val(),
					searchStr   : $("#searchStr").val(),
					chkReqSno   : param.chkReqSno,
					loginUserId : param.loginUserId,
					loginUserGroup : param.loginUserGroup
				};


// 				params.chkReqSno   = param.chkReqSno;
				
				// GRID 리스트 조회
				fnAjax("<c:url value='/api/chk/chkStatList'/>", params,
						function(data) {

							if (successResCode == data.resCode) {
								// RESET DATA(그리드)
								gridObj["grid2"].resetData(data.chkStatList);

							} else {
								// 경고메세지
								fnWarnMsg('조회에 실패했습니다.');
							}
						});
			}
		}
		fnInitGrid2();
	}

	/**********************************************************
	 * 초기화(그리드)
	 **********************************************************/
	function fnInitGrid3() {

		  // 그리드 컬럼 정보
		  var columnsData = [
	    	{
		      header: 'No.',
		      name: 'rnum',
		      align:'center',
		      width: 40,
		      visiable: true
		    },
			{
		      header: '점검기준 및 방식',
		      name: 'chk_item_nm',
		      width: 250
		    },
		    {
		      header: '점검내용',
		      name: 'chk_crtr_desc',
		      width: 300
		    },
		    {
		      header: '점검결과',
		      name: 'chk_rslt_desc',
// 		      editor: 'text', // 텍스트 편집기 사용
	          whiteSpace: 'pre-line',
	          editor: {
	              type: CustomTextEditor,
	            },
		      width: 200
		    },
		    {
		      header: 'chk_form_id',
		      name: 'chk_form_id',
		      hidden: true
		    },
		    {
		      header: 'chk_item_id',
		      name: 'chk_item_id',
		      hidden: true
		    }
		  ];

		// 그리드 생성
		fnDrawGrid("02", "grid3", columnsData);
	}
	
	function getCurrentDate() {
		  var today = new Date();
		  var year = today.getFullYear();
		  var month = (today.getMonth() + 1).toString().padStart(2, '0');
		  var day = today.getDate().toString().padStart(2, '0');
		  
		  var currentDate = year + month + day;
		  return currentDate;
	}
	
   class CustomTextEditor {
	      constructor(props) {
	        const el = document.createElement('textarea');

// 	        el.type = 'text';
			if(props.value) {
		        el.value = String(props.value);
			}

	        this.el = el;
	      }

	      getElement() {
	        return this.el;
	      }

	      getValue() {
	        return this.el.value;
	      }

	      mounted() {
	        this.el.select();
	      }
	    }
	
</script>