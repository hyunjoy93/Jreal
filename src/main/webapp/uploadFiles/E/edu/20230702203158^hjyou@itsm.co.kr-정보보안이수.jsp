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
			<li>이벤트관리</li>
			<li id="viewTypeLi">이벤트 상황 관리</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle" id="viewTypeHeader">이벤트 상황 관리</h2>
			<button id="btnSound" type="button" class="btSound" title="스피커">소리끔/켬</button>
			<p class="informTxt">구글정책으로 사운드 자동실행이 불가하오니 스피커 버튼으로 사운드를 실행시켜 주세요.</p>
			<div class="btns">
				<button id="btnExcelDown" type="button" class="bt bd">엑셀다운로드</button>
			</div>
		</div>

		<div id="printNowDateTime" class="nowTime"><b></b></div>

	</div><!--//conHead-->

	<div class="conBody">

		<div class="realTime">
			<div class="check switch hide"><input type="checkbox" id="realCHK" checked><label>실시간</label></div>
			<div class="check switch"><input type="checkbox" id="btnKeyword"><label>검색필터</label></div>
			<p id="chkRealTime" class="txt on"><span class="bulletTxt" id="currCheckTime"></span></p>

			<button id="btnReload" type="button" class="btSync" title="지금 업데이트">지금 업데이트</button>

			<div class="btns">
				<button type="button" class="btColumn">컬럼선택</button>
			</div>

		</div>

		<div id="divSearch" class="search hide">

			<div class="box">
				<form>
					<table class="field">
						<tbody class="keyword-td">
							<tr>
								<th>조회기간</th>
								<td>
									<select class="select" style="width: auto;" id="searchType">
										<option value="evtOccu">이벤트 발생 시간</option>
										<option value="evtChk">이벤트 인지 시간</option>
										<option value="evtEnd">이벤트 완료 시간</option>
									</select></td>									
									<td colspan="4">
										<input id="startDate" type="text" class="input date" placeholder="시작일" readonly>
										<input id="startTime" type="time" class="input time" step="2">
										<span class="txt">~</span>
										<input id="endDate" type="text" class="input date" placeholder="종료일" readonly>
										<input id="endTime" type="time" class="input time" step="2">
									</td>																															
							</tr>
							<tr>
								<th></th>
								<td>
									<select class="keyword-select" id="kwEventLevel">
										<option value="" selected>이벤트등급</option>
										<option value="Critical">Critical</option>
										<option value="Fatal">Fatal</option>
									</select>
								</td>
								<td>									
									<select class="keyword-select" id="kwZabbixState">
										<option value="" selected>이벤트상태</option>
										<option value="신규">신규</option>
										<option value="지속">지속</option>
										<option value="해소">해소</option>
									</select>
								</td>
								<td>																		
									<select class="keyword-select" id="kwEventState">
										<option value="" selected>처리상태</option>
										<option value="신규">신규</option>
										<option value="인지">인지</option>
										<option value="조치중">조치중</option>
										<option value="진행중">진행중</option>
										<option value="조치완료">조치완료</option>										
									</select>	
								</td>
								<td>																	
									<input type="text" class="keyword-input" value="" placeholder="인시던트" id="kwIncidentId">
								</td>
								<td>									
									<input type="text" class="keyword-input" value="" placeholder="인지자" id="kwStep1User">
								</td>
								<td>									
									<input type="text" class="keyword-input" value="" placeholder="조치자" id="kwStep2User">
								</td>
								<td>									
									<input type="text" class="keyword-input" value="" placeholder="이벤트제목" id="kwEventContent">
								</td>
								<td>									
									<input type="text" class="keyword-input" value="" placeholder="표준서비스명" id="kwStdnm">	
								</td>
								<td>									
									<input type="text" class="keyword-input" value="" placeholder="단위서비스명" id="kwEstdnm">									
								</td>																																			
							</tr>
							<tr>
								<th></th>
								<td>	
									<input type="text" class="keyword-input" value="" placeholder="호스트명" id="kwHostname">
								</td>
								<td>									
									<input type="text" class="keyword-input" value="" placeholder="관제영역" id="kwGubun">
								</td>
								<td>									
									<input type="text" class="keyword-input" value="" placeholder="Zabbix IP" id="kwTargetIp">
								</td>
								<td>									
									<input type="text" class="keyword-input" value="" placeholder="센터" id="kwContainerNm">
								</td>
								<td>									
									<input type="text" class="keyword-input" value="" placeholder="층/실" id="kwDatacenterNm">
								</td>
								<td>									
									<input type="text" class="keyword-input" value="" placeholder="상면정보" id="kwRackLocation">
								</td>
								<td>									
									<input type="text" class="keyword-input" value="" placeholder="이벤트ID" id="kwEventId">
								</td>								
							</tr>							
						</tbody>
					</table>
				</form>
				<div class="btns">
					<button id="btnSearch" type="button" class="bt bg primary">검색</button>
					<button id="btnSearchInit" type="button" class="btRefresh" title="초기화">초기화</button>
				</div>
			</div>

		</div><!--//keyword-->

		<ul id="ulColumnHide" class="column hide">
		</ul>

		<div class="result">

			<div class="control">

				<span class="count">
					<select id="slcPageSize" name="pageSize" class="select sm">
						<option>25</option>
						<option>50</option>
						<option>75</option>
						<option>100</option>
						<option>200</option>
						<option>300</option>
						<option>전체</option>
					</select>
					<i>화면에 표시할 리스트 갯수</i>
				</span>

				<div class="btns">
					<button id="btnEventEnd" type="button" class="bt bd primary disabledUser">이벤트 조치완료</button>
					<button id="btnPerceive" type="button" class="bt bd primary disabledUser">인지</button>
					<button id="btnIncident" type="button" class="bt bg disabledUser">인시던트확대</button>
					<button type="button" class="bt bd primary disabledUser hide">대응중</button>
					<button type="button" class="bt bd primary disabledUser hide">이관</button>
					<button type="button" class="bt bg primary disabledUser hide">조치완료</button>
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

<!-- [팝업] 이벤트 처리 및 상세내역 -->
<article class="popup hide" id="test-popup1">
	<div class="popBox">

		<div class="conHead">
			<h5 id="popTitle" class="popTitle"></h5>
			<button type="button" class="btClose hide"><i>닫기</i></button>
		</div>

		<div class="conBody cols">

			<div class="panel fix">

				<div class="headline">
					<h6 class="minTitle">이벤트 정보</h6>
				</div>
				<table class="field">
					<colgroup>
						<col width="80px">
						<col width="400px">
					</colgroup>
					<tbody>
						<tr>
							<th>이벤트 제목</th>
							<td id="popTargetContents" colspan="3"></td>
						</tr>
						<tr>
							<th>표준서비스명</th>
							<td id="popStdnm"></td>
						</tr>
						<tr>
							<th>단위서비스명</th>
							<td id="popEstdnm"></td>
						</tr>
						<tr>
							<th>호스트명</th>
							<td id="popHostname"></td>	
						</tr>
						<tr>													
							<th>TCP IP</th>
							<td id="popDeviceIp"></td>
						</tr>
						<tr>							
							<th>MGMT IP</th>
							<td id="popMgmtIp"></td>
						</tr>
						<tr>							
							<th>IPMI IP</th>
							<td id="popIpmiIp"></td>
						</tr>
						<tr>							
							<th>Zabbix IP</th>
							<td id="popTargetIp"></td>							
						</tr>						
						<tr>							
							<th>이벤트 최초발생시간</th>
							<td id="popCccuTime"></td>
						</tr>	
						<tr>
							<th>테크VOC 접수여부</th>
							<td id="popFirstEventTechVoc" colspan="3"></td>
						</tr>																																			
						<tr>
							<th>이벤트 등급</th>
							<td><span class="badge careful" id="popEvtLevel">Critical</span></td>
						</tr>
						<tr>
							<th>센터</th>
							<td id="popContainerNm"></td>
						</tr>
						<tr>
							<th>층/실</th>
							<td id="popDatacenterNm"></td>
						</tr>
						<tr>
							<th>상면정보</th>
							<td id="popRackLocation"></td>
						</tr>						
						<tr>							
							<th>실장위치</th>
							<td id="popEquipPosition"></td>
						</tr>
						<tr>							
							<th>설비 바코드</th>
							<td id="popEquBarcode"></td>
						</tr>
					</tbody>
				</table>

				<div class="headline">
					<h6 class="minTitle">대응 상태</h6>
				</div>
				<table class="field">
					<colgroup>
						<col width="80px">
						<col width="400px">
					</colgroup>
					<tbody>
						<tr>
							<th>대응 상태</th>
							<td id="popZabbixState"></td>
						</tr>
						<tr>							
							<th>이벤트 상태</th>
							<td id="popEventState"></td>
						</tr>
						<tr>
							<th>AGENT 수집시간</th>
							<td id="popLastOccuTime"></td>
						</tr>
						<tr class="hot">
							<th>AGENT 이벤트 수집 횟수</th>
							<td id="popEventOccuCount"></td>
						</tr>
						<tr class="hot">							
							<th>이벤트 지속시간</th>
							<td id="popCalOccuTime"></td>
						</tr>																		
						<tr>							
							<th>인시던트</th>
							<td id="popIncidentId"><span class="badge danger"></span></td>
						</tr>
					</tbody>
				</table>

			</div><!--//panel-->

			<div class="panel fix">

				<div class="headline">
					<h6 class="minTitle">이벤트 처리상세</h6>
				</div>
				<table class="field">
					<colgroup>
						<col width="60px">
						<col width="150px">
						<col width="60px">
						<col width="150px">
					</colgroup>
					<tbody>
						<tr>
							<th>인지자</th>
							<td id="popEventStep1User"></td>
							<th>처리진행현황</th>
							<td id="popEventStep1State"></td>
						</tr>
						<tr>
							<th>대응시작시간</th>
							<td id="popEventStep1Start"></td>
							<th>대응종료/이관시간</th>
							<td id="popEventStep1End"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3">
								<div class="set comment">
									<textarea id="popEventStep1Contents" class="textarea disabledUser" placeholder="내용입력"></textarea>
									<span id="popEventStep1ContentsCount" class="count"><b>0</b><i>/</i>100</span>
									<div class="btns">
										<button id="btnPopOnePerceive" type="button" class="bt bd primary disabledUser">인지</button>
										<button type="button" class="bt bd primary disabledUser hide">저장</button>
										<button id="btnPopOneTransfer" type="button" class="bt bd primary disabledUser">이관</button>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<table class="field">
					<colgroup>
						<col width="60px">
						<col width="150px">
						<col width="60px">
						<col width="150px">
					</colgroup>
					<tbody>
						<tr>
							<th>조치담당자</th>
							<td id="popEventStep2User"></td>
							<th>처리진행현황</th>
							<td id="popEventStep2State"></td>
						</tr>
						<tr>
							<th>대응시작시간</th>
							<td id="popEventStep2Start"></td>
							<th>대응종료/이관시간</th>
							<td id="popEventStep2End"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3">
								<div class="set comment">
									<textarea id="popEventStep2Contents" class="textarea disabledUser" placeholder="내용입력"></textarea>
									<span id="popEventStep2ContentsCount" class="count"><b>0</b><i>/</i>100</span>
									<div class="btns">
										<button id="btnPopTwoPerceive" type="button" class="bt bd primary disabledUser">인지접수 및 조치</button>
										<button type="button" class="bt bd primary disabledUser hide">저장</button>
										<button id="btnPopTwoTransfer" type="button" class="bt bd primary disabledUser">이관</button>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>


				<div class="headline">
					<h6 class="minTitle">이벤트 종료처리</h6>
				</div>
				<table class="field">
					<colgroup>
						<col width="60px">
						<col width="150px">
						<col width="60px">
						<col width="150px">
					</colgroup>
					<tbody>
						<tr>
							<th>서비스영향도여부</th>
							<td>
								<span class="check"><input id="popEventServiceImpactY" type="radio" name="popEventServiceImpact" value="Y" class="disabledUser"><label>있음</label></span><br>
								<span class="check"><input id="popEventServiceImpactN" type="radio" name="popEventServiceImpact" value="N" class="disabledUser"><label>없음</label></span>
							</td>
							<th>테크센터VOC</th>
							<td>
								<span class="check"><input id="popEventTechVocY" type="radio" name="popEventTechVoc" value="Y" class="disabledUser"><label>Y</label></span><br>
								<span class="check"><input id="popEventTechVocN" type="radio" name="popEventTechVoc" value="N" class="disabledUser"><label>N</label></span>
							</td>
						</tr>
						<tr>
							<th>구분</th>
							<td colspan="3">
								<span class="check"><input id="popEventResultType0" type="radio" name="popEventResultType" value="0" class="disabledUser"><label>조치 후 정상화</label></span>
								<span class="check"><input id="popEventResultType1" type="radio" name="popEventResultType" value="1" class="disabledUser"><label>인시던트</label></span>
								<span class="check"><input id="popEventResultType2" type="radio" name="popEventResultType" value="2" class="disabledUser"><label>변경작업</label></span>
								<span class="check"><input id="popEventResultType3" type="radio" name="popEventResultType" value="3" class="disabledUser"><label>자연해소</label></span>
								<span class="check"><input id="popEventResultType4" type="radio" name="popEventResultType" value="4" class="disabledUser"><label>오탐</label></span>
								<span class="check"><input id="popEventResultType5" type="radio" name="popEventResultType" value="5" class="disabledUser"><label>정보성</label></span>
								<span class="check"><input id="popEventResultType6" type="radio" name="popEventResultType" value="6" class="disabledUser"><label>운영자 확인</label></span>
								<span class="check"><input id="popEventResultType7" type="radio" name="popEventResultType" value="7" class="disabledUser"><label>외부영향</label></span>
								<span class="check"><input id="popEventResultType8" type="radio" name="popEventResultType" value="8" class="disabledUser"><label>테스트 이벤트 발생</label></span>
							</td>
						</tr>
						<tr>
							<th>처리자</th>
							<td id="popEventResultUser"></td>
							<th>종료 시간</th>
							<td id="popEventResultTime"></td>
						</tr>
					</tbody>
				</table>

			</div><!--//panel-->

		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bd secondary hide">성능정보</button>
				<button type="button" class="bt max bd secondary hide">구성정보</button>
			</div>
			<div class="btns">
				<button id="btnPopIncident" type="button" class="bt max bg secondary disabledUser">인시던트 확대</button>
				<button id="btnPopEventEnd" type="button" class="bt max bd primary disabledUser">이벤트 조치완료</button>
				<button id="btnPopEventSave" type="button" class="bt max bg primary disabledUser">저장</button>
				<button type="button" class="bt max bd" id="evtPopClose">닫기</button>
			</div>
		</div>

	</div>
</article>	
<!--// [팝업] 이벤트 처리 및 상세내역 -->

<!-- [팝업] 이벤트 일괄 종료 팝업 -->
<article class="popup hide" id="popEndEvent">
	<div class="popBox">

		<div class="conHead">
			<h5 id="popEndTitle" class="popTitle">[이벤트ID... 외 n건] 이벤트 일괄 조치완료</h5>
			<button type="button" class="btClose" id="popEndClose"><i>닫기</i></button>
		</div>

		<div class="conBody cols">

			<div class="">

				<div class="headline">
					<h6 class="minTitle">이벤트 처리내역 입력</h6>
				</div>
				<table class="field">
					<colgroup>
						<col width="140px">
						<col width="210px">
						<col width="140px">
						<col width="210px">
					</colgroup>
					<tbody>
						<tr>
							<th>인지내용</th>
							<td colspan="3">
								<div class="set comment">
									<textarea id="popEndEventStep1Contents" class="textarea disabledUser" placeholder="일괄 종료 처리 시 입력할 인지 내용을 입력하여 주십시오"></textarea>
									<span id="popEndEventStep1ContentsCount" class="count"><b>0</b><i>/</i>100</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<table class="field">
					<colgroup>
						<col width="140px">
						<col width="210px">
						<col width="140px">
						<col width="210px">
					</colgroup>
					<tbody>
						<tr>
							<th>조치내용</th>
							<td colspan="3">
								<div class="set comment">
									<textarea id="popEndEventStep2Contents" class="textarea disabledUser" placeholder="일괄 종료 처리 시 입력할 조치 내용을 입력하여 주십시오"></textarea>
									<span id="popEndEventStep2ContentsCount" class="count"><b>0</b><i>/</i>100</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="headline">
					<h6 class="minTitle">이벤트 종료처리</h6>
				</div>
				<table class="field">
					<colgroup>
						<col width="140px">
						<col width="210px">
						<col width="140px">
						<col width="210px">
					</colgroup>
					<tbody>
						<tr>
							<th>서비스 영향도 여부</th>
							<td>
								<span class="check"><input type="radio" name="popEndEventServiceImpact" value="Y" class="disabledUser"><label>있음</label></span>
								<span class="check"><input type="radio" name="popEndEventServiceImpact" value="N" class="disabledUser"><label>없음</label></span>
							</td>
							<th>테크센터 VOC</th>
							<td>
								<span class="check"><input type="radio" name="popEndEventTechVoc" value="Y" class="disabledUser"><label>Y</label></span>
								<span class="check"><input type="radio" name="popEndEventTechVoc" value="N" class="disabledUser"><label>N</label></span>
							</td>
						</tr>
						<tr>
							<th>구분</th>
							<td colspan="3">
								<span class="check"><input type="radio" name="popEndEventResultType" value="0" class="disabledUser"><label>조치 후 정상화</label></span>
								<span class="check"><input type="radio" name="popEndEventResultType" value="1" class="disabledUser"><label>인시던트</label></span>
								<span class="check"><input type="radio" name="popEndEventResultType" value="2" class="disabledUser"><label>변경작업</label></span>
								<span class="check"><input type="radio" name="popEndEventResultType" value="3" class="disabledUser"><label>자연해소</label></span>
								<span class="check"><input type="radio" name="popEndEventResultType" value="4" class="disabledUser"><label>오탐</label></span>
								<span class="check"><input type="radio" name="popEndEventResultType" value="5" class="disabledUser"><label>정보성</label></span>
								<span class="check"><input type="radio" name="popEndEventResultType" value="6" class="disabledUser"><label>운영자 확인</label></span>
								<span class="check"><input type="radio" name="popEndEventResultType" value="7" class="disabledUser"><label>외부영향</label></span>
								<span class="check"><input type="radio" name="popEndEventResultType" value="8" class="disabledUser"><label>테스트 이벤트 발생</label></span>
							</td>
						</tr>
					</tbody>
				</table>

			</div><!--//panel-->

		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button id="btnEndPopSave" type="button" class="bt max bg primary disabledUser">저장</button>
			</div>
		</div>

	</div>
</article>	
<!--// [팝업] 이벤트 일괄 종료 팝업 -->

<article class="popup hide" id="excelConfirm">
	<div class="popBox">
		<div class="conHead">
			<h5 class="popTitle">엑셀 다운로드 옵션 선택</h5>
			<button type="button" class="btClose" id="btnexcelConfirmClose"><i>닫기</i></button>
		</div>	
		<div class="conBody">
			<div class="headline">
				<h5 class="minTitle">상세내역을 포함하여 다운로드 하시겠습니까?</h5>
			</div>		
		</div>
		<div class="conFoot">
			<div class="btns">
				<button id="btnExcelDownlodDetail" type="button" class="bt bd primary disabledUser">예</button>
				<button id="btnExcelDownlodDefault" type="button" class="bt bd  disabledUser">아니오</button>
			</div>
		</div>		
	</div>
</article> <!-- 엑셀 다운로드 컨펌 팝업 -->

<!-- form hidden value -->
<form id="viewFrm" name="viewFrm" method="post">
    <input type="hidden" id="viewType"  name="viewType" value="${viewType}"/>
    <input type="hidden" id="pageNo"  name="pageNo" value="1"/>
    <input type="hidden" id="listTotalCount"  name="listTotalCount" value="0"/>
    <input type="hidden" id="alramCount"  name="alramCount" value="0"/>
	<input type="hidden" id="eventState"  name="eventState" value=""/>
	<input type="hidden" id="addThirtyTime"  name="addThirtyTime" value=""/>
	<input type="hidden" id="eventType"  name="eventType" value=""/>
	<input type="hidden" id="eventId"  name="eventId" value=""/>
	<input type="hidden" id="incidentId"  name="incidentId" value=""/>
	<input type="hidden" id="eventStep1Contents"  name="eventStep1Contents" value=""/>
	<input type="hidden" id="eventStep2Contents"  name="eventStep2Contents" value=""/>
</form>

<!-- EXCEL GRID -->
<div class="tui-grid hide">
	<div id="excelGrid"></div>
</div>	
<!-- EXCEL DETAIL GRID -->
<div class="tui-grid hide">
	<div id="excelDetailGrid"></div>
</div>	

<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/footer" />

<script type="text/javaScript">
//<!--
var _height = 0;
cmmObj["isPopup"] = false;
cmmObj["isList"] = true;
$(function(){
	// 초기화
	fnInit();
	
	// 이벤트(엑셀다운로드)
	$("#btnExcelDown").on("click", function(e){
		
		fnStopEvent(e);
		$("#excelConfirm").removeClass('hide');
	});
	
	// 엑셀 상세내역 다운로드(컨펌창 예)
	$("#btnExcelDownlodDetail").on("click", function(e){
		fnStopEvent(e);
		var type = "full";
		fnExcelList(type);
	});
	
	// 엑셀 기본 다운로드(컨펌창 아니오)
	$("#btnExcelDownlodDefault").on("click", function(e){
		fnStopEvent(e);
		var type = "basic";
		fnExcelList(type);
	});
	
	// 이벤트(실시간확인중, 이력확인 버튼)
	$("#realCHK").on("change", function(e){
		
		fnStopEvent(e);
		/*
		// CALL 이벤트(검색초기화버튼)
		$("#btnSearchInit").trigger("click");
		var chkLiveClsVal = $("#chkRealTime").attr("class");
		if("txt on" == chkLiveClsVal){
			$("#eventState").val("조치완료");
			fnPagenationList("1");
		}else{
			$("#eventState").val("");
			fnPagenationList("1");
		}
		*/
	});
	
	// 이벤트(지금업데이트)
	$("#btnReload").on("click", function(e){
		fnStopEvent(e);
		fnList();
	});
	
	// 이벤트(검색버튼)
	$("#btnSearch").on("click", function(e){
		fnStopEvent(e);
		fnPagenationList("1");
	});
	
	// 이벤트(컬럼숨기기)
	$(".colunm_hide").on("click", function(e){
		fnStopEvent(e);
		var idx = $(this).attr("class").indexOf("off");
		if(-1 < idx){
			gridObj["grid"].showColumn($(this).attr("id"));
			$(this).removeClass("off");
		}else{
			gridObj["grid"].hideColumn($(this).attr("id"));
			$(this).addClass("off");
		}
	});
	
	// 이벤트(검색필터초기화버튼)
	$("#btnSearchInit").on("click", function(e){
		fnStopEvent(e);
		$("#searchType option:eq(0)").prop("selected", true); 		// 기간검색 타입
		$("#startDate").val("");									// 시작일	
		$("#startTime").val("");									// 시작시간
		$("#endDate").val("");										// 종료일
		$("#endTime").val("");										// 종료시간
		$("#kwEventLevel option:eq(0)").prop("selected", true);		// 이벤트등급
		$("#kwZabbixState option:eq(0)").prop("selected", true);	// 이벤트상태
		$("#kwEventState option:eq(0)").prop("selected", true);		// 처리상태
		$("#kwIncidentId").val("");									// 인시던트(id)
		$("#kwStep1User").val("");									// 인지자
		$("#kwStep2User").val("");									// 조치자
		$("#kwEventContent").val("");								// 이벤트제목
		$("#kwStdnm").val("");										// 표준서비스명
		$("#kwEstdnm").val("");										// 단위서비스명
		$("#kwHostname").val("");									// 호스트명
		$("#kwGubun").val("");										// 관제영역
		$("#kwTargetIp").val("");									// Zabbix IP
		$("#kwContainerNm").val("");								// 센터
		$("#kwDatacenterNm").val("");								// 층/실
		$("#kwRackLocation").val("");								// 상면정보
		$("#kwEventId").val("");									// 이벤트ID
	});
	
	// 이벤트(페이지사이즈)
	$("#slcPageSize").on("change", function(e){
		fnStopEvent(e);
		fnPagenationList("1");
	});
	
	// 이벤트(조치완료)
	$("#btnEventEnd").on("click", function(e){
		fnStopEvent(e);
		
		var gridCheckdRows = gridObj["grid"].getCheckedRowKeys();
		
		if(0 < gridCheckdRows.length){
			var bRet = true;
			var eventIds = "";
			var tmpEventId = "";
			var tmpEventState = "";
			var nCnt = 0;
			$.each(gridCheckdRows, function(i, item){
				tmpEventId = fnNullChangeBlank(gridObj["grid"].getValue(gridCheckdRows[i], "event_id"));
				tmpEventState = fnNullChangeBlank(gridObj["grid"].getValue(gridCheckdRows[i], "event_state"));
				tmpZabbixState = fnNullChangeBlank(gridObj["grid"].getValue(gridCheckdRows[i], "zabbix_state"));
				if("신규" == tmpEventState || "지속" == tmpZabbixState){
					bRet = false;
				}else{
					if(0 == nCnt){
						eventIds += tmpEventId;
					}else{
						eventIds += ","  + tmpEventId;
					}
					nCnt++;
				}
			});
			if(! bRet){
				fnErrorMsg("이벤트 대응단계 [신규] 또는 이벤트 상태 [지속]인 이벤트는\n일괄 조치완료 처리를 할 수 없습니다.");
			}else{
				
				if(confirm("선택하신 이벤트 모두를 조치완료 처리 하시겠습니까?")){
					//이벤트 아이디 넘김
					$("#eventId").val(eventIds);
					fnPopEventEnd();
					$("#popEndEvent").removeClass('hide');
					
				}else{
					fnWarnMsg("취소하셨습니다.");
				}
			}
		} else {
			alert("선택된 이벤트가 없습니다.");
		}
		
	});
	
	// 이벤트(1선 인지버튼)
	$("#btnPerceive").on("click", function(e){
		fnStopEvent(e);
		
		var gridCheckdRows = gridObj["grid"].getCheckedRowKeys();
		
		if(0 < gridCheckdRows.length){
			var bRet = true;
			var eventIds = "";
			var tmpEventId = "";
			var nCnt = 0;
			$.each(gridCheckdRows, function(i, item){
				if("신규" != fnNullChangeBlank(gridObj["grid"].getValue(gridCheckdRows[i], "event_state"))){
					bRet = false;
				}else{
					tmpEventId = fnNullChangeBlank(gridObj["grid"].getValue(gridCheckdRows[i], "event_id"));
					if(0 == nCnt){
						eventIds += tmpEventId;
					}else{
						eventIds += ","  + tmpEventId;
					}
					nCnt++;
				}
			});
			
			if(! bRet){
				fnErrorMsg("\"인지\" 처리가 불가능한 데이터가 선택되었습니다.");
			}else{
				// 1선 인지처리
				$("#eventId").val(eventIds);
				fnUpdateOnePerceive();
			}
		} else {
			alert("선택된 이벤트가 없습니다.");
		}
	});
	
	// 이벤트(인시던트 확대)
	$("#btnIncident").on("click", function(e){
		fnStopEvent(e);
		
		var gridCheckdRows = gridObj["grid"].getCheckedRowKeys();
		if(0 < gridCheckdRows.length){
			var bRet = true;
			var eventIds = "";
			var tmpEventId = "";
			var tmpIncidentId = "";
			var nCnt = 0;
			$.each(gridCheckdRows, function(i, item){
				tmpEventId = fnNullChangeBlank(gridObj["grid"].getValue(gridCheckdRows[i], "event_id"));
				tmpIncidentId = fnNullChangeBlank(gridObj["grid"].getValue(gridCheckdRows[i], "incident_id"));
				if("" != tmpIncidentId){
					bRet = false;
				}else{
					if(0 == nCnt){
						eventIds += tmpEventId;
					}else{
						eventIds += ","  + tmpEventId;
					}
					nCnt++;
				}
			});
			if(! bRet){
				fnErrorMsg("이미\"인시던트\"인 데이터가 선택되었습니다.");
			}else{
				
				if(confirm("선택하신 이벤트 모두를 \"인시던트확대\"로 처리를 하시겠습니까?")){
					// 인시던트 생성
					$("#eventId").val(eventIds);
					$("#eventStep2Contents").val("");
					fnCreateIncident();
					
				}else{
					fnWarnMsg("취소하셨습니다.");
				}
			}
		} else {
			alert("선택된 이벤트가 없습니다.");
		}
	});
	// 이벤트 상황관리 그리드 클릭후 상세내용 팝업 호출
 	$(document).on("dblclick", "#grid .tui-grid-table tbody tr td", function(e){	
 		// 선택한 셀의 rowKey(rowNum)과 columnName을 가져옴
 		var cell = gridObj["grid"].getFocusedCell();
 		if(("" != fnNullChangeBlank(cell.rowKey)) || ("" != fnNullChangeBlank(cell.columnName))){
 			fnStopEvent(e);
 			var eventId = gridObj["grid"].getValue(cell.rowKey, "event_id", true);
 			$("#eventId").val(eventId);
 			fnPopupData();
 		};
	}); 
	
	// 이벤트(팝업 1차인지)
	$("#btnPopOnePerceive").on("click", function(e){
		fnStopEvent(e);
		cmmObj["isPopup"] = true;
		cmmObj["isList"] = false;
		fnUpdateOnePerceive();
		
	});
	
	// 이벤트(팝업 1차이관)
	$("#btnPopOneTransfer").on("click", function(e){
		fnStopEvent(e);
		cmmObj["isPopup"] = true;
		cmmObj["isList"] = false;
		$("#eventStep1Contents").val($("#popEventStep1Contents").val());
		fnUpdateOneTransfer();
	});
	
	// 이벤트(팝업 2차인지)
	$("#btnPopTwoPerceive").on("click", function(e){
		fnStopEvent(e);
		cmmObj["isPopup"] = true;
		cmmObj["isList"] = false;
		fnUpdateTwoPerceive();
	});
	
	// 이벤트(팝업 2차이관)
	$("#btnPopTwoTransfer").on("click", function(e){
		fnStopEvent(e);
		cmmObj["isPopup"] = true;
		cmmObj["isList"] = false;
		$("#eventStep2Contents").val($("#popEventStep2Contents").val());
		fnUpdateTwoTransfer();
	});
	// 이벤트(팝업 인시던트확대)
	$("#btnPopIncident").on("click", function(e){
		fnStopEvent(e);
		var cfm = confirm("인시던트 확대 처리를 하시겠습니까?");
		
		if(cfm){
			fnCreateIncident();
		} else {
			return;
		}
		
	});
	
	// 이벤트(팝업 이벤트조치완료)
	$("#btnPopEventEnd").on("click", function(e){
		fnStopEvent(e);
		var cfm = confirm("이벤트 조치완료 처리를 하시겠습니까?");
		if(cfm){
			if("" == fnNullChangeBlank($("input:radio[name='popEventServiceImpact']:checked").val())){
				fnWarnMsg("[이벤트 종료처리] 서비스 영향도 여부를 선택 하세요.");
				return;
			}
			if("" == fnNullChangeBlank($("input:radio[name='popEventTechVoc']:checked").val())){
				fnWarnMsg("[이벤트 종료처리] 테크센터 VOC를 선택 하세요.");
				return;
			}
			if("" == fnNullChangeBlank($("input:radio[name='popEventResultType']:checked").val())){
				fnWarnMsg("[이벤트 종료처리] 구분을 선택 하세요.");
				return;
			}
			
			fnEventEnd();
			
			$("#test-popup1").addClass("hide");
		} else {
			return;
		}
	});
	
	// 이벤트(팝업 저장)
	$("#btnPopEventSave").on("click", function(e){
		fnStopEvent(e);
		var cfm = confirm("입력하신 내용을 저장하시겠습니까?");
		
		if(cfm){
			cmmObj["isPopup"] = true;
			cmmObj["isList"] = false;
			$("#eventStep1Contents").val($("#popEventStep1Contents").val());
			$("#eventStep2Contents").val($("#popEventStep2Contents").val());
			fnEventSave();
		} else {
			return;
		}
	});
	
	// 이벤트(팝업 1차이관 내용)
	$("#popEventStep1Contents").on("keyup", function(e){
		var content = $(this).val();
		$("#popEventStep1ContentsCount").html('<b>'+content.length+'</b><i>/</i>100');
		if(content.length > 100){
			fnWarnMsg("최대 100자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 100));
			$("#popEventStep1ContentsCount").html('<b>100</b><i>/</i>100');
		}
	});
	
	// 이벤트(팝업 2차이관 내용)
	$("#popEventStep2Contents").on("keyup", function(e){
		var content = $(this).val();
		$("#popEventStep2ContentsCount").html('<b>'+content.length+'</b><i>/</i>100');
		if(content.length > 100){
			fnWarnMsg("최대 100자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 100));
			$("#popEventStep2ContentsCount").html('<b>100</b><i>/</i>100');
		}
	});
	
	/* 조회기간 시작일 종료일 min, max 설정 */
	$("#startDate").datepicker({
		dateFormat: "yy-mm-dd",  
		onClose : function(selectedDate){
			$("#endDate").datepicker( "option", "minDate", selectedDate );
		}
	});
	$("#endDate").datepicker({
		dateFormat: "yy-mm-dd", 
		onClose : function(selectedDate){
			$("#startDate").datepicker( "option", "maxDate", selectedDate );
		}
	});
	
	/* checkBox 선택시 5분동안 autoreload 멈춰지게 */
	$(document).on("change", "input[name=_checked]", function(e){
		fnStopEvent(e);
		var now = new Date();
		now.setMinutes(now.getMinutes()+5);
		var add5 = now.getFullYear()
		+ fnLpad(String((now.getMonth()+1)), 2 , "0")
		+ fnLpad(String(now.getDate()), 2 , "0")
		+ fnLpad(String(now.getHours()), 2 , "0")
		+ fnLpad(String(now.getMinutes()), 2 , "0")
		+ fnLpad(String(now.getSeconds()), 2 , "0");
		
		console.log(add5);
		$("#addThirtyTime").val(add5);
	});
	
	// 일괄종료 팝업 인지내역 글자수 입력 popEndEventStep1ContentsCount
	$("#popEndEventStep1Contents").on("keyup", function(e){
		var content = $(this).val();
		$("#popEndEventStep1ContentsCount").html('<b>'+content.length+'</b><i>/</i>100');
		if(content.length > 100){
			alert("최대 100자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 100));
			$("#popEndEventStep1ContentsCount").html('<b>100</b><i>/</i>100');
		}
	});
	
	// 일괄종료 팝업 조치내역 글자수 입력 popEndEventStep1ContentsCount
	$("#popEndEventStep2Contents").on("keyup", function(e){
		var content = $(this).val();
		$("#popEndEventStep2ContentsCount").html('<b>'+content.length+'</b><i>/</i>100');
		if(content.length > 100){
			alert("최대 100자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 100));
			$("#popEndEventStep2ContentsCount").html('<b>100</b><i>/</i>100');
		}
	});
	
	// 일괄종료 저장
	$(document).on("click", "#btnEndPopSave", function(e){
		fnStopEvent(e);
		var serviceImpact = $("input:radio[name='popEndEventServiceImpact']:checked").val();
		var techVoc = $("input:radio[name='popEndEventTechVoc']:checked").val();
		var resultType = $("input:radio[name='popEndEventResultType']:checked").val();
		var con1 = $("#popEndEventStep1Contents").val();
		var con2 = $("#popEndEventStep2Contents").val();
		
		console.log("일괄종료 저장 >>>>> " + serviceImpact + " / "+ techVoc + " / "+ resultType + " / "+ con1 + " / "+ con2);
		
		if("" == fnNullChangeBlank(con1)){
			fnWarnMsg("[이벤트 일괄 종료 처리] 인지 내용을 입력하세요.");
			return;
		}
		if("" == fnNullChangeBlank(con2)){
			fnWarnMsg("[이벤트 일괄 종료 처리] 조치 내용을 입력하세요.");
			return;
		}
		if("" == fnNullChangeBlank(serviceImpact)){
			fnWarnMsg("[이벤트 일괄 종료 처리] 서비스 영향도 여부를 선택 하세요.");
			return;
		}
		if("" == fnNullChangeBlank(techVoc)){
			fnWarnMsg("[이벤트 일괄 종료 처리] 테크센터 VOC를 선택 하세요.");
			return;
		}
		if("" == fnNullChangeBlank(resultType)){
			fnWarnMsg("[이벤트 일괄 종료 처리] 구분을 선택 하세요.");
			return;
		}
		var params = {
				eventStep1Contents : con1,
				eventStep2Contents : con2,
				eventServiceImpact : serviceImpact,
				eventTechVoc : techVoc,
			    eventResultType : resultType,
				eventId : $("#eventId").val()
			};
			
 		fnAjax("<c:url value='/api/evt/endSelectedEventList'/>", params, function(data) {
	 		fnDefaultMsg(data);
	 		fnList();
	 	});
			
		$("#popEndEvent").addClass("hide");
	});
	
	// 검색필터 버튼 click
	$("#btnKeyword").on("change", function(e){
		fnStopEvent(e);
		$("#divSearch").toggleClass('hide');
		var off = $("#divSearch").hasClass('hide');
		if(!off){ // 검색필터 열리면 5분간 리스트 갱신 멈춤
			var now = new Date();
			now.setMinutes(now.getMinutes()+5);
			var add5 = now.getFullYear()
			+ fnLpad(String((now.getMonth()+1)), 2 , "0")
			+ fnLpad(String(now.getDate()), 2 , "0")
			+ fnLpad(String(now.getHours()), 2 , "0")
			+ fnLpad(String(now.getMinutes()), 2 , "0")
			+ fnLpad(String(now.getSeconds()), 2 , "0");
			$("#addThirtyTime").val(add5);
		}
	});
	
	// 팝업 닫기
	$("#evtPopClose").on("click", function(e){
		fnStopEvent(e);
		var cfm = confirm("팝업화면을 닫으시겠습니까?");
		
		if(cfm){
			$('#test-popup1').addClass('hide');
		} else {
			return;
		}
	});
	
});
/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){
	// 현재일시출력
	fnPrintNowDateTime();
	
	var viewType = $("#viewType").val();
	
	if("00" == viewType){
		// 초기화(메뉴)
		fnInitGnbLnb(2, 1, 2, 1);
		$("#chkRealTime").attr("class", "txt on");
		$("#eventState").val("조치완료");
		$("#viewTypeLi").html("이벤트 상황 관리");
		$("#viewTypeHeader").html("이벤트 상황 관리");
		$("#kwEventState").html('<option value="" selected>처리상태</option><option value="신규">신규</option><option value="인지">인지</option><option value="조치중">조치중</option>');
		
	}else if("10" == viewType){
		
		// 초기화(메뉴)
		fnInitGnbLnb(2, 2, 2, 2);
		$("#chkRealTime").attr("class", "txt");
		//$("#divSearch").removeClass("hide");
		$("#viewTypeLi").html("이벤트 이력 조회");
		$("#viewTypeHeader").html("이벤트 이력 조회");
		$("#btnSearchInit").trigger("click");
		$("#eventState").val("");
		$("#kwEventState").html('<option value="" selected>처리상태</option><option value="신규">신규</option><option value="인지">인지</option><option value="조치중">조치중</option><option value="진행중">진행중</option><option value="조치완료">조치완료</option>');
	}
	// 자동실행(지금업데이트)
	fnAutoReload();
	
	// 초기화(그리드)
	fnInitGrid();
	
	// 리스트(페이지번호) 조회
	fnPagenationList("1");
	
	// 알림
	fnAlarm();
	
	// 공통
	fnCommon();
	
}
/**********************************************************
 * 초기화(그리드)
 **********************************************************/
function fnInitGrid(){
	
	// 그리드 컴럼 정보
	var columnsData = [
		  {header:'이벤트 발생시간', name:'occu_time', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, width:120, ellipsis : true}
		, {header:'이벤트등급', name:'event_level', sortable: true, filter:'select', align:'center', width:70, ellipsis : true}
		, {header:'이벤트상태', name:'zabbix_state', sortable: true, filter:'select', width:66, ellipsis : true}
		, {header:'이벤트 지속시간', name:'cal_occu_time', width:104, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'이벤트 누적횟수', name:'event_occu_count', width:80, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'이벤트 인지시간', name:'event_step1_start', width:120, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'이벤트 대응단계', name:'event_state', sortable: true, filter:'select', width:80, ellipsis : true}
		, {header:'인시던트', name:'incident_id', align:'center', width:110, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'인지자', name:'event_step1_user', width:'auto', filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'조치자', name:'event_step2_user', width:'auto', filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'이벤트 제목', name:'target_contents', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true, width:300, ellipsis : true}
		, {header:'표준서비스명', name:'stdnm', width:'auto', filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'단위서비스명', name:'estdnm', width:'auto', filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'호스트명', name:'hostname', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true, width:240, ellipsis : true}
		, {header:'관제영역', name:'gubun', sortable: true, filter:'select', width:'auto', ellipsis : true}
		, {header:'Zabbix IP', name:'target_ip', width:'auto', filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'센터', name:'container_nm', width:'auto', filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'층/실', name:'datacenter_nm', width:'auto', filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'상면정보', name:'rack_location', width:'auto', filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'이벤트ID', name:'event_id', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, width:'auto', ellipsis : true}
		, {header:'완료시간', name:'event_result_time', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, width:'auto', ellipsis : true}
		, {header:'테크센터VOC', name:'event_tech_voc', align:'center', width:'auto', filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
	];
	/* 		, {header:'서비스', name:'host_group_gubun', sortable: true, filter:'select', width:60} //epc,ipc		*/
	
	// 일반 엑셀용 그리드 컬럼 정보
		var columnsDataExcelDefault = [
		  {header:'이벤트 발생시간', name:'occu_time', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, width:120, ellipsis : true}
		, {header:'이벤트등급', name:'event_level', sortable: true, filter:'select', align:'center', width:70, ellipsis : true}
		, {header:'이벤트상태', name:'zabbix_state', sortable: true, filter:'select', width:70, ellipsis : true}
		, {header:'이벤트 지속시간', name:'cal_occu_time', width:104, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'이벤트 누적횟수', name:'event_occu_count', width:80, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'이벤트 인지시간', name:'event_step1_start', width:120, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'이벤트 대응단계', name:'event_state', sortable: true, filter:'select', width:80, ellipsis : true}
		, {header:'인시던트', name:'incident_id', align:'center', width:100, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'인지자', name:'event_step1_user', width:'auto', filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'조치자', name:'event_step2_user', width:'auto', filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'이벤트 제목', name:'excel_target_contents', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true, width:300, ellipsis : true}
		, {header:'표준서비스명', name:'stdnm', width:'auto', filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'단위서비스명', name:'estdnm', width:'auto', filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'호스트명', name:'hostname', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true, width:240, ellipsis : true}
		, {header:'관제영역', name:'gubun', sortable: true, filter:'select', width:'auto', ellipsis : true}
		, {header:'Zabbix IP', name:'target_ip', width:'auto', filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'센터', name:'container_nm', width:'auto', filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'층/실', name:'datacenter_nm', width:'auto', filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'상면정보', name:'rack_location', width:'auto', filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
		, {header:'이벤트ID', name:'event_id', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, width:'auto', ellipsis : true}
		, {header:'완료시간', name:'event_result_time', sortable: true, filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, width:'auto', ellipsis : true}
		, {header:'테크센터VOC', name:'event_tech_voc', align:'center', width:'auto', filter:{type: 'text', showApplyBtn: true, showClearBtn: true}, ellipsis : true}
	];
	// 상세 엑셀용 그리드 컴럼 정보 
	var columnsDataExcelDetail = [
		  {header:'이벤트 발생시간', name:'occu_time'}
		, {header:'이벤트 등급', name:'event_level'}
		, {header:'이벤트 상태', name:'zabbix_state'}
		, {header:'이벤트 지속시간', name:'cal_occu_time'}
		, {header:'이벤트 누적횟수', name:'event_occu_count'}
		, {header:'이벤트 인지시간', name:'event_step1_start'}
		, {header:'이벤트 대응단계', name:'event_state'}
		, {header:'인시던트', name:'incident_id'}
		, {header:'이벤트 제목', name:'excel_target_contents'}
		, {header:'표준서비스명', name:'stdnm'}
		, {header:'단위서비스명', name:'estdnm'}
		, {header:'호스트명', name:'hostname'}
		, {header:'관제영역', name:'gubun'}
		, {header:'Zabbix IP', name:'target_ip'}
		, {header:'TCP IP', name:'device_ip'}
		, {header:'MGMT IP', name:'mgmt_ip'}
		, {header:'IPMI IP', name:'ipmi_ip'}
		, {header:'센터', name:'container_nm'}
		, {header:'층/실', name:'datacenter_nm'}
		, {header:'상면정보', name:'rack_location'}
		, {header:'실장위치', name:'equip_position'}
		, {header:'이벤트ID', name:'event_id'}
		, {header:'인지처리자', name:'event_step1_user'}
		, {header:'인지_처리진행현황', name:'event_step1_state'}
		, {header:'인지_대응시작시간', name:'event_step1_start'}
		, {header:'인지_대응종료/이관시간', name:'event_step1_end'}
		, {header:'인지_내용', name:'event_step1_contents'}
		, {header:'조치담당자', name:'event_step2_user'}
		, {header:'조치_처리진행현황', name:'event_step2_state'}
		, {header:'조치_대응시작시간', name:'event_step2_start'}
		, {header:'조치_대응종료/이관시간', name:'event_step2_end'}
		, {header:'조치_내용', name:'event_step2_contents'}
		, {header:'서비스영향도여부', name:'event_service_impact'}
		, {header:'테크센터VOC', name:'event_tech_voc'}
		, {header:'이벤트종료처리자', name:'event_result_user'}
		, {header:'이벤트종료시간', name:'event_result_time'}
	];
	
	// viewType에 따른 그리드 생성
	var viewType = $("#viewType").val();
	if("00" == viewType){
		fnDrawGrid("01", "grid", columnsData);		
	}else if("10" == viewType){		
		//fnDrawGrid("05", "grid", columnsData);
		fnDrawGrid("01", "grid", columnsData);
	}
	
/* 	// 그리드 생성
	fnDrawGrid("01", "grid", columnsData); */
	
	// 그리드 컬럼 HIDE 목록
	var columns = gridObj["grid"].getColumns();
	if(0 < columns.length){
		
		var columnHtml = "";
		
		$.each(columns, function(i, item){
			if(! columns[i].hidden){
				columnHtml += "<li id='" + columns[i].name +"' class='colunm_hide'>" + columns[i].header + "</li>";
			}
		});
		$("#ulColumnHide").html(columnHtml);
	}
	
/* 	$("th[data-column-name=occu_time").css("font-size", "8px");
	$("th[data-column-name=event_level]").css("font-size", "8px");
	$("th[data-column-name=zabbix_state]").css("font-size", "8px");
	$("th[data-column-name=cal_occu_time]").css("font-size", "8px");
	$("th[data-column-name=event_occu_count]").css("font-size", "8px");
	//$("th[data-column-name=event_occu_count]").css("white-space", "pre-line");
	$("th[data-column-name=event_state]").css("font-size", "8px");
	$("th[data-column-name=event_step1_start]").css("font-size", "8px"); */
	
	fnDrawGrid("01", "excelGrid", columnsDataExcelDefault);
	fnDrawGrid("01", "excelDetailGrid", columnsDataExcelDetail);
	
}
/**********************************************************
 * 리스트(페이지번호) 조회 
 **********************************************************/
function fnPagenationList(slcPageNo){
	
	// SET 페이지번호
	$("#pageNo").val(slcPageNo);
	
	// 리스트(그리드) 조회
	fnList();
}
/**********************************************************
 * 리스트(그리드) 조회
 **********************************************************/
function fnList(){
	// Validator DateTime
	fnValidatorDateTime("startDate", "startTime", "endDate", "endTime");
	
	if(! valObj["validator"]) return;
	var pageSize = $("#slcPageSize").val();
	var pagingYn = "";
	
	if(pageSize == "전체"){
		pagingYn = "N";
		pageSize = 9999999;
	} else {
		pagingYn = "Y";
	}
	
	var params = {
		pageNo : $("#pageNo").val(),
		pageNavi : "5",
		pageSize : pageSize,
		searchType : $("#searchType option:selected").val(),
		startDateTime : valObj["startDateTime"],
		endDateTime : valObj["endDateTime"],
		eventState : $("#eventState").val(),
		pagingYn : pagingYn,
		filterEventLevel : $("#kwEventLevel option:selected").val(),
		filterZabbixState : $("#kwZabbixState option:selected").val(),
		filterEventState : $("#kwEventState option:selected").val(),
		filterIncidentId : $("#kwIncidentId").val(),
		filterEventStep1User : $("#kwStep1User").val(),
		filterEventStep2User : $("#kwStep2User").val(),
		filterTargetContents : $("#kwEventContent").val(),
		filterStdnm : $("#kwStdnm").val(),
		filterEstdnm : $("#kwEstdnm").val(),
		filterHostname : $("#kwHostname").val(),
		filterGubun : $("#kwGubun").val(),
		filterTargetIp : $("#kwTargetIp").val(),
		filterContainerNm : $("#kwContainerNm").val(),
		filterDatacenterNm : $("#kwDatacenterNm").val(),
		filterRackLocation : $("#kwRackLocation").val(),
		filterEventId : $("#kwEventId").val()
		
	};
	
    // GRID 리스트 조회
	fnAjax("<c:url value='/api/evt/list'/>", params, function(data) {
		if(successResCode == data.resCode){
			
			// SET 리스트전체건수, 시간변경(지금업데이트), 30초이후일시
			$("#listTotalCount").val(data.total_count);
			$("#currCheckTime").text(data.now_date_time);
			$("#addThirtyTime").val(data.add_thirty_time);
			// RESET DATA(그리드)
			gridObj["grid"].resetData(data.list);
			// row 배경색
			fnSetRowBgcolor();
			// 등급 뱃지
			fnSetBadgeColor();
			
			// 페이징
			fnPagenation(data.paging, "fnPagenationList");
			
			// 검색필터 닫기
			var filterChk = $("#btnKeyword").is(':checked');
			if(filterChk){
				$("#btnKeyword").click();
			}
			
			
		}else{
			fnErrorMsg(failResMsg);
		}
		
	});
}
/**********************************************************
 * 1차 인지
**********************************************************/
function fnUpdateOnePerceive(){
	var params = {
		eventId : $("#eventId").val()
	};
	
	fnAjax("<c:url value='/api/evt/updateOnePerceive'/>", params, function(data) {
		fnDefaultMsg(data);
		if(cmmObj["isList"]){
			fnList();
		}
		if(cmmObj["isPopup"]){
			fnPopupData();
		}
	});	
}
/**********************************************************
 * 2차 인지
**********************************************************/
function fnUpdateTwoPerceive(){
	var params = {
		eventId : $("#eventId").val()
	};
	
	fnAjax("<c:url value='/api/evt/updateTwoPerceive'/>", params, function(data) {
 		fnDefaultMsg(data);
		if(cmmObj["isList"]){
			fnList();
		}
		if(cmmObj["isPopup"]){
			fnPopupData();
		}
 	});	
}
/**********************************************************
 * 1차 이관
**********************************************************/
function fnUpdateOneTransfer(){
	
	var params = {
		eventStep1Contents : $("#eventStep1Contents").val(),
		eventId : $("#eventId").val()
	};
	
	fnAjax("<c:url value='/api/evt/updateOneTransfer'/>", params, function(data) {
		fnDefaultMsg(data);
		if(cmmObj["isList"]){
			fnList();
		}
		if(cmmObj["isPopup"]){
			fnPopupData();
		}
	});	
}
/**********************************************************
 * 2차 이관
**********************************************************/
function fnUpdateTwoTransfer(){
	
	var params = {
		eventStep2Contents : $("#eventStep2Contents").val(),
		eventId : $("#eventId").val()
	};
	
	fnAjax("<c:url value='/api/evt/updateTwoTransfer'/>", params, function(data) {
 		fnDefaultMsg(data);
		if(cmmObj["isList"]){
			fnList();
		}
		if(cmmObj["isPopup"]){
			fnPopupData();
		}
 	});	
}
/**********************************************************
 * 인시던트 생성
**********************************************************/
function fnCreateIncident(){
	var params = {
		eventId : $("#eventId").val()
	};
	
    // 인시던트 생성
	fnAjax("<c:url value='/api/evt/createIncident'/>", params, function(data) {
		if(successResCode == data.resCode){
			fnInfoMsg(data.resMsg);
			fnAjax("<c:url value='/api/evt/selectIcdIdInEvtId'/>", params, function(result) {
				if(successResCode == result.resCode){
					// 인시던트 팝업 페이지 이동
					params = {
						viewType : "00",
						incidentYn : "Y",
						evtIcdId : result.info.incident_id
					};
					fnPostSend("<c:url value='/view/icd/subIncidentState' />", params);
				}else{
					fnDefaultMsg(result);
				}
			});
			
		}else{
			fnDefaultMsg(data);
		}
	});
    
}
/**********************************************************
 * 이벤트 조치완료
**********************************************************/
function fnEventEnd(){
	
	var params = {
		eventStep1Contents : $("#eventStep1Contents").val(),
		eventStep2Contents : $("#eventStep2Contents").val(),
		eventServiceImpact : $("input:radio[name='popEventServiceImpact']:checked").val(),
		eventTechVoc : $("input:radio[name='popEventTechVoc']:checked").val(),
	    eventResultType : $("input:radio[name='popEventResultType']:checked").val(),
		eventId : $("#eventId").val(),
		chkState : $("#popEventState").text()
	};
	
	fnAjax("<c:url value='/api/evt/updateEventEnd'/>", params, function(data) {
 		fnDefaultMsg(data);
 		fnList();
 	});	
}
/**********************************************************
 * 이벤트 저장
**********************************************************/
function fnEventSave(){
	
	var params = {
		eventStep1Contents : $("#eventStep1Contents").val(),
		eventStep2Contents : $("#eventStep2Contents").val(),
		eventId : $("#eventId").val()
	};
	fnAjax("<c:url value='/api/evt/updateEventSave'/>", params, function(data) {
 		fnDefaultMsg(data);
		if(cmmObj["isList"]){
			fnList();
		}
		if(cmmObj["isPopup"]){
			fnPopupData();
		}
 	});	
}
/**********************************************************
 * 현재일시출력
**********************************************************/
function fnPrintNowDateTime(){
	var now = new Date();
	
	var nowDateTime = now.getFullYear() + "-" 
					+ fnLpad(String((now.getMonth()+1)), 2 , "0") + "-" 
					+ fnLpad(String(now.getDate()), 2 , "0") + " " 
					+ fnLpad(String(now.getHours()), 2 , "0") + ":" 
					+ fnLpad(String(now.getMinutes()), 2 , "0") + ":" 
					+ fnLpad(String(now.getSeconds()), 2 , "0");
					
	$("#printNowDateTime").html("<b>" + nowDateTime + "</b>");
	
	setTimeout("fnPrintNowDateTime()", 1000);
}
/**********************************************************
 * 자동실행(알람)
**********************************************************/
function fnAlarm(){
		
	var chkSoundClsVal = $("#btnSound").attr("class");
	
	if("btSound on" == chkSoundClsVal){
		
		var params = {
			eventState : "최종완료"
		};
	    // 알림건수
		fnAjax("<c:url value='/api/evt/newAlarmCount'/>", params, function(data) {
			
			if(successResCode == data.resCode){
				var totalCount = parseInt(data.info.total_count, 10);
				var alramCount = parseInt($("#alramCount").val(), 10);
				$("#alramCount").val(totalCount);
	
				if((0 < totalCount) && (0 < alramCount) && (alramCount < totalCount)){
					// 신규알림
				    var myAudio = new Audio();
				    myAudio.src = "/sound/event.mp3";
				    myAudio.play();
				}
				
			}else{
				fnErrorMsg(failResMsg);
			}
			
		});
	}
	
	setTimeout("fnAlarm()", 1000);
}
/**********************************************************
 * 자동실행(지금업데이트)
 **********************************************************/
function fnAutoReload(){
		
	// 30초이후일시(지금업데이트)
	var addThirtyTime = $("#addThirtyTime").val();
	
	// 현재일시 
	var nowDateTime = fnNowDateTime();
	
	if(("" != fnNullChangeBlank(addThirtyTime)) && addThirtyTime <= nowDateTime){
		
		// 이벤트(지금업데이트)
		$("#btnReload").trigger("click");
	}
	
	if("00" == $("#viewType").val()){
		setTimeout("fnAutoReload()", 1000);
	}
}
/**********************************************************
 * 이벤트 상황 관리 팝업 데이터 조회
 **********************************************************/
function fnPopupData(){
	
	$("#popTitle").text("");
	$("#popTargetContents").text("");
	$("#popEventLevel").text("");
	$("#popCccuTime").text("");
	$("#popEvtLevel").html("");
	$("#popStdnm").text("");
	$("#popHostname").text("");
	$("#popEstdnm").text("");
	$("#popDeviceIp").text("");
	$("#popMgmtIp").text("");
	$("#popIpmiIp").text("");
	$("#popTargetIp").text("");
	$("#popContainerNm").text("");
	$("#popDatacenterNm").text("");
	$("#popEquipPosition").text("");
	$("#popRackLocation").text("");
	$("#popEquBarcode").text("");
	$("#popFirstEventTechVoc").text("");
	$("#popZabbixState").text("");
	$("#popIncidentId").text("");
	$("#popLastOccuTime").text("");
	$("#popEventState").text("");
	$("#popEventOccuCount").text("");
	$("#popCalOccuTime").text("");
	$("#popEventStep1User").text("");
	$("#popEventStep1State").text("");
	$("#popEventStep1Start").text("");
	$("#popEventStep1End").text("");
	$("#popEventStep1Contents").val("");
	$("#popEventStep2User").text("");
	$("#popEventStep2State").text("");
	$("#popEventStep2Start").text("");
	$("#popEventStep2End").text("");
	$("#popEventStep2Contents").val("");
	$("#popEventStep1ContentsCount").html('<b>0</b><i>/</i>100');
	$("#popEventStep2ContentsCount").html('<b>0</b><i>/</i>100');
	var params = {
		eventId : $("#eventId").val()
	};
	fnAjax("<c:url value='/api/evt/info'/>", params, function(data){
		if(successResCode == data.resCode) {
			// 이벤트 정보
			$("#eventId").val(data.info.event_id);
			$("#popTitle").text("[" + data.info.event_id + "] 이벤트 처리 및 상세내역");      // 팝업타이틀
			$("#popTargetContents").text(data.info.target_contents);                      // 이벤트 제목
			
			// 이벤트등급
			var eventLevel = fnNullChangeBlank(data.info.event_level);
			if("Fatal" == eventLevel){
				$("#popEventLevel").html('<span class="badge danger">' + eventLevel + '<span>');                              
			}else if("Critical" == eventLevel){
				$("#popEventLevel").html('<span class="badge careful">' + eventLevel + '<span>');
			}else{
				$("#popEventLevel").text(eventLevel);
			}
			$("#popCccuTime").text(data.info.occu_time);                                  // 이벤트최초발생시간
			/* 이벤트 등급*/
			var lv = data.info.event_level;
			if(lv == "Critical") {
				$("#popEvtLevel").removeClass('danger');
				$("#popEvtLevel").addClass('careful');
			} else {
				$("#popEvtLevel").removeClass('careful');
				$("#popEvtLevel").addClass('danger');
			}
			$("#popEvtLevel").text(lv);
			$("#popStdnm").text(data.info.stdnm);                                         // 표준서비스명
			$("#popHostname").text(data.info.hostname);                                   // 호스트명
			$("#popEstdnm").text(data.info.estdnm);                                       // 단위서비스명
			$("#popDeviceIp").text(data.info.device_ip);                                  // TCP IP
			$("#popMgmtIp").text(data.info.mgmt_ip);                                      // MGMT IP
			$("#popIpmiIp").text(data.info.ipmi_ip);                                      // IPMI IP
			var agentStateArr = [data.info.zbx_available, data.info.ipmi_available, data.info.snmp_available, data.info.jmx_available];
			var agentState = "";
			for(var i = 0; i < agentStateArr.length-1; i++){
				if(agentStateArr[i] == 0) {
					agentState = 0;
				} else if(agentStateArr[i] == 1) {
					agentState = 1;
					break;
				} else if(agentStateArr[i] == 2) {
					agentState = 2;
					break;
				}
			}
			
			
			$("#popTargetIp").html(data.info.target_ip + '<span id="agentState"></span>');	// Zabbix IP
			if(agentState < 1){
				$("#agentState").addClass('agent-state-null');
			} else if (agentState > 1) {
				$("#agentState").addClass('agent-state-fail');
			} else if (agentState == 1) {
				$("#agentState").addClass('agent-state-pass');
			}
			$("#popContainerNm").text(data.info.container_nm);                            // 센터
			$("#popDatacenterNm").text(data.info.datacenter_nm);                          // 층/실
			$("#popEquipPosition").text(data.info.equip_position);                        // 실장위치
			$("#popRackLocation").text(data.info.rack_location);                          // 상면정보
			$("#popEquBarcode").text(data.info.equ_barcode);                              // 설비 바코드
			$("#popFirstEventTechVoc").text(data.info.event_tech_voc);                    // 테크VOC 접수여부
			// 인시던트ID
			var incidentId = fnNullChangeBlank(data.info.incident_id);
			if("" != incidentId){
				$("#popIncidentId").html('<span class="badge danger">' + incidentId + '<span>'); 
				$("#btnPopIncident").prop('disabled', true);
			}else{
				$("#btnPopIncident").prop('disabled', false);
				$("#popIncidentId").text(incidentId);
			}
			
			// 대응 상태
			$("#popZabbixState").text(data.info.zabbix_state);                            // 대응 상태
			$("#popLastOccuTime").text(data.info.last_occu_time);                         // 이벤트 최근발생시간
			$("#popEventState").text(data.info.event_state);                              // 이벤트 상태
			$("#popEventOccuCount").text(data.info.event_occu_count);                     // 이벤트 누적 횟수
			$("#popCalOccuTime").text(data.info.cal_occu_time);                           // 이벤트 지속시간
			// 이벤트 처리상세
			$("#popEventStep1User").text(data.info.event_step1_user);                     // 인지자
			$("#popEventStep1State").text(data.info.event_step1_state);                   // 처리진행현황
			$("#popEventStep1Start").text(data.info.event_step1_start);                   // 대응시작시간
			$("#popEventStep1End").text(data.info.event_step1_end);                       // 대응종료/이관시간
			var con1 = data.info.event_step1_contents;
			$("#popEventStep1Contents").val(con1);             // 내용
			if("" != fnNullChangeBlank(con1)){
				$("#popEventStep1ContentsCount").html('<b>'+con1.length+'</b><i>/</i>100');
			} else {
				$("#popEventStep1ContentsCount").html('<b>0</b><i>/</i>100');
			}			
			$("#popEventStep2User").text(data.info.event_step2_user);                     // 조치담당자
			$("#popEventStep2State").text(data.info.event_step2_state);                   // 처리진행현황
			$("#popEventStep2Start").text(data.info.event_step2_start);                   // 대응시작시간
			$("#popEventStep2End").text(data.info.event_step2_end);                       // 대응종료/이관시간
			var con2 = data.info.event_step2_contents;
			$("#popEventStep2Contents").val(con2);             // 내용
			if("" != fnNullChangeBlank(con2)){
				$("#popEventStep2ContentsCount").html('<b>'+con2.length+'</b><i>/</i>100');
			} else {
				$("#popEventStep2ContentsCount").html('<b>0</b><i>/</i>100');
			}	
			// 이벤트 종료처리
			
			// 서비스 영향도 여부
			$("input[name='popEventServiceImpact']").prop("checked", false);
			var eventServiceImpact = fnNullChangeBlank(data.info.event_service_impact);
			$("input[name='popEventServiceImpact']").each(function(i, item){
				if(eventServiceImpact == item.value){
					$(this).prop("checked", true);
				}
			});
			
			// 테크센터 VOC
			$("input[name='popEventTechVoc']").prop("checked", false);
			var eventTechVoc = fnNullChangeBlank(data.info.event_tech_voc);
			$("input[name='popEventTechVoc']").each(function(i, item){
				if(eventTechVoc == item.value){
					$(this).prop("checked", true);
				}
			});
			// 구분
			$("input[name='popEventResultType']").prop("checked", false);
			var eventResultType = fnNullChangeBlank(data.info.event_result_type);
			$("input[name='popEventResultType']").each(function(i, item){
				if(eventResultType == item.value){
					$(this).prop("checked", true);
				}
			});
			$("#popEventResultUser").text(data.info.event_result_user);                   // 처리자
			$("#popEventResultTime").text(data.info.event_result_time);                   // 종료 시간
			
			// 단계별 버튼처리			
			if("사용자" != loginUserGroup){
				$("#btnPopEventEnd").prop('disabled', false);
				$("#popEventStep1Contents").prop('readonly', true);
				$("#popEventStep2Contents").prop('readonly', true);
				$("input[name='popEventServiceImpact']").prop('disabled', false);
				$("input[name='popEventTechVoc']").prop('disabled', false);
				$("input[name='popEventResultType']").prop('disabled', false);
				
				$("#btnPopOnePerceive").prop('disabled', true);
				$("#btnPopTwoPerceive").prop('disabled', true);
				$("#btnPopOneTransfer").prop('disabled', true);
				$("#btnPopTwoTransfer").prop('disabled', true);
				
				var eventStep = data.info.event_step;
				if("99" == eventStep){
					// 신규
					$("#btnPopOnePerceive").prop('disabled', false);
				}else if("10" == eventStep){
					// 1차인지
					$("#btnPopOneTransfer").prop('disabled', false);
					$("#popEventStep1Contents").prop('readonly', false);
				}else if("20" == eventStep){
					// 1차이관
					$("#btnPopTwoPerceive").prop('disabled', false);
				}else if("11" == eventStep){
					// 2차인지
					$("#btnPopTwoTransfer").prop('disabled', false);
					$("#popEventStep2Contents").prop('readonly', false);
				}else if("21" == eventStep){
					// 2차이관
				}else if("00" == eventStep){
					// 조치완료
					$("#btnPopEventEnd").prop('disabled', true);
					$("input[name='popEventServiceImpact']").prop('disabled', true);
					$("input[name='popEventTechVoc']").prop('disabled', true);
					$("input[name='popEventResultType']").prop('disabled', true);
				}
			}
			
 			$("#test-popup1").removeClass("hide");
 			gridObj["grid"].focusAt(0, 0);
		} else {
			fnErrorMsg("이벤트 상세내역 조회에 실패했습니다.");
		}
	});
}
/**********************************************************
 * 이벤트 그리드 내 조치완료 row 배경색 변경
 **********************************************************/
function fnSetRowBgcolor(){
	var cnt = gridObj["grid"].getRowCount();
	for(i=0; i<=cnt; i++){
		var eventState = gridObj["grid"].getValue(i,"event_state");
		if(eventState != "조치완료"){
			gridObj["grid"].addRowClassName(i,"bg-yellow");
		}
	}
}
/**********************************************************
 * 메인그리드 내 구분에 따른 badge color 변경
 **********************************************************/
function fnSetBadgeColor(){
	 
	var cnt = gridObj["grid"].getRowCount();
	
	for(i=0; i<=cnt; i++){
		var a = gridObj["grid"].getValue(i,"event_level");
		var b = gridObj["grid"].getValue(i,"incident_id");
		if(a =='Critical'){
			gridObj["grid"].addCellClassName(i,"event_level","tag");
			gridObj["grid"].addCellClassName(i,"event_level","careful");
		} else {
			gridObj["grid"].addCellClassName(i,"event_level","tag");
			gridObj["grid"].addCellClassName(i,"event_level","danger");
		}
		
		if("" != fnNullChangeBlank(b)){
			gridObj["grid"].addCellClassName(i,"incident_id","tag");
			gridObj["grid"].addCellClassName(i,"incident_id","danger");
		}
	}
}
/**********************************************************
 * 엑셀 다운로드용 리스트(그리드) 조회
 **********************************************************/
function fnExcelList(type){
	// Validator DateTime
	fnValidatorDateTime("startDate", "startTime", "endDate", "endTime");
	
	if(! valObj["validator"]) return;
	
	var downloadType = type;
	
	var params = {
		pageNo : $("#pageNo").val(),
		pageNavi : "5",
		pageSize : $("#slcPageSize").val(),
		startDateTime : valObj["startDateTime"],
		endDateTime : valObj["endDateTime"],
		searchType : $("#searchType option:selected").val(),
		incidentYn : $("#incidentYn").val(),
		incidentState : $("#incidentState").val(),
	};
	
    // GRID 리스트 조회
	fnAjax("<c:url value='/api/evt/list'/>", params, function(data) {
		if(successResCode == data.resCode){
			if(type == "basic"){
				gridObj["excelGrid"].resetData(data.list);				
				var cnt = gridObj["excelGrid"].getRowCount();			
				if( 0 < cnt) {
					const options = {
							fileName: ("event_" + fnNowDateTimeUnderScore())
						};
				 		gridObj["excelGrid"].export("csv", options);
				} else {
					alert("조회된 데이터가 없어 엑셀 다운로드를 할 수 없습니다.");
				}
			} else if(type=="full") {
				gridObj["excelDetailGrid"].resetData(data.list);				
				var cnt = gridObj["excelDetailGrid"].getRowCount();			
				if( 0 < cnt) {
					const options = {
							fileName: ("event_detail_" + fnNowDateTimeUnderScore())
						};
				 		gridObj["excelDetailGrid"].export("csv", options);
				} else {
					alert("조회된 데이터가 없어 엑셀 다운로드를 할 수 없습니다.");
				}
			}
		}else{
			
			// 경고메세지
			fnErrorMsg(failResMsg);
		}
		
		$("#btnexcelConfirmClose").click();
	});
}
/**********************************************************
 * 이벤트 조치완료 일괄처리 팝업
 **********************************************************/
function fnPopEventEnd(){
	/* element 초기화*/
	$("#popEndTitle").html("");
	$("#popEndEventStep1Contents").val("");
	$("#popEndEventStep2Contents").val("");
	$("#popEndEventStep1ContentsCount").html('<b>0</b><i>/</i>100');
	$("#popEndEventStep1ContentsCount").html('<b>0</b><i>/</i>100');
	$("input:radio[name='popEndEventServiceImpact']:checked").prop('checked', false);
	$("input:radio[name='popEndEventTechVoc']:checked").prop('checked', false);
	$("input:radio[name='popEndEventResultType']:checked").prop('checked', false);
	//.prop('checked', false);
	
	/* 내용입력 */
	var evtIdArr = [];
	var evtIds = $("#eventId").val();
	evtIdArr = evtIds.split(',');
	var evtEndTitle = "["+evtIdArr[0]+" 외 "+(evtIdArr.length-1)+"건] 이벤트 일괄 조치완료";
	console.log(evtEndTitle);
	
	$("#popEndTitle").html(evtEndTitle);
}
//-->
</script>