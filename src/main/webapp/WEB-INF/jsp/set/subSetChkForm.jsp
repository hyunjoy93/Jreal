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
			<li>환경설정</li>
			<li>점검양식</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">점검양식</h2>
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
										<option value="searchChkFormNm">점검양식명</option>
										<option value="searchPrpsDesc" >점검양식설명</option>
									</select>
									<input type="text" class="input xxl" value="" placeholder="검색어입력" id="searchStr">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				<div class="btns">
					<button type="button" class="bt bg primary" id="btnSearch">검색</button>
					<!-- <button type="button" class="btRefresh" title="초기화">초기화</button> -->
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
						<tr>
							<td style="padding-right: 0;">
								<button type="button" class="bt bg secondary fr" id="insertChkForm">양식추가</button>
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
				<table class="field" >
					<colgroup>
						<col width="100px">
						<col width="*">
					</colgroup>
					<tbody>
						<tr hidden="true">
							<th align='center'>점검양식ID</th>
							<td>
							  <input type="text" class="input" value="" id="chkItemFormId">
							</td>
						</tr>
						<tr>
							<th align='center'>점검양식명</th>
							<td>
							  <input type="text" class="input" value="" id="chkItemFormNm" readonly style="font-size:12px; font-weight: 600;">
							</td>
							<td style="padding-right: 3px;" >
								<button type="button" class="bt bg secondary fr" id="insertChkItem">항목개별추가</button>
								<button type="button" class="bt bg secondary fr"  style="margin-right:4px;" id="insertAllItem">항목일괄추가</button>
								<button type="button" class="bt bg secondary fr" id="downForm">엑셀다운로드</button>
							</td>
						</tr>
						<tr hidden="true">
							<th align='center'>MAX점검ID</th>
							<td>
							  <input type="text" class="input" value="" id="chkItemMax" >
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

<!-- [팝업] 점검양식 추가 -->
<article class="popup hide" id="insertChkFormPopUp">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">양식추가</h5>
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
						<th>점검양식명</th>
						<td><input type="text" class="input xl" value="" id="popChkFormNm"></td>
					</tr>
					<tr>
						<th>점검양식설명</th>
						<td><input type="text" class="textarea" value="" id="popPrpsDesc"></td>
					</tr> 
					<tr>
						<th>사용여부</th>
						<td>
							<select class="select md" id="popItemUseYn">
								<option value="Y" selected>Y</option>
								<option value="N">N</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>

		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary" id="btnFormSave">저장</button>
				<button type="button" class="bt max bd btClose" id="btnFormCancleAndClose">취소</button>
			</div>
		</div>

	</div>
</article>	

<!-- [팝업] 점검양식 수정-->

<article class="popup hide" id="updateChkFormPopUp">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">점검양식수정</h5>
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
					<th>점검양식ID</th>
					<td><input type="text" class="input xl" value="" id="chkFormId"></td>
				  </tr>
				  <tr>
					<th>점검양식명</th>
					<td><input type="text" class="input xl" value="" id="chkFormNm"></td>
				  </tr>
				  <tr>
					<th>점검양식설명</th>
					<td><input type="text" class="textarea" value="" id="prpsDesc"></td>
				  </tr> 
				  <tr>
					<th>사용여부</th>
					<td>
						<select class="select md" id="useYn">
							<option value="Y">Y</option>
							<option value="N">N</option>
						</select>
					</td>
				  </tr>
				</tbody>
			</table>

		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary" id="btnUpdFormSave">저장</button>
				<button type="button" class="bt max bd btClose" id="btnUpdFormCancleAndClose">취소</button>
			</div>
		</div>

	</div>
</article>	



<!-- [팝업] 점검항목 추가 -->
<article class="popup hide" id="insertChkItemPopUp">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">항목개별추가</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody">

			<table class="field">
				<colgroup>
					<col width="100px">
					<col width="*">
				</colgroup> 
				<tbody>
					<tr hidden="true">
						<th>점검양식ID</th>
						<td><input type="text" class="input xl" value="" id="popChkItemFormId" readonly></td>
					</tr>
					<tr>
						<th>점검양식명</th>
						<td><input type="text" class="input xl" value="" id="popChkItemFormNm" readonly></td>
					</tr>
					<tr  hidden="true">
						<th>점검항목ID</th>
						<td><input type="text" class="input" value="" id="popChkItemId"></td>
					</tr> 
					<tr>
						<th>점검항목명</th>
						<td><input type="text" class="input xl" value="" id="popChkItemNm"></td>
					</tr>
					<tr>
						<th>점검항목설명</th>
						<td><input type="text" class="textarea" value="" id="popChkCrtrDesc"></td>
					</tr> 
					<tr>
						<th>사용여부</th>
						<td>
							<select class="select md" id="popItemUseYn">
								<option value="Y" selected>Y</option>
								<option value="N">N</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>

		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary" id="btnInsItemSave">저장</button>
				<button type="button" class="bt max bd btClose" id="btnInsItemCancleAndClose">취소</button>
			</div>
		</div>

	</div>
</article>	



<!-- [팝업] 점검항목 수정-->

<article class="popup hide" id="updateChkItemPopUp">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">점검항목수정</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody">

			<table class="field">
				<colgroup>
					<col width="100px">
					<col width="*">
				</colgroup>
				<tbody>
				  <tr hidden="true">
					<th>점검양식ID</th>
					<td><input type="text" class="input xl" value="" id="chkItemFormId2"></td>
				  </tr>
					<th>점검양식명</th>
					<td><input type="text" class="input xl" value="" id="chkItemFormNm2"></td>
				  </tr>
				  <tr hidden="true">
					<th>점검항목ID</th>
					<td><input type="text" class="input xl" value="" id="chkItemId"></td>
				  </tr> 
				  <tr>
					<th>점검항목명</th>
					<td><input type="text" class="input" value="" id="chkItemNm"></td>
				  </tr> 
				  <tr>
					<th>점검항목설명</th>
					<td><input type="text" class="textarea" value="" id="chkCrtrDesc"></td>
				  </tr>
				  <tr>
					<th>사용여부</th>
					<td>
						<select class="select md" id="itemUseYn">
							<option value="Y">Y</option>
							<option value="N">N</option>
						</select>
					</td>
				  </tr>
				</tbody>
			</table>

		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary" id="updItemSave">저장</button>
				<button type="button" class="bt max bd btClose" id="updItemCancleAndClose">취소</button>
			</div>
		</div>

	</div>
</article>	

<article class="popup hide" id="popFileUpload">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">점검양식일괄추가</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody">
		    <form id="file" method="post" enctype="multipart/form-data">
		        <div class="custom-file">
		            <input type="file" class="custom-file-input" id="file1" name="file">
		        </div>
    		</form>
		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary" id="excelSave">업로드</button>
			</div>
		</div>

	</div>
</article>	
	
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
	
	// 점검양식 추가
	$("#insertChkForm").on("click", function(e){
		fnStopEvent(e);
		$("#popChkFormNm").val("");
		$("#popPrpsDesc").val("");
		$("#popUseYn").val("Y");  
		$('#insertChkFormPopUp').removeClass('hide');	
	});


	// 점검양식 추가 팝업에서 저장 버튼 클릭
	$("#btnFormSave").on("click", function(e){
		
		fnStopEvent(e);
		console.log("팝업-저장 click");
		
		// input data null체크 진행
		if(fnFormPopNullCheck() == false) {
			$("#popChkFormNm").focus();
			return;
		};
		
		var param = {	
				popChkFormNm  : $("#popChkFormNm").val()
			  , popPrpsDesc   : $("#popPrpsDesc").val()
		      , popUseYn      : $("#popItemUseYn").val()
			  , regEmpId      : loginUserId
		}
			
		console.log(param);
			
		fnAjax("<c:url value='/api/set/insertChkForm'/>", param, function(data){
			if(successResCode == data.resCode) {
				alert("점검양식이 추가되었습니다.");
				// 리스트 새로고침
				fnList("1");
				$(".btClose").click();
				/* $("#popEmpId").attr("disabled", false); */
			} else {
				alert("점검양식 추가에 실패했습니다.");
			}
		});		
	});
	

	// 점검양식 수정
	$(document).on("click", ".form-update", function(e){
		 		
		fnStopEvent(e);
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		var cell = gridObj["grid"].getFocusedCell();	
 		var chkFormId = gridObj["grid"].getValue(cell.rowKey, "chk_form_id", true); 		
 		
 		fnPopupDataForm(chkFormId);

		//$("#chkItemFormId").prop("disabled", true);
		//$("#chkItemId").prop("disabled", true);
		//$("#chkItemFormNm2").prop("disabled", true);
		// 레이어팝업 
		$('#updateChkFormPopUp').removeClass('hide');
		
		var updChkFormData = fnNullChangeBlank(gridObj["grid"].getRow(cell.rowKey));
		console.log("수정할 데이터 >>>>> " + JSON.stringify(updChkFormData));
		
	});
	
	// 점검양식 수정 팝업에서 저장 버튼 클릭
	$("#btnUpdFormSave").on("click", function(e){
		fnStopEvent(e);
		console.log("수정-저장 click");
		
		var param = {
				chkFormId : $("#chkFormId").val()
			  , chkFormNm : $("#chkFormNm").val()
			  , prpsDesc  : $("#prpsDesc").val()
			  , useYn     : $("#useYn").val()
			  , regEmpId  : loginUserId
		}
		
		console.log(param);
		
		fnAjax("<c:url value='/api/set/updateChkForm'/>", param, function(data){
			if(successResCode == data.resCode) {
				alert("점검양식이 수정되었습니다.");
				// 리스트 새로고침
				fnList("1");
				$(".btClose").click();
			} else {
				alert("점검양식 수정에 실패했습니다.");
			}
		});
				
	});
	
	// 점검항목 추가
	$("#insertChkItem").on("click", function(e){
				
		fnStopEvent(e);

		chkItemFormId = $("#chkItemFormId").val();
		chkItemFormNm = $("#chkItemFormNm").val();
		chkItemId     = $("#chkItemMax").val();
		
		if ( chkItemFormId == "" ) { 
			alert("점검양식을 선택해 주세요");
			return;
		}
		
		$("#popChkItemFormId").val(chkItemFormId);
		$("#popChkItemFormNm").val(chkItemFormNm);
		$("#popChkItemId").val(chkItemId);
		$("#popChkItemNm").val("");
		$("#popChkCrtrDesc").val("");
		$("#popItemUseYn").val("Y");  
		$('#insertChkItemPopUp').removeClass('hide');	
	});

	// 점검항목 추가 팝업에서 저장 버튼 클릭
	$("#btnInsItemSave").on("click", function(e){
		
		fnStopEvent(e);
		console.log("팝업-저장 click");
		
		// input data null체크 진행
		if(fnItemPopNullCheck() == false) {
			$("#popChkItemNm").focus();
			return;
		};
		
		var param = {	
				popChkFormId   : $("#popChkItemFormId").val()
			  , popChkItemId   : $("#popChkItemId").val()
			  , popChkItemNm   : $("#popChkItemNm").val()
			  , popChkCrtrDesc : $("#popChkCrtrDesc").val()
		      , popItemUseYn   : $("#popItemUseYn").val()
			  , regItemEmpId   : loginUserId
		}
			
		console.log(param);
			
		fnAjax("<c:url value='/api/set/insertChkItem'/>", param, function(data){
			
			if(successResCode == data.resCode) {
				alert("점검항목이 추가되었습니다.");
				$('#grid2').empty();
				// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
				
		 		let cell = gridObj["grid"].getFocusedCell();

		 		let chkFormId  = gridObj["grid"].getValue(cell.rowKey, "chk_form_id", true);
		 		let chkFormNm  = gridObj["grid"].getValue(cell.rowKey, "chk_form_nm", true);
		 		let chkItemMax = gridObj["grid"].getValue(cell.rowKey, "chk_item_max", true);
		 		let prpsDesc   = gridObj["grid"].getValue(cell.rowKey, "prps_desc", true);
		 		 		
				let param = { chkFormId : chkFormId  };
				
				$('#chkItemFormId').val(chkFormId);
				$('#chkItemFormNm').val(chkFormNm);
				$('#chkItemMax').val(chkItemMax);
						
		 		detailSearch(param); 
				$(".btClose").click();
				/* $("#popEmpId").attr("disabled", false); */
			} else {
				alert("점검항목 추가에 실패했습니다.");
			}
		});		
	});
	

	// 점검항목 수정
	$(document).on("click", ".item-update", function(e){
		 		
		fnStopEvent(e);
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		var cell = gridObj["grid2"].getFocusedCell();	
 		var chkFormId = gridObj["grid2"].getValue(cell.rowKey, "chk_form_id", true); 
 		var chkItemId = gridObj["grid2"].getValue(cell.rowKey, "chk_item_id", true); 
 		 		
 		fnPopupDataItem(chkFormId,chkItemId);

		$("#chkItemFormId").prop("disabled", true);
		$("#chkItemId").prop("disabled", true);
		$("#chkItemFormNm2").prop("disabled", true);
		
		// 레이어팝업 
		$('#updateChkItemPopUp').removeClass('hide');
		
		var updChkItemData = fnNullChangeBlank(gridObj["grid2"].getRow(cell.rowKey));
		console.log("수정할 데이터 >>>>> " + JSON.stringify(updChkItemData));
		
	});
	
	// 점검항목 수정 팝업에서 저장 버튼 클릭
	$("#updItemSave").on("click", function(e){
		fnStopEvent(e);
		console.log("수정-저장 click");
		
		var param = {
				chkItemFormId : $("#chkItemFormId").val()
			  , chkItemId     : $("#chkItemId").val()
			  , chkItemNm     : $("#chkItemNm").val()
			  , chkCrtrDesc   : $("#chkCrtrDesc").val()
			  , itemUseYn     : $("#itemUseYn").val()
			  , itemRegEmpId  : loginUserId
		}
		
		console.log(param);
		
		fnAjax("<c:url value='/api/set/updateChkItem'/>", param, function(data){
			if(successResCode == data.resCode) {
				alert("점검항목이 수정되었습니다.");
				$('#grid2').empty();
				// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
				
		 		let cell = gridObj["grid"].getFocusedCell();

		 		let chkFormId  = gridObj["grid"].getValue(cell.rowKey, "chk_form_id", true);
		 		let chkFormNm  = gridObj["grid"].getValue(cell.rowKey, "chk_form_nm", true);
		 		let chkItemMax = gridObj["grid"].getValue(cell.rowKey, "chk_item_max", true);
		 		let prpsDesc   = gridObj["grid"].getValue(cell.rowKey, "prps_desc", true);
		 		 		
				let param = { chkFormId : chkFormId  };
				
				$('#chkItemFormId').val(chkFormId);
				$('#chkItemFormNm').val(chkFormNm);
				$('#chkItemMax').val(chkItemMax);
						
		 		detailSearch(param); 

		 		fnList("1");
				// 리스트 새로고침
				$(".btClose").click();
			} else {
				alert("점검항목 수정에 실패했습니다.");
			}
		});
				
	});

	
	//양식 상세 초기화
	var initParam = {
		chkFormId : '1',
		chkFormNm : '정기점검양식'
	}
	
	$('#chkItemFormId').val(initParam.chkFormId);
	$('#chkItemFormNm').val(initParam.chkFormNm);
	
	detailSearch(initParam);
	 	
	// 점검항목 내용 그리드
 	$(document).on("click", "#grid .tui-grid-table tbody tr td", function(e){	
// 	$('#gird1').on('focusChange', function(ev){
 		
		$('#grid2').empty();
		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
		
 		let cell = gridObj["grid"].getFocusedCell();

 		let chkFormId  = gridObj["grid"].getValue(cell.rowKey, "chk_form_id", true);
 		let chkFormNm  = gridObj["grid"].getValue(cell.rowKey, "chk_form_nm", true);
 		let chkItemMax = gridObj["grid"].getValue(cell.rowKey, "chk_item_max", true);
 		let prpsDesc   = gridObj["grid"].getValue(cell.rowKey, "prps_desc", true);
 		 		
		let param = { chkFormId : chkFormId  };
		
		$('#chkItemFormId').val(chkFormId);
		$('#chkItemFormNm').val(chkFormNm);
		$('#chkItemMax').val(chkItemMax);
				
 		detailSearch(param); 

	}); 
	
	// 검색 조건 입력 후 조회
	$("#btnSearch").on("click", function(e){

		fnStopEvent(e);
		fnList("1");
		gridObj["grid2"].resetData([]);
	});
	
 	// 엔터 키로 검색
    $("#searchStr").on("keyup", function(e) {
    	fnStopEvent(e);
    	console.log(e.key);
         if($("#searchStr :focus") && e.key == "Enter"){
			$("#btnSearch").click();
        }
    });

	// 검색 조건 초기화
	$(".btRefresh").on("click", function(e){
		fnStopEvent(e);
		$("#searchStr").val("");
		$("#searchType option:eq(0)").prop("selected", true); 
	});
	
	// 점검양식 삭제
	$(document).on("click", ".form-delete", function(e){
		
		fnStopEvent(e);
		var cell = gridObj["grid"].getFocusedCell();
		console.log("form-delete cell==>" + cell.rowKey);	
		
		var delChkFormId = fnNullChangeBlank(gridObj["grid"].getValue(cell.rowKey, "chk_form_id"));
		console.log("del delChkFormId ==>" + delChkFormId);
		
				
		var param = {
				delChkFormId : delChkFormId
		}
		
		console.log(param);
		
		if (!confirm("정말 삭제하시겠습니까?")) {
	        // 취소(아니오) 버튼 클릭 시 이벤트
			alert("삭제 취소되었습니다.");
	    } else {
	        // 확인(예) 버튼 클릭 시 이벤트
	    	fnAjax("<c:url value='/api/set/deleteChkForm'/>", param, function(data){
				if(successResCode == data.resCode) {
					alert("점검양식 삭제에 성공했습니다.");
					// 리스트 새로고침
					fnList("1");
				} else {
					alert("점검양식 삭제에 실패했습니다.");
				}
			});
	    }
	});
	
	// 점검항목 삭제
	$(document).on("click", ".item-delete", function(e){
		
		fnStopEvent(e);
		var cell = gridObj["grid2"].getFocusedCell();
		console.log("formItem-delete cell==>" + cell.rowKey);	
		
		var delChkFormId = fnNullChangeBlank(gridObj["grid2"].getValue(cell.rowKey, "chk_form_id"));
		var delChkItemId = fnNullChangeBlank(gridObj["grid2"].getValue(cell.rowKey, "chk_item_id"));
		
		console.log("del delChkFormId ==>" + delChkFormId);
		console.log("del delChkItemId ==>" + delChkItemId);
		
				
		var param = {
				delChkFormId : delChkFormId
		  	  , delChkItemId : delChkItemId
		}
		
		console.log(param);
		
		if (!confirm("정말 삭제하시겠습니까?")) {
	        // 취소(아니오) 버튼 클릭 시 이벤트
			alert("삭제 취소되었습니다.");
	    } else {
	        // 확인(예) 버튼 클릭 시 이벤트
	    	fnAjax("<c:url value='/api/set/deleteChkItem'/>", param, function(data){
				if(successResCode == data.resCode) {
					alert("점검 항목 삭제에 성공했습니다.");
					$('#grid2').empty();
					// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
					
			 		let cell = gridObj["grid"].getFocusedCell();

			 		let chkFormId  = gridObj["grid"].getValue(cell.rowKey, "chk_form_id", true);
			 		let chkFormNm  = gridObj["grid"].getValue(cell.rowKey, "chk_form_nm", true);
			 		let chkItemMax = gridObj["grid"].getValue(cell.rowKey, "chk_item_max", true);
			 		let prpsDesc   = gridObj["grid"].getValue(cell.rowKey, "prps_desc", true);
			 		 		
					let param = { chkFormId : chkFormId  };
					
					$('#chkItemFormId').val(chkFormId);
					$('#chkItemFormNm').val(chkFormNm);
					$('#chkItemMax').val(chkItemMax);
							
			 		detailSearch(param); 

			 		fnList("1");
				} else {
					alert("점검 항목 삭제에 실패했습니다.");
				}
			});
	    }
	});
	
	// 양식다운로드 버튼 클릭 이벤트
	$("#downForm").click(function() {
 		let cell = gridObj["grid"].getFocusedCell();

 		let chkFormId  = gridObj["grid"].getValue(cell.rowKey, "chk_form_id", true);
		
 		if(chkFormId == null || chkFormId == '') {
 			chkFormId = '1';
 		}
 		
		$.ajax({
		    url: "/api/set/excelDownload",
		    type: "POST",
		    data: {chkFormId : chkFormId},		    
		    xhrFields: {
		      responseType: "blob" // 응답 데이터 타입을 Blob으로 설정
		    },
		    success: function(data, textStatus, jqXHR) {
		      var blob = new Blob([data], { type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" });
		      var fileName = getFileNameFromResponse(jqXHR); // 응답 헤더에서 파일 이름 추출
		      saveBlobAsFile(blob, fileName); // Blob을 파일로 저장
		    },
		    error: function(jqXHR, textStatus, errorThrown) {
		      console.log("Error: " + errorThrown);
		    }
		  });

		  // 응답 헤더에서 파일 이름 추출
		  function getFileNameFromResponse(jqXHR) {
		    var contentDisposition = jqXHR.getResponseHeader("Content-Disposition");
		    var match = contentDisposition && contentDisposition.match(/filename="(.+)"/);
		    return match && match[1] ? match[1] : "download.xlsx";
		  }

			// Blob을 파일로 저장
			function saveBlobAsFile(blob, fileName) {
			  var url = window.URL.createObjectURL(blob);
			  var link = document.createElement("a");
			  link.href = url;
			  link.download = fileName;
			  link.click();
			  window.URL.revokeObjectURL(url);
			}
	});	
	
	
	$("#insertAllItem").click(function() {
		$('#popFileUpload').removeClass('hide');
	});
	
	$("#excelSave").click(function() {
	    var file = $("#file1").prop("files")[0];
	    
	    if (file) {
	        var formData = new FormData();
	        formData.append("file", file);
	        
	        $.ajax({
	            url: "/api/set/excelUpload",
	            type: "POST",
	            data: formData,
	            processData: false,
	            contentType: false,
	            success: function(data) {
	    			if(successResCode == data.resCode){
	                    alert("점검양식정보가 업로드 되었습니다.");
	                    $('#popFileUpload').addClass('hide');
	    		 		location.reload();
	    			}else{
	    				// 경고메세지
	                    alert("점검양식 업로드에 실패하였습니다.");
	    			}
	            },
	            error: function(xhr, status, error) {
	                // Handle the error response
	                alert("File upload failed: " + error);
	            }
	        });
	    }
	});	
	function fnFormPopNullCheck(){
		
		if ($("#popChkFormNm").val() == "" || $("#popChkFormNm").val() == null || $("#popChkFormNm").val() == undefined) {
			alert("점검양식명을 입력해주세요.");
			return false;
		}else if ($("#popPrpsDesc").val() == "" || $("#popPrpsDesc").val() == null || $("#popPrpsDesc").val() == undefined) {
			alert("점검양식 설명을 입력해주세요.");
			return false;
		}
	}
	
	
	function fnItemPopNullCheck(){
		
		if ($("#popChkItemNm").val() == "" || $("#popChkItemNm").val() == null || $("#popChkItemNm").val() == undefined) {
			alert("점검양식명을 입력해주세요.");
			return false;
		}else if ($("#popChkCrtrDesc").val() == "" || $("#popChkCrtrDesc").val() == null || $("#popChkCrtrDesc").val() == undefined) {
			alert("점검양식 설명을 입력해주세요.");
			return false;
		}
	}
});

/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){
	
	// 메뉴 초기화
	fnInitGnbLnb(5, 2, 5, 2);
	
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
			  {header:'점검양식ID', name:'chk_form_id', hidden:true}
			, {header:'점검양식명', name:'chk_form_nm'}
			, {header:'점검양식설명', name:'prps_desc'}
			, {header:'점검항목수', name:'chk_item_cnt', width:80, align:'center'}
			, {header:'MAX점검ID', name:'chk_item_max', width:80, align:'center', hidden:true}
			, {header:'등록일자', name:'reg_dt', width:80, align:'center'}
			, {header:'사용여부', name:'use_yn', width:80, align:'center'}
 			, {header:'변경', name:'btn_upd_del', align:'center', width:160}
	];
	
	// 그리드 생성
	fnDrawGrid("06", "grid", columnsData);
}
/**********************************************************
 * 초기화(그리드)
 **********************************************************/
function fnInitGrid2(){
	
	// 코드 상세 리스트 조회
	fnList2("1");
	
	// 그리드 컴럼 정보
	var columnsData = [
			  {header:'점검양식ID', name:'chk_form_id', hidden:true}
	    	, {header:'점검항목ID', name:'chk_item_id', hidden:true}
		    , {header:'점검항목', name:'chk_item_nm'}
			, {header:'점검기준 및 방식', name:'chk_crtr_desc'}  
			, {header:'사용여부', name:'use_yn', align:'center', width:80} 
 			, {header:'변경', name:'btn_upd_del_2', align:'center', width:160}
	];
	
	// 그리드 생성
	fnDrawGrid("06", "grid2", columnsData);
}

/**********************************************************
 * 리스트(그리드) 조회
 **********************************************************/
function fnList(slcPageNo){
	
	var pagingYn = "N";
	var pageSize = "9999999";
	
	var params = {
		pageNo : Number(slcPageNo),
		pageNavi : "5",
		pageSize : Number(pageSize),
		pagingYn : pagingYn,
		searchType : $("#searchType option:selected").val(),
		searchStr : $("#searchStr").val()
	};
	
	// GRID 리스트 조회
	fnAjax("<c:url value='/api/set/chkFormList'/>", params, function(data) {

		if(successResCode == data.resCode){
			// RESET DATA(그리드)
			gridObj["grid"].resetData(data.chkFormList);
			
		}else{
			// 경고메세지
			fnWarnMsg('조회에 실패했습니다.');
		}
	});
}

/**********************************************************
* 점검양식 수정 데이터 조회
**********************************************************/
function fnPopupDataForm(chkFormId){
	
	var param = { chkFormId : chkFormId };
		
	fnAjax("<c:url value='/api/set/chkFormInfo'/>", param, function(data){
		
		if(successResCode == data.resCode) {
			$('#chkFormId').val(data.info.chk_form_id);
			$('#chkFormNm').val(data.info.chk_form_nm);
			$('#prpsDesc').val(data.info.prps_desc);
			$('#useYn').val(data.info.use_yn);
		} else {
			alert("점검양식 조회에 실패했습니다.");
		}
	});
}
 
/**********************************************************
* 점검항목 수정 데이터 조회
**********************************************************/
 function fnPopupDataItem(chkFormId,chkItemId ){
		
	var param = { chkFormId : chkFormId, chkItemId : chkItemId };
			
	fnAjax("<c:url value='/api/set/chkItemInfo'/>", param, function(data){
		
		if(successResCode == data.resCode) {
			$('#chkItemFormId').val(data.itemInfo.chk_form_id);
			$('#chkItemFormNm2').val(data.itemInfo.chk_form_nm);
			$('#chkItemId').val(data.itemInfo.chk_item_id);
			$('#chkItemNm').val(data.itemInfo.chk_item_nm);
			$('#chkCrtrDesc').val(data.itemInfo.chk_crtr_desc);
			$('#itemUseYn').val(data.itemInfo.use_yn);
			$('#itemRegEmpId').val(loginUserId);
		} else {
			alert("점검항목 조회에 실패했습니다.");
		}
	});
}  


function detailSearch(param){
	
	/**********************************************************
	 * 초기화(그리드)
	 **********************************************************/
	function fnInitGrid2(){
		
		// 코드 상세 리스트 조회
		fnList2("1");
		
		// 그리드 컴럼 정보
		var columnsData = [
				  {header:'점검양식ID', name:'chk_form_id',hidden:true}
		    	, {header:'점검항목ID', name:'chk_item_id',hidden:true,width:300}
			    , {header:'점검항목', name:'chk_item_nm', width:300}
				, {header:'점검기준 및 방식', name:'chk_crtr_desc'}   
				, {header:'사용여부', name:'use_yn', width:80, align:'center'}
	 			, {header:'변경', name:'btn_upd_del_2', align:'center', width:160}
		];
		
		// 그리드 생성
		fnDrawGrid("06", "grid2", columnsData);
					
		/**********************************************************
		 * 리스트(그리드) 조회
		 **********************************************************/
		function fnList2(slcPageNo){
			
			var pageSize = $("#slcPageSize").val();
			var pagingYn = "";
			
			if(pageSize == "전체"){
				pagingYn = "N";
				pageSize = 9999999;
			} else {
				pagingYn = "Y";
			}
			
			var params = {
				pageNo : slcPageNo,
				pageNavi : "5",
				pageSize : pageSize,
				pagingYn : pagingYn,
				searchType : $("#searchType option:selected").val(),
				searchStr : $("#searchStr").val(),
			};
		    
			params.chkFormId = param.chkFormId;
			// GRID 리스트 조회
			fnAjax("<c:url value='/api/set/chkItemList'/>", params, function(data) {

				if(successResCode == data.resCode){
					// RESET DATA(그리드)
					gridObj["grid2"].resetData(data.chkItemList);
					
				}else{
					// 경고메세지
					fnWarnMsg('조회에 실패했습니다.');
				}
			});
		}
	}
	fnInitGrid2();
} 
</script>