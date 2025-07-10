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
			<li>Support</li>
			<li>FAQ</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">FAQ</h2>
		</div>

	</div><!--//conHead-->

	<div class="conBody">

		<div class="search">

			<div class="box">
				<form>
					<table class="field">
						<tbody>
							<tr>
								<th class="faqCtgType">구분</th>
								<td class="faqCtgType">
									<select class="select md" id="ctgryTypeCdGroup">
										<option value="" selected>전체</option>
										<option value="OS">OS</option>
										<option value="DB">DB</option>
										<option value="MW">MW</option>
										<option value="F99">공용</option>
									</select>
								</td>
								<th>검색어</th>
								<td>
									<select class="select md" id="searchType">
										<option value="pstngTitleNm">제목</option>
										<option value="pstngSbst">내용</option>
									</select>
									<input type="text" class="input xxl" value="" placeholder="검색어입력" id="searchStr">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				<div class="btns">
					<button type="button" class="bt bg primary" id="btnSearch">검색</button>
					<!--button type="button" class="bt bg">초기화</button-->
					<!-- <button type="button" class="btRefresh" title="초기화">초기화</button> -->
				</div>
			</div>

		</div><!--//search-->

		<div class="result">

			<div class="control">

				<span class="count">
					<select class="select sm" id="slcPageSize" name="pageSize">
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
					<button type="button" class="bt bg secondary" id="insertBtn">등록</button>
				</div>
						
			</div><!--//control-->
			
			<!-- GRID -->
			<div class="tui-grid" id="grid"></div>			
			
            <!-- PAGING -->
			<div id="divPaging" class="control">
			
				<span class="count"></span>

				<div class="pages"></div>

			</div><!--//control-->

		</div><!--//result-->

	</div><!--//pageBody-->

</section>

<!-- [팝업] FAQ상세 -->
<article class="popup hide" id="faqDetailPopup">
	<div class="popBox">
     <input type="hidden" id="fileMaxSize" value="${fileMaxSize}"/>
		<div class="conHead">
			<h5 class="popTitle">FAQ 상세</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>
		<div class="conBody">

			<table class="field">
				<colgroup>
					<col width="80px">
					<col width="180px">
					<col width="80px">
					<col width="180px">
				</colgroup>
				<tbody>
					<tr class="faqCtgType">
						<th>구분</th>
						<td colspan="3" id="ctgryTypeCd"></td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3" id="pstngTitleNm"></td>
					</tr>
					<tr>
						<th>작성일</th>
						<td id="amdDt"></td>
						<th>작성자</th>
						<td id="amdrId"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3" id="pstngSbst" style="white-space: pre;"></td>
					</tr>
					<tr class="faqFile">
						<th rowspan="5">첨부파일</th>
						<td colspan="3">
						    <p style="color: var(--color-danger);">*최대 3개 가능, 파일당 용량제한 00MB</p>
						    <p><input type="file" class="custom-file-input" id="file1" name="file1"></p>
						    <p><input type="file" class="custom-file-input" id="file2" name="file2"></p>
						    <p><input type="file" class="custom-file-input" id="file3" name="file3"></p>
						</td>
					</tr>
				</tbody>
			</table>
			
		</div><!-- //conBody -->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary" id="btnFaqPopClose">확인</button>
			</div>
		</div>

	</div>
</article>	
<!-- // [팝업] FAQ 등록 -->
<article class="popup hide" id="faqModifyPopup">
	<div class="popBox">
     <input type="hidden" id="fileMaxSize" value="${fileMaxSize}"/>
		<div class="conHead">
			<h5 class="popTitle" id="faqPopTitle">FAQ 등록</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>
<!-- 		<form id="faqFiles" action="/api/spt/faqFileUpload" method="post" enctype="multipart/form-data"> -->
		<div class="conBody">
			<input type="hidden" id="bbsTxnId" />
			<table class="field">
				<colgroup>
					<col width="80px">
					<col width="180px">
					<col width="80px">
					<col width="180px">
				</colgroup>
				<tbody>
					<tr class="faqCtgType">
						<th>구분</th>
						<td  colspan="3">
						    <select class="select lg" id="ctgryTypeCd2">
							    <option value="" selected>선택</option>
								<option value="OS">OS</option>
								<option value="DB">DB</option>
								<option value="MW">MW</option>
								<option value="공용">공용</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3">
						    <input type="text" class="input xxxl" value="" id="pstngTitleNm2">
						</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td id="amdDt2"></td>
						<th>작성자</th>
						<td id="amdrId2">${loginInfo.user_name}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">
						    <textarea class="textarea" id="pstngSbst2" ></textarea>
						</td>
					</tr>
					<tr class="faqFile">
						<th rowspan="5">첨부파일</th>
						<td colspan="3">
						    <p style="color: var(--color-danger);">*최대 3개 가능, 파일당 용량제한 00MB</p>
						    <p><input type="file" class="custom-file-input" id="file1" name="file1"></p>
						    <p><input type="file" class="custom-file-input" id="file2" name="file2"></p>
						    <p><input type="file" class="custom-file-input" id="file3" name="file3"></p>
						</td>
					</tr>
				</tbody>
			</table>
		</div><!-- //conBody -->
<!-- 		</form> -->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary" id="btnSave" data-mode="insert">저장</button>	
				<button type="button" class="bt max bd" id="btnCancleAndClose">취소</button>		
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
	
	// fileUpload 기능 추가 보류 2022.12.05
 	$(".faqFile").hide();
	
	//FAQ쪽 카테고리 재정의 되면 하이드 풀어야됨. => 쿼리도 하드코딩 ctgry_type_cd = 'F99' => 공통,,? 되어있음. 
    //FAQ쪽 카테로기 재정의 되면 code to val 옵션 태그 값 개발 해야함.
	$('.faqCtgType').hide();
		
	// 이벤트(검색버튼)
	$("#btnSearch").on("click", function(e){
		fnList("1");
	});
	
	// 이벤트(검색초기화버튼)
	$("#btnSearchInit").on("click", function(e){
		$("#searchStr").val("");
	});
	
	// FAQ 상세 내용 팝업 호출
 	$(document).on("dblclick", "#grid .tui-grid-table tbody tr td", function(e){	
		fnStopEvent(e);
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		var cell = gridObj["grid"].getFocusedCell();	
 		var bbsTxnId = gridObj["grid"].getValue(cell.rowKey, "bbs_txn_id", true);
 		fnPopupData(bbsTxnId);
		// 레이어팝업 보여줌
		$('#faqDetailPopup').removeClass('hide');
	}); 
	
	// FAQ 등록
	$("#insertBtn").on("click", function(e){
		fnStopEvent(e);
		var today = new Date();
		var regdate = today.getFullYear()
					+"-"+fnLpad(String((today.getMonth()+1)), 2, "0")
					+"-"+fnLpad(String(today.getDate()), 2, "0"); 
		
		$('#amdDt2').text(regdate);
		$('#amdrId2').text(loginUserName);
		
		$('#ctgryTypeCd2').val("");		
		$('#pstngTitleNm2').val("");		
		$('#bbsTxnId').val("");
		$('#pstngSbst2').val("");
		
		// 팝업타이틀 FAQ 등록으로 변경
		$('#faqPopTitle').text('FAQ 등록');
		// 수정완료버튼 => 저장으로 변경
		$('#btnSave').text('저장');
		$('#btnSave').data("mode","insert");
		
		$('#faqModifyPopup').removeClass('hide');
		
	});
		
	// FAQ 팝업 닫기
	$('#btnFaqPopClose').on('click', function(){
		$('#faqDetailPopup').addClass('hide');
	});
	
	// FAQ저장 
	$('#btnSave').on('click', function(){
		
		if(fnVocValChk()){
			var params = { 
					ctgryTypeCd: $('#ctgryTypeCd2').val(),
					pstngTitleNm: $('#pstngTitleNm2').val(),
					pstngSbst: $('#pstngSbst2').val(),
					userId: $('#amdrId2').val()
			};
			
			if($('#btnSave').data("mode") == "insert"){			
				// FAQ 등록
		 		fnAjax("<c:url value='/api/spt/insertFaq'/>", params, function(data) {
		
		 			if(data.insertResult == "successed") {
						alert("등록되었습니다.");
						fnList("1");
					} else {
						alert("등록 오류.");
					}
					$('#faqModifyPopup').addClass('hide');
		 		});
			}
			else{
				// 파라미터에 idx값 추가
				params.bbsTxnId = $('#bbsTxnId').val();
				
				console.log(JSON.stringify(params));
				
			 	// FAQ 수정
		 		fnAjax("<c:url value='/api/spt/updateFaq'/>", params, function(data) {
		
		 			if(data.updateResult == "successed") {
						alert("수정되었습니다.");
						fnList("1");
					} else {
						alert("수정 오류.");
					}
					$('#faqModifyPopup').addClass('hide');
		 		}); 
			}
		}
		
// 		$('#faqFiles').submit();
	});
	
	// 수정
	$(document).on("click", ".user-update", function(e){
		fnStopEvent(e);
		var cell = gridObj["grid"].getFocusedCell();
		console.log("user-update cell==>" + cell.rowKey);
		var bbsTxnId = gridObj["grid"].getValue(cell.rowKey, "bbs_txn_id");
		
		var param = { bbsTxnId : bbsTxnId };
		
		fnAjax("<c:url value='/api/spt/faqDetail'/>", param, function(data) {
			
			if(successResCode == data.resCode){
 				$('#bbsTxnId').val(data.FaqDetail.bbs_txn_id);
 				$('#ctgryTypeCd2').val(data.FaqDetail.ctgry_type_cd);
 				$('#pstngTitleNm2').val(data.FaqDetail.pstng_title_nm);
 				$('#amdDt2').text(data.FaqDetail.amd_dt);
 				$('#amdrId2').text(data.FaqDetail.amdr_id);
 				$('#pstngSbst2').val(data.FaqDetail.pstng_sbst);
 			}
 		});
		
		// 팝업타이틀 FAQ 수정으로 변경
		$('#faqPopTitle').text('FAQ 수정');
		// 수정완료버튼 => 저장으로 변경
		$('#btnSave').text('수정완료');
		$('#btnSave').data("mode","update");
		
		// 레이어팝업 보여줌
		$('#faqModifyPopup').removeClass('hide');
	});
	
	// 삭제
	$(document).on("click", ".user-delete", function(e){
		fnStopEvent(e);
		
		var confirmDel = confirm("선택하신 FAQ를 '삭제'하시겠습니까?");
		
		if(confirmDel){
			var cell = gridObj["grid"].getFocusedCell();
			console.log("user-delete cell==>" + cell.rowKey);	
			var bbsTxnId = gridObj["grid"].getValue(cell.rowKey, "bbs_txn_id");
			
			var param = { bbsTxnId : bbsTxnId };
			
			fnAjax("<c:url value='/api/spt/deleteFaq'/>", param, function(data) {
				
				if(data.deleteResult == "successed"){
					alert("삭제되었습니다.");
					fnList("1");
				} else {
					alert("삭제 오류.");
				}
	 		});
		}
		else{
			return;
		}
	});
	
	// 수정 취소 버튼 클릭
	$('#btnCancleAndClose').click(function(){
		$(".btClose").click();
	});
	
});

/**********************************************************
 * 초기화
 **********************************************************/
 function fnInit(){
		
		// InitGnbLnb
		fnInitGnbLnb(7, 2, 7, 2);
		
		// 초기화(그리드)
		fnInitGrid();
		
		// 리스트(그리드) 조회
		fnList("1");
		
		// 공통
		fnCommon();
	}
 
 /**********************************************************
  * 초기화(그리드)
  **********************************************************/
 function fnInitGrid(){

 	// 그리드 컴럼 정보
 	var columnsData = [
 			  {header:'구분', name:'ctgry_type_cd', sortable: true, align:'center', width:150}
 			, {header:'제목', name:'pstng_title_nm', sortable: true, align:'left'}
 			, {header:'작성자', name:'amdr_id', align:'center', width:200}
 			, {header:'등록일자', name:'amd_dt', align:'center', width:250}
 			, {header:'변경', name:'btn_upd_del', align:'center', width:250}
 			, {header:'bbs_txn_id', name:'bbs_txn_id', hidden: true}
 	];
 	
 	// 그리드 생성
 	fnDrawGrid("03", "grid", columnsData);
 	
 	if(loginUserGroup == "사용자"){
 		gridObj["grid"].hideColumn('btn_upd_del');
 	}
	 	
 }
 
 
 /**********************************************************
  * 리스트(그리드) 조회
  **********************************************************/
 function fnList(slcPageNo){
		
		var params = {
			pageNo : slcPageNo,
			pageNavi : "5",
			pageSize : $("#slcPageSize").val(),
			searchType : $("#searchType option:selected").val(),
			searchStr : $("#searchStr").val(),
			ctgryTypeCdGroup : $("#ctgryTypeCdGroup").val()
		};
	    
		// GRID 리스트 조회
		fnAjax("<c:url value='/api/spt/faqList'/>", params, function(data) {

			if(successResCode == data.resCode){
				// RESET DATA(그리드)
				gridObj["grid"].resetData(data.FaqList);
				
				// 페이징
				fnPagenation(data.paging, "fnList");
				
			}else{
				// 경고메세지
				fnWarnMsg(systemErrorMsg);
			}
		});
	}
 /**********************************************************
  * FAQ 팝업 데이터 조회
  **********************************************************/
 function fnPopupData(bbsTxnId){

 	let param = { bbsTxnId : bbsTxnId }
 	
 	fnAjax("<c:url value='/api/spt/faqDetail'/>", param, function(data){
 		if(successResCode == data.resCode) {
//  			fnInitPopup();
//  			fnShowPopup(data);
			$('#ctgryTypeCd').text(data.FaqDetail.ctgry_type_cd);
			$('#pstngTitleNm').text(data.FaqDetail.pstng_title_nm);
			$('#amdDt').text(data.FaqDetail.amd_dt);
			$('#amdrId').text(data.FaqDetail.amdr_id);
			$('#pstngSbst').text(data.FaqDetail.pstng_sbst);
 		} else {
 			alert("FAQ 상세내역 조회에 실패했습니다.");
 		}
 	});
 }
 

 /**********************************************************
  * 바이트 수 반환
  **********************************************************/
 function byteCheck(el){
     var codeByte = 0;
     for (var idx = 0; idx < el.length; idx++) {
         var oneChar = escape(el.charAt(idx));
         if ( oneChar.length == 1 ) {
             codeByte ++;
         } else if (oneChar.indexOf("%u") != -1) {
             codeByte += 2;
         } else if (oneChar.indexOf("%") != -1) {
             codeByte ++;
         }
     }
     return codeByte;
 }

 /**********************************************************
  * FAQ 등록/수정 유효성 체크
  **********************************************************/
 function fnVocValChk(){
 	
//  	if($('#ctgryTypeCd2').val() == ''){
//  		alert("구분을 선택해주세요.");
//  		$('#ctgryTypeCd2').focus();
//  		return false;
//  	}
 	
 	if($('#pstngTitleNm2').val() == ''){
 		alert("제목을 입력해주세요.");
 		$('#pstngTitleNm2').focus();
 		return false;
 	}
 	var strByte = byteCheck($('#pstngTitleNm2').val());
 	
 	if(strByte > 200){
 		alert("제목은 200Byte 이하만 가능합니다.");
 		$('#pstngTitleNm2').focus();
 		return false;
 	}
 	
 	if($('#pstngSbst2').val() == ''){
 		alert("내용을 입력해주세요.");
 		$('#pstngSbst2').focus();
 		return false;
 	}
 	return true;
 }
 
 
//  function fnUpload() {
// 		let form = new FormData($("#frmAttachedFiles")[0]);
// 		form.append("name", "테스트");
		
// 	    let apiUrl = "/uploadTest.do";
// 		$.ajax({
// 			url : apiUrl,
// 			type : "POST",
// 			data : form,
// 			dataType: "json",
// 			processData: false,
// 			contentType: false,
// 			enctype : 'multipart/form-data',
// 			success: function(result) {
// 				Alert("성공");
// 			}
// 		});
// 	}
 
 
</script>