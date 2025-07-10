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
			<li>작업관리</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">작업관리</h2>
			<div class="btns">
				<button type="button" class="bt bd">엑셀다운로드</button>
			</div>
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
									<select class="select md">
										<option>표준서비스명</option>
										<option>CRM ID</option>
										<option>TAM ID</option>
										<option>작업 등급</option>
										<option>작업 단계</option>
										<option>변경 담당자</option>
										<option>담당자 부서</option>
									</select>
									<input type="text" class="input xxl" value="" placeholder="검색어입력">
								</td>
								<th>조회기간</th>
								<td>
									<input type="text" class="input date" placeholder="시작일">
									<input type="time" class="input time" step="2">
									<span class="txt">~</span>
									<input type="text" class="input date" placeholder="종료일">
									<input type="time" class="input time" step="2">
								</td>
								<td>
									<div class="set radio">
										<div class="check"><input type="radio" name="term"><label>1일</label></div>
										<div class="check"><input type="radio" name="term"><label>1주일</label></div>
										<div class="check"><input type="radio" name="term"><label>1개월</label></div>
										<div class="check"><input type="radio" name="term"><label>3개월</label></div>
										<div class="check"><input type="radio" name="term"><label>6개월</label></div>
										<div class="check"><input type="radio" name="term"><label>1년</label></div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				<div class="btns">
					<button type="button" class="bt bg primary">검색</button>
					<!--button type="button" class="bt bg">초기화</button-->
					<!-- <button type="button" class="btRefresh" title="초기화">초기화</button> -->
				</div>
			</div>

		</div><!--//search-->

		<div class="result">

			<div class="control">

				<span class="count">
					<select class="select sm">
						<option>20</option>
						<option>1,000</option>
					</select>
				</span>
				
				<span class="count">Total <b>0</b></span>

			</div><!--//control-->

			<div class="grid">
				<table>
					<thead>
						<tr>
							<th><span>No.</span></th>
							<th class="range"><span>변경ID</span></th>
							<th class="range"><span>표준서비스명</span></th>
							<th class="range"><span>작업단계</span></th>
							<th class="range"><span>작업등급</span></th>
							<th class="range"><span>작업명</span></th>
							<th class="range"><span>변경담당자</span></th>
							<th class="range"><span>담당자부서</span></th>
							<th class="range"><span>작업시작일시</span></th>
							<th class="range"><span>작업종료일시</span></th>
							<th class="range"><span>작업상태</span></th>
						</tr>
					</thead>
					<tbody>
						<tr class="on">
							<td>00</td>
							<td>CRM022061600002</td>
							<td>EPC-UCLOUD-NW</td>
							<td>인프라변경 종료</td>
							<td>3등급</td>
							<td class="tl">[EPC_NW] 천안 공공 Cloud 40Gbps 백본 네트워크 G-D1 접선 스위치 VPC 연동 작업</td>
							<td>이창원</td>
							<td>고객인프라팀</td>
							<td>2022-07-23 15:00:33</td>
							<td>2022-07-23 15:00:33</td>
							<td><span class="badge careful">작업전</span></td>
						</tr>
						<tr v-for="n in 30">
							<td>00</td>
							<td>CRM022061600002</td>
							<td>EPC-UCLOUD-NW</td>
							<td>인프라변경 종료</td>
							<td>3등급</td>
							<td class="tl">[EPC_NW] 천안 공공 Cloud 40Gbps 백본 네트워크 G-D1 접선 스위치 VPC 연동 작업</td>
							<td>이창원</td>
							<td>고객인프라팀</td>
							<td>2022-07-23 15:00:33</td>
							<td>2022-07-23 15:00:33</td>
							<td><span class="badge bd">작업종료</span></td>
						</tr>
					</tbody>
				</table>
			</div><!--//grid-->

			<div class="control">

				<span class="count">현재 페이지 <b>1</b> <i>/</i> 전체 <b>1</b> 페이지</span>

				<div class="pages">
					<button type="button" class="btPrev end" disabled>처음 페이지</button>
					<button type="button" class="btPrev" disabled>이전 페이지</button>
					<a href="" class="pg on">1</a>
					<a href="" class="pg">2</a>
					<a href="" class="pg">3</a>
					<a href="" class="pg">4</a>
					<a href="" class="pg">5</a>
					<button type="button" class="btNext">다음 페이지</button>
					<button type="button" class="btNext end">마지막 페이지</button>
				</div>

			</div><!--//control-->

		</div><!--//result-->

	</div><!--//pageBody-->

</section>





<!-- [팝업] 작업내역 -->
<article class="popup hide" id="test-popup1">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">작업내역</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody">
			
			<table class="field">
				<colgroup>
					<col width="120px">
					<col width="320px">
					<col width="120px">
					<col width="320px">
				</colgroup>
				<tbody>
					<tr>
						<th>인프라ID</th>
						<td>CRM3764923869</td>
						<th>상태</th>
						<td>인프라변경 종료</td>
					</tr>
					<tr>
						<th>도메인</th>
						<td>KOS-요금</td>
						<th>작업그룹</th>
						<td>경영_인프라_DB관리</td>
					</tr>
					<tr>
						<th>요청자</th>
						<td>김정열</td>
						<th>회사</th>
						<td>KT</td>
					</tr>
					<tr><th>요청자 이메일</th>
						<td>7546253@email.com</td>
						<th>요청자부서</th>
						<td>협력사(고객인프라팀)</td>
					</tr>
					<tr>
						<th>등록자</th>
						<td>김정열</td>
						<th>등록일시</th>
						<td>2022-00-00 00:00:00</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3">[정규운영작업] NS 계산초기화 (파티션테이블 DROP)</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">
							내용<br>내용<br>내용<br>내용
						</td>
					</tr>
					<tr>
						<th>할당자</th>
						<td>박주</td>
						<th>서비스</th>
						<td>ICIS</td>
					</tr>
					<tr>
						<th>파트</th>
						<td colspan="3">계산</td>
					</tr>
					<tr>
						<th>구성항목</th>
						<td colspan="3">NBILLNS10</td>
					</tr>
					<tr>
						<th>프로세스구분</th>
						<td>인프라변경</td>
						<th>범주</th>
						<td></td>
					</tr>
					<tr>
						<th>단계</th>
						<td>종료 단계</td>
						<th>요청유형1</th>
						<td>DB</td>
					</tr>
					<tr>
						<th>완료일시</th>
						<td></td>
						<th>요청유형2</th>
						<td>DB Object</td>
					</tr>
					<tr>
						<th>클라우드 여부</th>
						<td>true</td>
						<th>요청유형3</th>
						<td>운용 테이블(Create/Modify/Drop/Truncate)</td>
					</tr>
					<tr>
						<th>접수자</th>
						<td></td>
						<th>접수유형1</th>
						<td></td>
					</tr>
					<tr>
						<th>접수일시</th>
						<td></td>
						<th>접수유형2</th>
						<td></td>
					</tr>
					<tr>
						<th>접수여부</th>
						<td></td>
						<th>접수유형3</th>
						<td></td>
					</tr>
					<tr>
						<th>변경구분</th>
						<td></td>
						<th>서비스중단여부</th>
						<td></td>
					</tr>
					<tr>
						<th>서비스중요도</th>
						<td></td>
						<th>우선순위</th>
						<td>3순위</td>
					</tr>
					<tr>
						<th>변경원인</th>
						<td>예방활동</td>
						<th>센터구분</th>
						<td>천안</td>
					</tr>
					<tr>
						<th>변경담당자</th>
						<td>김성욱</td>
						<th>변경담당자부서</th>
						<td>고객인프라팀</td>
					</tr>
					<tr>
						<th>변경계획</th>
						<td colspan="3">
							내용<br>내용<br>내용<br>내용
						</td>
					</tr>
					<tr>
						<th>처리담당자</th>
						<td></td>
						<th>처리담당부서</th>
						<td></td>
					</tr>
					<tr>
						<th>원복여부</th>
						<td></td>
						<th>실제처리 시작일시</th>
						<td>2022-00-00 00:00:00</td>
					</tr>
					<tr>
						<th>변경완료유형</th>
						<td></td>
						<th>실제처리 완료일시</th>
						<td>2022-00-00 00:00:00</td>
					</tr>
					<tr>
						<th>변경실패유형</th>
						<td></td>
						<th>변경종료코드</th>
						<td></td>
					</tr>
					<tr>
						<th>검토자</th>
						<td></td>
						<th>검토일시</th>
						<td>2022-00-00 00:00:00</td>
					</tr>
					<tr>
						<th>검토의견</th>
						<td colspan="3">검토결과 특이사항 없음</td>
					</tr>
					<tr>
						<th>서비스정상여부</th>
						<td></td>
						<th>서비스점검자</th>
						<td></td>
					</tr>
				</tbody>
			</table>

		</div><!--//conBody-->
		
		<!--div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bd">닫기</button>
			</div>
		</div-->

	</div>
</article>	
<!--// [팝업] 작업내역 -->
	
<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/footer" />

<script type="text/javaScript">


$(function(){

	// 초기화
	fnInit();
	
});

/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){
	
	// InitGnbLnb
	fnInitGnbLnb(5, 1, 5, 1);
}

/**********************************************************
 * 팝업
 **********************************************************/
$('.grid tbody tr').dblclick(function(){
	$('#test-popup1').removeClass('hide');
});

</script>