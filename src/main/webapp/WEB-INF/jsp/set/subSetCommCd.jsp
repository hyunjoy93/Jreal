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
			<li>공통코드</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">공통코드</h2>
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
										<option value="cdColEnNm">컬럼영문명</option>
										<option value="cdColKoNm">컬럼한글명</option>
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

		<div class="result">

			<div class="control">

			</div><!--//control-->
			
			<div class="gridFlex">
				<!-- grid -->
				<div class="tui-grid" style="width:50%;">
					<div id="grid"></div>
				</div>
				<div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
				<!-- GRID2 -->
				<div class="tui-grid" style="width:50%;">
					<div id="grid2"></div>
				</div>
			</div>
            <!-- PAGING -->
			<div id="divPaging" class="control">

				<span class="count"></span>

				<div class="pages"></div>

			</div><!--//control-->

		</div><!--//result-->

	</div><!--//pageBody-->

</section>

	
<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/footer" />

<script type="text/javaScript">


$(function(){  // === $(document).ready
	// 초기화
	fnInit();
	//코드 상세 초기화
	var initParam = {
			colEnNm : 'APND_FILE_SEP_CD'
	}
	detailSearch(initParam);
	
	function detailSearch(param){
		/**********************************************************
		 * 초기화(그리드)
		 **********************************************************/
		function fnInitGrid2(){
			
			// 코드 상세 리스트 조회
			fnList2("1");
			
			// 그리드 컴럼 정보
			var columnsData = [
					  {header:'컬럼영문명', name:'col_en_nm', width:200, align:'center'}
					, {header:'컬럼한글명', name:'col_ko_nm', width:200, align:'center'}
					, {header:'코드값'   , name:'cd_effv_val', width:200, align:'center'}
					, {header:'코드값설명' , name:'cd_desc'}
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
			    
				params.colEnNm = param.colEnNm;
				// GRID 리스트 조회
				fnAjax("<c:url value='/api/set/commcdDetailList'/>", params, function(data) {

					if(successResCode == data.resCode){
						// RESET DATA(그리드)
						gridObj["grid2"].resetData(data.CommCdDetailList);
						
					}else{
						// 경고메세지
						fnWarnMsg('조회에 실패했습니다.');
					}
				});
			}
		}
		fnInitGrid2();

	}

	
	// 코드 상세 내용 그리드
 	$(document).on("click", "#grid .tui-grid-table tbody tr td", function(e){	
// 	$('#gird1').on('focusChange', function(ev){
 		
		$('#grid2').empty();
		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		let cell = gridObj["grid"].getFocusedCell();
 		
 		let colEnNm = gridObj["grid"].getValue(cell.rowKey, "col_en_nm", true);
		
		let param = { colEnNm : colEnNm }

 		detailSearch(param); 

	});
		
	// 검색 조건 입력 후 조회
	$("#btnSearch").on("click", function(e){
		fnList("1");
		gridObj["grid2"].resetData([]);
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
});

/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){
	
	// 메뉴 초기화
	fnInitGnbLnb(4, 2, 4, 2);
	
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
			  {header:'컬럼영문명', name:'col_en_nm', width:200}
			, {header:'컬럼한글명', name:'col_ko_nm', width:200}
			, {header:'컬럼설명' , name:'col_desc'}
	];
	
	// 그리드 생성
	fnDrawGrid("06", "grid", columnsData);

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
	fnAjax("<c:url value='/api/set/commcdlist'/>", params, function(data) {

		if(successResCode == data.resCode){
			// RESET DATA(그리드)
			gridObj["grid"].resetData(data.CommCdList);

		}else{
			// 경고메세지
			fnWarnMsg('조회에 실패했습니다.');
		}
	});
}

</script>