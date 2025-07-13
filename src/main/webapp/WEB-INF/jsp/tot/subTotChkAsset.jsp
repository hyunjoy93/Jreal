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
			<li>통계관리</li>
			<li>점검통계(자산별)</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">점검통계(자산별)</h2>
		</div>

	</div><!--//conHead-->

	<div class="conBody">

		<div class="search">

			<div class="box">
				<form>
					<table class="field" >
						<tbody>
							<tr>
								<th>검색어</th>
								<td style="padding-right:4px">
									<select class="select md" id="searchType" >
										<option value="asetClsfNm">행정구분명</option>
<!--										<option value="searchPeriod">점검기간</option>-->
									</select>
								</td>
								<td>
 									<p id="inputContainer">
										<input type="text" class="input xxl" value="" placeholder="검색어입력" id="searchStr">
	 								</p>
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
			<!-- GRID -->
			
			<div class="gridFlex">
				<!-- grid -->
				<div class="box" style="width:50%;">
					<div class="graph">
						<canvas id="myChart" height="570" style="margin-top: 13px; !important"></canvas>
					</div>
				</div>
				<div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
				<!-- GRID2 -->
				<div class="tui-grid" style="width:50%;">
					<div id="grid"></div>
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
	
	// 검색 조건 입력 후 조회
	$("#btnSearch").on("click", function(e){
		fnStopEvent(e);
		fnList("1");
		$('.graph').empty();
		$('.graph').append($('<canvas id="myChart" height="570" style="margin-top: 13px; !important"></canvas>'))
		fnChartData();
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

	// 이벤트(페이지사이즈)
	$("#slcPageSize").on("change", function(e){
		fnStopEvent(e);
		fnList("1");
	});
	
		//검색조건 기간 필터
	$('#searchType').on('change', function(e) {
		var conditionSelect = document.getElementById('searchType');
		var inputContainer  = document.getElementById('inputContainer');
		var dateContainer   = document.getElementById('dateContainer');
		var condition       = conditionSelect.value;
		
		// 선택된 값에 따라 적절한 내용 추가
		if (condition == 'asetClsfNm') {
		  	$('#inputContainer').show();
		  	$('#dateContainer').hide();
		  	$('#chkStrtDt').val("");
		  	$('#chkEndDt').val("");
		} else {
		  	$('#inputContainer').hide();
		  	$('#dateContainer').show();	
		  	$('#searchStr').val("");
		}
	});
	
});

/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){
	
	// 메뉴 초기화
	fnInitGnbLnb(3, 1, 3, 1);
	
	// 그리드 초기화
	fnInitGrid();
	
	//공통
	fnCommon();
	
	// 리스트 조회
	fnList("1");
	
	//차트 데이터
	fnChartData();
	
	$('#dateContainer').hide();
}


/**********************************************************
 * 초기화(그리드)
 **********************************************************/
function fnInitGrid(){

	// 그리드 컴럼 정보
	var columnsData = [
		  	  {header:'행정분류', name:'aset_clsf_nm', align:'left', width:300}
			, {header:'매물등록건수', name:'chk_1', align:'center'}
			, {header:'계약등록건수', name:'chk_2', align:'center'}
			, {header:'계약완료건수', name:'chk_3', align:'center'}
			, {header:'합계'   , name:'tot_cnt', align:'center'}
			, {header:'비율(%)', name:'tot_rt', align:'center'}
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
		searchStr  : $("#searchStr").val()
	};
    
	// GRID 리스트 조회
	fnAjax("<c:url value='/api/tot/totChkAssetList'/>", params, function(data) {
		
		if(successResCode == data.resCode){
			// RESET DATA(그리드)
			gridObj["grid"].resetData(data.TotChkAssetList);

		}else{
			// 경고메세지
			fnWarnMsg('조회에 실패했습니다.');
		}
	});
}

var chartLabel = [];
var	chk_1 = [];
var chk_2 = [];
var chk_3 = [];
var chk_4 = [];

function fnChartData() {
	
	var assetNm = '';

	var params = {
		searchType : $("#searchType option:selected").val(),
		searchStr  : $("#searchStr").val()
	};
	// 차트데이터 조회
	
	fnAjax("<c:url value='/api/tot/totChkAssetList'/>", params, function(data) {
	  if (successResCode == data.resCode) {
	    var totChkAssetList = data.TotChkAssetList;
	    var chartLabel = []; // 라벨 데이터를 담을 배열
	
	    // 라벨 데이터 생성
	    for (var idx in data.TotChkAssetList) {
	      if (data.TotChkAssetList[idx].aset_clsf_nm == "Total") {
	        continue;
	      }
	      asetClsfNm = String(data.TotChkAssetList[idx].aset_clsf_nm);
	      chartLabel.push($.trim(asetClsfNm));
	    }
	
	    // 행정구분 데이터 생성
	    var chk_1 = [];
	    for (var idx in data.TotChkAssetList) {
	      chk_1.push(data.TotChkAssetList[idx].chk_1);
	    }
	    // 매물등록건수 데이터 생성
	    var chk_2 = [];
	    for (var idx in data.TotChkAssetList) {
	      chk_2.push(data.TotChkAssetList[idx].chk_2);
	    }
	    // 계약등록건수 데이터 생성
	    var chk_3 = [];
	    for (var idx in data.TotChkAssetList) {
	      chk_3.push(data.TotChkAssetList[idx].chk_3);
	    }
	    // 계약완료건수 데이터 생성
	    var chk_4 = [];
	    for (var idx in data.TotChkAssetList) {
	      chk_4.push(data.TotChkAssetList[idx].chk_4);
	    }
	
	    // 차트 생성
	    var ctx = document.getElementById("myChart");
		var myChart = new Chart(ctx, {
		    type: 'bar',
		    data: {
		        labels: chartLabel,
		        datasets: [
		            {
		                label: '매물등록건수',	
		                //data: chk_2,
						data: [10, 20 ,30 ,40 ,50 ,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60],
		                backgroundColor: 'rgba(0,62,129,0.8)', // 중간 남색
		            },
		            {
		                label: '계약등록건수',
		                //data: chk_3,
						data: [10, 20 ,30 ,40 ,50 ,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60],
		                backgroundColor: 'rgba(11,94,215,0.6)', // 파란색
		            },
		            {
		                label: '계약완료건수',
		                //data: chk_4,
						data: [10, 20 ,30 ,40 ,50 ,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60],
		                backgroundColor: 'rgba(135,206,250,0.4)', // 연한 하늘색
		            }
		        ],
		    },
		    options: {
		        responsive: true,
		        scales: {
		            x: {
		                stacked: true,
		                grid: {
		                    display: false
		                }
		            },
					y: {
					    stacked: true,
					    ticks: {
					        stepSize: 10 // y축을 10건 단위로 표시
					    }
					},
		        },
		        plugins: {
		            legend: {
		                display: true
		            },
		        }
		    }
		});
	  } else {
	    // 경고메세지
			fnWarnMsg('조회에 실패했습니다.');
	  }
	});
	
 	console.log(chartLabel);
	console.log(["해밀아이티", "스탠다드글로벌IT", "아이티스마트", "한솔교육", "롯데정보통신", "카카모", "네이바", "(주)세강", "Total"]);
	
}


</script>