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
			<li>공지사항</li>
			<li>공지사항</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">공지사항</h2>
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
										<option value="bbmTitl">제목</option>
										<option value="regEmpNm">작성자</option>
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
				<div style="font-size:11px;color:blue">
					* 공지사항 행을 더블클릭하면 댓글 등록창이 열립니다.				
				</div>

				<div class="btns">
					<button type="button" class="bt bg secondary" id="regVoc">공지사항등록</button>
				</div>

			</div><!--//control-->
			
			<div class="tui-grid">
				<div id="grid"></div>
			</div>
			
		</div><!--//result-->

	</div><!--//pageBody-->

</section>


<!-- [팝업] 공지사항 등록 -->
<article class="popup hide" id="popNoticeRegUpd">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle" id="regPopTitle">공지사항 등록</h5>
			<button type="button" class="btClose"  id="btnCancelRegNotice"><i>닫기</i></button>
		</div>
		<form id="faqFiles" action="/api/spt/faqFileUpload" method="post" enctype="multipart/form-data" target="faqFiles">
		<div class="conBody">
			<input type="hidden" id="nticItemSno2" />
			<table class="field">
				<colgroup>
					<col width="80px">
					<col width="180px">
					<col width="80px">
					<col width="180px">
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td colspan="3"><input type="text" class="input" value="" id="nticTitl2"></td>
					</tr>
					<tr>
						<th>작성일</th>
						<td id="regDt2"></td>
						<th>작성자</th>
						<td id="regNm2"></td>
					</tr>
					<tr>
						<th>내용<br><span>(내용은 최대 500자만 가능합니다)</span><br>
						<span id="con_cnt">(0/500)</span>
						</th>
						<td colspan="3"><textarea class="textarea" placeholder="" id="nticCtnt2"></textarea></td>
					</tr>
					<tr class="faqFile">
						<th rowspan="5">첨부파일</th>
						<td colspan="3">
						    <p style="color: var(--color-danger);">*최대 3개 가능, 파일당 용량제한 00MB</p>
						    <p><input type="file" class="custom-file-input" id="file1" name="uploadFileMulti"></p>
						    <p><input type="file" class="custom-file-input" id="file2" name="uploadFileMulti"></p>
						    <p><input type="file" class="custom-file-input" id="file3" name="uploadFileMulti"></p>
						</td>
					</tr>
				</tbody>
			</table>
		</div><!--//conBody-->
		</form>
		<div class="conFoot">
			<div class="btns">
<!-- 				<button type="button" class="bt max bg primary" id="btnRegNotice" data-mode="regist">저장</button> -->
				<button type="button" id="btnRegNotice"   class="bt max bg primary">저장</button>
				<button type="button" id="btnRegPopClose" class="bt max bd" >취소</button>
			</div>
		</div>

	</div>
</article>	

<!--// [팝업] 공지사항 등록 -->

<!-- [팝업] 공지사항 수정 -->
<article class="popup hide" id="popNoticeInfo">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle" id="modPopTitle">공지사항 수정</h5>
			<button type="button" class="btClose" id="btnCancelRegNotice"><i>닫기</i></button>
		</div>
		<div class="conBody">
			<input type="hidden" id="nticItemSno22" />
			<table class="field">
				<colgroup>
					<col width="80px">
					<col width="180px">
					<col width="80px">
					<col width="180px">
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td colspan="3"><input type="text" class="input" value="" id="nticTitl22"></td>
					</tr>
					<tr>
						<th>작성일</th>
						<td id="regDt22"></td>
						<th>작성자</th>
						<td id="regNm22"></td>
					</tr>
					<tr>
						<th>내용<br><span>(내용은 최대 500자만 가능합니다)</span><br>
						<span id="con_cnt22">(0/500)</span>
						</th>
						<td colspan="3"><textarea class="textarea" placeholder="" id="nticCtnt22"></textarea></td>
					</tr>
					<tr class="faqFile">
						<th rowspan="5">첨부파일</th>
						<td colspan="3">
						    <p style="color: var(--color-danger);">*최대 3개 가능, 파일당 용량제한 00MB</p>
						    <form id="faqFilesUp" action="/api/spt/noticeUpdate" method="post" enctype="multipart/form-data" target="faqFiles">
						    	<p id="fileInitY0"><input type="file" class="custom-file-input" id="file11" name="updateFileMulti"></p>
							    <p id="fileInitN0"><a download class="row" id="downFileUp0" style="color:blue;"></a><button class="fiClose" style="margin-left: 5px;" id="fileInit0"><i>파일초기화</i></button></p>
						    	<p id="fileInitY1"><input type="file" class="custom-file-input" id="file12" name="updateFileMulti"></p>
							    <p id="fileInitN1"><a download class="row" id="downFileUp1" style="color:blue;"></a><button class="fiClose" style="margin-left: 5px;" id="fileInit1"><i>파일초기화</i></button></p>
						    	<p id="fileInitY2"><input type="file" class="custom-file-input" id="file13" name="updateFileMulti"></p>
							    <p id="fileInitN2"><a download class="row" id="downFileUp2" style="color:blue;"></a><button class="fiClose" style="margin-left: 5px;" id="fileInit2"><i>파일초기화</i></button></p>
							</form>
						</td>
					</tr>
				</tbody>
			</table>
		</div><!--//conBody-->
		<div class="conFoot">
			<div class="btns">
				<button type="button" id="btnModNotice"   class="bt max bg primary">저장</button>
				<button type="button" id="btnModPopClose" class="bt max bd" >취소</button>
			</div>
		</div>

	</div>
</article>	

<!--// [팝업] 공지사항 수정 -->


<!-- [팝업] 공지사항 상세(댓글) -->
<article class="popup hide" id="popNoticeDetail">
	<div class="popBox" style="width:700px;">

		<div class="conHead">
			<h5 class="popTitle">공지사항 댓글 등록</h5>
			<button type="button" class="btClose" id="btnCancelReply"><i>닫기</i></button>
		</div>
			<div class="conBody" style="overflow:auto" id="popDetailBody">
				<input type="hidden" id="nticItemSno" />
				<table class="field" style="word-break:break-all; table-layout:fixed;">
					<colgroup>
						<col width="80px">
						<col width="180px">
						<col width="80px">
						<col width="180px">
					</colgroup>
					<tbody>
						<tr>
							<th>제목</th>
							<td colspan="3" id="nticTitl"></td>
						</tr>
						<tr>
							<th>작성일</th>
							<td id="regDttm"></td>
							<th>작성자</th>
<!-- 							<td id="regEmpId"></td> -->
							<td id="regEmpNm"></td>
						</tr>
						<tr>
							<th>내용</th>
<!-- 							<td colspan="3" id="nticCtnt" style="white-space: pre;"> -->
							<td colspan="3">
								<textarea class="textarea" placeholder="" id="nticCtnt" readonly></textarea>
							</td>
						</tr>
						<tr class="faqFile">
							<th rowspan="5">첨부파일</th>
							<td colspan="3">
								<form id="downFile" method="post">
								    <input type="file" hidden="true"/> 
								    <p><a download class="row" id="downFile0" style="color:blue;"></a></p>
								    <p><a download class="row" id="downFile1" style="color:blue;"></a></p>
								    <p><a download class="row" id="downFile2" style="color:blue;"></a></p>
								</form>
							</td>
						</tr>
					</tbody>
				</table>
				
				<!-- 댓글입력 -->
				<div id="replForm" style="margin: 15px 10px 15px;">
					<textarea class="textarea" style="height: 60px;" cols="5" placeholder="댓글입력" id="replSbst"></textarea>
					<!-- <span class="count" id="replInputCnt"><b>0</b><i>/</i>300</span>
					<button type="button" class="bt bg secondary" style='float: right; margin-top: 5px;' id="btnReplSave">댓글저장</button> -->
				</div>
				
				<!-- 댓글목록 -->
				<div>
					<table class="field" id="replListTbl">
						<tbody id="replList">
						</tbody>
					</table>
				</div>
	
			</div><!--//conBody-->
		<div class="conFoot" id="footBtn2">
			<div class="btns">
				<button type="button" id="btnReplSave"    class="bt max bg primary">댓글저장</button>
				<button type="button" id="btnCloseDetail" class="bt max bd">취소</button>
			</div>
		</div>

	</div>
</article>	
<!--// [팝업] 상세 -->

<iframe id="faqFiles" name="faqFiles" style="display:none"></iframe>


<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/footer" />

<script type="text/javaScript">

$(function(){

	// 초기화
	fnInit();

	//공통
	fnCommon();
	
	// 이벤트(검색버튼)
	$("#btnSearch").on("click", function(e){
		fnList("1");
	});
	
	// 이벤트(검색초기화버튼)
// 	$("#btnSearchInit").on("click", function(e){
// 		$("#searchStr").val("");
// 	});
	
	// 이벤트(페이지사이즈)
	$("#slcPageSize").on("change", function(e){
		fnStopEvent(e);
		fnList("1");
	});
	
	// 공지사항 등록 닫기
	$("#btnRegPopClose").on("click", function(e){
		$(".btClose").click();
		fnList("1");
	});
	
	// 공지사항 수정 닫기
	$("#btnModPopClose").on("click", function(e){
		$(".btClose").click();
		fnList("1");
	});
	
	// 공지사항 상세 닫기
	$("#btnCloseDetail").on("click", function(e){
		$(".btClose").click();
		fnList("1");
	});
	
	// 공지사항 등록 버튼 클릭 이벤트
	$('#regVoc').click(function(){
		
		var today = new Date();
		var regdate = today.getFullYear()
					+"-"+fnLpad(String((today.getMonth()+1)), 2, "0")
					+"-"+fnLpad(String(today.getDate()), 2, "0"); 

		$('#regDt2').text(regdate);
		$('#regNm2').text(loginUserName);
		
		$('#nticItemSno2').val("");		
		$('#nticTitl2').text("");
		$('#nticCtnt2').val("");
		
		// 팝업타이틀 VOC 질문 등록으로 변경
		$('#regPopTitle').text('공지사항 등록');
		// 수정완료버튼 => 저장으로 변경
		$('#btnRegNotice').text('저장');
		$('#btnRegNotice').data("mode","regist");
		
		$('#popNoticeRegUpd').removeClass('hide');
	});
	
	
	// 등록팝업 저장버튼 클릭 이벤트
	$('#btnRegNotice').click(function(){
		let loginUser = "${loginInfo.user_id}";
		let form = new FormData($("#faqFiles")[0]);
		form.append("user_id", loginUser);
		form.append("bbm_titl", $('#nticTitl2').val());
		form.append("bbm_ctnt", $('#nticCtnt2').val());
		
	    let apiUrl = "/api/spt/faqFileUpload";
		$.ajax({
			url : apiUrl,
			type : "POST",
			data : form,
			dataType: "json",
			processData: false,
			contentType: false,
			enctype : 'multipart/form-data',
			success: function(result) {
				alert("공지사항 등록에 성공하였습니다.");
		 		location.reload();
			}
		});
	});
	
	
	// 수정팝업 저장버튼 클릭 이벤트
	$('#btnModNotice').click(function(){
		
		let loginUser = "${loginInfo.user_id}";
		let form = new FormData($("#faqFilesUp")[0]);
		
		form.append("bbm_id_mod", $('#nticItemSno22').val());
		form.append("user_id_mod", loginUser);
		form.append("bbm_titl_mod", $('#nticTitl22').val());
		form.append("bbm_ctnt_mod", $('#nticCtnt22').val());
		
	    let apiUrl = "/api/spt/noticeUpdate";
		$.ajax({
			url : apiUrl,
			type : "POST",
			data : form,
			dataType: "json",
			processData: false,
			contentType: false,
			enctype : 'multipart/form-data',
			success: function(result) {
				alert("공지사항 수정에 성공하였습니다.");
		 		location.reload();
			}
		});
	});
	
	// 상세팝업
 	$(document).on("dblclick", "#grid .tui-grid-table tbody tr td", function(){
 				
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		let cell = gridObj["grid"].getFocusedCell();
 		
 		let id = gridObj["grid"].getValue(cell.rowKey, "bbm_id", true);

		fnNoticeDetail(id);
		
		// 레이어팝업 보여줌
		$('#popNoticeDetail').removeClass('hide');
		// 스크롤 위치 초기화
		$("#popDetailBody").scrollTop(0);
	}); 
	
	// 수정
	$(document).on("click", ".bbm-update", function(e){
				
		fnStopEvent(e);
		var cell = gridObj["grid"].getFocusedCell();
		//console.log("bbm-update cell==>" + cell.rowKey);
		var id = gridObj["grid"].getValue(cell.rowKey, "bbm_id");
				
		var param = { bbm_id : id , apnd_file_trg_id: id };
		
		fnAjax("<c:url value='/api/spt/noticeDetail'/>", param, function(data) {
			if(successResCode == data.resCode){
 				
 				$('#nticItemSno22').val(id);
 				$('#nticTitl22').val(data.NoticeDetail.bbm_titl);
				$('#regDt22').text(data.NoticeDetail.reg_dttm);
				$('#regNm22').text(data.NoticeDetail.reg_emp_nm);
 				$('#nticCtnt22').val(data.NoticeDetail.bbm_ctnt);
 				
// 				$('#regTitle').val(data.NoticeDetail.ntic_titl);
// 				$('#regContent').val(data.NoticeDetail.ntic_ctnt);
				
				
				$('#fileInitN0').hide();
				$('#fileInitN1').hide();
				$('#fileInitN2').hide();

				$('#fileInitY0').show();
				$('#fileInitY1').show();
				$('#fileInitY2').show();
				
				for(var idx in data.NoticeFiles) {
					
					$('#fileInitY'+idx).hide();
					$('#fileInitN'+idx).show();
					var fileName = data.NoticeFiles[idx].apnd_file_nm.split('^');
					$('#downFileUp' + idx).text(fileName[1]);
					
					$('#downFileUp' + idx).prop('name', data.NoticeFiles[idx].apnd_file_trg_id + '-' + data.NoticeFiles[idx].apnd_file_sno)
					$('#downFileUp' + idx).addClass('downFiles');
					
					var filePath = '../../uploadFiles/N/' + data.NoticeFiles[idx].apnd_file_nm;
					
					$('#downFileUp' + idx).prop('href', filePath);
				
				}

 			}
 		});
		
		// 레이어팝업 보여줌
		$('#popNoticeInfo').removeClass('hide');
	});
	
	//파일초기화 버튼
	$('#btnFileInit').on('click', function(e) {
		$('#fileInitN').hide();
		$('#fileInitY').show();
	});
	
	// 삭제
	$(document).on("click", ".bbm-delete", function(e){
		fnStopEvent(e);
		var cell = gridObj["grid"].getFocusedCell();
		console.log("bbm-delete cell==>" + cell.rowKey);	
		
		
		var bbmId = fnNullChangeBlank(gridObj["grid"].getValue(cell.rowKey, "bbm_id"));
		console.log("del bbm_id ==>" + bbmId);	
				
		var param = {
				bbmId : bbmId
		}
		
		console.log(param);
		
		if (!confirm("정말 삭제하시겠습니까?")) {
	        // 취소(아니오) 버튼 클릭 시 이벤트
			alert("삭제 취소되었습니다.");
	    } else {
	        // 확인(예) 버튼 클릭 시 이벤트
	    	fnAjax("<c:url value='/api/spt/deleteNotice'/>", param, function(data){
	    		
				if(successResCode == data.resCode) {
					alert("공지사항 삭제에 성공했습니다.");
					// 리스트 새로고침
					fnList("1");
				} else {
					alert("공지사항 삭제에 실패했습니다.");
				}
			});
	    }
	});
	

	// 댓글내용 입력시 글자수 count
	$('#replSbst').on('keyup', function() {
		
        $('#replInputCnt').html("<b>"+$(this).val().length+"</b><i>/</i>300");

        if($(this).val().length > 300) {
            $(this).val($(this).val().substring(0, 300));
            $('#replInputCnt').html("<b>300</b><i>/</i>300");
        }
    });
	
	$('.fiClose').click(function(e) {
		var sno = $(this).prop("id").slice(-1);
		$('#fileInitN' + sno).hide();
		$('#fileInitY' + sno).show();
	});
	
	//댓글 저장버튼 클릭
	$('#btnReplSave').click(function(){
		
		var loginUser = "${loginInfo.user_id}";
		
		var params = {
				bbm_ctnt : $('#replSbst').val(),
				par_bbm_id : $('#nticItemSno').val(),
				leaf_yn : 'Y',
				bbm_lvl : 2,
				user_id : loginUser
		}
		
		fnAjax("<c:url value='/api/spt/insertRepl'/>", params, function(data) {
			
 			if(data.insertResult == "successed") {
				alert("댓글이 등록되었습니다.");
				$('#replSbst').val('');
				 $('#replInputCnt').html("<b>0</b><i>/</i>300");
				fnNoticeDetail($('#nticItemSno').val());
			} else {
				alert("등록 오류.");
			}
 		});
	});
	
});

/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){
	
	// InitGnbLnb
	fnInitGnbLnb(6, 1, 6, 1);
	
	// 초기화(그리드)
	fnInitGrid();
	
	// 공통
	fnCommon();
	
	// 리스트(그리드) 조회
	fnList("1");
}

/**********************************************************
 * 초기화(그리드)
 **********************************************************/
function fnInitGrid(){

	// 그리드 컴럼 정보
	var columnsData = [
			  {header:'hidden', name:'bbm_id', hidden:true}
			, {header:'제목', name:'bbm_titl', sortable: true, align:'left'}
			, {header:'댓글개수', name:'reply_cnt', align:'center', width:80}
			, {header:'회사명', name:'corp_ko_nm', sortable: true, align:'center', width:200}
			, {header:'부서명', name:'dept_nm', sortable: true, align:'center', width:150}
			, {header:'작성자 ID', name:'reg_emp_id', sortable: true, align:'center', width:200}
			, {header:'작성자명', name:'reg_emp_nm', sortable: true, align:'center', width:120}
			, {header:'등록일시', name:'reg_dttm', sortable: true, align:'center', width:150}
// 			, {header:'상태', name:'repl_yn', sortable: true, align:'center', width:150}
			, {header:'수정', name:'btn_upd_del', align:'center', width:160}
	];
	
	// 그리드 생성
	fnDrawGrid("03", "grid", columnsData);
}

/**********************************************************
 * 리스트(그리드) 조회
 **********************************************************/
function fnList(slcPageNo){
	
	var params = {
		searchType : $("#searchType option:selected").val(),
		searchStr : $("#searchStr").val()
	};
	
    
	// GRID 리스트 조회
	fnAjax("<c:url value='/api/spt/list'/>", params, function(data) {

		if(successResCode == data.resCode){
			// RESET DATA(그리드)
			gridObj["grid"].resetData(data.NoticeList);

		}else{
			// 경고메세지
			fnWarnMsg('조회에 실패했습니다.');
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
 * 공지사항 등록/수정 유효성 체크
 **********************************************************/
function fnVocValChk(){
	
	if($('#ctgryId').val() == ''){
		alert("구분을 선택해주세요.");
		$('#ctgryId').focus();
		return false;
	}
	
	if($('#regTitle').val() == ''){
		alert("제목을 입력해주세요.");
		$('#regTitle').focus();
		return false;
	}
	var strByte = byteCheck($('#regTitle').val());
	
	if(strByte > 200){
		alert("제목은 200Byte 이하만 가능합니다.");
		$('#regTitle').focus();
		return false;
	}
	
	if($('#regContent').val() == ''){
		alert("내용을 입력해주세요.");
		$('#regContent').focus();
		return false;
	}
	return true;
}

/**********************************************************
 * 공지사항 상세
 **********************************************************/
function fnNoticeInfo(id){
	
	var loginUser = "${loginInfo.user_id}";
	
	let param = { bbm_id : id, apnd_file_trg_id: id }

	// id로 상세내역 조회		
	fnAjax("<c:url value='/api/spt/noticeDetail'/>", param, function(data) {

		if(successResCode == data.resCode){
			
			$('#nticItemSno').val(data.NoticeDetail.bbm_id);
			$('#nticTitl').text(data.NoticeDetail.bbm_titl);
			$('#regDttm').text(data.NoticeDetail.reg_dttm);
			$('#regEmpId').text(data.NoticeDetail.reg_emp_id);
			$('#regEmpNm').text(data.NoticeDetail.reg_emp_nm);
			$('#nticCtnt').text(data.NoticeDetail.bbm_ctnt);
			
			for(var idx in data.NoticeFiles) {
				
				var fileName = data.NoticeFiles[idx].apnd_file_nm.split('^');
				$('#downFile1' + idx).text(fileName[1]);
				
				$('#downFile1' + idx).prop('name', data.NoticeFiles[idx].apnd_file_trg_id + '-' + data.NoticeFiles[idx].apnd_file_sno)
				$('#downFile1' + idx).addClass('downFiles');
				
				var filePath = '../../uploadFiles/N/' + data.NoticeFiles[idx].apnd_file_nm;
				
				$('#downFile1' + idx).prop('href', filePath);
			
			}
	
// 			fngetRepl(id);

// 			$('#replList').html('');
// 			$('#replListTbl').addClass('hide');
		}
	});
}

/**********************************************************
 * 공지사항 상세조회
 **********************************************************/
function fnNoticeDetail(id){
	
	var loginUser = "${loginInfo.user_id}";
	
	let param = { bbm_id : id, apnd_file_trg_id: id }

	// id로 상세내역 조회		
	fnAjax("<c:url value='/api/spt/noticeDetail'/>", param, function(data) {

		if(successResCode == data.resCode){
			
			$('#nticItemSno').val(data.NoticeDetail.bbm_id);
			$('#nticTitl').text(data.NoticeDetail.bbm_titl);
			$('#regDttm').text(data.NoticeDetail.reg_dttm);
			$('#regEmpId').text(data.NoticeDetail.reg_emp_id);
			$('#regEmpNm').text(data.NoticeDetail.reg_emp_nm);
			$('#nticCtnt').text(data.NoticeDetail.bbm_ctnt);
			
			if(data.NoticeFiles.length == 0) {
				$('#downFile').hide();
			}
			
			for(var idx in data.NoticeFiles) {
				$('#downFile').show();
				var fileName = data.NoticeFiles[idx].apnd_file_nm.split('^');
				$('#downFile' + idx).text(fileName[1]);
				
				$('#downFile' + idx).prop('name', data.NoticeFiles[idx].apnd_file_trg_id + '-' + data.NoticeFiles[idx].apnd_file_sno)
				$('#downFile' + idx).addClass('downFiles');
				
				var filePath = '../../uploadFiles/N/' + data.NoticeFiles[idx].apnd_file_nm;
				
				$('#downFile' + idx).prop('href', filePath);
			
			}
	
			fngetRepl(id);

			$('#replList').html('');
			$('#replListTbl').addClass('hide');
		}
	});
}
/**********************************************************
 * 공지사항 답변 댓글 조회
 **********************************************************/
function fngetRepl(id){
	
	var loginUser = "${loginInfo.user_id}";
	var loginUserNm = "${loginInfo.user_name}";

	
	var param = { txnId : id };

	fnAjax("<c:url value='/api/spt/getreplyList'/>", param, function(data) {
		
		if(successResCode == data.resCode){
			
			if(data.replyList.length > 0){			
				
				var replyListData = "";
				
				$.each(data.replyList, function(index, list){

					replyListData += "<tr>";
					replyListData += "<td>";
					replyListData += "<div>";
					replyListData += "<span style='white-space: pre;'>"+list.bbm_ctnt+"</span>";
					replyListData += "<br>";
					replyListData += "<span>"+list.reg_emp_id+" | "+list.reg_dttm+"</span>";
					
					if(list.reg_emp_id == loginUser){

						var paramId = list.bbm_id.substring(2,5)+","+list.par_bbm_id.substring(2,5);
							
// 						replyListData += "<button type='button' class='bt bg secondary' id='replyDel_"+list.bbm_id+"_"+list.par_bbm_id+"' style='float: right;' onclick='fnDelRepl("+list.bbm_id+","+list.par_bbm_id+");'>삭제</button>";

						replyListData += "<button type='button' class='bt bg secondary' id='replyDel_"+paramId+"' style='float: right;' onclick='fnDelRepl("+paramId+")'>삭제</button>";
					}	
					replyListData += "</div>";
					replyListData += "</td>";
					replyListData += "</tr>";
				});

				//console.log(replyListData);
				
				$('#replList').html(replyListData);
				$('#replListTbl').removeClass('hide');
			}
		}
		else{
			fnErrorMsg(failResMsg);
		}
	});
	
}	

/**********************************************************
 * VOC 답변 댓글 삭제
 **********************************************************/
function fnDelRepl(bbmId,parBbmId){
	
	var confirmDel = confirm("선택하신 댓글을 삭제하시겠습니까?");
	
	if(confirmDel){

		var bbm_id     = "N_"+bbmId;
		var par_bbm_id = "N_"+parBbmId;
				
		var param = { bbm_id : bbm_id, par_bbm_id : par_bbm_id };
		
		fnAjax("<c:url value='/api/spt/deleteRepl'/>", param, function(data) {
			
			if(successResCode == data.resCode) {
				alert("삭제되었습니다.");
				$('#replSbst').val('');
				$('#replInputCnt').html("<b>0</b><i>/</i>300");
				
				fnNoticeDetail(par_bbm_id);
			} else {
				alert("삭제 오류.");
			}
		});
	}
	else{
		return;
	}
}

	
</script>