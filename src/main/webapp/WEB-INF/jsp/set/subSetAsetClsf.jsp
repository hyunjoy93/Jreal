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
			<li>환경설정</li>
			<li>행정분류</li>
		</ol>

		<div class="headline">
			<h2 class="pageTitle">행정분류</h2>
		</div>

	</div><!--//conHead-->

	<div class="conBody">
<!-- 		<h3 class="pageTitle">점검자산</h3> -->
		<div class="gridFlex" style="justify-content: space-around;">
			<div style="margin-bottom: 5px; height:30px;">
				<button type="button" class="bt bg primary" id="btnAddAsetClsf" 
				  style="margin-bottom: 5px;
                         position: absolute;
                         right: 51%;
                         margin-top: -10px;">
                  행정분류추가
                </button>
			</div>
			<div class="resultTree" style="width:50%;">
					<div class="dd" id="nestable" ></div>
			</div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
			<div class="resultTree" style="width:50%;">
			</div>
		</div><!--//result-->
		<textarea id="nestable-output"  style="display:none;"></textarea>

	</div><!--//pageBody-->
</section>

<!-- [팝업] 행정분류 추가 -->

<article class="popup hide" id="insertAsetClsfPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">행정분류 추가</h5>
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
						<th>행정구분</th>
						<td>
							<select class="select md" id="asetClsf">
								<option value="UP">행정지역구</option>
								<option value="LO">행정지역동</option>
							</select>
						</td>
					</tr>
					<tr id="hiddenArea">
						<th>행정지역구명</th>
						<td><select class="select md" id="parAsetClsfId"></select></td>
					</tr>
					<tr>
						<th>행정분류명</th>
						<td><input type="text" class="input xl" value="" id="asetClsfNm">
						</td>
					</tr>
				</tbody>
			</table>
			<p style="float: left; color: var(--color-danger); font-size:11px; font-weight:400; ">※상위자산명에 목록이 없으면 상위자산을 먼저 추가해 주세요.</p>
		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary" id="btnSave">저장</button>
				<button type="button" class="bt max bd btClose" id="btnCancleAndClose">취소</button>
			</div>
		</div>

	</div>
</article>	

<!-- [팝업] 행정분류 수정 -->

<article class="popup hide" id="updateAsetClsfPopup">
	<div class="popBox">

		<div class="conHead">
			<h5 class="popTitle">행정분류 수정</h5>
			<button type="button" class="btClose"><i>닫기</i></button>
		</div>

		<div class="conBody">

			<table class="field">
				<colgroup>
					<col width="100px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr  hidden="true">
						<th>이전 행정분류ID</th>
						<td><input type="text" class="input xl" value="" id="befAsetClsfId" readonly>
						</td>
					</tr>
					<tr>
						<th>이전 행정분류명</th>
						<td><input type="text" class="input xl" value="" id="befAsetClsfNm" readonly>
						</td>
					</tr>
					<tr>
						<th>변경 행정분류명</th>
						<td><input type="text" class="input xl" value="" id="updAsetClsfNm">
						</td>
					</tr>
				</tbody>
			</table>
		</div><!--//conBody-->

		<div class="conFoot">
			<div class="btns">
				<button type="button" class="bt max bg primary" id="btnUpdate">저장</button>
				<button type="button" class="bt max bd btClose" id="btnCancleAndClose">취소</button>
			</div>
		</div>

	</div>
</article>	

	
<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/footer" />

<script type="text/javaScript">

var compareList = []; 
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
	
	// 행정분류 추가 팝업 호출
	$('#btnAddAsetClsf').on("click", function(e){
		
		fnStopEvent(e);
		$("#parAsetClsfNm").empty();
		$("#asetClsfNm").val("");
		
		$("#asetClsf").on("change", function(e) {
			fnStopEvent(e);
			if($(this).val() == "LO") {
				$('#hiddenArea').removeClass('hide');
			} else {
				$('#hiddenArea').addClass('hide');
			}
		});
		
		var output = [];
		
		fnAjax("<c:url value='/api/set/asetClsfList'/>", null, function(data) {
			if(successResCode == data.resCode){
				var treeUpperList = [];
				var asetClsfList  = data.asetClsfList;
				
				for(var idx in asetClsfList) {
					if(asetClsfList[idx].aset_lvl == 1 && asetClsfList[idx].par_aset_clsf_id == "0") {
						var asetUpperMap={
						    cd      : asetClsfList[idx].aset_clsf_id,
						    nm      : asetClsfList[idx].aset_clsf_nm
						};
						
						output.push('<option value="'+ asetUpperMap.cd +'">'+ asetUpperMap.nm +'</option>');
					};
					$("#parAsetClsfId").html(output.join(''));
				};
			} else {
				alert("상위자산 목록을 불러오는데 실패했습니다. 관리자에게 문의해주세요.");
				$("#parAsetClsfId").empty();
			}
		});
		
		$('#insertAsetClsfPopup').removeClass('hide');
		
	});
	
	// 자산추가 팝업에서 저장 버튼 클릭
	$("#btnSave").on("click", function(e){
		fnStopEvent(e);
		console.log("팝업-저장 click");
		
		if(compareList.length > 0) {
			for(var idx in compareList) {
				if(compareList[idx].aset_clsf_nm == $("#asetClsfNm").val()) {
					alert('동일한 자산명이 존재합니다. 자산명을 확인 후 중복되지 않은 자산명으로 등록해주세요.');
					return false;
				}
			}
		}
		
		// input data null체크 진행
		if(fnPopNullCheck() == false) {
			$("#asetClsfNm").focus();
			return;
		};
				
		if ( $("#asetClsf").val() == "UP" )
		{
			parAsetClsfId = "0";
        	asetClsfNm    = $("#asetClsfNm").val();
        	asetLvl       = "1";
        	leafYn        = "N";
		}
	    else 
	    {
			parAsetClsfId = $("#parAsetClsfId").val();
        	asetClsfNm    = $("#asetClsfNm").val();
        	asetLvl       = "2";
        	leafYn        = "Y";
	    };	
	        
		var param = {
				
			 	parAsetClsfId : parAsetClsfId
	          , asetClsfNm    : asetClsfNm
	          , asetLvl       : asetLvl   
	          , leafYn        : leafYn   
			  , regEmpId      : loginUserId
		}
			
		console.log(param);
			
		fnAjax("<c:url value='/api/set/insertAsetClsf'/>", param, function(data){
			if(successResCode == data.resCode) {
				alert("행정분류 정보가 추가되었습니다.");
				// 리스트 새로고침
		 		location.reload();
			} else {
				alert("행정분류 추가에 실패했습니다.");
			}
		});		
	});

	// 자산정보 수정 팝업에서 저장 버튼 클릭
	$("#btnUpdate").on("click", function(e){
		
		fnStopEvent(e);
		console.log("수정-저장 click");
		
		// input data null체크 진행
		if(fnPopNullCheck2() == false) {
			$("#asetClsfNm").focus();
			return;
		};				
		
		var param = {
				
			  befAsetClsfId : $("#befAsetClsfId").val()
			, updAsetClsfNm	: $("#updAsetClsfNm").val()
			, regEmpId      : loginUserId
		}
		
		console.log(param);
		
		fnAjax("<c:url value='/api/set/updateAsetClsf'/>", param, function(data){
			if(successResCode == data.resCode) {
				alert("행정분류 정보가 수정되었습니다.");
				// 리스트 새로고침
		 		location.reload();
			} else {
				alert("행정분류 정보 수정에 실패했습니다.");
			}
		});
				
	});
	
});

/**********************************************************
 * 초기화
 **********************************************************/
function fnInit(){
	
	// 메뉴 초기화
	fnInitGnbLnb(5, 1, 5, 1);
	
	//공통
	fnCommon();
	
	
	fnTreeList();
	
	// 팝업화면 초기화
	//fnInitPopup();
}

/**********************************************************
 * 리스트(Tree) 조회
 **********************************************************/
 
function fnTreeList(){
	var treeData=[];
	// tree 리스트 조회
	fnAjax("<c:url value='/api/set/asetClsfList'/>", null, function(data) {
		compareList = data.asetClsfList;
		if(successResCode == data.resCode){
			var treeUpperList = [];
			var asetClsfList  = data.asetClsfList;

			for(var idx in asetClsfList) {
				
				if(asetClsfList[idx].aset_lvl == "1" && asetClsfList[idx].par_aset_clsf_id == "0") {
					var asetUpperMap={
					    id      : '0_'  + asetClsfList[idx].aset_clsf_id,
					    content : asetClsfList[idx].aset_clsf_nm
					};
					treeUpperList.push(asetUpperMap);
				};
			};
			
			for(var idx in treeUpperList) {
				var child = [];
				var idChk = treeUpperList[idx].id;
				for(var j in asetClsfList) {
					if(idChk == '0_' + asetClsfList[j].par_aset_clsf_id) {
						var asetLowerMap = {
								id      : asetClsfList[j].par_aset_clsf_id + '_' + asetClsfList[j].aset_clsf_id,   // idChk + '_' + 
								content : asetClsfList[j].aset_clsf_nm
						}
						child.push(asetLowerMap);
					}
				}
				treeUpperList[idx].children = child;
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
		        json: treeUpperList
		    }).on('change', updateOutput);

		    //output initial serialised data
		    updateOutput($('#nestable').data('output', $('#nestable-output')));
		    
			$('#nestable > ol > li > .dd-handle').each(function(e) {
				var labelTag = $('<label>').addClass('treeLabel treeLabel-default treeLabel-xs').text('행정지역구');
				
				$(this).prepend(labelTag);
				
			});
		    
			$('#nestable> ol > li > .dd-handle').each(function(e) {
				//var labelTag = $('<span style="position: relative; display: inline-block;"><input type="checkbox" name="chbox" value="N" style="width:30px; appearance: auto; !important;"></span>');
				
				var buttonTag = $('<button type="button" class="bt bd asetClsf-delete fr">삭제</button> <button type="button" class="bt bd primary asetClsf-update fr" style="margin-right: 5px;">수정</button>')
				
				$(this).prepend(buttonTag);	
			});
			
			$('#nestable > ol > li > ol').each(function(e) {
				$(this).attr('style', 'padding-left: 30px;');
				
			});
		    
			$('#nestable').children().children().children().children().children().each(function(e) {
				//var labelTag = $('<span style="position: relative; display: inline-block;"><input type="checkbox" name="chbox" value="N" style="width:30px; appearance: auto; !important;"></span>');
				
				var buttonTag = $('<button type="button" class="bt bd asetClsf-delete fr">삭제</button> <button type="button" class="bt bd primary asetClsf-update fr" style="margin-right: 5px;">수정</button>')
				
				$(this).prepend(buttonTag);	
			});
			
			
			$('ol > li > button:nth-child(-n+2)').each(function(e) {
					$(this).remove();
			});
			
			
			$("li button").on("click", function(e){
				
				fnStopEvent(e);

				
				let treeId = $(this).parent().parent().attr('data-id');			
							
				let treeIdsplit = treeId.split('_');
				
				let parAsetClsfId = treeIdsplit[0];
				let asetClsfId    = treeIdsplit[1];
				

				var params = {
						
					asetClsfId : asetClsfId
				};
				
				if($(this).hasClass('asetClsf-update')) {
					
					$('#updateAsetClsfPopup').removeClass('hide');

					$('#befAsetClsfId').val(asetClsfId);
					$('#befAsetClsfNm').val($(this).siblings('span').text());
					
				} else {
					
					if (!confirm("정말 삭제하시겠습니까?")) {
				        // 취소(아니오) 버튼 클릭 시 이벤트
						alert("삭제 취소되었습니다.");
				    } else {
				        // 확인(예) 버튼 클릭 시 이벤트
				    	fnAjax("<c:url value='/api/set/deleteAsetClsf'/>", params, function(data) {

							if(successResCode == data.resCode) {
								alert("행정분류정보 삭제에 성공했습니다.");
								// 리스트 새로고침
						 		location.reload();
							} else {
								alert("행정분류정보 삭제에 실패했습니다.");
							}
						});
				    }
					
				}
				
			});
			
			
		}else{
			// 경고메세지
			fnWarnMsg('조회에 실패했습니다.');
		}
	});
}



function fnPopNullCheck(){
	
	if ($("#asetClsfNm").val() == "" || $("#asetClsfNm").val() == null || $("#asetClsfNm").val() == undefined) {
		alert("행정분류명을 입력해주세요.");
		return false;
	}
}

function fnPopNullCheck2(){
	
	if ($("#updAsetClsfNm").val() == "" || $("#updAsetClsfNm").val() == null || $("#updAsetClsfNm").val() == undefined) {
		alert("행정분류명을 입력해주세요.");
		return false;
	}
}


</script>