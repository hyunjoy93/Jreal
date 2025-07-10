<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- HEADER -->
<c:import url="/link/pageLink?link=/inc/header" />

<!-- NAV -->
<c:import url="/link/pageLink?link=/inc/nav" />

<!-- CONTENTS -->
<section class="section main">
	
	<div class="panel row">
	
		<div class="panel">				
			<div class="box2 gridFlex" style="	 justify-content: space-around; height:50%; !important;">
				<div class="resultTree" style="width:50%;">
						<div class="headline">
							<h3 class="mainTitle">제이수원본점 실적</h3>
							<div class="graph lable" style="margin-right: 4%;">
								<ul>
									<li><i style="background:rgb(0,19,76)"></i>매물등록</li>
									<li><i style="background:rgba(11,94,215,0.5)"></i>계약등록</li>
								</ul>
							</div>
						</div>
						<ul class="situation" style="overflow-y: hidden;">
							<li>
								<div class="graph2"><canvas id="chart1" height="200px" width="1000px"></canvas></div>
							</li>
						</ul>
				</div>
				
			</div>
			<div class="box2 gridFlex" style="	 justify-content: space-around; height:50%; !important;">
				<div class="resultTree" style="width:50%;">
						<div class="headline">
							<h3 class="mainTitle">제이권선분점 실적</h3>
							<div class="graph lable" style="margin-right: 4%;">
								<ul>
									<li><i style="background:rgb(0,19,76)"></i>매물등록</li>
									<li><i style="background:rgba(11,94,215,0.5)"></i>계약등록</li>
								</ul>
							</div>
						</div>
						<ul class="situation" style="overflow-y: hidden;">
							<li>
								<div class="graph2"><canvas id="chart2" height="200px" width="1000px"></canvas></div>
							</li>
						</ul>
				</div>
				
			</div>
		</div>
		
		<div class="panel" style="width:20%;">
		
			<div class="box" style="height: 29%;">
				
				<div class="calendar" id="calendar"></div>
				<div>
					<div class="todo" style="margin-top: 10px;">
						<!-- <h4 class="subTitle">점검요청</h4> -->
						<p id="todoDay"></p>
						<p id="todoCnt"></p>
					</div>
				</div>
			</div>
			
			<div class="box" style="height: 23.5%;">
				<div class="tap">
					<ul>
						<li class="on">공지사항</li>
<!-- 						<li>Q&amp;A</li> -->
					</ul>
				</div>
				<div class="tapCon view1" id="noticeDetail">
						
					<div class="latest bg" id="noticeList">
					<!-- 
						<ul >
							<li v-for="n in 20">
								<a href="" class="row" >
									<span>[목동1] 8층 신구 개통작업 요청으로 8층 신구 개통작업 요청으로</span>
								</a>
							</li>
						</ul>
						<ul >
							<li v-for="n in 20">
								<a href="" class="row" >
									<span>[목동1] 8층 신구 개통작업 요청으로 </span>
								</a>
							</li>
						</ul>
						 -->
					</div>
				</div>
			</div>
<!-- 			<div class="box"> -->
<!-- 				<div class="headline"> -->
<!-- 					<h4 class="subTitle">관제팀 운영 메뉴얼</h4> -->
<!-- 					<a href="" class="btMore">더보기</a> -->
<!-- 				</div> -->
<!-- 				<div class="latest down"> -->
<!-- 					<ul> -->
<!-- 						<li v-for="n in 3"> -->
<!-- 							<a href="" class="row"> -->
<!-- 								<span>[목동1] 8층 신구 개통작업 요청으로 8층 신구 개통작업 요청으로 8층 신구 개통작업 요청으로</span> -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
		
	</div>

</section>



<!-- [팝업] 공지사항 상세(댓글) -->
<article class="popup hide" id="popNoticeDetail">
	<div class="popBox" style="width:700px;">

		<div class="conHead">
			<h5 class="popTitle">공지사항 댓글 등록</h5>
			<button type="button" class="btClose" id="btnCancelReply"><i>닫기</i></button>
		</div>
			<div class="conBody" style="overflow:auto" id="popDetailBody">
				<input type="hidden" id="nticItemSno" />
				<table class="field" style="word-break:break-all; table-layout:fixed;">
					<colgroup>
						<col width="80px">
						<col width="180px">
						<col width="80px">
						<col width="180px">
					</colgroup>
					<tbody>
						<tr>
							<th>제목</th>
							<td colspan="3" id="nticTitl"></td>
						</tr>
						<tr>
							<th>작성일</th>
							<td id="regDttm"></td>
							<th>작성자</th>
<!-- 							<td id="regEmpId"></td> -->
							<td id="regEmpNm"></td>
						</tr>
						<tr>
							<th>내용</th>
<!-- 							<td colspan="3" id="nticCtnt" style="white-space: pre;"> -->
							<td colspan="3">
								<textarea class="textarea" placeholder="" id="nticCtnt" readonly></textarea>
							</td>
						</tr>
						<tr class="faqFile">
							<th rowspan="5">첨부파일</th>
							<td colspan="3">
								<form id="downFile" method="post">
								    <input type="file" hidden="true"/> 
								    <p><a download class="row" id="downFile0" style="color:blue;"></a></p>
								    <p><a download class="row" id="downFile1" style="color:blue;"></a></p>
								    <p><a download class="row" id="downFile2" style="color:blue;"></a></p>
								</form>
							</td>
						</tr>
					</tbody>
				</table>
				
				<!-- 댓글입력 -->
				<div id="replForm" style="margin: 15px 10px 15px;">
					<textarea class="textarea" style="height: 60px;" cols="5" placeholder="댓글입력" id="replSbst"></textarea>
					<!-- <span class="count" id="replInputCnt"><b>0</b><i>/</i>300</span>
					<button type="button" class="bt bg secondary" style='float: right; margin-top: 5px;' id="btnReplSave">댓글저장</button> -->
				</div>
				
				<!-- 댓글목록 -->
				<div>
					<table class="field" id="replListTbl">
						<tbody id="replList">
						</tbody>
					</table>
				</div>
	
			</div><!--//conBody-->
		<div class="conFoot" id="footBtn2">
			<div class="btns">
				<button type="button" id="btnReplSave"    class="bt max bg primary">댓글저장</button>
				<button type="button" id="btnCloseDetail" class="bt max bd">취소</button>
			</div>
		</div>

	</div>
</article>	
<!--// [팝업] 상세 -->


<!-- [팝업] 공지사항 리스트 -->
<article class="popup hide" id="noticeListPopup">
	<div class="popBox">
		<div class="conHead">
			<h5 class="popTitle">공지사항 보기</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>
		
		<div class="conBody">
		
			<h7> 공지리스트 </h7>
			<table class="field">
				<colgroup>
					<col width="80px">
					<col width="500px">
					<col width="100px">
				</colgroup>
				<thead></thead>
				<tbody id="popnoticeList"></tbody>
			</table>

		</div><!--//conBody-->

		<div class="conFoot">
		</div>

	</div>
</article>	
<!--// [팝업] 공지사항 리스트 -->

<!-- [팝업] 패스워드변경 -->
<article class="popup hide" id="userPwChangePopup">
    <div class="popBox">
        <div class="conHead">
            <h5 class="popTitle">패스워드 변경</h5>
            <button type="button" class="btClose"><i>닫기</i></button>
        </div>

        <div class="conBody">
            <table class="field">
                <colgroup>
                    <col width="90px">
                    <col width="*">
                </colgroup>
                <tbody>
                    <tr>
                        <th>현재 비밀번호</th>
                        <td><input type="password" class="input" id="currentPassword"></td>
                    </tr>
                    <tr>
                        <th>새로운 비밀번호</th>
                        <td><input type="password" class="input" id="newPassword"></td>
                    </tr>
                    <tr>
                        <th>비밀번호 확인</th>
                        <td><input type="password" class="input" id="confirmPassword"></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="conFoot">
            <div class="btns">
                <button type="button" class="bt max bg primary" id="btnChangePassword">비밀번호 변경</button>
                <button type="button" class="bt max bd btClose">취소</button>
            </div>
        </div>
    </div>
</article>



<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/footer" />

<script type="text/javaScript">


$(function(){

	// 초기화
	fnInit();
	
	// 공지사항 팝업
	$(document).on("click", "#noticeDetail ul li", function(){
		
		// 선택한 row의 idx 가져오기
		var idx = $(this).attr('idx');
						
		var params = { idx : parseInt(idx) };
		
		fnAjax("<c:url value='/api/dsb/noticeDetail'/>", params, function(data) {
			
			if(successResCode == data.resCode){
				
				// 공지사항 팝업 데이터 셋팅
				$('#noticeTit').text(data.noticeDetail.bbs_titl);
				$('#noticeRegDt').text(fn_setDateFormat(data.noticeDetail.reg_dttm, 'YYYY-MM-DD'));
				$('#noticeName').text(data.noticeDetail.reg_emp_nm);
				$('#noticeContent').text(data.noticeDetail.bbm_ctnt);
				
				// 공지사항 팝업 보여줌
				$('#noticePopup').removeClass('hide');
			}else{
				
			}
		});
	});
	
	// 공지사항 팝업 닫기
	$('#btnNoticePopClose').on('click', function(){
		$('#noticePopup').addClass('hide');
	});
	
	
	// 공지사항 더보기 팝업
	$(document).on("click", "#noticeListPop", function(){
		
		var params = {  };
		
		fnAjax("<c:url value='/api/dsb/popnoticeList'/>", params, function(data) {
			
			if(successResCode == data.resCode){
				
				var noticeListData = "";
				var cnt = 1;
				
				$.each(data.noticeList, function(index, list){
					
					noticeListData += "<tr class='view-btn1' idx='"+list.idx+"'>";
					noticeListData += "<td>"+cnt+"</td>";
					noticeListData += "<td class='tl'>"+list.title+"</td>";
					noticeListData += "<td class='tl'>"+fn_setDateFormat(list.regist_time, 'YYYY-MM-DD')+"</td>";
					noticeListData += "</tr>";
					
					noticeListData += "<tr class='answer' id='ans_"+list.idx+"' style='display:none;'>";
					noticeListData += "<td></td>";
					noticeListData += "<td colspan='2'>"+list.content;
					noticeListData += "<br>";
					noticeListData += "<button type='button' onclick='$("+'"#ans_'+list.idx+'").hide();'+"'>닫기</button>";
					noticeListData += "</td>";
					noticeListData += "</tr>";
					
					cnt++;
				})
				
				//console.log(noticeListData);
				
				$('#popnoticeList').html(noticeListData);
				// 공지사항 더보기 팝업 보여줌
				$('#noticeListPopup').removeClass('hide');
				
			}else{
				
			}
		});
		
	});


	$(document).on('click','.view-btn1',function(){
		
	    var no = $(this).attr('idx');
	    $('.answer').hide();
	    $('#ans_'+no).show();
	});
	
	$("#evtCntLink").on("click", function(e){
		fnPostSend("<c:url value='/view/evt/subEventState' />", {viewType:'00'});
	});
	
	$("#icdCntLink").on("click", function(e){
		fnPostSend("<c:url value='/view/icd/subIncidentState' />", {viewType:'00',incidentYn:'Y'});
	});
	
	$("#errCntLink").on("click", function(e){
		fnPostSend("<c:url value='/view/icd/subIncidentState' />", {viewType:'00',incidentYn:'N'});
	});
	
	
	// 상세팝업
 	$(document).on("click", "#noticeList ul li", function(e){
 		
 		let id = $(this).attr('idx');
 		
		fnNoticeDetail(id);
		
		// 레이어팝업 보여줌
		$('#popNoticeDetail').removeClass('hide');
		// 스크롤 위치 초기화
		$("#popDetailBody").scrollTop(0);
	}); 
	// 댓글내용 입력시 글자수 count
	$('#replSbst').on('keyup', function() {
		
        $('#replInputCnt').html("<b>"+$(this).val().length+"</b><i>/</i>300");

        if($(this).val().length > 300) {
            $(this).val($(this).val().substring(0, 300));
            $('#replInputCnt').html("<b>300</b><i>/</i>300");
        }
    });
	
	//댓글 저장버튼 클릭
	$('#btnReplSave').click(function(){
		
		var loginUser = "${loginInfo.user_id}";
		
		var params = {
				bbm_ctnt : $('#replSbst').val(),
				par_bbm_id : $('#nticItemSno').val(),
				leaf_yn : 'Y',
				bbm_lvl : 2,
				user_id : loginUser
		}
		
		fnAjax("<c:url value='/api/spt/insertRepl'/>", params, function(data) {
			
 			if(data.insertResult == "successed") {
				alert("댓글이 등록되었습니다.");
				$('#replSbst').val('');
				 $('#replInputCnt').html("<b>0</b><i>/</i>300");
				fnNoticeDetail($('#nticItemSno').val());
			} else {
				alert("등록 오류.");
			}
 		});
	});
	// 공지사항 상세 닫기
	$("#btnCloseDetail").on("click", function(e){
		$(".btClose").click();
		fnList("1");
	});

 	$(document).on("dblclick", "#grid1 .tui-grid-table tbody tr td", function(e){	
 		window.location.href="<c:url value='/view/chk/subChkStat' />";
	}); 
 	
 	$(document).on("dblclick", "#grid2 .tui-grid-table tbody tr td", function(e){	
 		window.location.href="<c:url value='/view/chk/subChkRslt' />";
	}); 
	
 	$('#monTotCnt').on('click', function(e) {
 		window.location.href="<c:url value='/view/chk/subChkRslt' />";
 	})
 	
	$('#calendar').datepicker({
		dateFormat: "yy-mm-dd",
		monthNames: ['01','02','03','04','05','06','07','08','09','10','11','12'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		showMonthAfterYear: true,
	    onSelect: function(dateText, inst) {
		    // 클릭한 날짜 값 가져오기
		    var selectedDate = $(this).datepicker("getDate");
		    
		    // 선택한 날짜를 yyyy년 mm월 dd일 형식으로 출력
		    var formattedDate = selectedDate.toLocaleDateString("ko-KR", {
		      year: "numeric",
		      month: "long",
		      day: "numeric"
		    });
		    
		    $('#todoDay').text(formattedDate+',');
		    
		    // 선택한 날짜를 yyyy년 mm월 dd일 형식으로 출력

		    // 선택한 날짜를 yyyymmdd 형식으로 출력
		    var year = selectedDate.getFullYear();
		    var month = String(selectedDate.getMonth() + 1).padStart(2, "0");
		    var day = String(selectedDate.getDate()).padStart(2, "0");
		    var paramsDate = year +'-'+ month +'-'+ day;
		    
		    var params = {
		    		searchDt: paramsDate,
		    		loginUserId : loginUserId,
		    		loginUserGroup : loginUserGroup
		    }
			// GRID 리스트 조회
			fnAjax("<c:url value='/api/chk/chkReqInfo'/>", params, function(data) {
				if (successResCode == data.resCode) {
					if(data.chkReqInfo.length==0) {
						$('#todoCnt').html('계약 예정 <a href="<c:url value="/view/chk/subChkStat" />"> 0 </a> 건 있습니다.');
					} else {
						$('#todoCnt').html('계약 예정 <a href="<c:url value="/view/chk/subChkStat" />"> ' + data.chkReqInfo.length + ' </a> 건 있습니다.');
					}
				} else {
					// 경고메세지
					fnWarnMsg('조회에 실패했습니다.');
				}
			});
		    
		  }
	});
	
	$('.ui-state-active').click();
});


/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){
	
	// InitGnbLnb
	fnInitGnbLnb(9, 0, 9, 0);
	
	// 월간, 연간점검 현황 차트
	fn_getChart();
	
	//공지사항
	fn_getNoticeList();
	
}

/**********************************************************
 * 점검/인시던트 현황 건수 가져오기
 **********************************************************/
function fn_getCnt(){
	
	var params = {};
	
	fnAjax("<c:url value='/api/dsb/getCnt'/>", params, function(data) {
		
		if(successResCode == data.resCode){
			
			//console.log("evtCnt:: "+data.cntMap.evtCnt);
			//console.log("icdCnt:: "+data.cntMap.icdCnt);
			//console.log("errCnt:: "+data.cntMap.errCnt);
			
			$("#evtCnt").text(data.cntMap.evtCnt);
			$("#icdCnt").text(data.cntMap.icdCnt);
			$("#errCnt").text(data.cntMap.errCnt);
			
		}else{
			
		}
	});
}


var chartLabels = [];
var chk_1 = [];
var chk_2 = [];
var chk_3 = [];

var chk_4 =[];
	
/**********************************************************
 * 직원별 실적 차트데이터 가져오기 (회사별 차트 분리)
 **********************************************************/
function fn_getChart() {
	
	$('#dashDt').text(new Date().getFullYear() + "년 " + (new Date().getMonth() + 1) + "월");

	var param = {
		loginUserId: loginUserId,
		loginUserGroup: loginUserGroup
	}

	// 차트데이터 가져오기
	fnAjax("<c:url value='/api/dsb/chart'/>", param, function(data) {

		// 🔹 회사별 데이터 초기화
		let chartLabels1 = [], chartLabels2 = [];
		let chk_1_1 = [], chk_2_1 = [], chk_1_2 = [], chk_2_2 = [];
		let chk_4_1 = 0, chk_4_2 = 0;

		$.each(data.chartData, function(idx, obj) {
			let empLabel = obj.emp_nm; // 직원명만 표시

			// 🔹 회사별로 데이터 분류
			if (obj.corp_id == 2) {
				chartLabels1.push(empLabel);
				chk_1_1.push(obj.chk_1);
				chk_2_1.push(obj.chk_2);
				chk_4_1 += (parseInt(obj.chk_1) + parseInt(obj.chk_2));
			} else if (obj.corp_id == 3) {
				chartLabels2.push(empLabel);
				chk_1_2.push(obj.chk_1);
				chk_2_2.push(obj.chk_2);
				chk_4_2 += (parseInt(obj.chk_1) + parseInt(obj.chk_2));
			}
		});

		// 🔹 차트별 합산 데이터 표시
		$('#cnt_1').html(parseInt(chk_1_1.reduce((a, b) => a + b, 0)) + ' 건');
		$('#cnt_2').html(parseInt(chk_2_1.reduce((a, b) => a + b, 0)) + ' 건');
		$('#monTotCnt1').html('총<strong>' + parseInt(chk_4_1) + '</strong>건');

		$('#cnt_3').html(parseInt(chk_1_2.reduce((a, b) => a + b, 0)) + ' 건');
		$('#cnt_4').html(parseInt(chk_2_2.reduce((a, b) => a + b, 0)) + ' 건');
		$('#monTotCnt2').html('총<strong>' + parseInt(chk_4_2) + '</strong>건');

		// 차트 그리기
		fn_drawChart(chartLabels1, chk_1_1, chk_2_1, 'chart1');
		fn_drawChart(chartLabels2, chk_1_2, chk_2_2, 'chart2');
	});
}

function fn_drawChart(labels, chk_1, chk_2, chartId) {
	var ctx = document.getElementById(chartId);
	new Chart(ctx, {
		type: 'bar',
		data: {
			labels: labels, // 🔹 직원별 라벨
			datasets: [{
				label: '매물등록',
				data: chk_1,
				borderWidth: 0,
				backgroundColor: 'rgb(0,19,76)',
			}, {
				label: '계약등록',
				data: chk_2,
				borderWidth: 0,
				backgroundColor: 'rgba(11,94,215,0.5)',
			}],
		},
		options: {
			responsive: false,
			scales: {
				x: {
					stacked: true,
					grid: { display: false }
				},
				y: {
					stacked: true,
					ticks: { stepSize: 20 }
				},
			},
			plugins: {
				legend: { display: true }
			}
		}
	});
}
/**********************************************************
 * 날짜 YYYY-MM-DD HH:MM:SS 형태로 변환
 **********************************************************/
function fn_setDateFormat(strDate, format){
	var dt = new Date(strDate);
	
	var year    = dt.getFullYear();
	var month   = fnLpad(String((dt.getMonth()+1)), 2 , "0");
	var date    = fnLpad(String( dt.getDate())    , 2 , "0");
	var hour    = fnLpad(String( dt.getHours())   , 2 , "0");
	var min     = fnLpad(String( dt.getMinutes()) , 2 , "0");
	var seconds = fnLpad(String( dt.getSeconds()) , 2 , "0");

	var rtnDt = "";
	
	switch(format){
		case 'YYYY-MM-DD HH:mm:SS':
			rtnDt = year+"-"+month+"-"+date+" "+hour+":"+min+":"+seconds;
			break;
		case 'YYYY-MM-DD':
			rtnDt = year+"-"+month+"-"+date;
			break;
		case 'YYYY.MM.DD':
			rtnDt = year+"."+month+"."+date;
			break;
	}

	return rtnDt;
}


/**********************************************************
 * 공지사항 리스트 가져오기
 **********************************************************/
function fn_getNoticeList(){
	
	var params = {};
	
	fnAjax("<c:url value='/api/dsb/getNoticeList'/>", params, function(data) {
		
		if(successResCode == data.resCode){
			
			var noticeListData = "";	
			$.each(data.NoticeList, function(index, list){
				noticeListData += '<ul>'
				noticeListData += '<li v-for="n in 4" class="row" idx="'+list.bbm_id+'">';
				noticeListData += '<span>'+list.bbm_titl+'</span>';
				noticeListData += '<span>'+fn_setDateFormat(list.reg_dttm, 'YYYY.MM.DD')+'</span>';
				noticeListData += '</li>';
				noticeListData += '</ul>';
				
			})
			
			//console.log(noticeListData);
			
			$('#noticeList').html(noticeListData);
			
		}else{
			
		}
	});
}

/**********************************************************
 * 작업현황 리스트
 **********************************************************/
function fn_getExpList(){
	
	var today = new Date();
	
	var year = today.getFullYear();
	var month = today.getMonth()+1;
	var day = today.getDate();
	
	var params = {
		SRVDT : year + "-" + month + "-" + day
	};
	
	fnAjax("<c:url value='/api/dsb/getExpList'/>", params, function(data) {
		
		if(successResCode == data.resCode){
			
			var expListData = "";
			
			if(data.ExpList.length > 0){
				$.each(data.ExpList, function(index, list){
					expListData += '<td>';
					expListData += list.content;
					expListData += '</td>';
				})				
			} else{
				expListData = '<td class="noData">작업중인 현황이 없습니다.</td>';
			}
						
			//console.log(expListData);
			
			$('#ExpList').html(expListData);
			
		}else{
			
		}
	});
}

/**********************************************************
 * 공지사항 상세조회
 **********************************************************/
function fnNoticeDetail(id){
	
	var loginUser = "${loginInfo.user_id}";
	
	let param = { bbm_id : id, apnd_file_trg_id: id }

	// id로 상세내역 조회		
	fnAjax("<c:url value='/api/spt/noticeDetail'/>", param, function(data) {

		if(successResCode == data.resCode){
			
			$('#nticItemSno').val(data.NoticeDetail.bbm_id);
			$('#nticTitl').text(data.NoticeDetail.bbm_titl);
			$('#regDttm').text(data.NoticeDetail.reg_dttm);
			$('#regEmpId').text(data.NoticeDetail.reg_emp_id);
			$('#regEmpNm').text(data.NoticeDetail.reg_emp_nm);
			$('#nticCtnt').text(data.NoticeDetail.bbm_ctnt);
			
			if(data.NoticeFiles.length == 0) {
				$('#downFile').hide();
			}
			
			for(var idx in data.NoticeFiles) {
				$('#downFile').show();
				var fileName = data.NoticeFiles[idx].apnd_file_nm.split('^');
				$('#downFile' + idx).text(fileName[1]);
				
				$('#downFile' + idx).prop('name', data.NoticeFiles[idx].apnd_file_trg_id + '-' + data.NoticeFiles[idx].apnd_file_sno)
				$('#downFile' + idx).addClass('downFiles');
				
				var filePath = '../../uploadFiles/N/' + data.NoticeFiles[idx].apnd_file_nm;
				
				$('#downFile' + idx).prop('href', filePath);
			
			}
	
			fngetRepl(id);

			$('#replList').html('');
			$('#replListTbl').addClass('hide');
		}
	});
}
/**********************************************************
 * 공지사항 답변 댓글 조회
 **********************************************************/
function fngetRepl(id){
	
	var loginUser = "${loginInfo.user_id}";
	var loginUserNm = "${loginInfo.user_name}";

	
	var param = { txnId : id };

	fnAjax("<c:url value='/api/spt/getreplyList'/>", param, function(data) {
		
		if(successResCode == data.resCode){
			
			if(data.replyList.length > 0){			
				
				var replyListData = "";
				
				$.each(data.replyList, function(index, list){

					replyListData += "<tr>";
					replyListData += "<td>";
					replyListData += "<div>";
					replyListData += "<span style='white-space: pre;'>"+list.bbm_ctnt+"</span>";
					replyListData += "<br>";
					replyListData += "<span>"+list.reg_emp_id+" | "+list.reg_dttm+"</span>";
					
					if(list.reg_emp_id == loginUser){

						var paramId = list.bbm_id.substring(2,5)+","+list.par_bbm_id.substring(2,5);
							
// 						replyListData += "<button type='button' class='bt bg secondary' id='replyDel_"+list.bbm_id+"_"+list.par_bbm_id+"' style='float: right;' onclick='fnDelRepl("+list.bbm_id+","+list.par_bbm_id+");'>삭제</button>";

						replyListData += "<button type='button' class='bt bg secondary' id='replyDel_"+paramId+"' style='float: right;' onclick='fnDelRepl("+paramId+")'>삭제</button>";
					}	
					replyListData += "</div>";
					replyListData += "</td>";
					replyListData += "</tr>";
				});

				//console.log(replyListData);
				
				$('#replList').html(replyListData);
				$('#replListTbl').removeClass('hide');
			}
		}
		else{
			fnErrorMsg(failResMsg);
		}
	});
	
}	
/**********************************************************
 * VOC 답변 댓글 삭제
 **********************************************************/
function fnDelRepl(bbmId,parBbmId){
	var confirmDel = confirm("선택하신 댓글을 삭제하시겠습니까?");
	
	if(confirmDel){

		var bbm_id     = "N_"+bbmId;
		var par_bbm_id = "N_"+parBbmId;
				
		var param = { bbm_id : bbm_id, par_bbm_id : par_bbm_id };
		
		fnAjax("<c:url value='/api/spt/deleteRepl'/>", param, function(data) {
			
			if(successResCode == data.resCode) {
				alert("삭제되었습니다.");
				$('#replSbst').val('');
				$('#replInputCnt').html("<b>0</b><i>/</i>300");
				
				fnNoticeDetail(par_bbm_id);
			} else {
				alert("삭제 오류.");
			}
		});
	} 
	else{
		return;
	}
};
</script>