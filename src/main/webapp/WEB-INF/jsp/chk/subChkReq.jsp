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
			<li>점검관리</li>
			<li>점검요청</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">점검요청</h2>
		</div>

	</div><!--//conHead-->

	<div class="conBody">
<!-- 		<h3 class="pageTitle">점검자산</h3> -->
		<div class="gridFlex" style="	 justify-content: space-around;">
			<div class="resultTree" style="width:50%;">
					<div class="dd" id="nestable" ></div>
			</div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
			<div class="resultTree" style="width:50%;">
					<div class="gridSub">
					    <div class="popBox">
					         <div class="conBody cols">
								<div class="panel fix">
					
									<div class="headline">
										<h6 class="minTitle">점검요청정보</h6>
									</div>
									<table class="field">
										<colgroup>
											<col width="80px">
											<col width="400px">
										</colgroup>
										<tbody>
											<tr>
												<th>점검구분</th>
												<td>
													<span class="check"><input id="radio1-1" type="radio" name="popClsfCd" value="1" ><label>정기</label></span>
													<span class="check"><input id="radio1-2" type="radio" name="popClsfCd" value="2" ><label>장애</label></span>
													<span class="check"><input id="radio1-3" type="radio" name="popClsfCd" value="3" ><label>긴급</label></span>
													<!-- <span class="check"><input id="radio1-3" type="radio" name="popClsfCd" value="4" ><label>기타</label></span> -->
												</td>
											</tr>
											<tr>
												<th>지원형태</th>
												<td>
												    <span class="check"><input id="radio2-1" type="radio" name="popSptType" value="V" ><label>현장</label></span>
													<span class="check"><input id="radio2-2" type="radio" name="popSptType" value="R" ><label>원격</label></span>
												</td>
											</tr>
											<tr>
												<th>방문예정일</th>
												<td>
												    <input id="popVisitDate" type="text" class="input date" placeholder="방문예정일" readonly>
												</td>
											</tr>
											<tr>
												<th>점검내용</th>
												<td>
												     <input id="popChkNote" type="text" class="input" placeholder="점검 내용을 입력해주세요.">
												</td>	
											</tr>
											<tr>
												<th>결재자(정)</th>
												<td >
												     <input id="assignnameJung" type="text" class="input xxl" placeholder="결재자를 지정해주세요." readonly>
													 <input id="emailJung" type="text"  hidden="true">
													 <input id="asetList" type="text"  hidden="true">
													 <button type="button" class="btFind bg primary"  id="searchAssignJung" >검색</button>
												</td>	
											</tr>
											<tr>
												<th>결재자(부)</th>
												<td>
												     <input id="assignnameBu" type="text" class="input xxl" placeholder="결재자를 지정해주세요." readonly>
													 <input id="emailBu" type="text"  hidden="true">
													 <button type="button" class="btFind bg primary"  id="searchAssignBu" >검색</button>
												</td>	
											</tr>
										</tbody>
									</table>
								</div><!--//panel-->
							<div class="btns" style="flex-direction: column-reverse; margin-bottom: 5px;">
							<button type="button" class="bt bg primary" id="btnSave">저장</button>
							</div>
						</div>
					</div>
			</div>
		</div><!--//result-->
		<textarea id="nestable-output"  style="display:none;"></textarea>

	</div><!--//pageBody-->
</div>
</section>

<!-- [팝업] 결재자[정] 권한 사원 정보 -->
<article class="popup hide" id="corpEmpJungListPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle" id="corpPopTitle">결재자검색</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="result">
			<div class="tui-grid" id = "corpEmpGrid" style="height: 500px;">
				<div id="gridCorpJungEmpList"></div>
			</div>
		</div><!--//result-->


	</div>


</article>	

<!-- [팝업] 결재자[부] 권한 사원 정보 -->
<article class="popup hide" id="corpEmpBuListPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle" id="corpPopTitle">결자자검색</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="result">
			<div class="tui-grid" id = "corpEmpGrid" style="height: 500px;">
				<div id="gridCorpBuEmpList"></div>
			</div>
		</div><!--//result-->


	</div>


</article>	
<!-- form hidden value -->
<form id="viewFrm" name="viewFrm" method="post">
    <input type="hidden" id="incidentYn"  name="incidentYn" value="${incidentYn}"/>
</form>
	
<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/footer" />

<script type="text/javaScript">


$(function(){  // === $(document).ready
	// 초기화
	fnInit();

	
    
});

/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){
	
	// 메뉴 초기화
	fnInitGnbLnb(3, 2, 3, 2);
	
	//공통
	fnCommon();
	
	// 리스트(Tree) 조회
	fnTreeList();
	
	// 팝업화면 초기화
	//fnInitPopup();
}

	//저장클릭
	$('#btnSave').on("click", function(e){
		
		var asetList = "";
		var nCnt = 0;

		$('input:checkbox[name="chbox"]').each(function(idx, val) {
			var asetMap = {};
			if($(this).is(':checked')) {
				var asetId = $(this).parents().filter('[data-id]').attr('data-id');
				if(nCnt == 0) {
					asetList += asetId.split('_')[1];
					nCnt++;
				} else {
					asetList += "," + asetId.split('_')[1];
					nCnt++;
				}
			}
			$('#asetList').val(asetList);
		});
		
		
		if(nCnt == 0) {
			alert("점검요청 자산을 선택해주세요");
			return false;
		} else if ($("input:radio[name='popClsfCd']:checked").val() == "" || $("input:radio[name='popClsfCd']:checked").val() == null || $("input:radio[name='popClsfCd']:checked").val() == undefined) {
			alert("점검구분을 선택해주세요");
			return false;
		} else if ($("input:radio[name='popSptType']:checked").val() == "" || $("input:radio[name='popSptType']:checked").val() == null || $("input:radio[name='popSptType']:checked").val() == undefined) {
			alert("지원형태를 선택해주세요");
			return false;
		} else if ($("#popVisitDate").val() == "" || $("#popVisitDate").val() == null || $("#popVisitDate").val() == undefined) {
			alert("방문예정일을 입력해주세요.");
			return false;
		} else if ($("#popChkNote").val() == "" || $("#popChkNote").val() == null || $("#popChkNote").val() == undefined) {
			alert("점검내용을 입력해주세요.");
			return false;
		} else if ($("#assignnameJung").val() == "" || $("#assignnameJung").val() == null || $("#assignnameJung").val() == undefined) {
			alert("결재자를 지정해주세요.");
			return false;
		} else if ($("#assignnameBu").val() == "" || $("#assignnameBu").val() == null || $("#assignnameBu").val() == undefined) {
			alert("결재자를 지정해주세요.");
			return false;
		}
		
		var param = {
				chkSprtTypeCd : $("input:radio[name='popSptType']:checked").val()
			  , chkSepCd : $("input:radio[name='popClsfCd']:checked").val()
			  , vistPlanDt : $("#popVisitDate").val().replaceAll('-','')
			  , chkReqCtnt : $("#popChkNote").val()
			  , asetList   : $('#asetList').val()
			  , asignBuId  : $('#emailBu').val()
			  , asignJungId : $('#emailJung').val()
		}
		
		fnAjax("<c:url value='/api/chk/chkReqSave'/>", param, function(data){
			if(successResCode == data.resCode) {
				alert("점검 요청이 완료되었습니다.");
		 		location.reload();
			} else {
				alert("점검 요청에 실패했습니다. 요청 항목을 확인해주세요.");
			}
		});
		
		
	});

	// 업체 결재권한 사용자 내용 팝업 호출
 	$('#searchAssignJung').on("click", function(e){
		e.preventDefault();

		$('#assignnameJung').val("");
 		$('#gridCorpJungEmpList').empty();
 		
 		fnInitEmpJungGrid();
		
		fnStopEvent(e);

		let param = { auth_grp_cd : "S01",  corpId : ""};
		
		fnDetailList(param);
		
		$(document).on("click", "#gridCorpJungEmpList .tui-grid-table tbody tr td", function(e){	
			e.preventDefault();
			$('#gridCorpJungEmpList').empty();
			
	 		let cell = gridObj["gridCorpJungEmpList"].getFocusedCell();
		
	 		let empNm = gridObj["gridCorpJungEmpList"].getValue(cell.rowKey, "emp_nm", true);
	 		let empId = gridObj["gridCorpJungEmpList"].getValue(cell.rowKey, "emp_id", true);
	 		let corpNm = gridObj["gridCorpJungEmpList"].getValue(cell.rowKey, "corp_ko_nm", true);
	 		let deptNm = gridObj["gridCorpJungEmpList"].getValue(cell.rowKey, "dept_nm", true);
			$('#assignnameJung').val('');
			$('#emailJung').val(empId);
			$('#assignnameJung').val(corpNm + " > " + deptNm + ' > ' + empNm);
			
			$('#corpEmpJungListPopup').addClass('hide');
	 	});
		
		/**********************************************************
		 * 리스트(그리드) 조회
		 **********************************************************/
		function fnDetailList(param){
		    
			// GRID 리스트 조회
			fnAjax("<c:url value='/api/corp/corpEmpList'/>", param, function(data) {
		
				if(successResCode == data.resCode){
					// RESET DATA(그리드)
					gridObj["gridCorpJungEmpList"].resetData(data.corpEmpList);
							
				}else{
					// 경고메세지
					fnWarnMsg('조회에 실패했습니다.');
				}
			});
		}
		// 레이어팝업 보여줌
		$('#corpEmpJungListPopup').removeClass('hide');
	}); 

	// 업체 결재권한 사용자 내용 팝업 호출
	$('#searchAssignBu').on("click", function(e){
		e.preventDefault();
		
		$('#assignnameBu').val("");
 		
		fnInitEmpBuGrid();
		
		fnStopEvent(e);

		let param = { auth_grp_cd : "S01",  corpId : ""};
		
		fnDetailList(param);
		
		$(document).on("click", "#gridCorpBuEmpList .tui-grid-table tbody tr td", function(e){	
			e.preventDefault();
			$('#gridCorpBuEmpList').empty();
			
	 		let cell = gridObj["gridCorpBuEmpList"].getFocusedCell();
		
	 		let empNm = gridObj["gridCorpBuEmpList"].getValue(cell.rowKey, "emp_nm", true);
	 		let empId = gridObj["gridCorpBuEmpList"].getValue(cell.rowKey, "emp_id", true);
	 		let corpNm = gridObj["gridCorpBuEmpList"].getValue(cell.rowKey, "corp_ko_nm", true);
	 		let deptNm = gridObj["gridCorpBuEmpList"].getValue(cell.rowKey, "dept_nm", true);
	 		
			$('#assignnameBu').val("");
			$('#emailBu').val(empId);
			$('#assignnameBu').val(corpNm + " > " + deptNm + " > " + empNm);
			
			$('#corpEmpBuListPopup').addClass('hide');
	 	});
		
		/**********************************************************
		 * 리스트(그리드) 조회
		 **********************************************************/
		function fnDetailList(param){
		    
			// GRID 리스트 조회
			fnAjax("<c:url value='/api/corp/corpEmpList'/>", param, function(data) {
		
				if(successResCode == data.resCode){
					// RESET DATA(그리드)
					gridObj["gridCorpBuEmpList"].resetData(data.corpEmpList);
							
				}else{
					// 경고메세지
					fnWarnMsg('조회에 실패했습니다.');
				}
			});
		}
		// 레이어팝업 보여줌
		$('#corpEmpBuListPopup').removeClass('hide');
 	});
	
/**********************************************************
 * 초기화(결재자[정] 그리드)
 **********************************************************/
function fnInitEmpJungGrid(){

	// 결재자[정] 그리드 컬럼 정보
	var columnsEmpData = [
		  {header:'사용자명', name:'emp_nm', sortable:true, align:'center', width: 100}   
		, {header:'사원ID', name:'emp_id', sortable:true, align:'center', width: 150}    
		, {header:'회사명', name:'corp_ko_nm', sortable:true, align:'center', width: 100}   
		, {header:'부서명', name:'dept_nm', sortable:true, align:'center', width: 100}
		, {header:'직급명', name:'job_lvl_nm', sortable:true, align:'center', width: 100, hidden:true}
	];
	
	// 그리드 생성
	fnDrawGrid("04", "gridCorpJungEmpList", columnsEmpData);
}
	
/**********************************************************
 * 초기화(결재자[부] 그리드)
 **********************************************************/
function fnInitEmpBuGrid(){

	// 결재자[정] 그리드 컬럼 정보
	var columnsEmpData = [
		  {header:'사용자명', name:'emp_nm', sortable:true, align:'center', width: 100}   
		, {header:'사원ID', name:'emp_id', sortable:true, align:'center', width: 150}     
		, {header:'회사명', name:'corp_ko_nm', sortable:true, align:'center', width: 100}   
		, {header:'부서명', name:'dept_nm', sortable:true, align:'center', width: 100}
		, {header:'직급명', name:'job_lvl_nm', sortable:true, align:'center', width: 100, hidden:true} 
	];
	
	// 그리드 생성
	fnDrawGrid("04", "gridCorpBuEmpList", columnsEmpData);
}
	
/**********************************************************
 * 리스트(Tree) 조회
 **********************************************************/
function fnTreeList(){

	var params = {
		loginUserId : loginUserId,
		loginUserGroup : loginUserGroup
	};
	
	var treeData=[];
	// tree 리스트 조회
	fnAjax("<c:url value='/api/chk/chkReqList'/>", params, function(data) {
		if(successResCode == data.resCode){
			var treeCorpList = [];
			var corpList = data.chkReqCorpList;
			var asetList = data.chkReqAsetList;
			
			for(var idx in corpList) {
				var corpMap={
				    id      : corpList[idx].corp_id,
				    content : corpList[idx].corp_ko_nm
				};
				treeCorpList.push(corpMap);
			}
			
			for(var idx in treeCorpList) {
				var child = [];
				var idChk = treeCorpList[idx].id;
				for(var j in asetList) {
					if(idChk == asetList[j].corp_id) {
						var asetMap = {
								id      : idChk + '_' + asetList[j].aset_id,
								content : asetList[j].content
						}
						child.push(asetMap);
					}
					
					
				}
				treeCorpList[idx].children = child;
			}
			
		    var updateOutput = function(e) {
		        var list = e.length ? e : $(e.target),
		            output = list.data('output');
		        if(window.JSON) {
		            output.val(window.JSON.stringify(list.nestable('serialize')));//, null, 2));
		        }
		        else {
		            output.val('JSON browser support required for this demo.');
		        }
		    };
		    //activate Nestable for list 1
		    $('#nestable').nestable({
		        group: 1,
		        json: treeCorpList
		    }).on('change', updateOutput);

		    //output initial serialised data
		    updateOutput($('#nestable').data('output', $('#nestable-output')));
		    
		    
			$('#nestable > ol > li > .dd-handle').each(function(e) {
				var labelTag = $('<label>').addClass('treeLabel treeLabel-default treeLabel-xs').text('담당업체');
				
				$(this).prepend(labelTag);
				
			});
			
			$('#nestable > ol > li > ol').each(function(e) {
				$(this).attr('style', 'padding-left: 30px;');
				
			});
		    
			$('#nestable').children().children().children().children().children().each(function(e) {
				var labelTag = $('<span style="position: relative; display: inline-block;"><input type="checkbox" name="chbox" value="N" style="width:30px; appearance: auto; !important;"></span>');
				
				$(this).prepend(labelTag);			
			});
			
			
			$('ol > li > button:nth-child(-n+2)').each(function(e) {
					$(this).remove();
			});
			
		}else{
			// 경고메세지
			fnWarnMsg('조회에 실패했습니다.');
		}
	});
}

/* 조회기간 시작일 종료일 min, max 설정 */
$("#popVisitDate").datepicker({
	dateFormat: "yy-mm-dd",  
	onClose : function(selectedDate){
		$("#popVisitDate").datepicker("setDate", selectedDate);
	}
});

</script>