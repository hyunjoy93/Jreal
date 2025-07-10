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
			<li>운영관리</li>
			<li>계약관리</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">계약관리</h2>
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
								<td style="padding-right:4px">
									<select class="select md" id="searchType" >
										<option value="asetNm">소재지</option>
									</select>
								</td>
								<td>
 									<p id="inputContainer">
										<input type="text" class="input xxl" value="" placeholder="검색어입력" id="searchStr">
	 								</p>
 									<p id="dateContainer">	
 										<input id="baseDt" type="text" class="input date" placeholder="기준일자" readonly> 
									</p> 
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

				<div class="btns">
					<!-- 
					<button type="button" class="bt bg secondary" id="downForm">양식다운로드</button>
					<button type="button" class="bt bg secondary" id="totInsert">업체일괄추가</button> 
					-->
					<button type="button" class="bt bg secondary" id="insertMntc">계약추가</button>
				</div>
			</div><!--//control-->
			
			<!-- GRID -->
			<div class="tui-grid">
				<div id="grid"></div>
			</div>
			
            <!-- PAGING -->
			<div id="divPaging" class="control">

				<span class="count"></span>

				<div class="pages"></div>

			</div><!--//control-->

		</div><!--//result-->

	</div><!--//pageBody-->

</section>

<!-- [팝업] 게약 추가 -->
<article class="popup hide" id="insertMntcPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">계약 추가</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody cols">
			<div class="panel fix">
				<p style="font-size: 14px; font-weight:600;">⊙ 매물목록</p>
				<div class="tui-grid" id = "asetListGrid2">
					<div id="gridAsetList2" style="height: 400px;"></div>
				</div>
			</div>
			<div class="panel fix">
				<table class="field">
					<colgroup>
						<col width="100px">
						<col width="270px">
						<col width="280px">
					</colgroup>
					<tbody>
						<p style="font-size: 14px; font-weight:600; margin-bottom: 5px;">⊙ 계약상세</p>
						<tr hidden="true">
							<th>계약일련번호</th>
							<td><input type="text" class="input" value="" id="popMntcCtrtSno" readonly></td>
						</tr>
						<tr hidden="true">
							<th>매물ID</th>
							<td><input type="text" class="input md" value="" id="popAsetId"></td>
						</tr>
						<tr hidden="true">
							<th>매물명<span  style="color: red">*</span ></th>
							<td><input type="text" class="input md" value="" id="popAsetNm" readonly>
								<button type="button" class="btFind bg primary"  id="popSearchAsetList" >검색</button>
							</td>
						</tr>
						<tr  hidden="true">
							<th>매물분류ID</th>
							<td><input type="text" class="input md" value="" id="popAsetClsfId"></td>
						</tr>
						<tr hidden="true">
							<th>매물분류명</th>
							<td><input type="text" class="input" value="" id="popAsetClsfNm" readonly>
							</td>
						</tr>
						<!-- 회사명은 select 박스로 corp 테이블에서 조회해서 보여줘야 함, 한글명만 보여주고 ID는 HIDDEN으로 처리 필요-->
						 <tr>
							<th>계약담당자(정)<span  style="color: red">*</span ></th>
							<td>
								<input id="popAsetChrgEmpId1" hidden="true">
								<input type="text" class="input md" value="" id="popAsetChrgEmpNm1" readonly>
								<button type="button" class="btFind bg primary"  id="popSearchChrgEmpJung" >검색</button>
							</td>
						</tr>
						<tr>
							<th>계약담당자(부)<span  style="color: red">*</span ></th>
							<td>
								<input id="popAsetChrgEmpId2" hidden="true">
								<input type="text" class="input md" value="" id="popAsetChrgEmpNm2" readonly>
								<button type="button" class="btFind bg primary"  id="popSearchChrgEmpBu" >검색</button>
							</td>
						</tr>
						<tr>
							<th>계약시작일자<span  style="color: red">*</span ></th>
							<td><input id="popCtrtStrtDt" type="text" class="input date" placeholder="계약시작일자" readonly></td>
						</tr> 
						<tr>
							<th>계약종료일자<span  style="color: red">*</span ></th>

							<td><input id="popCtrtEndDt" type="text" class="input date" placeholder="계약종료일자" readonly></td>
						</tr>
						<tr>
						    <th>계약일<span style="color: red">*</span></th>
						    <!-- 날짜 선택 input -->
						    <td><input id="popCtrtDt" type="text" class="input date" placeholder="계약일자" readonly>   <!-- 날짜 --> </td>
						</tr>
						<tr>
							<th>계약시간<span style="color: red">*</span></th>
						    <!-- 시간 선택 select box -->
						    <td>
						        <select id="popCtrtHour" class="select md">
						            <option value="">시간 선택</option>
						            <!-- 0~24 시간 옵션 -->
						            <option value="00">00</option>
						            <option value="01">01</option>
						            <option value="02">02</option>
						            <option value="03">03</option>
						            <option value="04">04</option>
						            <option value="05">05</option>
						            <option value="06">06</option>
						            <option value="07">07</option>
						            <option value="08">08</option>
						            <option value="09">09</option>
						            <option value="10">10</option>
						            <option value="11">11</option>
						            <option value="12">12</option>
						            <option value="13">13</option>
						            <option value="14">14</option>
						            <option value="15">15</option>
						            <option value="16">16</option>
						            <option value="17">17</option>
						            <option value="18">18</option>
						            <option value="19">19</option>
						            <option value="20">20</option>
						            <option value="21">21</option>
						            <option value="22">22</option>
						            <option value="23">23</option>
						            <option value="24">24</option>
						        </select> 시
						    </td>

						    <!-- 분 선택 select box -->
						    <td>
						        <select id="popCtrtMinute" class="select md">
						            <option value="">분 선택</option>
						            <option value="00">00</option>
						            <option value="30">30</option>
						        </select> 분
						    </td>
						</tr> 
						<tr>
							<th>계약구분</th>
							<td>
								<select class="select md" id="popMntcCtrtSepCd">
									<option value="A" selected>주택매매</option>
									<option value="B">주택 외 매매</option>
									<option value="C">주택임대차</option>
									<option value="D">상가임대차</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
	
			</div><!--//conBody-->
		</div>
		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary" id="btnSave">저장</button>
				<button type="button" class="bt max bd btClose" id="btnCancleAndClose">취소</button>
			</div>
		</div>

	</div>
</article>	

<!-- [팝업] 계약 수정-->

<article class="popup hide" id="updateMntcPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">계약 수정</h5>
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
						<th>계약일련번호</th>
						<td><input type="text" class="input" value="" id="mntcCtrtSno"></td>
					</tr>
					<tr hidden="true">
						<th>자산ID</th>
						<td><input type="text" class="input md" value="" id="asetId"></td>
					</tr>
					<tr>
						<th>행정구분<span  style="color: red">*</span ></th>
						<td><input type="text" class="input" value="" id="asetClsfId2" readonly>
<!-- 							<button type="button" class="btFind bg primary"  id="searchAsetList" >검색</button> -->
						</td>
					</tr>
					<tr  hidden="true">
						<th>자산분류ID</th>
						<td><input type="text" class="input md" value="" id="asetClsfId"></td>
					</tr>
					<tr>
						<th>행정동</th>
						<td><input type="text" class="input" value="" id="asetClsfNm" readonly>
						</td>
					</tr> 
					<tr>
						<th>소재지</th>
						<td><input type="text" class="input" value="" id="asetNm2" readonly>
						</td>
					</tr> 
					<!-- 회사명은 select 박스로 corp 테이블에서 조회해서 보여줘야 함, 한글명만 보여주고 ID는 HIDDEN으로 처리 필요-->
					 <tr>
						<th>계약담당자(정)<span  style="color: red">*</span ></th>
						<td>
							<input id="asetChrgEmpId1" hidden="true">
							<input type="text" class="input md" value="" id="asetChrgEmpNm1" readonly>
							<button type="button" class="btFind bg primary"  id="searchChrgEmpJung" >검색</button>
						</td>
					</tr>
					<tr>
						<th>계약담당자(부)<span  style="color: red">*</span ></th>
						<td>
							<input id="asetChrgEmpId2" hidden="true">
							<input type="text" class="input md" value="" id="asetChrgEmpNm2" readonly>
							<button type="button" class="btFind bg primary"  id="searchChrgEmpBu" >검색</button>
						</td>
					</tr>
					<tr>
						<th>계약시작일자<span  style="color: red">*</span ></th>
						<td><input id="ctrtStrtDt" type="text" class="input date" placeholder="계약시작일자" readonly></td>
					</tr> 
					<tr>
						<th>계약종료일자<span  style="color: red">*</span ></th>
						<td><input id="ctrtEndDt" type="text" class="input date" placeholder="계약종료일자" readonly></td>
					</tr>
					<tr>
					    <th>계약일<span style="color: red">*</span></th>
					    <!-- 날짜 선택 input -->
					    <td><input id="ctrtDt" type="text" class="input date" placeholder="계약일자" readonly>   <!-- 날짜 --> </td>
					</tr>
					<tr>
						<th>계약시간<span style="color: red">*</span></th>
					    <!-- 시간 선택 select box -->
					    <td>
					        <select id="ctrtHour" class="select md">
					            <option value="">시간 선택</option>
					            <!-- 0~24 시간 옵션 -->
					            <option value="00">00</option>
					            <option value="01">01</option>
					            <option value="02">02</option>
					            <option value="03">03</option>
					            <option value="04">04</option>
					            <option value="05">05</option>
					            <option value="06">06</option>
					            <option value="07">07</option>
					            <option value="08">08</option>
					            <option value="09">09</option>
					            <option value="10">10</option>
					            <option value="11">11</option>
					            <option value="12">12</option>
					            <option value="13">13</option>
					            <option value="14">14</option>
					            <option value="15">15</option>
					            <option value="16">16</option>
					            <option value="17">17</option>
					            <option value="18">18</option>
					            <option value="19">19</option>
					            <option value="20">20</option>
					            <option value="21">21</option>
					            <option value="22">22</option>
					            <option value="23">23</option>
					            <option value="24">24</option>
					        </select> 시
					    </td>

					    <!-- 분 선택 select box -->
					    <td>
					        <select id="ctrtMinute" class="select md">
					            <option value="">분 선택</option>
					            <option value="00">00</option>
					            <option value="30">30</option>
					        </select> 분
					    </td>
					</tr> 
					<tr>
						<th>계약구분</th>
						<td>
							<select class="select md" id="mntcCtrtSepCd">
								<option value="A" selected>주택매매</option>
								<option value="B">주택 외 매매</option>
								<option value="C">주택임대차</option>
								<option value="D">상가임대차</option>
							</select>
						</td>
					</tr>
					<tr hidden="true">
						<th>삭제여부</th>
						<td>
							<select class="select md" id="delYn">
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
				<button type="button" class="bt max bg primary" id="updSave">저장</button>
				<button type="button" class="bt max bd btClose" id="updCancleAndClose">취소</button>
			</div>
		</div>

	</div>
</article>	


<!-- [팝업] 자산 정보 -->
<article class="popup hide" id="asetListPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle" id="AsetTitle">자산검색</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="result">
			<div class="tui-grid" id = "asetListGrid" style="height: 500px;">
				<div id="gridAsetList"></div>
			</div>
		</div><!--//result-->

	</div>

</article>	
	

<!-- [팝업] 회사 정보 -->
<article class="popup hide" id="corpListPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle" id="corpNmTitle">업체검색</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="result">
			<div class="tui-grid" id = "corpListGrid" style="height: 300px;">
				<div id="gridCorpList"></div>
			</div>
		</div><!--//result-->

	</div>

</article>	


<!-- [팝업] 결재자[정] 권한 사원 정보 -->
<article class="popup hide" id="chrgEmpJungListPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle" id="apvlPopTitle">자산담당자(정) 검색</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="result">
			<div class="tui-grid" id = "apvlEmpGrid" style="height: 500px;">
				<div id="gridChrgJungEmpList"></div>
			</div>
		</div><!--//result-->

	</div>

</article>	

<!-- [팝업] 결재자[부] 권한 사원 정보 -->
<article class="popup hide" id="chrgEmpBuListPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle" id="apvlPopTitle">자산담당자(부) 검색</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="result">
			<div class="tui-grid" id = "apvlEmpGrid" style="height: 500px;">
				<div id="gridChrgBuEmpList"></div>
			</div>
		</div><!--//result-->

	</div>

</article>	
	


<!-- [팝업] 담당자 권한 사원 정보 -->
<article class="popup hide" id="mntcEmpListPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle" id="mntcEmpPopTitle">유지보수담당자 검색</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="result">
			<div class="tui-grid" id = "mntcEmpGrid" style="height: 500px;">
				<div id="gridMntcEmpList"></div>
			</div>
		</div><!--//result-->

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
	

	//검색조건 기간 필터
	$('#searchType').on('change', function(e) {
		var conditionSelect = document.getElementById('searchType');
		var inputContainer  = document.getElementById('inputContainer');
		var dateContainer   = document.getElementById('dateContainer');
		var condition       = conditionSelect.value;
		
		// 선택된 값에 따라 적절한 내용 추가
		if (condition != 'mntcBaseDt') {
		  	$('#inputContainer').show();
		  	$('#dateContainer').hide();
		  	$('#mntcBaseDt').val("");
		} else {
		  	$('#inputContainer').hide();
		  	$('#dateContainer').show();	
		  	$('#searchStr').val("");
		}
	});
		
	
	$('#dateContainer').hide();
	
	// 계약 추가
	$("#insertMntc").on("click", function(e){
		
		fnStopEvent(e);
		
		$('#gridAsetList2').empty();
		
// 		var sno = gridObj["grid"].getValue(0, "mntc_ctrt_sno", true);
		var comPareList = consParamsData.map(function(v) {
			return v.mntc_ctrt_sno
		});
		
		var maxSno = 0;
		if(comPareList.length >= 1) {
			maxSno = Math.max(...comPareList);
		}
		
		$("#popMntcCtrtSno").val(maxSno+1);
		
		$("#popAsetId").val();
		$("#popAsetNm").val("");
		$("#popAsetClsfNm").val("");
		$("#popAsetChrgEmpNm2").val("");
		$("#popAsetChrgEmpNm1").val("");
		$("#popMntcEmpNm").val("");
		$("#popCorpKoNm").val("");
		$("#popCtrtStrtDt").val("");
		$("#popCtrtEndDt").val("");
		$("input:checkbox[name='popRglrChkDt']:checked").each(function() {
			$(this).prop('checked', false);
		})
		
 		fnInitAsetGrid2();
 		
		fnStopEvent(e);
		
		let param = { asetId : "" };		
		
		// GRID 리스트 조회
		fnAjax("<c:url value='/api/aset/asetList'/>", param, function(data) {
			
			if(successResCode == data.resCode){
				// RESET DATA(그리드)
				gridObj["gridAsetList2"].resetData(data.asetList);
						
			}else{
				// 경고메세지
				fnWarnMsg('조회에 실패했습니다.');
			}
		});
		
		$('#insertMntcPopup').removeClass('hide');	
	});
	

	// 계약 추가 팝업에서 저장 버튼 클릭
	$("#btnSave").on("click", function(e){
		fnStopEvent(e);
		console.log("팝업-저장 click");
		
		//input data null체크 진행
		if(fnPopNullCheck() == false) {
			$("#popAsetNm").focus();
			return;
		};
		
		var asetId = ''; // 여기다가 값을 넣을 예정

		// gridAsetList2에서 체크된 로우의 aset_id 가져오기
		var checkedRow = gridObj["gridAsetList2"].getCheckedRows(); // 체크된 로우를 가져옵니다.
		if (checkedRow.length === 1) {
		    asetId = checkedRow[0].aset_id; // 체크된 로우의 aset_id를 asetId에 저장
		} else {
			alert("왼쪽 그리드에서 매물을 선택해주세요.");
		}
				
		var param = {	
				popMntcCtrtSno   : parseInt($("#popMntcCtrtSno").val())
			  , popAsetChrgEmpId1: $("#popAsetChrgEmpId1").val()
			  , popAsetChrgEmpId2: $("#popAsetChrgEmpId2").val()
			  , popCtrtStrtDt    : $("#popCtrtStrtDt").val().replaceAll('-', '')
			  , popCtrtEndDt     : $("#popCtrtEndDt").val().replaceAll('-', '')
			  , popCtrtDt        : $("#popCtrtDt").val().replaceAll('-', '')
			  , popMntcCtrtSepCd : $("#popMntcCtrtSepCd").val()
			  , popCtrtHour      : $("#popCtrtHour").val()
			  , popCtrtMinute    : $("#popCtrtMinute").val()
			  , popMntcCtrtSepCd : $("#popMntcCtrtSepCd").val()
			  , regEmpId         : loginUserId
			  , popAsetId : asetId
		}				
		
		console.log(param);

		fnAjax("<c:url value='/api/mntc/mntcDupChk'/>", param, function(data){
			
			if ( data.dupCnt > 0 ){

				alert("계약일자가 겹치는 자산입니다. 확인 바랍니다.");
			
			} else {
				
				fnAjax("<c:url value='/api/mntc/add'/>", param, function(data){
					
					if(successResCode == data.resCode) {
						alert("계약이 추가되었습니다.");
						// 리스트 새로고침
						fnList("1");
						$(".btClose").click();
						/* $("#popEmpId").attr("disabled", false); */
					} else {
						alert("계약 추가에 실패했습니다.");
					}
				});		
			}
			
		});

		
		
	});

	
	//계약 수정
	$(document).on("click", ".mntc-update", function(e){
		 		
		fnStopEvent(e);
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		var cell = gridObj["grid"].getFocusedCell();	
 		var mntcCtrtSno = gridObj["grid"].getValue(cell.rowKey, "mntc_ctrt_sno", true); 		
 		
 		fnPopupData(mntcCtrtSno);
		$("#mntcCtrtSno").prop("disabled", true);
		// 레이어팝업 보updateEmpPopup
		$('#updateMntcPopup').removeClass('hide');
		
		var updMntcData = fnNullChangeBlank(gridObj["grid"].getRow(cell.rowKey));
		console.log("수정할 데이터 >>>>> " + JSON.stringify(updMntcData));
		
	});
	
	// 수정 팝업에서 저장 버튼 클릭
	$("#updSave").on("click", function(e){
		fnStopEvent(e);
		console.log("수정-저장 click");
		
		//input data null체크 진행
		if(fnNullCheck() == false) {
			return;
		};
		
		var rglrChkDtList = [];
		$("input:checkbox[name='rglrChkDt']:checked").each(function() {
			rglrChkDtList.push(Number($(this).val()));
		});
		
		var param = {	
				mntcCtrtSno   : parseInt($("#mntcCtrtSno").val())
			  , asetChrgEmpId1: $("#asetChrgEmpId1").val()
			  , asetChrgEmpId2: $("#asetChrgEmpId2").val()
			  , ctrtStrtDt    : $("#ctrtStrtDt").val().replaceAll('-', '')
			  , ctrtEndDt     : $("#ctrtEndDt").val().replaceAll('-', '')
			  , ctrtDt        : $("#ctrtDt").val().replaceAll('-', '')
			  , mntcCtrtSepCd : $("#mntcCtrtSepCd").val()
			  , ctrtHour      : $("#ctrtHour").val()
			  , ctrtMinute    : $("#ctrtMinute").val()
			  , mntcCtrtSepCd : $("#mntcCtrtSepCd").val()
			  , regEmpId         : loginUserId
		}				
		console.log(param);		
		
		fnAjax("<c:url value='/api/mntc/update'/>", param, function(data){
			if(successResCode == data.resCode) {
				alert("계약이 수정되었습니다.");
				// 리스트 새로고침
				fnList("1");
				$(".btClose").click();
			} else {
				alert("계약 수정에 실패했습니다.");
			}
		});
	});
			
	// 계약 정보 삭제
	$(document).on("click", ".mntc-delete", function(e){
		fnStopEvent(e);
		var cell = gridObj["grid"].getFocusedCell();
		console.log("mntc-delete cell==>" + cell.rowKey);	
		
		
		var mntcCtrtSno = fnNullChangeBlank(gridObj["grid"].getValue(cell.rowKey, "mntc_ctrt_sno"));
		console.log("del mntc_ctrt_sno ==>" + mntcCtrtSno);	
						
		var param = {
				mntcCtrtSno : mntcCtrtSno
			  , modEmpId      : loginUserId
		}
		
		console.log(param);
		
		if (!confirm("정말 삭제하시겠습니까?")) {
	        // 취소(아니오) 버튼 클릭 시 이벤트
			alert("삭제 취소되었습니다.");
	    } else {
	        // 확인(예) 버튼 클릭 시 이벤트
	    	fnAjax("<c:url value='/api/mntc/delete'/>", param, function(data){
				if(successResCode == data.resCode) {
					alert("계약 삭제에 성공했습니다.");
					// 리스트 새로고침
					fnList("1");
				} else {
					alert("계약 삭제에 실패했습니다.");
				}
			});
	    }
	});
	

	// 업체 보유 자산 내용 팝업 호출
 	$(document).on("click","#asetDetail", function(e){	
		

 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		var cell   = gridObj["grid"].getFocusedCell();	
 		var asetId = gridObj["grid"].getValue(cell.rowKey, "aset_id", true); 		
 				
		var output = [];
		
		/* [남정석, 2023-05-20] 자산분류 최하위 대상 추출 필요, sql 추가하고 해당 sql 호출 해야 함 */
		
		fnAjax("<c:url value='/api/set/asetClsfList'/>", null, function(data) {
			if(successResCode == data.resCode){
				var treeUpperList = [];
				var asetClsfList  = data.asetClsfList;
				
				for(var idx in asetClsfList) {
					//if(asetList[idx].aset_lvl == "1" && asetList[idx].par_aset_clsf_id == "0") {
					if(asetClsfList[idx].leaf_yn == "Y" ) {
						var asetUpperMap={
						    cd      : asetClsfList[idx].aset_clsf_id,
						    nm      : asetClsfList[idx].par_aset_clsf_nm + " > " + asetClsfList[idx].aset_clsf_nm
						};
						
						output.push('<option value="'+ asetUpperMap.cd +'">'+ asetUpperMap.nm +'</option>');
					};
					$("#asetClsfId").html(output.join(''));
				};
			} else {
				alert("상위자산 목록을 불러오는데 실패했습니다. 관리자에게 문의해주세요.");
				$("#asetClsfId").empty();
			}
		});
		

 		fnPopupData(asetId);
		$("#asetId").prop("disabled", true);
		
		// 레이어팝업 보여줌
		$('#asetDetailPopup').removeClass('hide');
	}); 
	
	//-----------------------------------------------------------------//

	// 계약추가, 자산정보 팝업 호출
 	$('#popSearchAsetList').on("click", function(e){
 		
		e.preventDefault();

		$('#asetNm').val("");
 		$('#gridAsetList').empty();


 		fnInitAsetGrid();
 		
		fnStopEvent(e);
		
		let param = { asetId : "" };		
		
		fnDetailList(param);
		
		$(document).on("click", "#gridAsetList .tui-grid-table tbody tr td", function(e){
			e.preventDefault();
			
			$('#gridAsetList').empty();
			
	 		let cell = gridObj["gridAsetList"].getFocusedCell();

	 		let asetId      = gridObj["gridAsetList"].getValue(cell.rowKey, "aset_id", true);
	 		let asetNm      = gridObj["gridAsetList"].getValue(cell.rowKey, "aset_nm", true);
	 		let asetClsfId  = gridObj["gridAsetList"].getValue(cell.rowKey, "aset_clsf_id", true);
	 		let asetClsfNm  = gridObj["gridAsetList"].getValue(cell.rowKey, "aset_clsf_nm", true);

			$('#popAsetNm').val('');
			$('#popAsetClsfNm').val('');
			
			$('#popAsetId').val(asetId);
			$('#popAsetNm').val(asetNm);
			$('#popAsetClsfId').val(asetClsfId);
			$('#popAsetClsfNm').val(asetClsfNm);
			
			$('#asetListPopup').addClass('hide');
	 	});
		
		/**********************************************************
		 * 리스트(그리드) 조회
		 **********************************************************/
		function fnDetailList(param){
		    
			// GRID 리스트 조회
			fnAjax("<c:url value='/api/aset/asetList'/>", param, function(data) {
				
				if(successResCode == data.resCode){
					// RESET DATA(그리드)
					gridObj["gridAsetList"].resetData(data.asetList);
							
				}else{
					// 경고메세지
					fnWarnMsg('조회에 실패했습니다.');
				}
			});
		}
		// 레이어팝업 보여줌
		$('#asetListPopup').removeClass('hide');
	}); 

	// 계약수정, 자산정보 팝업 호출
 	$('#searchAsetList').on("click", function(e){
 		
		e.preventDefault();

		//$('#corpKoNm').val("");
 		$('#gridAsetList').empty();

 		fnInitAsetGrid();
 		
		fnStopEvent(e);

		let param = { asetId : "" };

		fnDetailList(param);
		
		$(document).on("click", "#gridAsetList .tui-grid-table tbody tr td", function(e){

			$('#gridAsetList').empty();
			
	 		let cell = gridObj["gridAsetList"].getFocusedCell();

	 		let asetId      = gridObj["gridAsetList"].getValue(cell.rowKey, "aset_id", true);
	 		let asetNm      = gridObj["gridAsetList"].getValue(cell.rowKey, "aset_nm", true);
	 		let asetClsfId  = gridObj["gridAsetList"].getValue(cell.rowKey, "aset_clsf_id", true);
	 		let asetClsfNm  = gridObj["gridAsetList"].getValue(cell.rowKey, "aset_clsf_nm", true);

			$('#asetNm').val('');
			$('#asetClsfNm').val('');
			
			$('#asetId').val(asetId);
			$('#asetNm').val(asetNm);
			$('#asetClsfId').val(asetClsfId);
			$('#asetClsfNm').val(asetClsfNm);
			
			$('#asetListPopup').addClass('hide');
	 	});
		
		/**********************************************************
		 * 리스트(그리드) 조회
		 **********************************************************/
		function fnDetailList(param){
		    
			// GRID 리스트 조회
			fnAjax("<c:url value='/api/aset/asetList'/>", param, function(data) {
				
				if(successResCode == data.resCode){
					// RESET DATA(그리드)
					gridObj["gridAsetList"].resetData(data.asetList);
							
				}else{
					// 경고메세지
					fnWarnMsg('조회에 실패했습니다.');
				}
			});
		}
		// 레이어팝업 보여줌
		$('#asetListPopup').removeClass('hide');
	}); 
	
	
	//-----------------------------------------------------------------//

	// 계약추가, 업체정보 팝업 호출
 	$('#popSearchCorpList').on("click", function(e){
 		
		e.preventDefault();

		$('#corpKoNm').val("");
 		$('#gridCorpList').empty();

		fnStopEvent(e);
		
		let param = { corpId : "" };		
		
		fnDetailList(param);
		
		$(document).on("click", "#gridCorpList .tui-grid-table tbody tr td", function(e){
			e.preventDefault();
			
			$('#gridCorpList').empty();
			
	 		let cell = gridObj["gridCorpList"].getFocusedCell();

	 		let corpId   = gridObj["gridCorpList"].getValue(cell.rowKey, "corp_id", true);
	 		let corpKoNm = gridObj["gridCorpList"].getValue(cell.rowKey, "corp_ko_nm1", true);
				 		
			$('#popCorpKoNm').val('');
			$('#popCorpId').val(corpId);
			$('#popCorpKoNm').val(corpKoNm);
			
			$('#corpListPopup').addClass('hide');
	 	});
		
		/**********************************************************
		 * 리스트(그리드) 조회
		 **********************************************************/
		function fnDetailList(param){
		    
			// GRID 리스트 조회
			fnAjax("<c:url value='/api/corp/corpList'/>", param, function(data) {
				
				if(successResCode == data.resCode){
					// RESET DATA(그리드)
					gridObj["gridCorpList"].resetData(data.corpList);
							
				}else{
					// 경고메세지
					fnWarnMsg('조회에 실패했습니다.');
				}
			});
		}
		// 레이어팝업 보여줌
		$('#corpListPopup').removeClass('hide');
	}); 

	// 계약수정, 업체정보 팝업 호출
 	$('#searchCorpList').on("click", function(e){
 		
		e.preventDefault();

		//$('#corpKoNm').val("");
 		$('#gridCorpList').empty();

		fnStopEvent(e);

		let param = { corpId : "" };

		fnDetailList(param);
		
		$(document).on("click", "#gridCorpList .tui-grid-table tbody tr td", function(e){
			e.preventDefault();
			
			$('#gridCorpList').empty();
			
	 		let cell = gridObj["gridCorpList"].getFocusedCell();

	 		let corpId   = gridObj["gridCorpList"].getValue(cell.rowKey, "corp_id", true);
	 		let corpKoNm = gridObj["gridCorpList"].getValue(cell.rowKey, "corp_ko_nm1", true);
				 		
			$('#corpKoNm').val('');
			$('#corpId').val(corpId);
			$('#corpKoNm').val(corpKoNm);

// 			$('#corpKoNm').val(deptNm + ' > ' + empNm);
			
			$('#corpListPopup').addClass('hide');
	 	});
		
		/**********************************************************
		 * 리스트(그리드) 조회
		 **********************************************************/
		function fnDetailList(param){
		    
			// GRID 리스트 조회
			fnAjax("<c:url value='/api/corp/corpList'/>", param, function(data) {
				
				if(successResCode == data.resCode){
					// RESET DATA(그리드)
					gridObj["gridCorpList"].resetData(data.corpList);
							
				}else{
					// 경고메세지
					fnWarnMsg('조회에 실패했습니다.');
				}
			});
		}
		// 레이어팝업 보여줌
		$('#corpListPopup').removeClass('hide');
	}); 
	

	// 이벤트(페이지사이즈)
	$("#slcPageSize").on("change", function(e){
		fnStopEvent(e);
		fnList("1");
	});
	
});
	

function fnPopNullCheck(){
	
	
	var checkedRow = gridObj["gridAsetList2"].getCheckedRows(); // 체크된 로우를 가져옵니다.

	if (checkedRow.length === 0) {
		alert("왼쪽 그리드에서 매물을 선택해주세요.");
		return false;
	}
	if ($("#popAsetChrgEmpNm1").val() == "" || $("#popAsetChrgEmpNm1").val() == null || $("#popAsetChrgEmpNm1").val() == undefined) {
		alert("자산담당자(정)명을 입력해주세요.");
		return false;
	} else if ($("#popAsetChrgEmpNm2").val() == "" || $("#popAsetChrgEmpNm2").val() == null || $("#popAsetChrgEmpNm2").val() == undefined) {
		alert("자산담당자(부)명을 입력해주세요.");
		return false;
	}	else if ($("#popCtrtStrtDt").val() == "" || $("#popCtrtStrtDt").val() == null || $("#popCtrtStrtDt").val() == undefined) {
		alert("계약시작일자를 입력해주세요.");
		return false;
	} else if ($("#popCtrtEndDt").val() == "" || $("#popCtrtEndDt").val() == null || $("#popCtrtEndDt").val() == undefined) {
		alert("계약종료일자를 입력해주세요.");
		return false;
	} else if ($("#popCtrtDt").val() == "" || $("#popCtrtDt").val() == null || $("#popCtrtDt").val() == undefined) {
		alert("계약일을 입력해주세요.");
		return false;
	} else if ($("#popCtrtHour").val() == "" || $("#popCtrtHour").val() == null || $("#popCtrtHour").val() == undefined) {
		alert("계약시간을 입력해주세요.");
		return false;
	} else if ($("#popCtrtMinute").val() == "" || $("#popCtrtMinute").val() == null || $("#popCtrtMinute").val() == undefined) {
		alert("계약시간을 입력해주세요.");
		return false;
	}; 
	
	if ($("#popCtrtEndDt").val() <= $("#popCtrtStrtDt").val()) {
		alert("계약종료일자는 계약시작일자보다 이후여야 합니다.");
		return false;
	}; 
}



function fnNullCheck(){
	
	if ($("#asetChrgEmpNm2").val() == "" || $("#asetChrgEmpNm2").val() == null || $("#asetChrgEmpNm2").val() == undefined) {
		alert("자산담당자(정)명을 입력해주세요.");
		return false;
	} else if ($("#asetChrgEmpNm1").val() == "" || $("#asetChrgEmpNm1").val() == null || $("#asetChrgEmpNm1").val() == undefined) {
		alert("자산담당자(부)명을 입력해주세요.");
		return false;
	}	else if ($("#ctrtStrtDt").val() == "" || $("#ctrtStrtDt").val() == null || $("#ctrtStrtDt").val() == undefined) {
		alert("계약시작일자를 입력해주세요.");
		return false;
	} else if ($("#ctrtEndDt").val() == "" || $("#ctrtEndDt").val() == null || $("#ctrtEndDt").val() == undefined) {
		alert("계약종료일자를 입력해주세요.");
		return false;
	} else if ($("#ctrtDt").val() == "" || $("#ctrtDt").val() == null || $("#ctrtDt").val() == undefined) {
		alert("계약일을 입력해주세요.");
		return false;
	} else if ($("#ctrtHour").val() == "" || $("#ctrtHour").val() == null || $("#ctrtHour").val() == undefined) {
		alert("계약시간을 입력해주세요.");
		return false;
	}; 

	if ($("#ctrtEndDt").val() <= $("#ctrtStrtDt").val()) {
		alert("계약종료일자는 계약시작일자보다 이후여야 합니다.");
		return false;
	}; 
	
// 	else if ($("#rglrChkDt").val() == "" || $("#rglrChkDt").val() == null || $("#rglrChkDt").val() == undefined) {
// 		alert("정기점검일자를 입력해주세요.");
// 		return false;
// 	} 
}

/**********************************************************
 * 초기화
 **********************************************************/

var consParamsData;
function fnInit(){
	
	// 메뉴 초기화
	fnInitGnbLnb(2, 4, 2, 4);
	
	// 그리드 초기화
	fnInitGrid();

	//공통
	fnCommon();
	makeData();
	// 리스트 조회
	fnList("1");
	
	// 팝업화면 초기화
// 	fnInitPopup();
	
	
	// 자산추가, 담당자(정) 팝업 호출
 	$('#popSearchChrgEmpJung').on("click", function(e){
 		
		e.preventDefault();

		$('#popAsetChrgEmpId1').val("");
		$('#popAsetChrgEmpNm1').val("");
//  		$('#gridCorpJungEmpList').empty();

 		fnInitEmpJungGrid();
 		
		fnStopEvent(e);

		let param = { auth_grp_cd : "S01",  corpId : ""};

		fnDetailList(param);
		
		$(document).on("click", "#gridChrgJungEmpList .tui-grid-table tbody tr td", function(e){
			e.preventDefault();
			$('#gridChrgJungEmpList').empty();
			
	 		let cell = gridObj["gridChrgJungEmpList"].getFocusedCell();
		
	 		let empNm  = gridObj["gridChrgJungEmpList"].getValue(cell.rowKey, "emp_nm", true);
	 		let deptNm = gridObj["gridChrgJungEmpList"].getValue(cell.rowKey, "dept_nm", true);
	 		let empId  = gridObj["gridChrgJungEmpList"].getValue(cell.rowKey, "emp_id", true);
				 		
			$('#popAsetChrgEmpNm1').val('');
			$('#popAsetChrgEmpId1').val(empId);
			$('#popAsetChrgEmpNm1').val(deptNm + ' > ' + empNm);
			
			$('#chrgEmpJungListPopup').addClass('hide');
	 	});
		
		/**********************************************************
		 * 리스트(그리드) 조회
		 **********************************************************/
		function fnDetailList(param){
		    
			// GRID 리스트 조회
			fnAjax("<c:url value='/api/corp/corpEmpList'/>", param, function(data) {
					
				if(successResCode == data.resCode){
					// RESET DATA(그리드)
					gridObj["gridChrgJungEmpList"].resetData(data.corpEmpList);
							
				}else{
					// 경고메세지
					fnWarnMsg('조회에 실패했습니다.');
				}
			});
		}
		// 레이어팝업 보여줌
		$('#chrgEmpJungListPopup').removeClass('hide');
	}); 

	// 자산추가, 담당자(부) 팝업 호출
	$('#popSearchChrgEmpBu').on("click", function(e){
		e.preventDefault();

		$('#popAsetChrgEmpId2').val("");
		$('#popAsetChrgEmpNm2').val("");
 		
		fnInitEmpBuGrid();
		
		fnStopEvent(e);

		let param = { auth_grp_cd : "",  corpId : ""};
		
		fnDetailList(param);
		
		$(document).on("click", "#gridChrgBuEmpList .tui-grid-table tbody tr td", function(e){	
			e.preventDefault();
			$('#gridChrgBuEmpList').empty();
			
	 		let cell = gridObj["gridChrgBuEmpList"].getFocusedCell();
		
	 		let empNm  = gridObj["gridChrgBuEmpList"].getValue(cell.rowKey, "emp_nm", true);
	 		let deptNm = gridObj["gridChrgBuEmpList"].getValue(cell.rowKey, "dept_nm", true);
	 		let empId  = gridObj["gridChrgBuEmpList"].getValue(cell.rowKey, "emp_id", true);
	 		
			$('#popAsetChrgEmpNm2').val("");
			$('#popAsetChrgEmpId2').val(empId);
			$('#popAsetChrgEmpNm2').val(deptNm + " > " + empNm);
			
			$('#chrgEmpBuListPopup').addClass('hide');
	 	});
		
		/**********************************************************
		 * 리스트(그리드) 조회
		 **********************************************************/
		function fnDetailList(param){
		    
			// GRID 리스트 조회
			fnAjax("<c:url value='/api/corp/corpEmpList'/>", param, function(data) {
		
				if(successResCode == data.resCode){
					// RESET DATA(그리드)
					gridObj["gridChrgBuEmpList"].resetData(data.corpEmpList);
							
				}else{
					// 경고메세지
					fnWarnMsg('조회에 실패했습니다.');
				}
			});
		}
		// 레이어팝업 보여줌
		$('#chrgEmpBuListPopup').removeClass('hide');
 	});

	// 자산수정, 담당자(정) 팝업 호출
 	$('#searchChrgEmpJung').on("click", function(e){
 		
		e.preventDefault();

		$('#asetChrgEmpId1').val("");
 		$('#gridCorpJungEmpList').empty();

 		fnInitEmpJungGrid();
 		
		fnStopEvent(e);

		let param = { auth_grp_cd : "S01",  corpId : ""};

		fnDetailList(param);
		
		$(document).on("click", "#gridChrgJungEmpList .tui-grid-table tbody tr td", function(e){
			e.preventDefault();
			$('#gridChrgJungEmpList').empty();
			
	 		let cell = gridObj["gridChrgJungEmpList"].getFocusedCell();
		
	 		let empNm  = gridObj["gridChrgJungEmpList"].getValue(cell.rowKey, "emp_nm", true);
	 		let deptNm = gridObj["gridChrgJungEmpList"].getValue(cell.rowKey, "dept_nm", true);
	 		let empId  = gridObj["gridChrgJungEmpList"].getValue(cell.rowKey, "emp_id", true);
				 		
			$('#asetChrgEmpNm1').val('');
			$('#asetChrgEmpId1').val(empId);
			$('#asetChrgEmpNm1').val(deptNm + ' > ' + empNm);
			
			$('#chrgEmpJungListPopup').addClass('hide');
	 	});
		
		/**********************************************************
		 * 리스트(그리드) 조회
		 **********************************************************/
		function fnDetailList(param){
		    
			// GRID 리스트 조회
			fnAjax("<c:url value='/api/corp/corpEmpList'/>", param, function(data) {
					
				if(successResCode == data.resCode){
					// RESET DATA(그리드)
					gridObj["gridChrgJungEmpList"].resetData(data.corpEmpList);
							
				}else{
					// 경고메세지
					fnWarnMsg('조회에 실패했습니다.');
				}
			});
		}
		// 레이어팝업 보여줌
		$('#chrgEmpJungListPopup').removeClass('hide');
	}); 

	// 자산수정, 담당자(부) 팝업 호출
	$('#searchChrgEmpBu').on("click", function(e){
		e.preventDefault();
		
		$('#asetChrgEmpId2').val("");
 		
		fnInitEmpBuGrid();
		
		fnStopEvent(e);

		let param = { auth_grp_cd : "",  corpId : ""};
		
		fnDetailList(param);
		
		$(document).on("click", "#gridChrgBuEmpList .tui-grid-table tbody tr td", function(e){	
			e.preventDefault();
			$('#gridChrgBuEmpList').empty();
			
	 		let cell = gridObj["gridChrgBuEmpList"].getFocusedCell();
		
	 		let empNm  = gridObj["gridChrgBuEmpList"].getValue(cell.rowKey, "emp_nm", true);
	 		let deptNm = gridObj["gridChrgBuEmpList"].getValue(cell.rowKey, "dept_nm", true);
	 		let empId  = gridObj["gridChrgBuEmpList"].getValue(cell.rowKey, "emp_id", true);
	 		
			$('#asetChrgEmpNm2').val("");
			$('#asetChrgEmpId2').val(empId);
			$('#asetChrgEmpNm2').val(deptNm + " > " + empNm);
			
			$('#chrgEmpBuListPopup').addClass('hide');
	 	});
		
		/**********************************************************
		 * 리스트(그리드) 조회
		 **********************************************************/
		function fnDetailList(param){
		    
			// GRID 리스트 조회
			fnAjax("<c:url value='/api/corp/corpEmpList'/>", param, function(data) {
		
				if(successResCode == data.resCode){
					// RESET DATA(그리드)
					gridObj["gridChrgBuEmpList"].resetData(data.corpEmpList);
							
				}else{
					// 경고메세지
					fnWarnMsg('조회에 실패했습니다.');
				}
			});
		}
		// 레이어팝업 보여줌
		$('#chrgEmpBuListPopup').removeClass('hide');
 	});

	// 계약추가, 담당자 팝업 호출
	$('#popSearchMntcEmpList').on("click", function(e){

		e.preventDefault();
		
		$('#popMntcEmpId').val("");
 		
		
		fnStopEvent(e);

		let param = { empId : ""};
		
		fnDetailList(param);
		
		$(document).on("click", "#gridMntcEmpList .tui-grid-table tbody tr td", function(e){
			
			e.preventDefault();
			$('#gridMntcEmpList').empty();
			
	 		let cell = gridObj["gridMntcEmpList"].getFocusedCell();

	 		let empId    = gridObj["gridMntcEmpList"].getValue(cell.rowKey, "emp_id", true);
	 		let empNm    = gridObj["gridMntcEmpList"].getValue(cell.rowKey, "emp_nm", true);
	 		let corpKoNm = gridObj["gridMntcEmpList"].getValue(cell.rowKey, "corp_ko_nm", true);

			$('#popMntcEmpId').val("");
			$('#popMntcEmpNm').val("");
			$('#pooCorpKoNm').val("");
			
			$('#popMntcEmpId').val(empId);
			$('#popMntcEmpNm').val(empNm);
			$('#popCorpKoNm').val(corpKoNm);			

			$('#popMntcEmpNm').val(corpKoNm + " > " + empNm);
			
			$('#mntcEmpListPopup').addClass('hide');
	 	});
		
		/**********************************************************
		 * 리스트(그리드) 조회
		 **********************************************************/
		function fnDetailList(param){
		    
			// GRID 리스트 조회
			fnAjax("<c:url value='/api/ctl/list'/>", param, function(data) {
		
				if(successResCode == data.resCode){
					// RESET DATA(그리드)
					gridObj["gridMntcEmpList"].resetData(data.list);
					
					var asetClsfList  = data.asetClsfList;
					
					for(var idx in asetClsfList) {
						if(asetClsfList[idx].aset_lvl == 1 && asetClsfList[idx].par_aset_clsf_id == "0") {
							var asetUpperMap={
							    cd      : asetClsfList[idx].aset_clsf_id,
							    nm      : asetClsfList[idx].aset_clsf_nm
							};
							
							output.push('<option value="'+ asetUpperMap.cd +'">'+ asetUpperMap.nm +'</option>');
						};
						$("#parAsetClsfId").html(output.join(''));
					};
							
				}else{
					// 경고메세지
					fnWarnMsg('조회에 실패했습니다.');
				}
			});
		}
		// 레이어팝업 보여줌
		$('#mntcEmpListPopup').removeClass('hide');
 	});

	// 계약수정, 담당자 팝업 호출
	$('#searchMntcEmpList').on("click", function(e){

		e.preventDefault();
		
		$('#mntcEmpId').val("");
 		
		fnStopEvent(e);

		let param = { empId : ""};
		
		fnDetailList(param);
		
		$(document).on("click", "#gridMntcEmpList .tui-grid-table tbody tr td", function(e){
			
			e.preventDefault();
			$('#gridMntcEmpList').empty();
			
	 		let cell = gridObj["gridMntcEmpList"].getFocusedCell();

	 		let empId    = gridObj["gridMntcEmpList"].getValue(cell.rowKey, "emp_id", true);
	 		let empNm    = gridObj["gridMntcEmpList"].getValue(cell.rowKey, "emp_nm", true);
	 		let corpKoNm = gridObj["gridMntcEmpList"].getValue(cell.rowKey, "corp_ko_nm", true);

			$('#mntcEmpNm').val("");
			$('#corpNm').val("");
			
			$('#mntcEmpId').val(empId);
			$('#mntcEmpNm').val(empNm);
			$('#corpKoNm').val(corpKoNm);

			$('#mntcEmpNm').val(corpKoNm + " > " + empNm);
			
			$('#mntcEmpListPopup').addClass('hide');
	 	});
		
		/**********************************************************
		 * 리스트(그리드) 조회
		 **********************************************************/
		function fnDetailList(param){
		    
			// GRID 리스트 조회
			fnAjax("<c:url value='/api/ctl/list'/>", param, function(data) {
		
				if(successResCode == data.resCode){
					// RESET DATA(그리드)
					gridObj["gridMntcEmpList"].resetData(data.list);
							
				}else{
					// 경고메세지
					fnWarnMsg('조회에 실패했습니다.');
				}
			});
		}
		// 레이어팝업 보여줌
		$('#mntcEmpListPopup').removeClass('hide');
 	});
	
	$("#insertMntc").prop('disabled', false);
}
function makeData(){
	var params = {
			searchType : '',
			searchStr  : '',
			baseDt     : ''
	};
	fnAjax("<c:url value='/api/mntc/mntcList'/>", params, function(data2) {
		consParamsData = data2.mntcList;
		
	});
}
/**********************************************************
 * 초기화(그리드)
 **********************************************************/
function fnInitGrid(){

	// 그리드 컴럼 정보
	var columnsData = [
		      {header:'계약일련번호', name:'mntc_ctrt_sno', align:'center', sortable: true, hidden: true}
		    , {header:'자산ID', name:'aset_id', align:'center', sortable: true, hidden: true}
			, {header:'행정구분', name:'aset_clsf_id', align:'center', sortable: true}
			, {header:'행정동', name:'aset_clsf_nm', align:'center', sortable: true}
			, {header:'소재지(지번)', name:'aset_nm', align:'center'}
			, {header:'계약담당ID1', name:'aset_chrg_emp_id1', align:'center', sortable: true, hidden: true}
			, {header:'계약담당자(정)', name:'aset_chrg_emp_nm1', align:'center'}
			, {header:'계약담당자ID2', name:'aset_chrg_emp_id2', align:'center	', sortable: true, hidden: true}
			, {header:'계약담당자(부)', name:'aset_chrg_emp_nm2', align:'center'}
			, {header:'계약일시', name:'ctrt_dt', align:'center', sortable: true}
			, {header:'계약시작일자', name:'ctrt_strt_dt', align:'center', sortable: true}
			, {header:'계약종료일자', name:'ctrt_end_dt', align:'center', sortable: true}   
			, {header:'계약구분코드', name:'mntc_ctrt_sep_cd', align:'center', hidden: true} 
			, {header:'거래유형', name:'contract_type', align:'center'}   
			, {header:'삭제여부', name:'del_yn', align:'center', hidden: true}   
 			, {header:'변경', name:'btn_upd_del', align:'center'}
	];
	
	// 그리드 생성
	fnDrawGrid("04", "grid", columnsData);
}

/**********************************************************
 * 리스트(그리드) 조회
 **********************************************************/
function fnList(slcPageNo){
	
	var params = {
		searchType : $("#searchType option:selected").val(),
		searchStr  : $("#searchStr").val(),
		baseDt     : $("#baseDt").val()
	};
	
	// GRID 리스트 조회
	fnAjax("<c:url value='/api/mntc/mntcList'/>", params, function(data) {

		if(successResCode == data.resCode){
			// RESET DATA(그리드)
			gridObj["grid"].resetData(data.mntcList);

		}else{
			// 경고메세지
			fnWarnMsg('조회에 실패했습니다.');
		}
	});
}



/**********************************************************
* 업체정보 수정 데이터 조회
**********************************************************/
function fnPopupData(mntcCtrtSno){
	
	$("input:checkbox[name='rglrChkDt']:checked").each(function() {
		$(this).prop('checked', false);
	})
	
	var param = { mntcCtrtSno : mntcCtrtSno };
	fnAjax("<c:url value='/api/mntc/mntcInfo'/>", param, function(data){
		if(successResCode == data.resCode) {
			var ctrtDt = data.info.ctrt_dt.slice(0, 8); // "20241122" 추출 (앞 8자리)
			var ctrtHour = data.info.ctrt_dt.slice(8, 10); // "16" 추출 (9~10번째 자리)
			var ctrtMinute = data.info.ctrt_dt.slice(10, 12); // "30" 추출 (11~12번째 자리)
			
			$('#mntcCtrtSno').val(data.info.mntc_ctrt_sno);
			$('#asetId').val(data.info.aset_id);
			$('#asetClsfId2').val(data.info.aset_clsf_id);
			$('#asetNm2').val(data.info.aset_nm);
			$('#asetClsfNm').val(data.info.aset_clsf_nm);
			$('#asetChrgEmpId2').val(data.info.aset_chrg_emp_id2);
			$('#asetChrgEmpNm2').val(data.info.aset_chrg_emp_nm2);
			$('#asetChrgEmpId1').val(data.info.aset_chrg_emp_id1);
			$('#asetChrgEmpNm1').val(data.info.aset_chrg_emp_nm1);
			$('#corpId').val(data.info.corp_id);
			$('#corpKoNm').val(data.info.corp_ko_nm);
			$('#ctrtStrtDt').val(data.info.ctrt_strt_dt);
			$('#ctrtEndDt').val(data.info.ctrt_end_dt);
			$('#ctrtDt').val(ctrtDt.replace(/(\d{4})(\d{2})(\d{2})/, "$1-$2-$3"));
			$('#ctrtHour').val(ctrtHour);
			$('#ctrtMinute').val(ctrtMinute);
			$('#regEmpId').val(loginUserId);
			
			for(var idx in data.rglrDtList) {
				$("input:checkbox[name='rglrChkDt']").filter('[value='+data.rglrDtList[idx].rglr_chk_dt+']').prop('checked', true);
			}
			
		} else {
			alert("업체정보 조회에 실패했습니다.");
		}
	});
	
}


/**********************************************************
 * 초기화(자산정보 그리드)
 **********************************************************/
function fnInitAsetGrid(){

	// 자산정보 그리드 컬럼 정보
	var columnsData = [
		  {header:'행정구분'   , name:'aset_clsf_id', width: 150, align:'center'}   
		, {header:'행정동'   , name:'aset_clsf_nm', width: 150, align:'center'}   
		, {header:'소재지(지번)', name:'aset_nm', width: 150, align:'center'}   
	];
	
	// 그리드 생성	
	fnDrawGrid("07", "gridAsetList2", columnsData);

}

/**********************************************************
 * 초기화(자산정보추가 그리드)
 **********************************************************/
function fnInitAsetGrid2(){

	// 자산정보 그리드 컬럼 정보
	var columnsData = [
		  {header:'행정구분'   , name:'aset_clsf_id', width: 150, align:'center'}   
		, {header:'행정동'   , name:'aset_clsf_nm', width: 150, align:'center'}   
		, {header:'소재지(지번)', name:'aset_nm', width: 150, align:'center'}   
	];
	
	// 그리드 생성
	fnDrawGrid("07", "gridAsetList2", columnsData);
}

/**********************************************************
 * 초기화(결재자[정] 그리드)
 **********************************************************/
function fnInitEmpJungGrid(){

	// 결재자[정] 그리드 컬럼 정보
	var columnsEmpData = [  
		  {header:'회사명', name:'corp_ko_nm', sortable:true, align:'center', width: 100}
		, {header:'부서명', name:'dept_nm', sortable:true, align:'center', width: 100}
		, {header:'사용자명', name:'emp_nm', sortable:true, align:'center', width: 100}   
		, {header:'사원ID', name:'emp_id', sortable:true, align:'center', width: 150}  
		, {header:'직급', name:'job_lvl_nm', sortable:true, align:'center', width: 100, hidden:true}
	];
	
	// 그리드 생성
	fnDrawGrid("04", "gridChrgJungEmpList", columnsEmpData);
}
	
/**********************************************************
 * 초기화(결재자[부] 그리드)
 **********************************************************/
function fnInitEmpBuGrid(){

	// 결재자[정] 그리드 컬럼 정보
	var columnsEmpData = [    
		  {header:'회사명', name:'corp_ko_nm', sortable:true, align:'center', width: 100}
		, {header:'부서명', name:'dept_nm', sortable:true, align:'center', width: 100}
		, {header:'사용자명', name:'emp_nm', sortable:true, align:'center', width: 100}   
		, {header:'사원ID', name:'emp_id', sortable:true, align:'center', width: 150}  
		, {header:'직급', name:'job_lvl_nm', sortable:true, align:'center', width: 100, hidden:true} 
	];
	
	// 그리드 생성
	fnDrawGrid("04", "gridChrgBuEmpList", columnsEmpData);
}

</script>