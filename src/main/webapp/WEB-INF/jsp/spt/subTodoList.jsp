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
			<li>업무관리</li>
			<li>나의업무현황</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">나의업무현황</h2>
		</div>

	</div><!--//conHead-->

	<div class="conBody">

		<div class="result gridFlex">

			<div class="verticalFlex">
				<!-- grid -->
				오늘의 계약 일정
				<div class="tui-grid" style="height: 95%;">
					<div id="grid"></div>
				</div>
			</div><!--//control-->
			<div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
			<!-- GRID -->
			<div class="verticalFlex" style="margin-right:1px;">
				<!-- GRID2 -->
				오늘의 출퇴근 시간표
				<div class="tui-grid"  style="height:95%;">
					<div id="grid2"></div>
				</div>
			</div>
			
		</div><!--//result-->

	</div><!--//pageBody-->

</section>

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

	// 자산상세 팝업 호출
 	$(document).on("click","#asetInfo", function(e){	
		 		
 		fnStopEvent(e);
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		var cell = gridObj["grid2"].getFocusedCell();	
 		var asetId = gridObj["grid2"].getValue(cell.rowKey, "aset_id", true); 	
 		 		
 		fnPopupData(asetId);
		$("#asetId").prop("disabled", true);
		// 레이어팝업 보updateEmpPopup
		$('#asetDtlPopup').removeClass('hide');
		
		var asetDtlData = fnNullChangeBlank(gridObj["grid2"].getRow(cell.rowKey));
		console.log("수정할 데이터 >>>>> " + JSON.stringify(asetDtlData));
	});

	// 결재자(부) 팝업 호출
 	$(document).on("click","#apvl_1", function(e){	
		 		
 		fnStopEvent(e);
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		var cell          = gridObj["grid"].getFocusedCell();	
 		var chkReqSno     = gridObj["grid"].getValue(cell.rowKey, "chk_req_sno", true); 
 		var apvlPrcSeqno  = "1"; 
 		var apvlPrcSepCd1 = gridObj["grid"].getValue(cell.rowKey, "apvl_prc_sep_cd_1", true); 	
 		 		 		
 		fnPopupApvlData(chkReqSno,apvlPrcSeqno,apvlPrcSepCd1);

		$("#chkReqSno").prop("disabled", true);
		$("#apvlPrcSeqno").prop("disabled", true);
		$("#apvlPrcSepCd1").prop("disabled", true);
		
		// 레이어팝업 보updateEmpPopup
		$('#apvlPopup').removeClass('hide');
		
		var apvlData = fnNullChangeBlank(gridObj["grid"].getRow(cell.rowKey));
		console.log("수정할 데이터 >>>>> " + JSON.stringify(apvlData));
	});

	// 결재자(정) 팝업 호출
 	$(document).on("click","#apvl_2", function(e){	
		 		
 		fnStopEvent(e);
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		var cell          = gridObj["grid"].getFocusedCell();	
 		var chkReqSno     = gridObj["grid"].getValue(cell.rowKey, "chk_req_sno", true); 
 		var apvlPrcSeqno  = "2"; 
 		var apvlPrcSepCd1 = gridObj["grid"].getValue(cell.rowKey, "apvl_prc_sep_cd_1", true); 	
 		 		
 		fnPopupApvlData(chkReqSno,apvlPrcSeqno,apvlPrcSepCd1);

		$("#chkReqSno").prop("disabled", true);
		$("#apvlPrcSeqno").prop("disabled", true);
		$("#apvlPrcSepCd1").prop("disabled", true);
		
		// 레이어팝업 보updateEmpPopup
		$('#apvlPopup').removeClass('hide');
		
		var apvlData = fnNullChangeBlank(gridObj["grid"].getRow(cell.rowKey));
		console.log("수정할 데이터 >>>>> " + JSON.stringify(apvlData));
	});	
	
});

	/**********************************************************
	 * 초기화
	 **********************************************************/
	function fnInit() {

		// 메뉴 초기화
		fnInitGnbLnb(6, 1, 6, 1);
		
		// 그리드 초기화
		fnInitGrid();
		fnInitGrid2();
		
		//공통
		fnCommon();

		// 리스트 조회
		fnList("1");
 		fnList2("1");

		// 팝업화면 초기화
		//fnInitPopup();
	}

	/**********************************************************
	 * 초기화(그리드)
	 **********************************************************/
	function fnInitGrid() {

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
				, {header:'계약시간', name:'ctrt_dt', align:'center', sortable: true}
				, {header:'계약시작일자', name:'ctrt_strt_dt', align:'center', sortable: true}
				, {header:'계약종료일자', name:'ctrt_end_dt', align:'center', sortable: true}   
				, {header:'계약구분코드', name:'mntc_ctrt_sep_cd', align:'center', hidden: true} 
				, {header:'거래유형', name:'contract_type', align:'center'}   
		];

		// 그리드 생성
		fnDrawGrid("04", "grid", columnsData);
	}
	/**********************************************************
	 * 초기화(그리드)
	 **********************************************************/
	function fnInitGrid2() {

		// 그리드 컴럼 정보
		var columnsData = [ {
			header : '지점명',
			name : 'corp_ko_nm',
		}, {
			header : '이름',
			name : 'emp_nm',
			align : 'center',
		}, {
			header : '출근시간',
			name : 'clock_in_time',
			align : 'center',
		}, {
			header : '퇴근시간',
			name : 'clock_out_time',
			align : 'center',
		}];

		// 그리드 생성
		fnDrawGrid("04", "grid2", columnsData);
	}

	/**********************************************************
	 * 리스트(그리드) 조회
	 **********************************************************/
	function fnList(slcPageNo) {

		var params = {
			loginUserId : loginUserId,
			loginUserGroup : loginUserGroup
		};

		// GRID 리스트 조회
		fnAjax("<c:url value='/api/spt/mntcList'/>", params, function(data) {
			
			if (successResCode == data.resCode) {
				// RESET DATA(그리드)
				gridObj["grid"].resetData(data.MntcList);

			} else {
				// 경고메세지
				alert('조회에 실패했습니다.');
			}
		});
	}

	/**********************************************************
	 * 리스트(그리드) 조회
	 **********************************************************/
	function fnList2(slcPageNo) {
		
		var params = {
			searchType  : $("#searchType option:selected").val(),
			searchStr   : $("#searchStr").val(),
			loginUserId : loginUserId,
			loginUserGroup : loginUserGroup
		};

		// GRID 리스트 조회
		fnAjax("<c:url value='/api/spt/checkInList'/>", params, function(data) {

			if (successResCode == data.resCode) {
				// RESET DATA(그리드)
				gridObj["grid2"].resetData(data.checkInList);

			} else {
				// 경고메세지
				fnWarnMsg('조회에 실패했습니다.');
			}
		});
	}

	
	/**********************************************************
	 * 자산관리 수정 데이터 조회
	 **********************************************************/
	function fnPopupData(asetId) {

		var param = {
			asetId : asetId
		};

		$("#asetStusSepCd").prop("disabled", true);
		$("#scrtRatCd").prop("disabled", true);
		$("#intdDt").prop("disabled", true);

		fnAjax("<c:url value='/api/aset/asetInfo'/>", param, function(data) {
			if (successResCode == data.resCode) {

				$("#asetId").val(data.info.aset_id);
				$("#asetNm").val(data.info.aset_nm);
				$("#asetClsfId").val(data.info.aset_clsf_id);
				$("#stusSepCd").val(data.info.stus_sep_cd);
				$("#asetStusSepCd").val(data.info.aset_stus_sep_cd);
				$("#chrgEmpId1").val(data.info.chrg_emp_id1);
				$("#chrgEmpId2").val(data.info.chrg_emp_id2);
				$("#scrtRatCd").val(data.info.scrt_rat_cd);
				$("#muftCorpNm").val(data.info.muft_corp_nm);
				$("#asetMdlNm").val(data.info.aset_mdl_nm);
				$("#cpuSpd").val(data.info.cpu_spd);
				$("#memoryVol").val(data.info.memory_vol);
				$("#hddVol").val(data.info.hdd_vol);
				$("#osVer").val(data.info.os_ver);
				$("#ipAddr").val(data.info.ip_addr);
				$("#intdDt").val(data.info.intd_dt);
				$("#instlPlce").val(data.info.instl_plce);
				$("#intdCost").val(data.info.intd_cost);
				$("#prpsDesc").val(data.info.prps_desc);
				$("#note").val(data.info.note);
				$('#regEmpId').val(loginUserId);
			} else {
				alert("자산정보 조회에 실패했습니다.");
			}
		});
	}

	function getCurrentDate() {
		  var today = new Date();
		  var year = today.getFullYear();
		  var month = (today.getMonth() + 1).toString().padStart(2, '0');
		  var day = today.getDate().toString().padStart(2, '0');
		  
		  var currentDate = year + month + day;
		  return currentDate;
	}
	
   class CustomTextEditor {
	      constructor(props) {
	        const el = document.createElement('textarea');

// 	        el.type = 'text';
			if(props.value) {
		        el.value = String(props.value);
			}

	        this.el = el;
	      }

	      getElement() {
	        return this.el;
	      }

	      getValue() {
	        return this.el.value;
	      }

	      mounted() {
	        this.el.select();
	      }
	    }
	
</script>