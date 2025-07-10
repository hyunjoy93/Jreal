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
			<li>사원관리</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">사원관리</h2>
		</div>

	</div><!--//conHead-->

	<div class="conBody">

		<div class="search">

			<div class="box">
				<form>
					<table class="field">
						<tbody>
							<tr>
							<!-- 
								<th>사용권한</th>
								<td>
									<select class="select md" id="userGroup">
										<option value="" selected>전체</option>
										<option value="관리자">관리자</option>
										<option value="운용관제자">운용관제자</option>
										<option value="사용자">사용자</option>
										<option value="승인대기">승인대기</option>
									</select>
								</td>
								-->
								<th>검색어</th>
								<td>
									<select class="select md" id="searchType">
										<option value="searchEmpId">이메일주소</option>
										<option value="searchEmpCorpNm">회사명</option>
										<option value="searchEmpNm">사용자명</option>
									</select>
									<input type="text" class="input xxl" value="" placeholder="검색어입력"  id="searchStr">
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
<!-- 
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
 -->
				<div class="btns">
					<button type="button" class="bt bg secondary" id="downData">엑셀다운로드</button>
					<button type="button" class="bt bg secondary" id="totInsert">사원일괄추가</button>
					<button type="button" class="bt bg secondary" id="insertEmp">사원개별추가</button>
				</div>

			
			</div><!--//control-->
			
			<!-- GRID -->
			<div class="tui-grid">
				<div id="grid"></div>
			</div>
			<!--//control-->

		</div><!--//result-->

	</div><!--//pageBody-->

</section>

<!-- [팝업] 사용자추가 -->
<article class="popup hide" id="insertEmpPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">사용자추가</h5>
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
						<th>이메일(로그인ID)<span  style="color: red">*</span ></th>
						<td>
						<input type="text" class="input xl" value="" id="popEmpId">
						<button class="bt bg secondary" type="button" id="idCheck" value="N">중복확인</button>
						</td>
					</tr>
					<tr>
						<th>사용자명<span  style="color: red">*</span ></th>
						<td><input type="text" class="input" value="" id="popEmpNm"></td>
					</tr>					 
					<tr hidden="true">
						<th>회사ID</th>
						<td><input type="text" class="input" value="" id="popCorpId"></td>
					</tr> 
					<tr>
						<th>회사명<span  style="color: red">*</span ></th>
						<td><input type="text" class="input xxl" value="" id="popCorpKoNm" readonly>
							<button type="button" class="btFind bg primary"  id="popSearchCorpList"  style="margin-left:3px" >검색</button>
						</td>
					</tr>
					<tr>
						<th>부서명<span  style="color: red">*</span ></th>
						<td><input type="text" class="input" value="" id="popDeptNm"></td>
					</tr>
					<tr>
						<th>직급명</th>
						<td><input type="text" class="input" value="" id="popJobLvlNm"></td>
					</tr>
					<tr>
						<th>사내번호</th>
						<td><input type="text" class="input" value="" id="popIntpNo"></td>
					</tr>
					<tr>
						<th>휴대폰번호</th>
						<td><input type="text" class="input" value="" id="popCelpNo"></td>
					</tr>
					<tr>
						<th>사용자권한</th>
						<td>
							<select class="select" id="popUserGroup">
								<option value="" selected>선택</option>
								<option value="A01">시스템관리자</option>
								<option value="G01">일반사용자</option>
<!-- 								<option value="M01">유지보수업체 담당자</option> -->
<!-- 								<option value="S01">결재담당자</option> -->
							</select>
						</td>					
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

<!-- [팝업] 사용자수정-->

<article class="popup hide" id="updateEmpPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">사용자수정</h5>
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
						<th>이메일(로그인ID)<span  style="color: red">*</span ></th>
						<td><input type="text" class="input" value="" id="empId"></td>
					</tr>
					<tr>
						<th>사용자명<span  style="color: red">*</span ></th>
						<td><input type="text" class="input" value="" id="empNm"></td>
					</tr>
					<tr  hidden="true">
						<th>회사ID</th>
						<td><input type="text" class="input xl" value="" id="corpId"></td>
					</tr>
					<tr>
						<th>회사명<span  style="color: red">*</span ></th>
						<td><input type="text" class="input xl" value="" id="corpKoNm" readonly>
							<button type="button" class="btFind bg primary"  id="searchCorpList" >검색</button>
						</td>
					</tr>
					<tr>
						<th>부서명<span  style="color: red">*</span ></th>
						<td><input type="text" class="input" value="" id="deptNm"></td>
					</tr>
					<tr>
						<th>직급명</th>
						<td><input type="text" class="input" value="" id="jobLvlNm"></td>
					</tr>
					<tr>
						<th>사내번호</th>
						<td><input type="text" class="input" value="" id="intpNo"></td>
					</tr>
					<tr>
						<th>휴대폰번호</th>
						<td><input type="text" class="input" value="" id="celpNo"></td>
					</tr>
					<tr>
						<th>사용자권한</th>
						<td>
							<select class="select" id="authGrpCd">
								<option value="" selected>선택</option>
								<option value="A01">시스템관리자</option>
								<option value="G01">일반사용자</option>
<!-- 								<option value="M01">유지보수업체 담당자</option> -->
<!-- 								<option value="S01">결재담당자</option> -->
							</select>
						</td>
					</tr>
					<tr>
						<th>정보보안서약서</th>
						<td id="fileInitY1">
							<form id="empFiles1" action="api/ctl/fileUpload" method="post" enctype="multipart/form-data" target="empFiles">
						    	<p><input type="file" class="custom-file-input" id="secSignFile" name="uploadFileMulti"></p>
						    </form>
						</td>
						<td id="fileInitN1">
						    <p><a download class="row" id="downFileUp1" style="color:blue;"></a><button class="fiClose" style="float: right;" id="fileInit1"><i>파일초기화</i></button></p>
						</td>
					</tr>	
					<tr>
						<th>정보보안이수</th>
						<td id="fileInitY2">
							<form id="empFiles2" action="api/ctl/fileUpload" method="post" enctype="multipart/form-data" target="empFiles">
						    	<p><input type="file" class="custom-file-input" id="secEduFile" name="uploadFileMulti"></p>
						    </form>
						</td>
						<td id="fileInitN2">
						    <p><a download class="row" id="downFileUp2" style="color:blue;"></a><button class="fiClose" style="float: right;" id="fileInit2"><i>파일초기화</i></button></p>
						</td>
					</tr>
				</tbody>
			</table>
		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg danger" id="pwInit" >비밀번호 초기화</button>
				<button type="button" class="bt max bg primary" id="updSave">저장</button>
				<button type="button" class="bt max bd btClose" id="updCancleAndClose">취소</button>
			</div>
		</div>

	</div>
</article>	

<iframe id="empFiles" name="empFiles" style="display:none"></iframe>

<article class="popup hide" id="popFileUpload">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">사원일괄추가</h5>
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
	
	// 사용자 추가
	$("#insertEmp").on("click", function(e){
		fnStopEvent(e);
		$("#popEmpId").val("");
		$("#popEmpId").prop("disabled", false);
		$("#popCorpId").val("");
		$("#popCorpKoNm").val("");
		$("#popEmpNo").val("");
		$("#popEmpNm").val("");
		$("#popDeptNm").val("");
		$("#popJobLvlNm").val("");
		$("#popIntpNo").val("");
		$("#popCelpNo").val("");
		$("#popAuthGrpCd").val("");
		$('#insertEmpPopup').removeClass('hide');
	});
	
	// 검색 조건 입력 후 조회
	$("#btnSearch").on("click", function(e){
		fnStopEvent(e);
		fnList("1");
	});
	
	// 비밀번호 초기화
	$("#pwInit").on("click", function(e){
		alert("비밀번호 초기화시 관리자가 지정한 패스워드로 초기화 됩니다.\n관리자에게 초기 비밀번호 공유를 요청해주세요.")
		fnAjax("<c:url value='/api/ctl/updateUserPw'/>", {empId: loginUserId, pswd: 'hKdwzuzRUIRAfKFoz1aFmRGjaGdbHyuo1/+wr4VTKNY='}, function(data) {
			if(successResCode == data.resCode){
				alert("비밀번호가 초기화되었습니다.");
				location.reload();
			} else {
				alert("비밀번호 초기화에 실패했습니다.");
			}
		});
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
		$("#userGroup").val("");
	});
	
	// 사용자 수정
	$(document).on("click", ".user-update", function(e){
		
		fnStopEvent(e);
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		var cell = gridObj["grid"].getFocusedCell();	
 		var empId = gridObj["grid"].getValue(cell.rowKey, "emp_id", true);
 		
 		//var corpId = gridObj["grid"].getValue(cell.rowKey, "corp_id", true);
 		//var corpKoNm = gridObj["grid"].getValue(cell.rowKey, "corp_ko_nm", true);
 		
 		fnPopupData(empId);
		$("#empId").prop("disabled", true);
		$("#corpId").prop("disabled", true);
		// 레이어팝업 보여줌
		$('#updateEmpPopup').removeClass('hide');
		
		var updUserData = fnNullChangeBlank(gridObj["grid"].getRow(cell.rowKey));
		console.log("수정할 데이터 >>>>> " + JSON.stringify(updUserData));
		
	});
	
	// 사용자 수정 팝업에서 저장 버튼 클릭
	$("#updSave").on("click", function(e){
		fnStopEvent(e);
		console.log("수정-저장 click");

		// input data null체크 진행
		if(fnNullCheck() == false) {
			$("#empId").focus();
			return;
		};
		
		var success = false;
		
		var param = {
				empId : $("#empId").val()
			  , corpId : $("#corpId").val()
			  , corpKoNm : $("#corpKoNm").val()
			  , empNo : $("#empNo").val()
			  , empNm : $("#empNm").val()
			  , deptNm : $("#deptNm").val()	
			  , jobLvlNm : $("#jobLvlNm").val()
			  , intpNo : $("#intpNo").val()
			  , celpNo : $("#celpNo").val()
			  , authGrpCd : $("#authGrpCd").val()
		}
		
		console.log(param);
		
		fnAjax("<c:url value='/api/ctl/update'/>", param, function(data){
			if(successResCode == data.resCode) {
				alert("사용자 정보 수정에 성공하였습니다.");
				// 리스트 새로고침
				fnList("1");
				$(".btClose").click();
			} else {
            	alert("사용자 정보 수정에 실패하였습니다.");
			}
		});
		
		let form1 = new FormData($("#empFiles1")[0]);
		let form2 = new FormData($("#empFiles2")[0]);
		
		// form1에서 파일 필드의 값을 가져옴
		let file1 = form1.files;
		// form2에서 파일 필드의 값을 가져옴
		let file2 = form2.files;
		
		form1.append("fileType", "sec");
		form2.append("fileType", "edu");
		form1.append("empId", $("#empId").val());
		form2.append("empId", $("#empId").val());
		
	    let apiUrl = "/api/ctl/fileUpload";
		
	 	// 파일이 존재하는지 확인
	    $.ajax({
			url : apiUrl,
			type : "POST",
			data : form1,
			dataType: "json",
			processData: false,
			contentType: false,
			enctype : 'multipart/form-data',
// 			success: function(result) {
// 				alert("사용자 보안서약서 등록에 성공하였습니다.");
// 			},
//             error: function(xhr, status, error) {
//             	alert("사용자 보안서약서 등록에 실패하였습니다.");
//             }
		});
		$.ajax({
			url : apiUrl,
			type : "POST",
			data : form2,
			dataType: "json",
			processData: false,
			contentType: false,
			enctype : 'multipart/form-data',
// 			success: function(result) {
// 				alert("사용자 보안교육이수 확인파일 등록에 성공하였습니다.");
// 			},
//             error: function(xhr, status, error) {
//             	alert("사용자 보안교육이수 확인파일 등록에 실패하였습니다.");
//             }
		});
	});
	
	$('.fiClose').click(function(e) {
		var sno = $(this).prop("id").slice(-1);
		$('#fileInitN' + sno).hide();
		$('#fileInitY' + sno).show();
	});
	
	
	// 사용자 삭제
	$(document).on("click", ".user-delete", function(e){
		fnStopEvent(e);
		var cell = gridObj["grid"].getFocusedCell();
		console.log("user-delete cell==>" + cell.rowKey);	
		
		var empId = fnNullChangeBlank(gridObj["grid"].getValue(cell.rowKey, "emp_id"));
		console.log("del user_id==>" + empId);	
		
		var param = {
				empId : empId
		}
		
		console.log(param);
		
		if (!confirm("정말 삭제하시겠습니까?")) {
	        // 취소(아니오) 버튼 클릭 시 이벤트
			alert("삭제 취소되었습니다.");
	    } else {
	        // 확인(예) 버튼 클릭 시 이벤트
	    	fnAjax("<c:url value='/api/ctl/delete'/>", param, function(data){
				if(successResCode == data.resCode) {
					alert("사용자 삭제에 성공했습니다.");
					// 리스트 새로고침
					fnList("1");
				} else {
					alert("사용자 삭제에 실패했습니다.");
				}
			});
	    }
	});
	
	// 사용자 추가 팝업에서 저장 버튼 클릭
	$("#btnSave").on("click", function(e){
		fnStopEvent(e);
		console.log("팝업-저장 click");
		
		// input data null체크 진행
		if(fnPopNullCheck() == false) {
			$("#popEmpId").focus();
			return;
		};
		
		// ID 중복체크 진행 여부 확인
		let idCheckVal = $("#idCheck").val();	
		
		if(idCheckVal == "N") {
			
			alert("사용자ID 중복체크는 필수사항입니다.");
			
		} else if(idCheckVal == "Y") {
			
			var param = {	
					popEmpId : $("#popEmpId").val()
				  , popCorpId : $("#popCorpId").val()
			      , popEmpNo : $("#popEmpNo").val()
				  , popEmpNm : $("#popEmpNm").val()
				  , popDeptNm : $("#popDeptNm").val()
				  , popJobLvlNm : $("#popJobLvlNm").val()
				  , popIntpNo : $("#popIntpNo").val()
				  , popCelpNo : $("#popCelpNo").val()
				  , popAuthGrpCd : $("#popUserGroup").val()
			}
			
			console.log(param);
			
			fnAjax("<c:url value='/api/ctl/add'/>", param, function(data){
				if(successResCode == data.resCode) {
					alert("사용자가 추가되었습니다.");
					// 리스트 새로고침
					fnList("1");
					$(".btClose").click();
					$("#popEmpId").attr("disabled", false);
				} else {
					alert("사용자 추가에 실패했습니다.");
				}
			});
		}
				
	});
	
	
	// 사용자 추가 팝업에서 중복확인 버튼 클릭
	$("#idCheck").on("click", function(e){
		fnStopEvent(e);
		
		var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		
		if(!emailPattern.test($('#popEmpId').val())) {
			alert('이메일형식이 올바르지 않습니다. 이메일형식을 확인해주세요.');
			return;
		}
		
		if(fnValidatorRequir("이메일(로그인ID)", "popEmpId", "popEmpId", "이메일(로그인ID)를 입력해주세요.") == true) {
			return;
		} else {
			$.ajax({
				url : "/api/ctl/check",
				type : "post",
				dataType : "json",
				data : {popEmpId : $("#popEmpId").val()},
				success : function(data){
					
					let idCheckResult = data.idCheckResult;
					console.log(idCheckResult);
					
					if (idCheckResult == "disable") {
						alert("중복된 사용자ID가 존재합니다. 사용자ID를 확인해주세요.");
					} else if (idCheckResult == "able") {
						$("#idCheck").attr("value", "Y");
						$("#popEmpId").prop("disabled", true);
						alert("사용 가능한 사용자ID입니다.");
					}
					
					let idCheckVal = $("#idCheck").val();
					
					/* if(idCheckVal == "N") {
						alert("사용자ID 중복체크는 필수사항입니다.");
					} else if(idCheckVal == "Y") {
						
					} */
					
				} 
			
			});
		}

	});
	

	// 사용자추가, 업체정보 팝업 호출
 	$('#popSearchCorpList').on("click", function(e){
 		
		e.preventDefault();

		$('#corpKoNm').val("");
 		$('#gridCorpList').empty();

 		fnInitCorpGrid();
 		
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

	// 사용자수정, 업체정보 팝업 호출
 	$('#searchCorpList').on("click", function(e){
 		
		e.preventDefault();

		$('#corpKoNm').val("");
 		$('#gridCorpList').empty();

 		fnInitCorpGrid();
 		
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
	
});

$("#excelSave").click(function() {
    var file = $("#file1").prop("files")[0];
    
    if (file) {
        var formData = new FormData();
        formData.append("file", file);
        
        $.ajax({
            url: "/api/ctl/excelUpload",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            success: function(data) {
    			if(successResCode == data.resCode){
                    alert("사원정보가 업로드 되었습니다.");
                    $('#popFileUpload').addClass('hide');
    		 		location.reload();
    			}else{
    				// 경고메세지
                    alert("사원정보 업로드에 실패하였습니다.");
    			}
            },
            error: function(xhr, status, error) {
                // Handle the error response
                alert("File upload failed: " + error);
            }
        });
    }
});

$("#totInsert").click(function() {
	$('#popFileUpload').removeClass('hide');
});

// 엑셀다운로드 버튼 클릭 이벤트
$("#downData").click(function() {
	  $.ajax({
	    url: "/api/ctl/excelDownload",
	    type: "POST",
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

/********************************************************** 
 * 사용자 추가 팝업 내부 null check
 **********************************************************/

function fnPopNullCheck(){
	
	if ($("#popCorpId").val() == "" || $("#popCorpId").val() == null || $("#popCorpId").val() == undefined) {
		alert("회사정보를 입력해주세요.");
		return false;
	}else if ($("#popEmpNm").val() == "" || $("#popEmpNm").val() == null || $("#popEmpNm").val() == undefined) {
		alert("사용자명을 입력해주세요.");
		return false;
	}else if ($("#popDeptNm").val() == "" || $("#popDeptNm").val() == null || $("#popDeptNm").val() == undefined) {
		alert("부서명을 입력해주세요.");
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
 * 사용자 추가 팝업 내부 null check
 **********************************************************/

function fnNullCheck(){
	
	if ($("#corpId").val() == "" || $("#corpId").val() == null || $("#corpId").val() == undefined) {
		alert("회사정보를 입력해주세요.");
		return false;
	}else if ($("#empNm").val() == "" || $("#empNm").val() == null || $("#empNm").val() == undefined) {
		alert("사용자명을 입력해주세요.");
		return false;
	}else if ($("#deptNm").val() == "" || $("#deptNm").val() == null || $("#deptNm").val() == undefined) {
		alert("부서명을 입력해주세요.");
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
	fnInitGnbLnb(2, 2, 2, 2);
	
	// 그리드 초기화
	fnInitGrid();
	
	//공통
	fnCommon();
	
	// 리스트 조회
	fnList("1");
	
	// 팝업화면 초기화
	//fnInitPopup();
	
	$("#insertEmp").prop('disabled', false);
}


/**********************************************************
 * 초기화(그리드)
 **********************************************************/
function fnInitGrid(){
	
	// 그리드 컬럼 정보
	var columnsData = [
		  {header:'이메일(로그인ID)', name:'emp_id', sortable:true, align:'center'}	    
		, {header:'사용자명', name:'emp_nm', sortable:true, align:'center'}
		, {header:'회사ID', name:'corp_id', sortable:true, align:'center', hidden:true}	    
		, {header:'회사명', name:'corp_ko_nm', sortable:true, align:'center'}	
		, {header:'사번', name:'emp_no', sortable:true, align:'center', hidden:true}
		, {header:'부서명', name:'dept_nm', sortable:true, align:'center'}
		, {header:'직급명', name:'job_lvl_nm', sortable:true, align:'center'}
        , {header:'사내번호', name:'intp_no', sortable:true, align:'center'}		    
        , {header:'휴대폰번호', name:'celp_no', sortable:true, align:'center'}		    
        , {header:'사용자권한', name:'auth_grp_nm', sortable:true, align:'center'}		    
        , {header:'보안서약서등록여부', name:'scrt_pldg_reg_yn', sortable:true, align:'center'}			    
        , {header:'교육이수파일등록여부', name:'edu_cmplt_file_reg_yn', sortable:true, align:'center'}			    
        , {header:'auth_grp_cd', name:'auth_grp_cd', sortable:true, align:'center', hidden:true}		    
		, {header:'변경', name:'btn_upd_del', align:'center', width:160}
	];
	
	// 그리드 생성
	fnDrawGrid("00", "grid", columnsData);
	gridObj["grid"].hideColumn('_checked');
	
}


 /**********************************************************
  * 리스트(그리드) 조회
  **********************************************************/
function fnList(slcPageNo){
	 
	 // 파라미터 설정
	 var params = {
			 searchStr : $("#searchStr").val(),
			 searchType : $("#searchType").val(),
			 userGroup : $("#userGroup").val()
	 };
	 console.log(params);
	 
	 // 그리드에 뿌려질 리스트 조회
	 fnAjax("<c:url value='/api/ctl/list'/>", params, function(data){
		 
		 if(successResCode = data.resCode){ //조회성공
			 
			// SET 리스트전체건수
			$("#listTotalCount").val(data.total_count);
		 	
		 	// RESET DATA(그리드에 데이터 입력)
		 	gridObj["grid"].resetData(data.list);

		 } else { //조회실패
			// 경고메세지
			alert('사원정보 조회에 실패했습니다.')
		 }
	 })
	 
 }
 
  /**********************************************************
  * 사용자정보 수정 데이터 조회
  **********************************************************/
 function fnPopupData(empId){
	
 	var param = { empId : empId };
 	
 	fnAjax("<c:url value='/api/ctl/userDetail'/>", param, function(data){
 		if(successResCode == data.resCode) {
			$('#empId').val(data.detail.emp_id);
			$('#corpId').val(data.detail.corp_id);
			$('#corpKoNm').val(data.detail.corp_ko_nm);
			$('#empNm').val(data.detail.emp_nm);
			$('#deptNm').val(data.detail.dept_nm);
			$('#jobLvlNm').val(data.detail.job_lvl_nm);
			$('#intpNo').val(data.detail.intp_no);
			$('#celpNo').val(data.detail.celp_no);
			$('#authGrpCd').val(data.detail.auth_grp_cd);
			
			$('#downFileUp1').text('');
			$('#downFileUp1').prop('name', '');
			$('#downFileUp1').removeClass('downFiles');
			$('#downFileUp1').prop('href', '');
			
			$('#downFileUp2').text('');
			$('#downFileUp2').prop('name', '');
			$('#downFileUp2').removeClass('downFiles');
			$('#downFileUp2').prop('href', '');
			
			if(data.EmpFile1.length < 1) {
				$('#fileInitN1').hide();
				$('#fileInitY1').show();
			} else {
				$('#fileInitN1').show();
				$('#fileInitY1').hide();
				var fileName1 = data.EmpFile1[0].apnd_file_nm.split('^');
				$('#downFileUp1').text(fileName1[1]);
				
				$('#downFileUp1').prop('name', data.EmpFile1[0].apnd_file_trg_id + '-' + data.EmpFile1[0].apnd_file_sno)
				$('#downFileUp1').addClass('downFiles');
				var filePath1 = '../../uploadFiles/E/sec/' + data.EmpFile1[0].apnd_file_nm;
				
				$('#downFileUp1').prop('href', filePath1);
				$('#downFileUp1').prop('download', data.EmpFile1[0].apnd_file_nm);
			}
			
			if(data.EmpFile2.length < 1) {
				$('#fileInitN2').hide();
				$('#fileInitY2').show();
			} else {
				$('#fileInitN2').show();
				$('#fileInitY2').hide();
				var fileName2 = data.EmpFile2[0].apnd_file_nm.split('^');
				$('#downFileUp2').text(fileName2[1]);
				
				$('#downFileUp2').prop('name', data.EmpFile2[0].apnd_file_trg_id + '-' + data.EmpFile2[0].apnd_file_sno)
				$('#downFileUp2').addClass('downFiles');
				
				var filePath2 = '../../uploadFiles/E/edu/' + data.EmpFile2[0].apnd_file_nm;
				
				$('#downFileUp2').prop('href', filePath2);
				$('#downFileUp2').prop('download', data.EmpFile2[0].apnd_file_nm);

			}
 		} else {
 			alert("사용자 상세내역 조회에 실패했습니다.");
 		}
 	});
 }
 

 /**********************************************************
  * 초기화(결재자[정] 그리드)
  **********************************************************/
 function fnInitCorpGrid(){

 	// 결재자[정] 그리드 컬럼 정보
 	var columnsData = [
 		  {header:'업체한글명', name:'corp_ko_nm1', sortable:true, align:'center', width: 150}   
 		, {header:'업체영문명', name:'corp_en_nm' , sortable:true, align:'center', width: 100}   
 		, {header:'대표자명' , name:'rep_nm'     , sortable:true, align:'center', width: 100}    
 		, {header:'사업자번호', name:'biz_reg_no' , sortable:true, align:'center', width: 100}
 	];
 	
 	// 그리드 생성
 	fnDrawGrid("04", "gridCorpList", columnsData);
 }

</script>