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
										<option value="title">제목</option>
										<option value="regPerson">작성자</option>
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
					<!-- <button type="button" class="btRefresh" title="초기화" id="btnSearchInit">초기화</button> -->
				</div>
			</div>

		</div><!--//search-->

		<div class="result">

			<div class="control">

				<span class="count">
					<select id="slcPageSize" name="pageSize" class="select sm">
						<option>25</option>
						<option>50</option>
						<option>75</option>
						<option>100</option>
						<option>200</option>
						<option>300</option>
						<option>전체</option>
					</select>
					<i>화면에 표시할 리스트 갯수</i>
				</span>

				<div class="btns">
					<button type="button" class="bt bg secondary" id="regist">등록</button>
				</div>

			</div><!--//control-->
			
			<!-- <div class="tui-grid" id="grid"></div> -->
			<div class="tui-grid">
				<div id="grid"></div>
			</div>
	
            <!-- PAGING -->
			<div id="divPaging" class="control">

				<span class="count"></span>

				<div class="pages"></div>
			</div><!-- //control -->
		</div><!--//result-->

	</div><!--//pageBody-->

</section>




<!-- [팝업] 공지사항 등록 -->
<article class="popup hide" id="popNoticeRegUpd">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle" id="regPopTitle">공지사항 등록</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody">
			<input type="hidden" id="idx" />
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
						<td colspan="3"><input type="text" class="input" value="" id="regTitle"></td>
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
						<td colspan="3"><textarea class="textarea" placeholder="" id="regContent"></textarea></td>
					</tr>
				</tbody>
			</table>

		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary" id="btnRegNotice" data-mode="regist">저장</button>
				<button type="button" class="bt max bd" id="btnRegPopClose">취소</button>
			</div>
		</div>

	</div>
</article>	
<!--// [팝업] 공지사항 등록 -->




<!-- [팝업] 공지사항 상세 -->
<article class="popup hide" id="popNoticeDetail">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">공지사항 상세</h5>
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
					<tr>
						<th>제목</th>
						<td colspan="3" id="title"></td>
					</tr>
					<tr>
						<th>작성일</th>
						<td id="regDt"></td>
						<th>작성자</th>
						<td id="regNm">${loginInfo.user_name}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3" id="content" style="white-space: pre;"></td>
					</tr>
				</tbody>
			</table>

		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<!-- <a href="" class="bt max bg primary">확인</a> -->
				<button type="button" class="bt max bg primary" id="btnDetailPopClose">확인</button>
			</div>
		</div>

	</div>
</article>	
<!--// [팝업] 공지사항 상세 -->
	
<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/footer" />

<script type="text/javaScript">


$(function(){
	
	// 초기화
	fnInit();
	
	// 이벤트(검색버튼)
	$("#btnSearch").on("click", function(e){
		fnList("1");
	});
	
	// 이벤트(검색초기화버튼)
	$("#btnSearchInit").on("click", function(e){
		$("#searchStr").val("");
	});
	
	// 이벤트(페이지사이즈)
	$("#slcPageSize").on("change", function(e){
		fnStopEvent(e);
		fnList("1");
	});
	
	// 수정
	$(document).on("click", ".user-update", function(e){
		fnStopEvent(e);
		var cell = gridObj["grid"].getFocusedCell();
		console.log("user-update cell==>" + cell.rowKey);
		var idx = fnNullChangeBlank(gridObj["grid"].getValue(cell.rowKey, "idx"));
		
		var param = { idx : idx };
		
		fnAjax("<c:url value='/api/spt/detail'/>", param, function(data) {

			if(successResCode == data.resCode){
				$('#idx').val(data.NoticeDetail.idx);
				$('#regTitle').val(data.NoticeDetail.title);
				$('#regContent').val(data.NoticeDetail.content);
				$('#regDt2').text(data.NoticeDetail.regist_time);
				$('#regNm2').text(data.NoticeDetail.regist_person);
				
				$('#con_cnt').html("("+$('#regContent').val().length+" / 500)");
 			}
			
 		});

		// 팝업타이틀 공지사항 등록 => 수정으로 변경
		$('#regPopTitle').text('공지사항 수정');
		// 저장버튼 => 수정완료로 변경
		$('#btnRegNotice').text('수정완료');
		$('#btnRegNotice').data("mode","update");
		
		// 레이어팝업 보여줌
		$('#popNoticeRegUpd').removeClass('hide');
	});
	
	// 삭제
	$(document).on("click", ".user-delete", function(e){
		fnStopEvent(e);
		
		var confirmDel = confirm("선택하신 공지사항을 '삭제'하시겠습니까?");
		
		if(confirmDel){
			var cell = gridObj["grid"].getFocusedCell();
			console.log("user-delete cell==>" + cell.rowKey);	
			var idx = fnNullChangeBlank(gridObj["grid"].getValue(cell.rowKey, "idx"));
			console.log("del idx==>" + idx);
			
			var param = { idx : idx };
			
			fnAjax("<c:url value='/api/spt/delete'/>", param, function(data) {

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
	
	
	// 상세팝업
 	$(document).on("dblclick", "#grid .tui-grid-table tbody tr td", function(){	
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		let cell = gridObj["grid"].getFocusedCell();
 		
 		let idx = gridObj["grid"].getValue(cell.rowKey, "idx", true);

		let param = { idx : idx }
		
		// idx로 상세내역 조회		
		fnAjax("<c:url value='/api/spt/detail'/>", param, function(data) {

 			if(successResCode == data.resCode){
 				$('#title').text(data.NoticeDetail.title);
				$('#content').text(data.NoticeDetail.content);
				$('#regDt').text(data.NoticeDetail.regist_time);
				$('#regNm').text(data.NoticeDetail.regist_person);
 			}
			
 		});
		
		// 레이어팝업 보여줌
		$('#popNoticeDetail').removeClass('hide');
	}); 
	
	
	// 등록버튼 클릭
	$('#regist').on('click', function(){
		
		var today = new Date();
		var regdate = today.getFullYear()
					+"-"+fnLpad(String((today.getMonth()+1)), 2, "0")
					+"-"+fnLpad(String(today.getDate()), 2, "0"); 

		$('#regDt2').text(regdate);
		
		// 팝업타이틀 공지사항 수정 => 등록으로 변경
		$('#regPopTitle').text('공지사항 등록');
		
		// 수정완료버튼 => 저장으로 변경
		$('#btnRegNotice').text('등록');
		$('#btnRegNotice').data("mode","regist");

		$('#idx').val("");
		$('#regTitle').val("");
		$('#regContent').val("");
		$('#regNm2').text("${loginInfo.user_name}");
		$('#con_cnt').html("(0 / 500)");
		$('#popNoticeRegUpd').removeClass('hide');
	});
	
	// 공지사항 등록 팝업 등록버튼 클릭
	$('#btnRegNotice').click(function(){
		
		if(fnNoticeValChk()){
		
			var params = { 
					title: $('#regTitle').val(),
					content: $('#regContent').val()
			};
			
			if($('#btnRegNotice').data("mode") == "regist"){			
				// 공지사항 등록
		 		fnAjax("<c:url value='/api/spt/regist'/>", params, function(data) {
		
		 			if(data.insertResult == "successed") {
						alert("등록되었습니다.");
						fnList("1");
					} else {
						alert("등록 오류.");
					}
					$('#popNoticeRegUpd').addClass('hide');
		 		});
			}
			else{
				// 파라미터에 idx값 추가
				params.idx = $('#idx').val();
				
				console.log(JSON.stringify(params));
				
				// 공지사항 수정
		 		fnAjax("<c:url value='/api/spt/update'/>", params, function(data) {
		
		 			if(data.updateResult == "successed") {
						alert("수정되었습니다.");
						fnList("1");
					} else {
						alert("수정 오류.");
					}
					$('#popNoticeRegUpd').addClass('hide');
		 		});
			}
		}
	});
	
	// 공지사항 내용 입력시 글자수 count
	$('#regContent').on('keyup', function() {
		
        $('#con_cnt').html("("+$(this).val().length+" / 500)");

        if($(this).val().length > 500) {
            $(this).val($(this).val().substring(0, 500));
            $('#con_cnt').html("(500 / 500)");
        }
    });
	
	// 공지사항 등록/수정 팝업 내 취소 버튼 클릭 이벤트
	$('#btnRegPopClose').on('click', function(){

		$('#idx').val("");
		$('#regTitle').val("");
		$('#regContent').val("");
		$('#regNm2').text("");
		$('#con_cnt').html("(0 / 500)");
		$('#popNoticeRegUpd').addClass('hide');
	});
	
	// 공지사항 상세 팝업 내 확인 버튼 클릭 이벤트
	$('#btnDetailPopClose').on('click', function(){
		$('#title').text("");
		$('#content').text("");
		$('#regDt').text("");
		$('#regNm').text("");
		$('#popNoticeDetail').addClass('hide');
	});
	
});



/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){
	
	// InitGnbLnb
	fnInitGnbLnb(7, 3, 7, 3);
	
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
			  {header:'제목', name:'title', sortable: true, align:'left'}
			, {header:'작성자', name:'regist_person', sortable: true, align:'center', width:150}
			, {header:'등록일자', name:'regist_time', sortable: true, align:'center', width:200}
			, {header:'댓글개수', name:'reply_cnt', align:'center', width:80}
			, {header:'변경', name:'btn_upd_del', align:'center', width:160}
	];
	
	// 그리드 생성
	fnDrawGrid("03", "grid", columnsData);
}

/**********************************************************
 * 리스트(그리드) 조회
 **********************************************************/
function fnList(slcPageNo){
	
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
		searchStr : $("#searchStr").val()
	};
    
	// GRID 리스트 조회
	fnAjax("<c:url value='/api/spt/list'/>", params, function(data) {

		if(successResCode == data.resCode){
			// RESET DATA(그리드)
			gridObj["grid"].resetData(data.NoticeList);
			
			if(loginUserGroup == "사용자"){
		 		gridObj["grid"].hideColumn('btn_upd_del');
		 	}

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
function fnNoticeValChk(){
	if($('#regTitle').val() == ''){
		alert("제목을 입력해주세요.");
		$('#regTitle').focus();
		return false;
	}
	var strByte = byteCheck($('#regTitle').val());
	
	if(strByte > 100){
		alert("제목은 100Byte 이하만 가능합니다.");
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
 
</script>