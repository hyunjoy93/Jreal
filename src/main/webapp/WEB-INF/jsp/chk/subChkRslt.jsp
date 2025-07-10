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
			<li>점검결과</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">점검결과</h2>
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
										<option value="asetNm">자산명</option>
										<option value="mntcCorpKoNm">유지보수업체</option>
										<option value="mntcEmpNm">유지보수담당자</option>
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
				
		<div class="result">

			<div class="control">

				<div class="btns">
					<button type="button" class="bt bg secondary" id="rsltReport">보고서출력</button>
				</div>
				
			</div><!--//control-->
			
			<!-- GRID -->
			<div class="tui-grid"  style="height:95%;">
				<div id="grid"></div>
			</div>
			
		</div><!--//result-->

	</div><!--//pageBody-->

</section>

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
						<th>자산ID</th>
						<td><input type="text" class="input" value="" id="popAsetId"></td>
					</tr>
					<tr>
						<th>결재자ID</th>
						<td><input type="text" class="input" value="" id="popApvlEmpId"></td>
					</tr>
					<tr>
						<th>결재자명</th>
						<td><input type="text" class="input" value="" id="popApvlEmpNm"></td>
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
						<td><textarea class="textarea" id="popSendCtnt" ></textarea></td>
					</tr>
					<tr hidden="true">
						<th>결재순번</th>
						<td><input type="text" class="input" value="" id="popApvlPrcSeqno"></td>
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

<!-- [팝업] 전달내용 확인 popup -->
<article class="popup hide" id="notiCntnPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">전달내용확인</h5>
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
						<th id="popNotiApvlEmpNmTh">결재자</th>
						<td id="popNotiApvlEmpNm"></td>
					</tr>
					<tr>
						<th>전달내용</th>
						<td><textarea class="textarea" id="popNotiSendCtnt" readonly></textarea></td>
					</tr>
					<tr hidden="true">
						<th>결재순번</th>
						<td><input type="text" class="input" value="" id="popNotiApvlPrcSeqno"></td>
					</tr>
				</tbody>
			</table>

		</div><!--//conBody-->
	</div>
</article>

<!-- [팝업] 점검결과보고서 출력 -->
<article class="popup hide" id="chkRstlReportPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle" id="chkRstlTitle">점검결과보고서</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody" id="reportArea">
			<input type="hidden" value="" id="rsltAsetId">
			<input type="hidden" value="" id="rsltchkReqSno">
			<div id ="tossField">
			<table class="field">
				<colgroup>
					<col width="100px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>1. 수요기관</th>
						<td>
						  <input type="text" id="agency" class="input" value="" style ="width: 280px;">
						</td>
						<th>2. 사 업 명</th>
						<td>
						  <input type="text" id="project" class="input" value="" style ="width: 280px;">
						</td>
					</tr>
					<tr>
						<th>3. 주사업자</th>
						<td>
						  <input type="text" id="contractor" class="input" value="" style ="width: 280px;">
						</td>
						<th>4. 제 출 일</th>
						<td>
						  <input type="text" id="submissionDate" class="input date" value="" style ="width: 280px;">
						</td>
					</tr>
					<tr>
						<th>5. 점검결과</th>
						<td>
						  <input type="text" id="chkResult" class="input" value="" style ="width: 280px;">
						</td>
						<th>6. 특이사항</th>
						<td>
						  <input type="text" id="chkMemo" class="input" value="" style ="width: 280px;">
						</td>
					</tr>
					<tr>
						<th>7. 첨부파일</th>
						<td id="fileInit" COLSPAN=3>
						    <p><a download class="row" id="downFileUp" style="color:blue;"></a></p>
						</td>					
					</tr>
				</tbody>
			</table>
			<table class="field">
				<colgroup>
					<col width="100px">
					<col width="200px">
					<col width="150px">
					<col width="150px">
				</colgroup>
				<tbody>
					<tr>
						<th style="text-align:center">점검일</th>
						<th style="text-align:center">자산명</th>
						<th style="text-align:center">점검자</th>
						<th style="text-align:center">결재자</th>
					</tr>
					<tr>
						<td id="chkDay"    style="text-align:center"></td>
						<td id="asetNm"    style="text-align:center"></td>
						<td id="chkEmp"    style="text-align:center"></td>
						<td id="assignEmp" style="text-align:center;width:100px"></td>
					</tr>
<!-- 					<tr> -->
<!-- 						<th style="text-align:center">점검결과</th> -->
<!-- 						<td><input type="text" id="chkResult" class="input xl"></td> -->
<!-- 						<th style="text-align:center">특이사항</th> -->
<!-- 						<td><input type="text" id="chkMemo"   class="input xl"></td> -->
<!-- 					</tr> -->
				</tbody>
			</table>
			</div>
			<div class="tui-grid" id="formGrid" style="width:860px; height: 350px;">
				<div id="grid2"></div>
			</div>
		
		</div><!--//result-->
		
		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary" id="btnPrintRslt">인쇄하기</button>
				<button type="button" class="bt max bd btClose" id="btnPrintClose">취소</button>
			</div>
		</div>

	</div>


</article>	

<!-- [팝업] 점검결과보고서 출력 -->
<article class="popup" id="reportPopup" style="height: 3200px; display: none;">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle" id="chkRstlTitle">점검결과보고서</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody" id="printArea">
		
		</div><!--//result-->
			<table class="field" id="reportTable" style="margin-top:15px;">
				<colgroup>
					<col width="60px">
					<col width="200px">
					<col width="300px">
					<col width="350px">
				</colgroup>
				<thead>
				</thead>
					<tr>
						<th style="text-align:center">No.</th>
						<th style="text-align:center">점검기준 및 방식</th>
						<th style="text-align:center">점검내용</th>
						<th style="text-align:center">점검결과</th>
					</tr>
				<tbody id="tbodyP">
				</tbody>
			</table>
	</div>


</article>	
	
<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/footer" />

<script type="text/javaScript">


$(function(){  // === $(document).ready
	// 초기화
	fnInit();
	var printData = [];
	// 엔터키 검색 시 refresh 되는것 막기
	$('form').submit(function(e){
		fnStopEvent(e);
		e.preventDefault();
	});

	// 결재자(부) 팝업 호출
 	$(document).on("click","#apvl_1", function(e){
 		fnStopEvent(e);
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		var cell          = gridObj["grid"].getFocusedCell();	
 		var chkReqSno     = gridObj["grid"].getValue(cell.rowKey, "chk_req_sno", true); 
 		var asetId        = gridObj["grid"].getValue(cell.rowKey, "aset_id", true); 
 		var apvlEmpId     = gridObj["grid"].getValue(cell.rowKey, "apvl_emp_id_1", true); 
 		var apvlEmpNm     = gridObj["grid"].getValue(cell.rowKey, "apvl_emp_nm_1", true); 
 		var apvlPrcSepCd  = gridObj["grid"].getValue(cell.rowKey, "apvl_prc_sep_cd_1", true);  
 		var sendCtnt      = gridObj["grid"].getValue(cell.rowKey, "send_ctnt_1", true); 
 		var apvlPrcSeqno  = "1"; 	
  		
 		if(loginUserId != apvlEmpId) {
 			alert('지정된 결재자만 결재 가능합니다.');
 			return;
 		}
 		fnPopupApvlData1(chkReqSno,asetId,apvlEmpId,apvlPrcSeqno);
 		
		$("#chkReqSno").prop("disabled", true);
		$("#chkReqAset").prop("disabled", true);
		$("#apvlPrcSepCd").prop("disabled", true);
		
		// 레이어팝업 
		$('#apvlPopup').removeClass('hide');
		
		var apvlData = fnNullChangeBlank(gridObj["grid"].getRow(cell.rowKey));
		console.log("수정할 데이터 >>>>> " + JSON.stringify(apvlData));
	});

	// 결재자(부) 전달내용 팝업 호출
 	$(document).on("click","#notiCntn", function(e){
 		fnStopEvent(e);
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		var cell          = gridObj["grid"].getFocusedCell();	
 		var chkReqSno     = gridObj["grid"].getValue(cell.rowKey, "chk_req_sno", true); 
 		var asetId        = gridObj["grid"].getValue(cell.rowKey, "aset_id", true); 
 		var apvlEmpId     = gridObj["grid"].getValue(cell.rowKey, "apvl_emp_id_1", true); 
 		var apvlEmpNm     = gridObj["grid"].getValue(cell.rowKey, "apvl_emp_nm_1", true); 
 		var apvlPrcSepCd  = gridObj["grid"].getValue(cell.rowKey, "apvl_prc_sep_cd_1", true);  
 		var sendCtnt      = gridObj["grid"].getValue(cell.rowKey, "send_ctnt_1", true); 
 		var apvlPrcSeqno  = "1"; 	
  		
 		var param = { chkReqSno    : chkReqSno , 
			      asetId       : asetId , 
			      apvlEmpId    : apvlEmpId ,
			      apvlPrcSeqno : apvlPrcSeqno  };
		
		fnAjax("<c:url value='/api/chk/chkApvlInfo'/>", param, function(data){
			if(successResCode == data.resCode) {
				$("#popNotiApvlEmpNmTh").text('결재자(부)'); 
				$("#popNotiApvlEmpNm").text(data.info.apvl_emp_nm_1); 
				$("#popNotiSendCtnt").val(data.info.send_ctnt_1); 
				$("#popApvlPrcSeqno").val(apvlPrcSeqno); 
			} else {
				alert("전달내용정보 조회에 실패했습니다.");
			}
		});
 		
		// 레이어팝업 
		$('#notiCntnPopup').removeClass('hide');
	});

	// 결재자(정) 팝업 호출
 	$(document).on("click","#apvl_2", function(e){	
		 		
 		fnStopEvent(e);
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		var cell          = gridObj["grid"].getFocusedCell();	
 		var chkReqSno     = gridObj["grid"].getValue(cell.rowKey, "chk_req_sno", true);  
 		var asetId        = gridObj["grid"].getValue(cell.rowKey, "aset_id", true); 
 		var apvlEmpId     = gridObj["grid"].getValue(cell.rowKey, "apvl_emp_id_2", true);
 		var apvlEmpNm     = gridObj["grid"].getValue(cell.rowKey, "apvl_emp_nm_2", true); 
 		var chkapvlEmpNm  = gridObj["grid"].getValue(cell.rowKey, "apvl1_emp_nm", true); 
 		var apvlPrcSepCd  = gridObj["grid"].getValue(cell.rowKey, "apvl_prc_sep_cd_2", true); 
 		var sendCtnt      = gridObj["grid"].getValue(cell.rowKey, "send_ctnt_2", true); 
 		var apvlPrcSeqno  = "2"; 	
 		
 		if(loginUserId != apvlEmpId) {
 			alert('지정된 결재자만 결재 가능합니다.');
 			return;
 		} else if (!chkapvlEmpNm.includes('승인')) {
 			alert('결재자(부)가 결재 후 결재 가능합니다. 결재자(부)에게 결재를 요청해주세요.');
 			return;
 		}
 		fnPopupApvlData2(chkReqSno,asetId,apvlEmpId,apvlPrcSeqno);

		$("#chkReqSno").prop("disabled", true);
		$("#asetId").prop("disabled", true);
		$("#apvlEmpId").prop("disabled", true);
		
		// 레이어팝업 
		$('#apvlPopup').removeClass('hide');
		
		var apvlData = fnNullChangeBlank(gridObj["grid"].getRow(cell.rowKey));
		console.log("수정할 데이터 >>>>> " + JSON.stringify(apvlData));
	});	

	// 결재자(정) 전달내용 팝업 호출
 	$(document).on("click","#notiCntn2", function(e){
 		fnStopEvent(e);
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		var cell          = gridObj["grid"].getFocusedCell();	
 		var chkReqSno     = gridObj["grid"].getValue(cell.rowKey, "chk_req_sno", true); 
 		var asetId        = gridObj["grid"].getValue(cell.rowKey, "aset_id", true); 
 		var apvlEmpId     = gridObj["grid"].getValue(cell.rowKey, "apvl_emp_id_1", true); 
 		var apvlEmpNm     = gridObj["grid"].getValue(cell.rowKey, "apvl_emp_nm_1", true); 
 		var apvlPrcSepCd  = gridObj["grid"].getValue(cell.rowKey, "apvl_prc_sep_cd_1", true);  
 		var sendCtnt      = gridObj["grid"].getValue(cell.rowKey, "send_ctnt_1", true); 
 		var apvlPrcSeqno  = "1"; 	
  		
 		var param = { chkReqSno    : chkReqSno , 
			      asetId       : asetId , 
			      apvlEmpId    : apvlEmpId ,
			      apvlPrcSeqno : apvlPrcSeqno  };
		
		fnAjax("<c:url value='/api/chk/chkApvlInfo'/>", param, function(data){
			if(successResCode == data.resCode) {
				$("#popNotiApvlEmpNmTh").text('결재자(정)'); 
				$("#popNotiApvlEmpNm").text(data.info.apvl_emp_nm_2); 
				$("#popNotiSendCtnt").val(data.info.send_ctnt_2); 
				$("#popApvlPrcSeqno").val(apvlPrcSeqno); 
			} else {
				alert("전달내용정보 조회에 실패했습니다.");
			}
		});
 		
		// 레이어팝업 
		$('#notiCntnPopup').removeClass('hide');
	});
	// 결재처리 수정 팝업에서 저장 버튼 클릭
	$("#btnSave").on("click", function(e){
		fnStopEvent(e);
		console.log("수정-저장 click");
		
		var param = {
				chkReqSno    : $("#popChkReqSno").val()
			  , asetId       : $("#popAsetId").val()
			  , apvlEmpId    : $("#popApvlEmpId").val()
			  , apvlPrcSepCd : $("input:radio[name='popApvlPrcSepCd']:checked").val()
			  , sendCtnt     : $("#popSendCtnt").val()
			  , modEmpId     : loginUserId
			  , apvlPrcSeqno : $("#popApvlPrcSeqno").val()
		}
		
		if($("input:radio[name='popApvlPrcSepCd']:checked").val() == "" || $("input:radio[name='popApvlPrcSepCd']:checked").val() == null || $("input:radio[name='popApvlPrcSepCd']:checked").val() == undefined) {
			alert("결재구분을 선택해주세요");
			return false;
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
	
	$('#rsltReport').on('click', function(e) {
 		fnStopEvent(e);

		// tuigrid에서 체크된 행 가져오기
		var checkedRows = gridObj["grid"].getCheckedRows();

		// 선택된 행의 개수 확인
		var checkedRowCount = checkedRows.length;

		var firstCheckedRow = {};
		
		// 선택된 행이 2개 이상인 경우 알림 처리
		if (checkedRowCount >= 2) {
		  	alert("2개 이상의 행을 선택할 수 없습니다.");
		  	return;
		} else if (checkedRowCount == 1) {
		    firstCheckedRow = checkedRows[0];
		} else {
			// 선택된 행이 없는 경우 처리
			alert("점검결과를 출력할 대상을 선택해주세요.");
			return;
		}
		
		if (firstCheckedRow.cmpl_dt == '' || firstCheckedRow.cmpl_dt == null) {
			alert("점검결과가 등록된 항목만 출력이 가능합니다.\n점검결과를 먼저 등록해주세요.");
			return;
		} else if (!firstCheckedRow.apvl1_emp_nm.includes('결재승인') || !firstCheckedRow.apvl2_emp_nm.includes('결재승인')) {
			alert("정/부 결재담당자 모두 결재승인한 보고서만 출력가능합니다. 결재담당자에게 결재를 요청해주세요.");
			return;
		}
		
	    let chkReqSno = firstCheckedRow.chk_req_sno;
	    let asetId = firstCheckedRow.aset_id;
	    let asetNm = firstCheckedRow.aset_nm;
	    let mntcCorpKoNm = firstCheckedRow.mntc_corp_ko_nm;
	    let mntcEmpNm = firstCheckedRow.mntc_emp_nm;
	    let apvl1EmpNm = firstCheckedRow.apvl1_emp_nm;
	    let apvl2EmpNm = firstCheckedRow.apvl2_emp_nm;
	    let chkDt = firstCheckedRow.chk_dt;
	    
	    var text = '(부)' + apvl1EmpNm + ', (정) ' + apvl2EmpNm;
	    var regex = /\(부\)\s*([^<]+)<button.*?\>,\s*\(정\)\s*([^<]+)/;
	    var matches = regex.exec(text);

	    if (matches) {
	      var part1 = matches[1].trim();
	      var part2 = matches[2].trim();

	      var modifiedText = "(정)" + part2 + ", (부)" + part1;
	      $('#assignEmp').text(modifiedText);
	    }
	    $('#chkDay').text(chkDt);
	    $('#asetNm').text(asetNm);
	    $('#chkEmp').text('[' + mntcCorpKoNm + ']' + mntcEmpNm);
	    $('#chkResult').text('양호');
	    
		let param = {
						chk_req_sno : chkReqSno,
						aset_id     : asetId
		};
		
		fnInitGrid2();
		
    	fnAjax("<c:url value='/api/chk/chkRsltReportList'/>", param, function(data){
			if(successResCode == data.resCode) {
				gridObj["grid2"].resetData(data.chkRstlReportList);
				printData = data.chkRstlReportList;

				if(data.ChkRsltFiles.length > 0) {
					
					$('#downFileUp').text('');
					$('#downFileUp').prop('name', '');
					$('#downFileUp').removeClass('downFiles');
					$('#downFileUp').prop('href', '');
					
					var fileName = data.ChkRsltFiles[0].apnd_file_nm.split('^');
					$('#downFileUp').text(fileName[1]);
					
					$('#downFileUp').prop('name', data.ChkRsltFiles[0].apnd_file_trg_id + '-' + data.ChkRsltFiles[0].apnd_file_sno)
					$('#downFileUp').addClass('downFiles');
					
					var filePath = '../../uploadFiles/C/' + data.ChkRsltFiles[0].apnd_file_nm;
					
					$('#downFileUp').prop('href', filePath);
				}
				
			} else {
				alert("점검결과 조회에 실패했습니다.");
			}
		});
    	
		// 점검보고서팝업
		$('#chkRstlReportPopup').removeClass('hide');
	})
	
	
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

	// 검색 조건 초기화
	$(".btRefresh").on("click", function(e){
		fnStopEvent(e);
		$("#keyword").val("");
		$("#searchType option:eq(0)").prop("selected", true); 
	});

	// 이벤트(페이지사이즈)
	$("#slcPageSize").on("change", function(e){
		fnStopEvent(e);
		fnList("1");
	});
	
	$('input').blur(function(e) {
		$(this).val(this.value)
	})
  // 프린트 버튼 클릭 이벤트 처리
  $("#btnPrintRslt").click(function(e) {
	fnStopEvent(e);
    // 각 입력 필드에서 값 가져와서 출력할 내용에 설정
    $("#chkRstlReportPopup").find('input').each(function() {
      var value = $(this).val();
      $(this).replaceWith('<span>' + value + '</span>');
    });
	
    $('#printArea').append($('#tossField'));
    
    $('td').attr('style', 'width:50%;');
    
    var columnsData = [
      {
        header: '점검기준 및 방식',
        name: 'chk_item_nm',
        width: 200,
        visible: true
      },
      {
        header: '점검내용',
        name: 'chk_crtr_desc',
        width: 300,
        visible: true
      },
      {
        header: '점검결과',
        name: 'chk_rslt_desc',
        width: 300,
        visible: true
      }
    ];
    
    var $tbody = $('#tbodyP');
    var $dataRow;
    for (var i = 0; i < printData.length; i++) {
      $dataRow = $('<tr>');
      $dataRow.append($('<td>').text(i+1).attr('style', 'text-align:center;'));
      for (var j = 0; j < columnsData.length; j++) {
        var $dataCell = $('<td>').text(printData[i][columnsData[j].name]).attr('style', 'font-size:12px;');
        $dataRow.append($dataCell);
      }
      $tbody.append($dataRow);
    }
    $('#reportTable').append($tbody);
    
    // 출력할 내용을 선택합니다.
    var printContent = $("#reportPopup").html();

    // 현재 창에 HTML 내용을 추가합니다.
    $("body").empty().html(printContent);

    // 프린트 실행
    window.print();
	    
    // 페이지 새로고침
    location.reload();
    $(".conFoot").show();
  });

  // 닫기 버튼 클릭 이벤트 처리
  $(".btClose").click(function() {
      $("#chkRstlReportPopup").removeClass("show").addClass("hide");
  });
  
});

/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){
	
	// 메뉴 초기화
	fnInitGnbLnb(3, 3, 3, 3);
	
	// 그리드 초기화
	fnInitGrid();
	
	//공통
	fnCommon();
	
	// 리스트 조회
	fnList("1");
	
	// 팝업화면 초기화
	//fnInitPopup();
}

/**********************************************************
 * 초기화(그리드)
 **********************************************************/
function fnInitGrid(){

	// 그리드 컴럼 정보
	var columnsData = [
			  {header:'요청번호', name:'chk_req_sno', align:'center', width:80}
			, {header:'요청일', name:'req_dt', align:'center', width:80}
			, {header:'요청자', name:'req_emp_nm', align:'center', width:80}
			, {header:'점검구분', name:'chk_sep_nm', align:'center', width:80}
			, {header:'지원유형', name:'chk_sprt_type_nm', align:'center', width:60}
			, {header:'점검요청내용', name:'chk_req_ctnt'}
			, {header:'자산ID', name:'aset_id', width:300, hidden:true}
			, {header:'자산명', name:'aset_nm', width:300}
			, {header:'유지보수업체', name:'mntc_corp_ko_nm', align:'center', width:120}
			, {header:'유지보수담당자', name:'mntc_emp_nm', align:'center', width:100}
			, {header:'방문예정일', name:'vist_plan_dt', align:'center', width:80, hidden:true}
			, {header:'점검일', name:'chk_dt', align:'center', width:80}
			, {header:'완료일', name:'cmpl_dt', align:'center', width:80}
			, {header:'결재자(부)', name:'apvl1_emp_nm', width:200}
// 			, {header:'결재자(부)_결재상태', name:'apvl_prc_sep_cd_1', width:150, hidden:true}
			, {header:'결재자(정)', name:'apvl2_emp_nm', width:200}
// 			, {header:'결재자(정)_결재상태', name:'apvl_prc_sep_cd_2', width:150, hidden:true}
			, {header:'최종결재상태', name:'final_apvl_prc_sep_nm', align:'center', width:80}
			, {header:'emp_id', name:'emp_id', hidden:true}
			, {header:'chk_req_sno', name:'chk_req_sno', hidden:true}
			, {header:'reg_emp_id', name:'reg_emp_id', hidden:true}
	];
	
	// 그리드 생성
	fnDrawGrid("05", "grid", columnsData);
}


/**********************************************************
 * 리스트(그리드) 조회
 **********************************************************/
function fnList(slcPageNo){
	
	var pageSize = $("#slcPageSize").val();
	var pagingYn = "";
	
	if(pageSize == "전체"){
		pagingYn = "N";
		pageSize = "9999999";
	} else {
		pagingYn = "Y";
	}
		
	var params = {
		pageNo : Number(slcPageNo),
		pageNavi : "5",
		pageSize : Number(pageSize),
		pagingYn : pagingYn,
		searchType : $("#searchType option:selected").val(),
		searchStr : $("#searchStr").val(),
		loginUserId : loginUserId,
		loginUserGroup : loginUserGroup
	};
    
	// GRID 리스트 조회
	fnAjax("<c:url value='/api/chk/chkRsltList'/>", params, function(data) {

		if(successResCode == data.resCode){
			
			// RESET DATA(그리드)
			gridObj["grid"].resetData(data.chkRsltList);
			
		}else{
			// 경고메세지
			fnWarnMsg('조회에 실패했습니다.');
		}
	});
}

/**********************************************************
* 자산관리 수정 데이터 조회
**********************************************************/
function fnPopupData(asetId){
	
	var param = { asetId : asetId };

	$("#asetStusSepCd").prop("disabled", true);
	$("#scrtRatCd").prop("disabled", true);
	$("#intdDt").prop("disabled", true);
	
	fnAjax("<c:url value='/api/aset/asetInfo'/>", param, function(data){
		if(successResCode == data.resCode) {

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
			$("#instlPlce").val(data.info.instl_plce) ;      
			$("#intdCost").val(data.info.intd_cost) ;             
			$("#prpsDesc").val(data.info.prps_desc);   
			$("#note").val(data.info.note);               
			$('#regEmpId').val(loginUserId);
		} else {
			alert("자산정보 조회에 실패했습니다.");
		}
	});
}

/**********************************************************
* 결재처리 수정 데이터 조회
**********************************************************/
function fnPopupApvlData1(chkReqSno, asetId, apvlEmpId, apvlPrcSeqno){
	
	var param = { chkReqSno    : chkReqSno , 
			      asetId       : asetId , 
			      apvlEmpId    : apvlEmpId ,
			      apvlPrcSeqno : apvlPrcSeqno  };
	
	fnAjax("<c:url value='/api/chk/chkApvlInfo'/>", param, function(data){
		if(successResCode == data.resCode) {

			$("#popChkReqSno").val(data.info.chk_req_sno); 
			$("#popAsetId").val(data.info.aset_id);
			$("#popApvlEmpId").val(data.info.apvl_emp_id_1);
			$("#popApvlEmpNm").val(data.info.apvl_emp_nm_1);
			 
			if(data.info.apvl_prc_sep_cd_1 != null || data.info.apvl_prc_sep_cd_1 !="") {
				$("input:radio[name='popApvlPrcSepCd']").filter(':checked').prop('checked', false);
				$("input:radio[name='popApvlPrcSepCd']").filter('#'+data.info.apvl_prc_sep_cd_1).prop('checked', true);
			}
			$("#popSendCtnt").val(data.info.send_ctnt_1); 
			$("#popApvlPrcSeqno").val(apvlPrcSeqno); 
		} else {
			alert("결재처리정보 조회에 실패했습니다.");
		}
	});
}


/**********************************************************
* 결재처리 수정 데이터 조회
**********************************************************/
function fnPopupApvlData2(chkReqSno, asetId, apvlEmpId,apvlPrcSeqno){
	
	var param = { chkReqSno    : chkReqSno , 
			      asetId       : asetId , 
			      apvlEmpId    : apvlEmpId ,
			      apvlPrcSeqno : apvlPrcSeqno };
	
	fnAjax("<c:url value='/api/chk/chkApvlInfo'/>", param, function(data){
		if(successResCode == data.resCode) {

			$("#popChkReqSno").val(data.info.chk_req_sno); 
			$("#popAsetId").val(data.info.aset_id);
			$("#popApvlEmpId").val(data.info.apvl_emp_id_2);
			$("#popApvlEmpNm").val(data.info.apvl_emp_nm_2);
			 
			if(data.info.apvl_prc_sep_cd_2 != null || data.info.apvl_prc_sep_cd_2 !="") {
				$("input:radio[name='popApvlPrcSepCd']").filter(':checked').prop('checked', false);
				$("input:radio[name='popApvlPrcSepCd']").filter('#'+data.info.apvl_prc_sep_cd_2).prop('checked', true);
			}
			$("#popSendCtnt").val(data.info.send_ctnt_2); 
			$("#popApvlPrcSeqno").val(apvlPrcSeqno); 
		} else {
			alert("결재처리정보 조회에 실패했습니다.");
		}
	});
}

/**********************************************************
 * 초기화(그리드) - 점검보고서출력
 **********************************************************/
function fnInitGrid2() {

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
	      width: 200,
	      visiable: true
	    },
	    {
	      header: '점검내용',
	      name: 'chk_crtr_desc',
	      width: 300,
	      visiable: true
	    },
	    {
	      header: '점검결과',
	      name: 'chk_rslt_desc',
          whiteSpace: 'pre-line',
	      width: 300,
	      visiable: true
	    }
	  ];

	// 그리드 생성
	fnDrawGrid("02", "grid2", columnsData);
// 	fnDrawGrid("07", "grid3", columnsData, 2000);
}

</script>