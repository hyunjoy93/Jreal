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
			<li>업체관리</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">업체관리</h2>
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
										<option value="corpKoNm">업체한글명</option>
										<option value="repTelno">연락처</option>
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

				<div class="btns">
<!-- 					<button type="button" class="bt bg secondary" id="downForm">엑셀다운로드</button> -->
<!-- 					<button type="button" class="bt bg secondary" id="totInsert">업체일괄추가</button> -->
					<button type="button" class="bt bg secondary" id="insertCorp">업체개별추가</button>
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

<!-- [팝업] 업체 소속사원 정보 -->
<article class="popup hide" id="corpEmpListPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle" id="corpPopTitle">업체직원정보</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="result">
			
			<table class="field">
				<colgroup>
					<col width="100px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>업체명</th>
						<td>
						  <input type="text" class="input" value="" id="empCorpKoNm" style ="width: 600px;" disabled>
						</td>
					</tr>
				</tbody>
			</table>
						
			<div class="tui-grid" id = "corpEmpGrid" style="height: 510px; width:800px;">
				<div id="gridCorpEmpList"></div>
			</div>
		
		</div><!--//result-->


	</div>


</article>	


<!-- [팝업] 업체 유지보수자산정보 상세 -->
<article class="popup hide" id="corpAsetListPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle" id="corpPopTitle">유지보수자산정보</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="result">
			
			<table class="field">
				<colgroup>
					<col width="100px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>업체명</th>
						<td>
						  <input type="text" class="input" value="" id=asetCorpKoNm style ="width: 600px;" disabled>
						</td>
				</tbody>
			</table>
						
			<div class="tui-grid" id = "corpAsetGrid" style="height: 510px; width:888px;">
				<div id="gridCorpAsetList"></div>
			</div>
		
		</div><!--//result-->


	</div>


</article>	


<!-- [팝업] 업체추가 -->
<article class="popup hide" id="insertCorpPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">업체추가</h5>
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
						<th>업체한글명<span  style="color: red">*</span ></th>
						<td><input type="text" class="input xl" value="" id="popCorpKoNm"></td>
					</tr>
					<!-- 회사명은 select 박스로 corp 테이블에서 조회해서 보여줘야 함, 한글명만 보여주고 ID는 HIDDEN으로 처리 필요-->
					 
					<tr>
						<th>업체영문명</th>
						<td><input type="text" class="input" value="" id="popCorpEnNm"></td>
					</tr> 
					<tr>
						<th>법인번호</th>
						<td><input type="text" class="input" value="" id="popCorpNo"></td>
					</tr>
					<tr>
						<th>사업자등록번호</th>
						<td><input type="text" class="input" value="" id="popBizRegNo"></td>
					</tr>
					<tr>
						<th>대표명</th>
						<td><input type="text" class="input" value="" id="popRepNm"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" class="input" value="" id="popAddr"></td>
					</tr>
					<tr>
						<th>대표전화번호</th>
						<td><input type="text" class="input" value="" id="popRepTelno"></td>
					</tr>
					<tr>
						<th>URL</th>
						<td><input type="text" class="input" value="" id="popWebSiteUrl"></td>
					</tr>
<!--					<tr>-->
<!--						<th>유지보수회사여부</th>   list 박스 형태로 표시 -->
<!--						<td>-->
<!--							<select class="select md" id="popMntcCorpYn">-->
<!--								<option value="Y">Y</option>-->
<!--								<option value="N">N</option>-->
<!--							</select>-->
<!--						</td>-->
<!--					</tr>-->
<!-- 					<tr> -->
<!-- 						<th>사용권한</th> -->
<!-- 						<td> -->
<!-- 							<select class="select" id="popUserGroup"> -->
<!-- 								<option value="" selected>선택</option> -->
<!-- 								<option value="관리자">관리자</option> -->
<!-- 								<option value="운용관제자">운용관제자</option> -->
<!-- 								<option value="사용자">사용자</option> -->
<!-- 								<option value="승인대기">승인대기</option> -->
<!-- 							</select> -->
<!-- 						</td> -->
<!-- 					</tr> -->
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

<!-- [팝업] 업체수정-->

<article class="popup hide" id="updateCorpPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">업체수정</h5>
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
					<th>업체ID</th>
					<td><input type="text" class="input xl" value="" id="corpId"></td>
				  </tr>
				  <tr>
					<th>업체한글명<span  style="color: red">*</span ></th>
						<td><input type="text" class="input xl" value="" id="corpKoNm"></td>
				  </tr>
					<tr>
						<th>업체영문명</th>
						<td><input type="text" class="input" value="" id="corpEnNm"></td>
					</tr> 
					<tr>
						<th>법인번호</th>
						<td><input type="text" class="input" value="" id="corpNo"></td>
					</tr>
					<tr>
						<th>사업자등록번호</th>
						<td><input type="text" class="input" value="" id="bizRegNo"></td>
					</tr>
					<tr>
						<th>대표명</th>
						<td><input type="text" class="input" value="" id="repNm"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" class="input" value="" id="addr"></td>
					</tr>
					<tr>
						<th>대표전화번호</th>
						<td><input type="text" class="input" value="" id="repTelno"></td>
					</tr>
					<tr>
						<th>URL</th>
						<td><input type="text" class="input" value="" id="webSiteUrl"></td>
					</tr>
					<tr>
						<th>유지보수회사여부</th>  <!-- list 박스 형태로 표시 -->
						<td>
							<select class="select md" id="mntcCorpYn">
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

<article class="popup hide" id="popFileUpload">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">업체정보일괄추가</h5>
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
	
	// 업체 추가
	$("#insertCorp").on("click", function(e){
		fnStopEvent(e);
		$("#popCorpKoNm").val("");
		$("#popCorpEnNm").val("");
		$("#popCorpNo").val("");
		$("#popBizRegNo").val("");
		$("#popRepNm").val("");
		$("#popAddr").val("");
		$("#popRepTelno").val("");
		$("#popWebSiteUrl").val("");
		//$("#popMntcCorpYn").val("");
		$('#insertCorpPopup').removeClass('hide');	
	});
	


	// 업체 소속 사용자 내용 팝업 호출
 	$(document).on("click","#corpEmpList", function(e){	
		
 		$('#gridCorpEmpList').empty();
 		
 		fnInitEmpGrid();
		
		fnStopEvent(e);

 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		let cell = gridObj["grid"].getFocusedCell();
 		
 		let corpId = gridObj["grid"].getValue(cell.rowKey, "corp_id", true);
 		let empCorpKoNm = gridObj["grid"].getValue(cell.rowKey, "tr_corp_ko_nm", true);

		let param = { corpId : corpId }
		
		$('#empCorpKoNm').val("");
		$('#empCorpKoNm').val(empCorpKoNm);

		fnDetailList(param);
		
		/**********************************************************
		 * 리스트(그리드) 조회
		 **********************************************************/
		function fnDetailList(param){
		    
			// GRID 리스트 조회
			fnAjax("<c:url value='/api/corp/corpEmpList'/>", param, function(data) {
		
				if(successResCode == data.resCode){
					// RESET DATA(그리드)
					gridObj["gridCorpEmpList"].resetData(data.corpEmpList);
							
				}else{
					// 경고메세지
					fnWarnMsg('조회에 실패했습니다.');
				}
			});
		}
		
		// 레이어팝업 보여줌
		$('#corpEmpListPopup').removeClass('hide');
	}); 
	
	// 업체 보유 자산 내용 팝업 호출
 	$(document).on("click","#corpAsetList", function(e){	
		
 		$('#gridCorpAsetList').empty();
 		
 		fnInitAsetGrid();
		
		fnStopEvent(e);

 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		let cell = gridObj["grid"].getFocusedCell();
 		
 		let corpId = gridObj["grid"].getValue(cell.rowKey, "corp_id", true);
 	    let asetCorpKoNm = gridObj["grid"].getValue(cell.rowKey, "tr_corp_ko_nm", true); 
 	    
		let param = { corpId : corpId }
		
		$('#asetCorpKoNm').val("");
		$('#asetCorpKoNm').val(asetCorpKoNm);

		fnDetailList(param);
		
		/**********************************************************
		 * 리스트(그리드) 조회
		 **********************************************************/
		function fnDetailList(param){
		    
			// GRID 리스트 조회
			fnAjax("<c:url value='/api/corp/corpAsetList'/>", param, function(data) {
		
				if(successResCode == data.resCode){
					// RESET DATA(그리드)
					gridObj["gridCorpAsetList"].resetData(data.corpAsetList);
							
				}else{
					// 경고메세지
					fnWarnMsg('조회에 실패했습니다.');
				}
			});
		}
		
		// 레이어팝업 보여줌
		$('#corpAsetListPopup').removeClass('hide');
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
	

	
	// 업체정보 수정
	$(document).on("click", ".corp-update", function(e){
		 		
		fnStopEvent(e);
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		var cell = gridObj["grid"].getFocusedCell();	
 		var corpId = gridObj["grid"].getValue(cell.rowKey, "corp_id", true); 		
 		
 		fnPopupData(corpId);
		$("#corpId").prop("disabled", true);
		// 레이어팝업 보updateEmpPopup
		$('#updateCorpPopup').removeClass('hide');
		
		var updCorpData = fnNullChangeBlank(gridObj["grid"].getRow(cell.rowKey));
		console.log("수정할 데이터 >>>>> " + JSON.stringify(updCorpData));
		
	});
	
	// 업체정보 수정 팝업에서 저장 버튼 클릭
	$("#updSave").on("click", function(e){
		fnStopEvent(e);
		console.log("수정-저장 click");
		
		var param = {
				corpId   : $("#corpId").val()
			  , corpKoNm : $("#corpKoNm").val()
			  , corpEnNm : $("#corpEnNm").val()
			  , corpNo   : $("#corpNo").val()
			  , bizRegNo : $("#bizRegNo").val()
			  , repNm    : $("#repNm").val()
			  , addr     : $("#addr").val()
			  , repTelno : $("#repTelno").val()
			  , webSiteUrl : $("#webSiteUrl").val()
			  , mntcCorpYn : $("#mntcCorpYn").val()
			  , regEmpId   : loginUserId
		}
		
		console.log(param);
		
		fnAjax("<c:url value='/api/corp/update'/>", param, function(data){
			if(successResCode == data.resCode) {
				alert("업체정보가 수정되었습니다.");
				// 리스트 새로고침
				fnList("1");
				$(".btClose").click();
			} else {
				alert("업체정보 수정에 실패했습니다.");
			}
		});
				
	});
			
	// 업체정보 삭제
	$(document).on("click", ".corp-delete", function(e){
		fnStopEvent(e);
		var cell = gridObj["grid"].getFocusedCell();
		console.log("corp-delete cell==>" + cell.rowKey);	
		
		
		var corpId = fnNullChangeBlank(gridObj["grid"].getValue(cell.rowKey, "corp_id"));
		console.log("del corp_id==>" + corpId);	
				
		var param = {
				corpId : corpId
		}
		
		console.log(param);
		
		if (!confirm("정말 삭제하시겠습니까?")) {
	        // 취소(아니오) 버튼 클릭 시 이벤트
			alert("삭제 취소되었습니다.");
	    } else {
	        // 확인(예) 버튼 클릭 시 이벤트
	    	fnAjax("<c:url value='/api/corp/delete'/>", param, function(data){
				if(successResCode == data.resCode) {
					alert("업체정보 삭제에 성공했습니다.");
					// 리스트 새로고침
					fnList("1");
				} else {
					alert("업체정보 삭제에 실패했습니다.");
				}
			});
	    }
	});

	$("#excelSave").click(function() {
	    var file = $("#file1").prop("files")[0];
	    
	    if (file) {
	        var formData = new FormData();
	        formData.append("file", file);
	        
	        $.ajax({
	            url: "/api/opm/excelUpload",
	            type: "POST",
	            data: formData,
	            processData: false,
	            contentType: false,
	            success: function(data) {
	    			if(successResCode == data.resCode){
	                    alert("업체정보가 업로드 되었습니다.");
	                    $('#popFileUpload').addClass('hide');
						fnList("1");
	    			}else{
	    				// 경고메세지
	                    alert("업체정보 업로드에 실패하였습니다.");
	    			}
	            },
	            error: function(xhr, status, error) {
	                // Handle the error response
	                alert("업체정보 업로드에 실패했습니다.: " + error);
	            }
	        });
	    }
	});

	$("#totInsert").click(function() {
		$('#popFileUpload').removeClass('hide');
	});

	// 엑셀다운로드 버튼 클릭 이벤트
	$("#downForm").click(function() {
		
		var params = {
				searchType : $("#searchType option:selected").val(),
				searchStr : $("#searchStr").val()
			};
		
		  $.ajax({
		    url: "/api/opm/excelDownload",
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
	

	// 업체추가 팝업에서 저장 버튼 클릭
	$("#btnSave").on("click", function(e){
		fnStopEvent(e);
		console.log("팝업-저장 click");
		
		// input data null체크 진행
		if(fnPopNullCheck() == false) {
			$("#popCorpKoNm").focus();
			return;
		};
		
		var chkNmList = gridObj["grid"].getColumnValues('corp_ko_nm');
		var chkRegNoList = gridObj["grid"].getColumnValues('biz_reg_no');
		
		for (idx in chkNmList) {
			if(chkNmList[idx].includes($("#popCorpKoNm").val())) {
				alert("이미 등록된 업체명입니다. 업체명을 확인해주세요.");
				return;
			}
		}
		
		for (idx2 in chkRegNoList) {
			if(chkRegNoList.includes($("#popBizRegNo").val())) {
				alert("이미 등록된 사업자등록번호 입니다. 해당 업체가 등록되어있는지 다시한번 확인해주세요.");
				return;
			}
		}
		
		var param = {	
				popCorpKoNm   : $("#popCorpKoNm").val()
			  , popCorpEnNm   : $("#popCorpEnNm").val()
		      , popCorpNo     : $("#popCorpNo").val()
			  , popBizRegNo   : $("#popBizRegNo").val()
			  , popRepNm      : $("#popRepNm").val()
			  , popAddr       : $("#popAddr").val()
			  , popRepTelno   : $("#popRepTelno").val()
			  , popWebSiteUrl : $("#popWebSiteUrl").val()
			  , popMntcCorpYn : $("#popMntcCorpYn").val()
			  , regEmpId      : loginUserId
		}
			
		console.log(param);
			
		fnAjax("<c:url value='/api/corp/add'/>", param, function(data){
			if(successResCode == data.resCode) {
				alert("업체정보가 추가되었습니다.");
				// 리스트 새로고침
				fnList("1");
				$(".btClose").click();
				/* $("#popEmpId").attr("disabled", false); */
			} else {
				alert("업체정보 추가에 실패했습니다.");
			}
		});		
	});

	// 이벤트(페이지사이즈)
	$("#slcPageSize").on("change", function(e){
		fnStopEvent(e);
		fnList("1");
	});
	
});
	

function fnPopNullCheck(){
	
	if ($("#popCorpKoNm").val() == "" || $("#popCorpKoNm").val() == null || $("#popCorpKoNm").val() == undefined) {
		alert("업체 한글명을 입력해주세요.");
		return false;
	}else if ($("#popRepNm").val() == "" || $("#popRepNm").val() == null || $("#popRepNm").val() == undefined) {
		alert("대표자명을 입력해주세요.");
		return false;
	}
	
	/* if ($("#popEmpNo").val() == "" || $("#popEmpNo").val() == null || $("#popEmpNo").val() == undefined) {
		alert("사번을 입력해주세요.");
		return false;
	} else if ($("#popEmpNm").val() == "" || $("#popEmpNm").val() == null || $("#popEmpNm").val() == undefined) {
		alert("사용자명을 입력해주세요.");
		return false;
	} else if ($("#popEmailAddr").val() == "" || $("#popEmailAddr").val() == null || $("#popEmailAddr").val() == undefined) {
		alert("이메일(로그인ID)을 입력해주세요.");
		return false;
	} else if ($("#popCorpId").val() == "" || $("#popCorpId").val() == null || $("#popCorpId").val() == undefined) {
		alert("회사정보를 입력해주세요.");
		return false;
	} */
	
}

/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){
	
	// 메뉴 초기화
	fnInitGnbLnb(2, 1, 2, 1);
	
	// 그리드 초기화
	fnInitGrid();

	//공통
	fnCommon();
	
	// 리스트 조회
	fnList("1");
	
	// 팝업화면 초기화
// 	fnInitPopup();
	
	$("#insertCorp").prop('disabled', false);
}

/**********************************************************
 * 초기화(그리드)
 **********************************************************/
function fnInitGrid(){

	// 그리드 컴럼 정보
	var columnsData = [
		      {header:'업체ID', name:'corp_id', sortable: true, width:300, hidden: true}
		    , {header:'업체한글명', name:'corp_ko_nm', sortable: true, width:400}
			, {header:'업체영문명', name:'corp_en_nm', align:'center', sortable: true, width:100}
			, {header:'법인번호', name:'corp_no', align:'center', sortable: true, width:120}
			, {header:'사업자번호', name:'biz_reg_no', align:'center', sortable: true, width:120}
			, {header:'대표자명', name:'rep_nm', align:'center', sortable: true, width:100}
			, {header:'주소', name:'addr', sortable: true}
			, {header:'연락처', name:'rep_telno', align:'center', sortable: true, width:100}
			, {header:'등록일', name:'reg_dttm', align:'center', width:80}   
<!--			, {header:'유지보수업체여부', name:'mntc_corp_yn', align:'center', width:100}   -->
 			, {header:'변경', name:'btn_upd_del', align:'center', width:160}
 			, {header:'corp_id', name:'corp_id', hidden: true}
 			, {header:'tr_corp_ko_nm', name:'tr_corp_ko_nm', hidden: true}	 
	];
	
	// 그리드 생성
	fnDrawGrid("04", "grid", columnsData);
}

/**********************************************************
 * 초기화(업체직원정보 그리드)
 **********************************************************/
function fnInitEmpGrid(){

	// 업체직원정보그리드 컴럼 정보
	var columnsEmpData = [
          {header:'이메일(로그인ID)', name:'emp_id', sortable:true, align:'center', width: 200}		
		, {header:'사용자명', name:'emp_nm', sortable:true, align:'center'}
		, {header:'부서', name:'dept_nm', sortable:true, align:'center', width: 100}
		, {header:'직급', name:'job_lvl_nm', sortable:true, align:'center', width: 80}    
        , {header:'사내번호', name:'intp_no', sortable:true, align:'center', width: 120}		    
        , {header:'휴대폰', name:'celp_no', sortable:true, align:'center', width: 120}		    
	];
	
	// 그리드 생성
	fnDrawGrid("04", "gridCorpEmpList", columnsEmpData);
}

/**********************************************************
 * 초기화(보유자산정보 그리드)
 **********************************************************/
 function fnInitAsetGrid(){

	// 보유자산정보 그리드 컴럼 정보
	var columnsAsetData = [
          {header:'자산구분'  , name:'aset_clsf_nm', sortable:true, align:'center', hidden:true, width: 200}		
		, {header:'자산명'   , name:'aset_nm', sortable:true, align:'center', width: 200}
		, {header:'제조업체명', name:'mnft_corp_nm', sortable:true, align:'center', hidden:true, align:'center', width: 100}
		, {header:'모델명'   , name:'aset_mdl_nm', sortable:true, align:'center', hidden:true, width: 100}
		, {header:'IP주소'  , name:'ip_addr', sortable:true, align:'center', hidden:true, width: 100}    
        , {header:'상태'    , name:'aset_stus_sep_nm', sortable:true, align:'center', width: 80}		    
        , {header:'장소'    , name:'instl_plce', sortable:true, align:'center', hidden:true, width: 150}    
		, {header:'업체명', name:'corp_ko_nm', align:'center', width:150}
		, {header:'담당자명', name:'emp_nm', align:'center', width:100}
		, {header:'도입일', name:'intd_dt', align:'center', sortable: true, width:100}
		, {header:'유지보수시작일', name:'ctrt_strt_dt', align:'center', sortable: true, width:100}
		, {header:'유지보수종료일', name:'ctrt_end_dt', align:'center', sortable: true, width:100}	        	   
	];
	
	// 그리드 생성
	fnDrawGrid("04", "gridCorpAsetList", columnsAsetData);
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
	fnAjax("<c:url value='/api/corp/corpList'/>", params, function(data) {

		if(successResCode == data.resCode){
			// RESET DATA(그리드)
			gridObj["grid"].resetData(data.corpList);
			
		}else{
			// 경고메세지
			fnWarnMsg('조회에 실패했습니다.');
		}
	});
}



/**********************************************************
* 업체정보 수정 데이터 조회
**********************************************************/
function fnPopupData(corpId){
	
	var param = { corpId : corpId };
	
	fnAjax("<c:url value='/api/corp/corpInfo'/>", param, function(data){
		if(successResCode == data.resCode) {
			$('#corpId').val(data.info.corp_id);
			$('#corpKoNm').val(data.info.corp_ko_nm);
			$('#corpEnNm').val(data.info.corp_en_nm);
			$('#corpNo').val(data.info.corp_no);
			$('#bizRegNo').val(data.info.biz_reg_no);
			$('#repNm').val(data.info.rep_nm);
			$('#addr').val(data.info.addr);
			$('#repTelno').val(data.info.rep_telno);
			$('#webSiteUrl').val(data.info.web_site_url);
			$('#mntcCorpYn').val(data.info.mntc_corp_yn);
			$('#regEmpId').val(loginUserId);
		} else {
			alert("업체정보 조회에 실패했습니다.");
		}
	});
}

</script>