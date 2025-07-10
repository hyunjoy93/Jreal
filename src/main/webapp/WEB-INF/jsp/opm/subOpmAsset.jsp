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
			<li>매물관리</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">매물관리</h2>
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
										<option value="asetNm">소재지</option>
										<option value="buildingUse">건축물용도</option>
										<option value="reconfirmYn">재확인여부</option>
									</select>
									<span id="searchField">
									    <input type="text" class="input xxl" value="" placeholder="검색어입력" id="searchStr">
									</span>						
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
					<button type="button" class="bt bg secondary" id="downForm">엑셀다운로드</button>
					<button type="button" class="bt bg secondary" id="totInsert">매물일괄추가</button>
					<button type="button" class="bt bg secondary" id="insertAset">매물추가</button>
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

<!-- [팝업] 매물추가 -->
<article class="popup hide" id="insertAsetPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 id="popTitle" class="popTitle">매물추가</h5>
			<button type="button" class="btClose hide"><i>닫기</i></button>
		</div>

		<div class="conBody cols">

				<table class="field">
					<colgroup>
						<col width="80px">
						<col width="400px">
					</colgroup>
				<tbody>
					<!-- 회사명은 select 박스로 corp 테이블에서 조회해서 보여줘야 함, 한글명만 보여주고 ID는 HIDDEN으로 처리 필요-->
					 <tr> 
						<th>행정구분<span  style="color: red">*</span ></th>
						<td>
							<select class="select" id="popAsetClsfId"></select>
						</td>
					</tr> 
					<tr>
						<th>소재지(지번)<span  style="color: red">*</span ></th>
						<td><input type="text" class="input" value="" id="popAsetNm"></td>
					</tr>
					<tr>
						<th>소유주(남)</th>
						<td><input type="text" class="input" value="" id="popOwnerManCpno" placeholder="010-0000-0000"></td>
					</tr>
					<tr>
						<th>소유주(여)</th>
						<td><input type="text" class="input" value="" id="popOwnerWomanCpno" placeholder="010-0000-0000"></td>
					</tr>
					<tr>
						<th>관리인</th>
						<td><input type="text" class="input" value="" id="popOwnerCpno" placeholder="010-0000-0000"></td>
					</tr>
					<tr>
						<th>건축물용도</th>
						<td>
							<select class="select md" id="popBuildingUse">
								<option value="A" selected>다가구주택</option>
								<option value="B">단독주택</option>
								<option value="C">공동주택</option>
								<option value="D">도시형생활주택</option>
								<option value="E">제2종근린생활시설</option>
								<option value="F">제1종근린생활시설</option>
								<option value="G">인터넷게임제공업소</option>
								<option value="H">지식산업센터(꽁장)</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>거래유형</th>
						<td>
							<select class="select md" id="popTradeType">
								<option value="A" selected>월세</option>
								<option value="B">전세</option>
								<option value="C">매매</option>
								<option value="D">분양</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>재확인여부</th>
						<td>
							<select class="select md" id="popReconfirmYn">
								<option value="Y" selected>Y</option>
								<option value="">N</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

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
			<h5 id="popTitle" class="popTitle">매물수정</h5>
			<button type="button" class="btClose hide"><i>닫기</i></button>
		</div>

		<div class="conBody cols">

				<table class="field">
					<colgroup>
						<col width="80px">
						<col width="400px">
					</colgroup>
				<tbody>
					<!-- 회사명은 select 박스로 corp 테이블에서 조회해서 보여줘야 함, 한글명만 보여주고 ID는 HIDDEN으로 처리 필요-->
					 <tr> 
						<th>행정구분<span  style="color: red">*</span ></th>
						<td>
							<select class="select" id="asetClsfId"></select>
						</td>
					</tr> 
					<tr>
						<th>소재지(지번)<span  style="color: red">*</span ></th>
						<td><input type="text" class="input" value="" id="asetNm"></td>
						<td><input type="hidden" value="" id="asetId"></td>
					</tr>
					<tr>
						<th>소유주(남)</th>
						<td><input type="text" class="input" value="" id="ownerManCpno" placeholder="010-0000-0000"></td>
					</tr>
					<tr>
						<th>소유주(여)</th>
						<td><input type="text" class="input" value="" id="ownerWomanCpno" placeholder="010-0000-0000"></td>
					</tr>
					<tr>
						<th>관리인</th>
						<td><input type="text" class="input" value="" id="ownerCpno" placeholder="010-0000-0000"></td>
					</tr>
					<tr>
						<th>건축물용도</th>
						<td>
							<select class="select md" id="buildingUse">
								<option value="A" selected>다가구주택</option>
								<option value="B">단독주택</option>
								<option value="C">공동주택</option>
								<option value="D">도시형생활주택</option>
								<option value="E">제2종근린생활시설</option>
								<option value="F">제1종근린생활시설</option>
								<option value="G">인터넷게임제공업소</option>
								<option value="H">지식산업센터(꽁장)</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>거래유형</th>
						<td>
							<select class="select md" id="tradeType">
								<option value="A" selected>월세</option>
								<option value="B">전세</option>
								<option value="C">매매</option>
								<option value="D">분양</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>재확인여부</th>
						<td>
							<select class="select md" id="reconfirmYn">
								<option value="Y" selected>Y</option>
								<option value="">N</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

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
				alert("행정구분 목록을 불러오는데 실패했습니다. 관리자에게 문의해주세요.");
				$("#popAsetClsfId").empty();
			}
		});
		
		$('#insertAsetPopup').removeClass('hide');	
	});

	// 자산추가 팝업에서 저장 버튼 클릭
	$("#btnAddSave").on("click", function(e){
		fnStopEvent(e);
		console.log("팝업-저장 click");
		
		var chkNmList = gridObj["grid"].getColumnValues('aset_nm');
		for (idx in chkNmList) {
			if(chkNmList.indexOf($("#popAsetNm").val()) > -1 ) {
				alert("이미 등록된 자산명입니다. 자산명을 확인해주세요.");
				return;
			}
		}
		
		var param = {
		    popAsetClsfId     : $("#popAsetClsfId").val(),        // 행정구분
		    popAsetNm         : $("#popAsetNm").val(),            // 소재지(지번)
		    popOwnerManCpno   : $("#popOwnerManCpno").val(),      // 소유주(남)
		    popOwnerWomanCpno : $("#popOwnerWomanCpno").val(),    // 소유주(여)
		    popOwnerCpno      : $("#popOwnerCpno").val(),         // 관리인
		    popBuildingUse    : $("#popBuildingUse").val(),       // 건축물용도
		    popTradeType      : $("#popTradeType").val(),         // 거래유형
		    popReconfirmYn    : $("#popReconfirmYn").val(),       // 재확인여부
		    regAddEmpId       : loginUserId                       // 등록자 ID (기존 코드에서 가져옴)
		}
			
		console.log(param);
			
		fnAjax("<c:url value='/api/aset/add'/>", param, function(data){
			if(successResCode == data.resCode) {
				alert("매물정보가 추가되었습니다.");
				// 리스트 새로고침
				fnList("1");
				$(".btClose").click();
				/* $("#popEmpId").attr("disabled", false); */
			} else {
				alert("매물정보 추가에 실패했습니다.");
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
			asetId		      : $("#asetId").val(),
		    popAsetClsfId     : $("#asetClsfId").val(),        // 행정구분
		    popAsetNm         : $("#asetNm").val(),            // 소재지(지번)
		    popOwnerManCpno   : $("#ownerManCpno").val(),      // 소유주(남)
		    popOwnerWomanCpno : $("#ownerWomanCpno").val(),    // 소유주(여)
		    popOwnerCpno      : $("#ownerCpno").val(),         // 관리인
		    popBuildingUse    : $("#buildingUse").val(),       // 건축물용도
		    popTradeType      : $("#tradeType").val(),         // 거래유형
		    popReconfirmYn    : $("#reconfirmYn").val(),       // 재확인여부
		    regEmpId       : loginUserId                       // 등록자 ID (기존 코드에서 가져옴)
		}
		
		console.log(param);
		
		fnAjax("<c:url value='/api/aset/update'/>", param, function(data){
			if(successResCode == data.resCode) {
				alert("매물정보가 수정되었습니다.");
				// 리스트 새로고침
				fnList("1");
				$(".btClose").click();
			} else {
				alert("매물정보 수정에 실패했습니다.");
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
	}
	
}


function fnNullCheck(){
	
	if ($("#asetNm").val() == "" || $("#asetNm").val() == null || $("#asetNm").val() == undefined) {
		alert("자산명을 입력해주세요.");
		return "1";
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

	document.getElementById('searchType').addEventListener('change', function() {
	    const searchType = this.value;
	    const searchField = document.getElementById('searchField');

	    // 기존의 내용을 비워줌
	    searchField.innerHTML = '';

	    if (searchType === 'asetNm') {
	        // '소재지' 선택 시 기본 텍스트 입력 필드 유지
	        searchField.innerHTML = '<input type="text" class="input xxl" value="" placeholder="검색어입력" id="searchStr">';
	    } else if (searchType === 'buildingUse') {
	        // '건축물용도' 선택 시 선택 박스 추가
	        searchField.innerHTML = `
	            <select class="select xxl" id="searchStr">
	                <option value="A">다가구주택</option>
	                <option value="B">단독주택</option>
	                <option value="C">공동주택</option>
	                <option value="D">도시형생활주택</option>
	                <option value="E">제2종근린생활시설</option>
	                <option value="F">제1종근린생활시설</option>
	                <option value="G">인터넷게임제공업소</option>
	                <option value="H">지식산업센터(꽁장)</option>
	            </select>`;
	    } else if (searchType === 'reconfirmYn') {
	        // '재확인여부' 선택 시 Y/N 선택 박스 추가
	        searchField.innerHTML = `
	            <select class="select xxl" id="searchStr">
	                <option value="Y">Y</option>
	                <option value="">N</option>
	            </select>`;
	    }
	});
	
	
}

/**********************************************************
 * 초기화(그리드)
 **********************************************************/
function fnInitGrid(){

	// 그리드 컴럼 정보
	var columnsData = [
			{header:'행정구분', name:'aset_clsf_id', align:'center'}
			, {header:'행정동', name:'aset_clsf_nm', align:'center'}
			, {header:'소재지(지번)', name:'aset_nm', align:'center'}
			, {header:'소유주(남)', name:'owner_man_cpno', align:'center'}
			, {header:'소유주(여)', name:'owner_woman_cpno', align:'center'}
			, {header:'관리인', name:'owner_cpno', align:'center'}
			, {header:'건축물용도', name:'building_use', align:'center'}
			, {header:'거래유형', name:'trade_type', align:'center'}
			, {header:'등록일', name:'reg_dttm', align:'center'}
			, {header:'확인일', name:'confirm_dttm', align:'center'}
			, {header:'등록자', name:'reg_emp_id', align:'center'}
			, {header:'최종수정자', name:'mod_emp_id', align:'center'}
			, {header:'확인자', name:'confirm_emp_id', align:'center'}
			, {header:'재확인여부', name:'reconfirm_yn', align:'center'}
			, {header:'변경', name:'btn_upd_del', align:'center', width:240}
	];
	
	// 그리드 생성
	fnDrawGrid("06", "grid", columnsData);
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
	fnAjax("<c:url value='/api/aset/asetList'/>", params, function(data) {

		if(successResCode == data.resCode){
			// RESET DATA(그리드)
			gridObj["grid"].resetData(data.asetList);
			
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
	
	// 자산 정보 조회 및 팝업에 데이터 채우기
	fnAjax("<c:url value='/api/aset/asetInfo'/>", param, function(data) {
	    if (successResCode == data.resCode) {
	        $("#asetId").val(data.info.aset_id);
	        $("#asetNm").val(data.info.aset_nm);
	        
	        $("#asetClsfId").val(data.info.aset_clsf_id);
	        
	        $("#ownerManCpno").val(data.info.owner_man_cpno);
	        
	        $("#ownerWomanCpno").val(data.info.owner_woman_cpno);
	        
	        $("#ownerCpno").val(data.info.owner_cpno);
	        
	        $("#buildingUse").val(data.info.building_use);
	        
	        $("#tradeType").val(data.info.trade_type);
	        
	        $("#reconfirmYn").val(data.info.reconfirm_yn);

	        $('#regEmpId').val(loginUserId);
	        
	    } else {
	        alert("매물정보 조회에 실패했습니다.");
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