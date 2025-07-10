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
			<li>계산서요청</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">계산서요청</h2>
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
									<select class="select md" id="searchType" >
										<option value="asetNm">자산명</option>
										<option value="asetClsfNm">자산뷴류명</option>
										<option value="muftCorpNm">제조회사명</option>
									</select>
									<input type="text" class="input xxl" value="" placeholder="검색어입력" id="searchStr">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				<div class="btns">
					<button type="button" class="bt bg primary" id="btnSearch">검색</button>					
					<!-- <button type="button" class="btRefresh" title="초기화">초기화</button> --></div>
			</div>

		</div><!--//search-->

		<div class="result">

			<div class="control">

				<div class="btns">
<!--					<button type="button" class="bt bg secondary" id="downForm">엑셀다운로드</button>-->
<!--					<button type="button" class="bt bg secondary" id="totInsert">자산일괄추가</button>-->
					<button type="button" class="bt bg secondary" id="insertAset">계산서추가</button>
					<button type="button" class="bt bg secondary" id="insertAset">계산서추가</button>
					<button type="button" class="bt bg secondary" id="insertAset">계산서추가</button>
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

<!-- [팝업] 자산추가 -->
<article class="popup hide" id="insertAsetPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 id="popTitle" class="popTitle">자산추가</h5>
			<button type="button" class="btClose hide"><i>닫기</i></button>
		</div>

		<div class="conBody cols">

			<div class="panel fix">
				<table class="field">
					<colgroup>
						<col width="80px">
						<col width="400px">
					</colgroup>
				<tbody>
					<tr>
						<th>자산명<span  style="color: red">*</span ></th>
						<td><input type="text" class="input" value="" id="popAsetNm"></td>
					</tr>
					<!-- 회사명은 select 박스로 corp 테이블에서 조회해서 보여줘야 함, 한글명만 보여주고 ID는 HIDDEN으로 처리 필요-->
					 <tr> 
						<th>자산분류</th>
						<td>
							<select class="select" id="popAsetClsfId"></select>
						</td>
						<!--
						
						<td>
							<input id="popAsetClsfId" hidden="true">
							<input type="text" class="input xl" value="" id="popAsetClsfNm">
							<button type="button" class="btFind bg primary"  id="searchPopAsetClsf" >검색</button>
						</td>
						 -->
					</tr> 
					<tr>
						<th>자산상태</th>
						<td>
							<select class="select md" id="popAsetStusSepCd">
								<option value="U" selected>사용</option>
								<option value="B">백업</option>
								<option value="L">가용</option>
								<option value="S">창고</option>
								<option value="A">폐기</option>
								<option value="D">데모</option>
							</select>
						</td>
					</tr>
					<tr>
					<tr>
						<th>보안등급</th>
						<td>
							<select class="select md" id="popScrtRatCd">
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
						<td><input type="text" class="input" value="" id="popMuftCorpNm"></td>
					</tr>
					<tr>
						<th>S/N</th>
						<td><input type="text" class="input" value="" id="popAsetMdlNm"></td>
					</tr>
					<tr>
						<th>설치장소</th>
						<td><input type="text" class="input" value="" id="popInstlPlce"></td>
					</tr>
					<tr>
						<th>용도</th>
						<td><input type="text" class="input" value="" id="popPrpsDesc"></td>
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
						<td><input type="text" class="input" value="" id="popCpuSpd"></td>
					</tr>
					<!-- 회사명은 select 박스로 corp 테이블에서 조회해서 보여줘야 함, 한글명만 보여주고 ID는 HIDDEN으로 처리 필요-->
					 
					<tr>
						<th>MEMORY</th>
						<td><input type="text" class="input" value="" id="popMemoryVol"></td>
					</tr> 
					<tr>
						<th>HDD</th>
						<td><input type="text" class="input" value="" id="popHddVol"></td>
					</tr>
					<tr>
						<th>OS</th>
						<td><input type="text" class="input" value="" id="popOsVer"></td>
					</tr>
					<tr>
						<th>IP</th>
						<td><input type="text" class="input" value="" id="popIpAddr"></td>
					</tr>
					<tr>
						<th>도입일자</th>
						<td><input id="popIntdDt" type="text" class="input date" placeholder="도입일" readonly></td>
					</tr>
					<tr>
						<th>도입비용</th>
						<td><input type="text" class="input numR" value="" id="popIntdCost" ></td>
					</tr>
					<tr>
						<th>비고</th>
						<td><input type="text" class="input" value="" id="popNote"></td>
					</tr>
				</tbody>
			</table>

		</div><!--//panel-->

		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary" id="btnAddSave">저장</button>
				<button type="button" class="bt max bd btClose" id="btnAddCacleAndClose">취소</button>
			</div>
		</div>

	</div>
</article>	

<!-- [팝업] 자산수정-->
<article class="popup hide" id="updateAsetPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 id="popTitle" class="popTitle">자산수정</h5>
			<button type="button" class="btClose hide"><i>닫기</i></button>
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
						<th>자산명<span  style="color: red">*</span ></th>
						<td><input type="text" class="input" value="" id="asetNm"></td>
					</tr>
					<!-- 회사명은 select 박스로 corp 테이블에서 조회해서 보여줘야 함, 한글명만 보여주고 ID는 HIDDEN으로 처리 필요-->
					 
					<tr>
						<th>자산분류</th>
						<td>
							<select class="select" id="asetClsfId"></select>
						</td>
						<!--
						<td>
							<input id="asetClsfId" hidden="true">
							<input type="text" class="input xl" value="" id="asetClsfNm">
							<button type="button" class="btFind bg primary"  id="searchAsetClsf" >검색</button>
						</td>
						-->
					</tr> 
					<tr>
						<th>자산상태</th>
						<td>
							<select class="select md" id="asetStusSepCd">
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
<!-- 							<input type="text" class="input xl" value="" id="chrgEmpNm1"> -->
<!-- 							<button type="button" class="btFind bg primary"  id="searchChrgEmpJung" >검색</button> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th>담당자(부)</th> -->
<!-- 						<td> -->
<!-- 							<input id="chrgEmpId2" hidden="true"> -->
<!-- 							<input type="text" class="input xl" value="" id="chrgEmpNm2"> -->
<!-- 							<button type="button" class="btFind bg primary"  id="searchChrgEmpBu" >검색</button> -->
<!-- 						</td> -->
<!-- 					</tr> -->
					<tr>
						<th>보안등급</th>
						<td>
							<select class="select md" id="scrtRatCd">
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
						<td><input type="text" class="input" value="" id="muftCorpNm"></td>
					</tr>
					<tr>
						<th>자산모델</th>
						<td><input type="text" class="input" value="" id="asetMdlNm"></td>
					</tr>
					<tr>
						<th>설치장소</th>
						<td><input type="text" class="input" value="" id="instlPlce"></td>
					</tr>
					<tr>
						<th>용도</th>
						<td><input type="text" class="input" value="" id="prpsDesc"></td>
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
						<td><input type="text" class="input" value="" id="cpuSpd"></td>
					</tr>
					<tr>
						<th>MEMORY</th>
						<td><input type="text" class="input" value="" id="memoryVol"></td>
					</tr> 
					<tr>
						<th>HDD</th>
						<td><input type="text" class="input" value="" id="hddVol"></td>
					</tr>
					<tr>
						<th>OS</th>
						<td><input type="text" class="input" value="" id="osVer"></td>
					</tr>
					<tr>
						<th>IP</th>
						<td><input type="text" class="input" value="" id="ipAddr"></td>
					</tr>
					<tr>
						<th>도입일자</th>
						<td><input id="intdDt" type="text" class="input date" placeholder="도입일" readonly></td>
					</tr>
					<tr>
						<th>도입비용</th>
						<td><input type="text" class="input numR" value="" id="intdCost"></td>
					</tr>
					<tr>
						<th>비고</th>
						<td><input type="textarea" class="input" value="" id="note"></td>
					</tr>
				</tbody>
			</table>

		</div><!--//panel-->

		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary" id="btnSave">저장</button>
				<button type="button" class="bt max bd btClose" id="btnCacleAndClose">취소</button>
			</div>
		</div>

	</div>
</article>		



<!-- [팝업] 결재자[정] 권한 사원 정보 -->
<article class="popup hide" id="chrgEmpJungListPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle" id="apvlPopTitle">담당자검색</h5>
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
			<h5 class="popTitle" id="apvlPopTitle">담당자검색</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="result">
			<div class="tui-grid" id = "apvlEmpGrid" style="height: 500px;">
				<div id="gridChrgBuEmpList"></div>
			</div>
		</div><!--//result-->

	</div>

</article>	

<article class="popup hide" id="popFileUpload">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">자산일괄추가</h5>
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
	
	// 자산 추가
	$("#insertAset").on("click", function(e){
		fnStopEvent(e);
		$("#popAsetNm").val("");
		$("#popAsetClsfId").val("");
		$("#popAsetClsfNm").val("");
		$("#popAsetStusSepCd").val("U");
// 		$("#popChrgEmpId1").val("");
// 		$("#popChrgEmpNm1").val("");
// 		$("#popChrgEmpId2").val("");
// 		$("#popChrgEmpNm2").val("");
		$("#popScrtRatCd").val("0");
		$("#popMuftCorpNm").val("");
		$("#popAsetMdlNm").val("");
		$("#popCpuSpd").val("");
		$("#popMemoryVol").val("");
		$("#popHddVol").val("");
		$("#popOsVer").val("");
		$("#popIpAddr").val("");
		$("#popInstlPlce").val("");
		$("#popPrpsDesc").val("");
		$("#popIntdDt").val("");
		$("#popIntdCost").val("0");
		$("#popNote").val("");
			
		var output = [];
		
		/* [남정석, 2023-05-20] 자산분류 최하위 대상 추출 필요, sql 추가하고 해당 sql 호출 해야 함 */
		
		fnAjax("<c:url value='/api/set/asetClsfList'/>", null, function(data) {
			if(successResCode == data.resCode){
				var treeUpperList = [];
				var asetClsfList  = data.asetClsfList;
				
				for(var idx in asetClsfList) {
					
					if(asetClsfList[idx].leaf_yn == "Y" ) {
						var asetUpperMap={
						    cd      : asetClsfList[idx].aset_clsf_id,
						    nm      : asetClsfList[idx].par_aset_clsf_nm + " > " + asetClsfList[idx].aset_clsf_nm
						};
						
						output.push('<option value="'+ asetUpperMap.cd +'">'+ asetUpperMap.nm +'</option>');
					};
					$("#popAsetClsfId").html(output.join(''));
				};
			} else {
				alert("상위자산 목록을 불러오는데 실패했습니다. 관리자에게 문의해주세요.");
				$("#popAsetClsfId").empty();
			}
		});
		
		$('#insertAsetPopup').removeClass('hide');	
	});

	// 자산추가 팝업에서 저장 버튼 클릭
	$("#btnAddSave").on("click", function(e){
		fnStopEvent(e);
		console.log("팝업-저장 click");
		

		popNullCheckValue = fnPopNullCheck();
		
		// input data null체크 진행
		if(popNullCheckValue == "1") {
			$("#popAsetNm").focus();
			return;
		} else if(popNullCheckValue == "2"){
			$("#popIntdCost").focus();
			return;
		}
		
		var chkNmList = gridObj["grid"].getColumnValues('aset_nm');
		for (idx in chkNmList) {
			if(chkNmList.indexOf($("#popAsetNm").val()) > -1 ) {
				alert("이미 등록된 자산명입니다. 자산명을 확인해주세요.");
				return;
			}
		}
		
		var param = {	
			  popAsetNm			: $("#popAsetNm").val()
			, popAsetClsfId		: $("#popAsetClsfId").val()
			, popAsetClsfNm 	: $("#popAsetClsfNm").val()
			, popAsetStusSepCd 	: $("#popAsetStusSepCd").val()
// 			, popChrgEmpId1 	: $("#popChrgEmpId1").val()
// 			, popChrgEmpNm1 	: $("#popChrgEmpNm1").val()
// 			, popChrgEmpId2 	: $("#popChrgEmpId2").val()
// 			, popChrgEmpNm2 	: $("#popChrgEmpNm2").val()
			, popScrtRatCd 		: $("#popScrtRatCd").val()
			, popMuftCorpNm 	: $("#popMuftCorpNm").val()
			, popAsetMdlNm	 	: $("#popAsetMdlNm").val()
			, popCpuSpd 		: $("#popCpuSpd").val()
			, popMemoryVol 		: $("#popMemoryVol").val()
			, popHddVol 		: $("#popHddVol").val()
			, popOsVer 			: $("#popOsVer").val()
			, popIpAddr 		: $("#popIpAddr").val()
			, popInstlPlce 		: $("#popInstlPlce").val()
			, popPrpsDesc 		: $("#popPrpsDesc").val()
			, popIntdDt 		: $("#popIntdDt").val().replaceAll('-','')
			, popIntdCost 		: $("#popIntdCost").val() 
			, popNote     		: $("#popNote").val()
			, regAddEmpId      	: loginUserId
		}
			
		console.log(param);
			
		fnAjax("<c:url value='/api/aset/add'/>", param, function(data){
			if(successResCode == data.resCode) {
				alert("자산정보가 추가되었습니다.");
				// 리스트 새로고침
				fnList("1");
				$(".btClose").click();
				/* $("#popEmpId").attr("disabled", false); */
			} else {
				alert("자산정보 추가에 실패했습니다.");
			}
		});		
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
	
	// 자산정보 수정
	$(document).on("click", ".aset-update", function(e){
		 		
		fnStopEvent(e);
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
		// 레이어팝업 보updateEmpPopup
		$('#updateAsetPopup').removeClass('hide');
		
		var updAsetData = fnNullChangeBlank(gridObj["grid"].getRow(cell.rowKey));
		
		console.log("수정할 데이터 >>>>> " + JSON.stringify(updAsetData));
		
	});
	
	// 자산정보 복사
	$(document).on("click", ".aset-copy", function(e){
		 		
		fnStopEvent(e);
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
					$("#popAsetClsfId").html(output.join(''));
				};
			} else {
				alert("상위자산 목록을 불러오는데 실패했습니다. 관리자에게 문의해주세요.");
				$("#asetClsfId").empty();
			}
		});
		

		var param = { asetId : asetId };
		
		fnAjax("<c:url value='/api/aset/asetInfo'/>", param, function(data){
			if(successResCode == data.resCode) {

				$("#popAsetNm").val(data.info.aset_nm);
				$("#popAsetClsfId").val(data.info.aset_clsf_id);
				$("#popAsetStusSepCd").val(data.info.aset_stus_sep_cd);
				$("#popScrtRatCd").val(data.info.scrt_rat_cd);
				$("#popMuftCorpNm").val(data.info.muft_corp_nm);
				$("#popAsetMdlNm").val(data.info.aset_mdl_nm);
				$("#popCpuSpd").val(data.info.cpu_spd);
				$("#popMemoryVol").val(data.info.memory_vol);
				$("#popHddVol").val(data.info.hdd_vol);
				$("#popOsVer").val(data.info.os_ver);
				$("#popIpAddr").val(data.info.ip_addr);
				$("#popInstlPlce").val(data.info.instl_plce);
				$("#popIntdCost").val(data.info.intd_cost) ;             
				$("#popPrpsDesc").val(data.info.prps_desc);
				$("#popIntdDt").val(data.info.intd_dt);
				$("#popNote").val(data.info.note);
				
			} else {
				alert("자산정보 조회에 실패했습니다.");
			}
		});
 		
		$("#asetId").prop("disabled", true);
		// 레이어팝업 보updateEmpPopup
		$('#insertAsetPopup').removeClass('hide');
		
		var updAsetData = fnNullChangeBlank(gridObj["grid"].getRow(cell.rowKey));
		
		console.log("수정할 데이터 >>>>> " + JSON.stringify(updAsetData));
		
	});
	
	// 자산정보 수정 팝업에서 저장 버튼 클릭
	$("#btnSave").on("click", function(e){
		fnStopEvent(e);
		console.log("수정-저장 click");
		
		nullCheckValue = fnNullCheck();
		
		// input data null체크 진행
		if(nullCheckValue == "1") {
			$("#asetNm").focus();
			return;
		} else if(nullCheckValue == "2"){
			$("#intdCost").focus();
			return;
		}
		
		var param = {
			  asetId		: $("#asetId").val()
			, asetNm		: $("#asetNm").val()
			, asetClsfId	: $("#asetClsfId").val()
/* 			, asetClsfNm 	: $("#asetClsfNm").val() */
			, asetStusSepCd : $("#asetStusSepCd").val()
// 			, chrgEmpId1 	: $("#chrgEmpId1").val()
			/* , chrgEmpNm1 	: $("#chrgEmpNm1").val() */
// 			, chrgEmpId2 	: $("#chrgEmpId2").val()
			/* , chrgEmpNm2 	: $("#chrgEmpNm2").val() */
			, scrtRatCd 	: $("#scrtRatCd").val()
			, muftCorpNm 	: $("#muftCorpNm").val()
			, asetMdlNm 	: $("#asetMdlNm").val()
			, cpuSpd 		: $("#cpuSpd").val()
			, memoryVol 	: $("#memoryVol").val()
			, hddVol 		: $("#hddVol").val()
			, osVer 		: $("#osVer").val()
			, ipAddr 		: $("#ipAddr").val()
			, instlPlce 	: $("#instlPlce").val()
			, prpsDesc		: $("#prpsDesc").val()
			, intdDt 		: $("#intdDt").val().replaceAll('-','')
			, intdCost 		: $("#intdCost").val() 
			, note     		: $("#note").val()
			, regEmpId      : loginUserId
		}
		
		console.log(param);
		
		fnAjax("<c:url value='/api/aset/update'/>", param, function(data){
			if(successResCode == data.resCode) {
				alert("자산정보가 수정되었습니다.");
				// 리스트 새로고침
				fnList("1");
				$(".btClose").click();
			} else {
				alert("자산정보 수정에 실패했습니다.");
			}
		});
				
	});
			
	// 자산정보 삭제
	$(document).on("click", ".aset-delete", function(e){
		fnStopEvent(e);
		var cell = gridObj["grid"].getFocusedCell();
		console.log("aset-delete cell==>" + cell.rowKey);	
		
		
		var asetId = fnNullChangeBlank(gridObj["grid"].getValue(cell.rowKey, "aset_id"));
		console.log("del aset_id ==>" + asetId);	
				
		var param = {
				asetId : asetId
		}
		
		console.log(param);
		
		if (!confirm("정말 삭제하시겠습니까?")) {
	        // 취소(아니오) 버튼 클릭 시 이벤트
			alert("삭제 취소되었습니다.");
	    } else {
	        // 확인(예) 버튼 클릭 시 이벤트
	    	fnAjax("<c:url value='/api/aset/delete'/>", param, function(data){
				if(successResCode == data.resCode) {
					alert("자산정보 삭제에 성공했습니다.");
					// 리스트 새로고침
					fnList("1");
				} else {
					alert("자산정보 삭제에 실패했습니다.");
				}
			});
	    }
	});
	

	// 이벤트(페이지사이즈)
	$("#slcPageSize").on("change", function(e){
		fnStopEvent(e);
		fnList("1");
	});
	
	// 엑셀다운로드 버튼 클릭 이벤트
	$("#downForm").click(function() {
		
		var params = {
				searchType : $("#searchType option:selected").val(),
				searchStr : $("#searchStr").val()
			};
		
		  $.ajax({
		    url: "/api/aset/excelDownload",
		    type: "POST",
		    data: params,  
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
	
	$("#totInsert").click(function() {
		$('#popFileUpload').removeClass('hide');
	});
	
	$("#excelSave").click(function() {
	    var file = $("#file1").prop("files")[0];
	    
	    if (file) {
	        var formData = new FormData();
	        formData.append("file", file);
	        
	        $.ajax({
	            url: "/api/aset/excelUpload",
	            type: "POST",
	            data: formData,
	            processData: false,
	            contentType: false,
	            success: function(data) {
	    			if(successResCode == data.resCode){
	                    alert("자산정보가 업로드 되었습니다.");
	                    $('#popFileUpload').addClass('hide');
						fnList("1");
	    			}else{
	    				// 경고메세지
	                    alert("자산정보 업로드에 실패하였습니다.");
	    			}
	            },
	            error: function(xhr, status, error) {
	                // Handle the error response
	                alert("자산정보 업로드에 실패했습니다.: " + error);
	            }
	        });
	    }
	});
	
});


function fnPopNullCheck(){

	if ($("#popAsetNm").val() == "" || $("#popAsetNm").val() == null || $("#popAsetNm").val() == undefined) {
		alert("자산명을 입력해주세요.");
		return "1";
	} else if ($("#popIntdCost").val() == "" || $("#popIntdCost").val() == null || $("#popIntdCost").val() == undefined) {
		alert("도입비용을 입력해주세요.");
		return "2";
	}
	
}


function fnNullCheck(){
	
	if ($("#asetNm").val() == "" || $("#asetNm").val() == null || $("#asetNm").val() == undefined) {
		alert("자산명을 입력해주세요.");
		return "1";
	}else if ($("#intdCost").val() == "" || $("#intdCost").val() == null || $("#intdCost").val() == undefined) {
		alert("도입비용을 입력해주세요.");
		return "2";
	}
	
}

/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){
	
	// 메뉴 초기화
	fnInitGnbLnb(2, 3, 2, 3);
	
	// 그리드 초기화
	fnInitGrid();
	
	//공통
	fnCommon();
	
	// 리스트 조회
	fnList("1");
	
	// 팝업화면 초기화
	//fnInitPopup();
	
	$("#insertAset").prop('disabled', false);


	// 자산추가, 담당자(정) 팝업 호출
 	$('#popSearchChrgEmpJung').on("click", function(e){
 		
		e.preventDefault();

		$('#popChrgEmpNm1').val("");
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
				 		
			$('#popChrgEmpNm1').val('');
			$('#popChrgEmpId1').val(empId);
			$('#popChrgEmpNm1').val(deptNm + ' > ' + empNm);
			
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
		
		$('#popChrgEmpId2').val("");
 		
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
	 		
			$('#popChrgEmpNm2').val("");
			$('#popChrgEmpId2').val(empId);
			$('#popChrgEmpNm2').val(deptNm + " > " + empNm);
			
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

		$('#chrgEmpNm1').val("");
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
				 		
			$('#chrgEmpNm1').val('');
			$('#chrgEmpId1').val(empId);
			$('#chrgEmpNm1').val(deptNm + ' > ' + empNm);
			
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
		
		$('#chrgEmpId2').val("");
 		
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
	 		
			$('#chrgEmpNm2').val("");
			$('#chrgEmpId2').val(empId);
			$('#chrgEmpNm2').val(deptNm + " > " + empNm);
			
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

}

/**********************************************************
 * 초기화(그리드)
 **********************************************************/
function fnInitGrid(){

	// 그리드 컬럼 정보
	var columnsData = [
	    {header:'계약일', name:'contract_date', align:'center', width:110, fixed: 'left'},
	    {header:'잔금일', name:'balance_due_date', align:'center', width:110, fixed: 'left'},
	    {header:'계약 주소지', name:'contract_address', align:'center', width:300, fixed: 'left'},
	    {header:'계약 담당자', name:'contract_manager', align:'center', width:100, fixed: 'left'},
	    {header:'구분', name:'category', align:'center', width:100, fixed: 'left'},
	    {header:'공급가액', name:'public_amount', align:'center', width:100, fixed: 'left'},
	    {header:'부가세', name:'vat', align:'center', width:100, fixed: 'left'},
	    {header:'총 금액', name:'total_amount', align:'center', width:100, fixed: 'left'},
	    {header:'발행 구분', name:'issue_type', align:'center', width:100}, 	
	    {header:'식별번호', name:'identifier', align:'center', width:130},
	    {header:'구매자명', name:'buyer_name', align:'center', width:100},
	    {header:'사업장 주소', name:'business_address', align:'center', width:300},
	    {header:'업태', name:'business_type', align:'center', width:100},
	    {header:'종목', name:'business_field', align:'center', width:100},
	    {header:'담당자', name:'responsible_person', align:'center', width:100},
	    {header:'담당 연락처', name:'contact_number', align:'center', width:110},
	    {header:'이메일', name:'email', align:'center', width:200},
	    {header:'발행일', name:'issue_date', align:'center', width:110},
	    {header:'사진저장', name:'photo_saved', align:'center', width:50},
	    {header:'부가세이전', name:'vat_transfer_date', align:'center', width:110},
	    {header:'등록일시', name:'reg_dttm', align:'center', width:110},
	    {header:'등록자', name:'reg_emp_id', align:'center', width:100},
	    {header:'수정일시', name:'mod_dttm', align:'center', width:110},
	    {header:'수정자', name:'mod_emp_id', align:'center', width:100},
		{header:'변경', name:'btn_upd_del', align:'center', width:240}

	];
	
	// 그리드 생성
	fnDrawGrid("01", "grid", columnsData);
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
	fnAjax("<c:url value='/api/aset/taxList'/>", params, function(data) {

		if(successResCode == data.resCode){
			// RESET DATA(그리드)
			gridObj["grid"].resetData(data.taxList);
			
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
	
	fnAjax("<c:url value='/api/aset/asetInfo'/>", param, function(data){
		if(successResCode == data.resCode) {

			$("#asetId").val(data.info.aset_id); 
			$("#asetNm").val(data.info.aset_nm);        
			$("#asetClsfId").val(data.info.aset_clsf_id);     
			$("#stusSepCd").val(data.info.stus_sep_cd);   
			$("#asetStusSepCd").val(data.info.aset_stus_sep_cd); 
			$("#chrgEmpId1").val(data.info.chrg_emp_id1);
			$("#chrgEmpNm1").val(data.info.chrg_emp_nm1);
			$("#chrgEmpId2").val(data.info.chrg_emp_id2);
			$("#chrgEmpNm2").val(data.info.chrg_emp_nm2);
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
 * 초기화(결재자[정] 그리드)
 **********************************************************/
function fnInitEmpJungGrid(){

	// 결재자[정] 그리드 컬럼 정보
	var columnsEmpData = [
		  {header:'사용자명', name:'emp_nm', sortable:true, align:'center', width: 100}   
		, {header:'사원ID', name:'emp_id', sortable:true, align:'center', width: 150}    
		, {header:'부서', name:'dept_nm', sortable:true, align:'center', width: 100}
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
		  {header:'사용자명', name:'emp_nm', sortable:true, align:'center', width: 100}   
		, {header:'사원ID', name:'emp_id', sortable:true, align:'center', width: 150}    
		, {header:'부서', name:'dept_nm', sortable:true, align:'center', width: 100}
		, {header:'직급', name:'job_lvl_nm', sortable:true, align:'center', width: 100, hidden:true} 
	];
	
	// 그리드 생성
	fnDrawGrid("04", "gridChrgBuEmpList", columnsEmpData);
}


/* 조회기간 시작일 종료일 min, max 설정 */
$("#popIntdDt").datepicker({
	dateFormat: "yy-mm-dd",  
	onClose : function(selectedDate){
		$("#popIntdDt").datepicker("setDate", selectedDate);
	}
});

/* 조회기간 시작일 종료일 min, max 설정 */
$("#intdDt").datepicker({
	dateFormat: "yy-mm-dd",  
	onClose : function(selectedDate){
		$("#intdDt").datepicker("setDate", selectedDate);
	}
});
</script>