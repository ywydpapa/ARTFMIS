<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:parseDate var="STDate" value="${detailCont.START_DATE}"
	pattern="yyyy-MM-dd" />
<fmt:parseDate var="ENDate" value="${detailCont.END_DATE}"
	pattern="yyyy-MM-dd" />
<div class="listcont">
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						<h5>호실이동</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="c-container">
		<div>
			<!--Page-header end 페이지 타이틀 -->
			<div class="cnt_wr">
				<!-- Row start -->
				<div class="row">
					<div class="col-lg-12 col-xl-12">
						<div class="table-responsive">
							<table class="table  table-bordered nowrap">
								<tr>
									<td><input id="frid" type="hidden" value="${frid}"><input
										id="contid" type="hidden" value="${CONTid}"> <input
										id="rmchk" type="hidden" value="OK"><span>계약번호
											: </span>${CONTid}</td>
									<td style="text-align:right;">
									<button class="btn btn-md btn-primary" onClick="fn_FroomTR()">호실이동</button>
									</td>
								</tr>
							</table>
						</div>
						<div class="tab-content tabs m-t-20">
							<div class="tab-pane active" id="tab01" role="tabpanel">
								<div class="cnt_wr">
									<div class="row">
										<div class="col-sm-12">
											<div class="card-block table-border-style">
												<div class="table-responsive">
													<table class="table table-sm bst02">
														<tbody>
															<tr>
																<th scope="row">계약기본사항</th>
															</tr>
														</tbody>
													</table>
													<table class="table table-sm bst02" id="basicTable">
														<colgroup>
															<col width="10%" />
															<col width="10%" />
															<col width="10%" />
															<col width="10%" />
															<col width="10%" />
															<col width="10%" />
															<col width="10%" />
														</colgroup>
														<tbody>
															<tr>
																<th
																	style="vertical-align: center; text-align: center; background-color: #CEF6E3"
																	rowspan="2">계약기간</th>
																<td class="text-center">계약호실</td>
																<td><select class="form-control" id="contp1-01"
																	disabled>
																		<c:forEach var="listroom" items="${listroom}">
																			<option value="${listroom.FROOM_ID}">${listroom.FROOM_TITLE}</option>
																		</c:forEach>
																</select></td>
																<td class="text-center">기간</td>
																<td><input type="date" class="form-control"
																	id="contp1-02" name="contp1-02" value="${STDate}"
																	disabled></td>
																<td><input type="date" class="form-control"
																	id="contp1-03" name="contp1-03" value="${ENDate}"
																	disabled></td>
																<td></td>
															</tr>
															<tr>
																<td class="text-center">행사업체</td>
																<td><input type="text" class="form-control"
																	id="contp1-04"></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<th
																	style="vertical-align: center; text-align: center; background-color: #CEF6E3">고인</th>
																<td class="text-center">성명</td>
																<td><input type="text"
																	class="form-control form-control-sm" id="contp1-07"
																	name="contp1-07" value="${detailCont.DPERSON_NAME}">
																</td>
																<td class="text-center">성별</td>
																<td><select class="form-control" id="contp1-09">
																		<option value="">선택</option>
																		<option value="1">남</option>
																		<option value="2">여</option>
																</select></td>
															</tr>
															<tr>
																<th
																	style="vertical-align: center; text-align: center; background-color: #CEF6E3">유족</th>
																<td class="text-center">상주성명</td>
																<td><input type="text"
																	class="form-control form-control-sm" id="contp1-20"
																	name="contp1-20" value="${detailCont.SANGJU_NAME}">
																</td>
																<td class="text-center">관계</td>
																<td><select class="form-control" id="contp1-22">
																		<option value="">선택</option>
																		<c:forEach var="regc" items="${frelation}">
																			<option value="${regc.BCD_ID}">${regc.BCD_TITLE}</option>
																		</c:forEach>
																</select></td>
																<td class="text-center">연락처</td>
																<td><input type="text"
																	class="form-control form-control-sm" id="contp1-24"
																	name="contp1-24" value="${detailCont.SANGJU_TEL}"></td>
															</tr>
															<tr>
																<th
																	style="vertical-align: center; text-align: center; background-color: #CEF6E3"
																	>일정</th>
																<td class="text-center">입실일시*</td>
																<td><input type="date"
																	style="width: 70%; float: left"
																	class="form-control form-control-sm" id="contp1-26"
																	name="contp1-26" value=""> <input type="text"
																	style="width: 25%; float: right"
																	class="form-control form-control-sm timepicker"
																	id="contp1-26-1" name="contp1-26-1" value="">
																</td>
																<td class="text-center">발인일시*</td>
																<td><input type="date"
																	style="width: 70%; float: left"
																	class="form-control form-control-sm" id="contp1-29"
																	name="contp1-29" value=""> <input type="text"
																	style="width: 25%; float: right"
																	class="form-control form-control-sm timepicker"
																	id="contp1-29-1" name="contp1-29-1" value=""></td>
																<td></td>
																<td></td>
															</tr>
															<tr align="center">
																<td
																	style="vertical-align: center; text-align: center; background-color: #CEF6E3">장지</td>
																<td colspan="3"><input type="text"
																	class="form-control form-control-sm" id="contp1-30"
																	name="contp1-30" value="${detailCont.JANGJI}">
																</td>
																<td></td>
																<td></td>
																<td></td>
															</tr>
															<tr align="center">
																<td
																	style="vertical-align: center; text-align: center; background-color: #CEF6E3">비고</td>
																<td colspan="6"><input type="text"
																	class="form-control form-control-sm" id="contp1-37"
																	name="contp1-37" value="${detailCont.REMARK}"></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--//계약기본등록-->
							</div>
							<div class="tab-pane active" id="tab02" role="tabpanel">
								<div class="card-block table-border-style">
									<div class="table-responsive" style="overflow-x: hidden">
										<table class="table table-sm bst02">
												<tbody>
													<tr>
														<th scope="row">계약 호실</th>
													</tr>
												</tbody>
										</table>
										<table class="table table-bordered nowrap" style="width:100 %;"id="SltdroomList">
											<colgroup>
												<col width="10%" />
												<col width="10%" />
												<col width="10%" />
												<col width="10%" />
												<col width="10%" />
												<col width="10%" />
											</colgroup>
											<thead>
												<tr>
													<th class="text-center">계약호실명</th>
													<th class="text-center">일일사용료</th>
													<th class="text-center">시간당사용료</th>
													<th class="text-center">사용일</th>
													<th class="text-center">사용시간</th>
													<th class="text-center">사용요금</th>
													<th style="display: none" class="text-center">선택</th>
												</tr>
											</thead>
											<tbody>
													<c:forEach var="row" items="${listroomemp}">
														<tr>
															<td class="text-center">${row.FROOM_TITLE}(이동호실)<input type="hidden"
																class="FRMID" value="${row.FROOM_ID}"></td>
															<td class="RMday" style="text-align: right;"><fmt:formatNumber
																	value="${row.FROOM_DAY_PRICE}" pattern="#,###" /></td>
															<td class="RMtime" style="text-align: right;"><fmt:formatNumber
																	value="${row.FROOM_TIME_PRICE}" pattern="#,###" /></td>
														<td style="background-color: #F5F6CE"><input
															type="number" class="trRMd sRMd form-control"
															style="text-align: right; border: none; background-color: #F5F6CE"
															min="0" value="${row.DAYS}"></td>
														<td style="background-color: #F5F6CE"><input
															type="number" class="trRMt sRMt form-control"
															style="text-align: right; border: none; background-color: #F5F6CE"
															min="0" max="23" value="${row.TIMES}"></td>
														<td class="sRMcharge" style="text-align: right;"><fmt:formatNumber
																value="${row.RCHARGE}" pattern="#,###" /></td>
														<td style="text-align: center; display: none"><input
															type="checkbox" class="sCHGroom CHKsrm form-control">
															<input type="hidden" class="sAddYn" value="T">
														</td>
														</tr>
													</c:forEach>
												<c:forEach var="row" items="${contpage2}">
													<tr>
														<td class="text-center">${row.FROOM_TITLE}<c:if
																test="${row.ADD_YN eq 'Y'}">(추가호실)</c:if>
															<c:if test="${row.ADD_YN eq 'C'}">(계약호실)</c:if>
															<input type="hidden" class="sFRMID" value="${row.FROOM_ID}"></td>
														<td class="RMday" style="text-align: right;"><fmt:formatNumber
																value="${row.FROOM_DAY_PRICE}" pattern="#,###" /></td>
														<td class="RMtime" style="text-align: right;"><fmt:formatNumber
																value="${row.FROOM_TIME_PRICE}" pattern="#,###" /></td>
														<td style="background-color: #F5F6CE"><input
															type="number" class="sRMd form-control"
															style="text-align: right; border: none; background-color: #F5F6CE"
															min="0" value="${row.DAYS}"></td>
														<td style="background-color: #F5F6CE"><input
															type="number" class="sRMt form-control"
															style="text-align: right; border: none; background-color: #F5F6CE"
															min="0" max="23" value="${row.TIMES}"></td>
														<td class="sRMcharge" style="text-align: right;"><fmt:formatNumber
																value="${row.RCHARGE}" pattern="#,###" /></td>
														<td style="text-align: center; display: none"><input
															type="checkbox" class="CHKsrm form-control" checked><input type="hidden" class="sAddYn" value="${row.ADD_YN}">
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<form name="room2" method="post" onsubmit="return false;">
											<table class="table table-sm bst02">
												<tbody>
													<tr>
														<th scope="row">이동 가능 호실 목록</th>
													</tr>
												</tbody>
											</table>
											<table class="table table-bordered nowrap" id="roomList">
												<colgroup>
													<col width="20%" />
													<col width="20%" />
													<col width="10%" />
													<col width="10%" />
													<col width="10%" />
													<col width="10%" />
													<col width="10%" />
												</colgroup>
												<thead>
													<tr>
														<th class="text-center">선택</th>
														<th class="text-center">호실명</th>
														<th class="text-center">일일사용료</th>
														<th class="text-center">시간당사용료</th>
														<th class="text-center">면적(m<sup>2</sup>)
														</th>
														<th class="text-center">평수</th>
														<th class="text-center">수용인원</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="row" items="${listroomemp}">
														<tr>
															<td><input type="checkbox" class="CHGroom form-control" onClick="oneCheck(this);"></td>
															<td>${row.FROOM_TITLE}<input type="hidden"
																class="FRMID" value="${row.FROOM_ID}"></td>
															<td class="RMday" style="text-align: right;"><fmt:formatNumber
																	value="${row.FROOM_DAY_PRICE}" pattern="#,###" /></td>
															<td class="RMtime" style="text-align: right;"><fmt:formatNumber
																	value="${row.FROOM_TIME_PRICE}" pattern="#,###" /></td>
															<td style="text-align: right;">${row.FROOM_AREA}</td>
															<td style="text-align: right;">${row.FROOM_AREA_KOR}</td>
															<td style="text-align: right;">${row.FROOM_MAX_PERS}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<table class="table table-sm bst02">
												<tbody>
													<tr>
														<th scope="row">호실 이동 선택 사항</th>
													</tr>
												</tbody>
											</table>
											
											<table class="table table-bordered nowrap" id="TRoption">
											<colgroup>
													<col width="10%" />
													<col width="30%" />
													<col width="60%" />
												</colgroup>
												<thead>
											<tr>
												<th class="text-center">선택</th>
												<th class="text-center">항목</th>
												<th class="text-center">설명</th>
											</tr>
											</thead>
											<tbody>
											<tr>
											<td class="text-center align-middle">
											<input type="checkbox" class="form-control" id="tropt01">
											</td>
											<td class="text-left align-middle">
											변경 전 호실의 매점물품사용 
											</td>
											<td class="text-left align-middle">
											* 체크시 : 변경 전 호실의 매점 초도주문을 그대로 가져옵니다.(냉장고 물품 제외) <br>
											         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;변경 후 호실을 기준으로 냉장고 초도주문을 생성합니다. <br>
											         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;변경 후 호실에 있던 매점 용품을 수거하여 보관합니다. <br>
											</td>
											</tr>
											<tr>
											<td class="text-center align-middle">
											<input type="checkbox" class="form-control" id="tropt02" checked>
											</td>
											<td class="text-left align-middle">
											변경 후 호실 기준 매점초도주문  
											</td>
											<td class="text-left align-middle">
											* 체크시 : 변경 후 호실기준으로 매점 초도주문을 생성합니다.(냉장고 물품 포함) <br>
											</td>
											</tr>
											<tr>
											<td class="text-center align-middle">
											<input type="checkbox" class="form-control" id="tropt03">
											</td>
											<td class="text-left align-middle">
											변경 후 호실기준 식당 초도주문 생성 
											</td>
											<td class="text-left align-middle">
											* 체크시&nbsp;&nbsp;:&nbsp;변경 후 호실의 식당 초도주문을 생성합니다.<br>
											* 미체크시&nbsp;:&nbsp;변경 전 호실의 식당 초도주문을 그대로 사용합니다.<br>
											</td>
											</tr>
											</tbody>
											</table>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- Row end -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--계약기본등록-->
<script>
	
function fn_contTrfroomP2() {
		var CONid = $("#contid").val();
		if (CONid != ""){
		var $frmid = $(".FRMID");
		var $Chk2arr = $(".CHKsrm");
		var $A2arr =  $(".sRMd");
		var $B2arr =  $(".sRMt");
		var $C2arr =  $(".sRMcharge");
		var $D2arr =  $(".sAddYn");
		var contp2upd ={};
		contp2upd.CONTRACT_ID = Number(CONid);
		console.log(contp2upd);
		$.ajax({
			url : "${path}/cont/updateP2tr.do",  
			data : contp2upd,  
			method : "POST",  
			dataType : "json"  
		})
		.done(function(data) {
		for (var i=0; i<$A2arr.length; i++){
		if($($Chk2arr[i]).is(":checked")==true){
		var contp2data = {};
		contp2data.CONTRACT_ID = CONid;
		contp2data.FROOM_ID = Number($frmid[i].value.replace(/[\D\s\._\-]+/g, ""));
		contp2data.DAYS = Number($A2arr[i].value.replace(/[\D\s\._\-]+/g, ""));
		contp2data.TIMES = Number($B2arr[i].value.replace(/[\D\s\._\-]+/g, ""));
		contp2data.RCHARGE = Number($C2arr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
		contp2data.ADD_YN = $D2arr[i].value;
		console.log(contp2data);
		$.ajax({
			url : "${path}/cont/insertP2.do",  
			data : contp2data,  
			method : "POST",  
			dataType : "json"  
		});
		}
		}
		});
		}
		else
		{
		}
	}
	
function chkRoomchange(){
		var $infoarr = $(".CHKroom");
		var $sinfoarr = $(".CHKsrm");
		for (var i = 0; i < $infoarr.length; i++) {
			if($($infoarr[i]).is(":checked")==true){
			$($sinfoarr[i]).attr("checked",true);
			$($sinfoarr[i]).parent().parent().show();
			}
			else{
				$($sinfoarr[i]).attr("checked",false);
				$($sinfoarr[i]).parent().parent().hide();
			}
		}
		
	}
	
	var i = 1;
	var str;
	var element = $(".first");
	var firstElement;
	element.each(function() {
		console.dir(i + $(this).text());
		if (str == undefined && firstElement == undefined) {
			str = $(".first")[0].innerText;
			firstElement = $(".first")[0];
			return;
		}
		if (str == $(this).text()) {
			i++;
			console.dir('--> ' + i + $(this).text());
			$(this).remove();
		} else {
			$(firstElement).attr('rowspan', i);
			i = 1;
			str = $(this).text();
			firstElement = $(this);
		}
	});
	// 마지막꺼까지 반영
	$(firstElement).attr('rowspan', i);
	
function calculateR() {
		var $infoarr = $(".CHKsrm");
		var $Aarr = $(".RMday");
		var $Barr = $(".RMtime");
		var $Carr = $(".sRMd");
		var $Darr = $(".sRMt");
		var $Earr = $(".sRMcharge");
		var RMfee = 0;
		for (var i = 0; i < $infoarr.length; i++) {
			var t1 = Number($Aarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t2 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t3 = Number($Carr[i].value.replace(/[\D\s\._\-]+/g, ""));
			var t4 = Number($Darr[i].value.replace(/[\D\s\._\-]+/g, ""));
			RMfee = (t1*t3)+(t2*t4);
		$Earr[i].innerText = numberWithCommas(RMfee);
		 }
	}

function trRoomDT() {
	var $infoarr = $(".trRMd");
	var $Aarr = $(".trRMt");
	for (var i = 0; i < $infoarr.length; i++) {
	 }
}
	
$(".CHGroom, .CHKroom, .sRMd, .sRMt").change(function() {
	chkTrRoomchange();
	chkRoomchange();
	calculateR();
	chkcalR();
	});


$(".trRMd, .trRMt").change(function() {
	trRoomDT();
	calculateR();
	chkcalR();
});

function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}


function chkcalR() {
		var $Barr = $(".RB");
		var chksum = 0;
		for (var i = 0; i < $Barr.length; i++) {
			var b1 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			chksum = chksum + b1;
		}
		$('#Roomgrandtotal').val(numberWithCommas(chksum));
	}

function Setdate(){
		let today = new Date();   
		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1;  // 월
		if(month < 10) month = '0'+month;
		let date = today.getDate();  // 날짜
		if(date < 10) date = '0'+date;
		let hours = today.getHours(); // 시
		if(hours < 10) hours = '0'+hours;
		let minutes = today.getMinutes();  // 분
		let seconds = today.getSeconds();  // 초
		var from = year+'-'+month+'-'+date+'T'+hours+':00';
		let today2 = new Date();
		today2.setDate(today2.getDate() + 3);
		let year2 = today2.getFullYear(); // 년도
		let month2 = today2.getMonth() + 1;  // 월
		if(month2 < 10) month2 = '0'+month2;
		let date2 = today2.getDate();  // 날짜
		if(date2 < 10) date2 = '0'+date2;
		let hours2 = today2.getHours(); // 시
		if(hours2 < 10) hours2 = '0'+hours2;
		let minutes2 = today2.getMinutes();  // 분
		let seconds2 = today2.getSeconds();  // 초
		var to = year2+'-'+month2+'-'+date2+'T'+hours2+':00';
		$('#contp1-02').val(from);
		$('#contp1-03').val(to);				
	}
	
function setComboP1(){
		var p109val = ${detailCont.DPERSON_MW};
		var p113val = ${detailCont.REGION};
		var p116val = ${detailCont.DTYPE};
		var p119val = ${detailCont.CREMATION_YN};
		var p122val = ${detailCont.RELATION};
		var p102val = "${detailCont.START_DATE}";
		var p103val = "${detailCont.END_DATE}";
		var p114val = "${detailCont.DDATE}";
		var p1141val = "${detailCont.DDATE}";
		var p126val = "${detailCont.ANCHI_REALDATE}";
		var p1261val = "${detailCont.ANCHI_REALDATE}";
		var p127val = "${detailCont.ANCHI_DATE}";
		var p1271val = "${detailCont.ANCHI_DATE}";
		var p128val = "${detailCont.COFFIN_DATE}";
		var p1281val = "${detailCont.COFFIN_DATE}";
		var p129val = "${detailCont.DEPART_DATE}";
		var p1291val = "${detailCont.DEPART_DATE}";
		var p101val =  "${detailCont.FROOM_ID}";
		p102val = p102val.substr(0,10);
		p103val = p103val.substr(0,10);
		p114val = p114val.substr(0,10);
		p1141val = p1141val.substr(11,17);
		p126val = p126val.substr(0,10);
		p1261val = p1261val.substr(11,17);
		p127val = p127val.substr(0,10);
		p1271val = p1271val.substr(11,17);
		p128val = p128val.substr(0,10);
		p1281val = p1281val.substr(11,17);
		p129val = p129val.substr(0,10);
		p1291val = p1291val.substr(11,17);
		$("#contp1-01").val(p101val).prop("selected",true);
		$("#contp1-09").val(p109val).prop("selected",true);
		$("#contp1-13").val(p113val).prop("selected",true);
		$("#contp1-16").val(p116val).prop("selected",true);
		$("#contp1-19").val(p119val).prop("selected",true);
		$("#contp1-22").val(p122val).prop("selected",true);
		$("#contp1-02").val(p102val);
		$("#contp1-03").val(p103val);
		$("#contp1-14").val(p114val);
		$("#contp1-14-1").val(p1141val);
		$("#contp1-26").val(p126val);
		$("#contp1-26-1").val(p1261val);
		$("#contp1-27").val(p127val);
		$("#contp1-27-1").val(p1271val);
		$("#contp1-28").val(p128val);
		$("#contp1-28-1").val(p1281val);
		$("#contp1-29").val(p129val);
		$("#contp1-29-1").val(p1291val);
	}
	
	$("#contp1-26, #contp1-29").change(function(){
		$("#contp1-02").val($("#contp1-26").val());
		$("#contp1-03").val($("#contp1-29").val());
	})


$(document).ready(function(){
		$('.timepicker').timepicker({
		    timeFormat: 'HH:mm',
		    interval: 10,
		    minTime: '10',
		    maxTime: '23:59',
		    defaultTime: '09',
		    startTime: '10:00',
		    dynamic: false,
		    dropdown: false,
		    scrollbar: false
		});
		setComboP1();
		chkRoomchange();
		chkTrRoomchange();
	});
	
	$(".Eday, .Etime").change(function() {
		chkcalE();
	});
function chkcalE() {
		var $Aarr = $(".EA");
		var $Barr = $(".EB");
		var $Carr = $(".Eday");
		var $Darr = $(".Etime");
		var $Earr = $(".Esum");
		for (var i = 0; i < $Earr.length; i++) {
			var chksum = 0;	
			var b1 = Number($Aarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var b2 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var c1 = Number($Carr[i].value.replace(/[\D\s\._\-]+/g, ""));
			var c2 = Number($Darr[i].value.replace(/[\D\s\._\-]+/g, ""));
			chksum = (b1*c1)+(b2*c2);
			$Earr[i].innerText = numberWithCommas(chksum);
		}
	}
	
function oneCheck(chk){
    var obj = document.getElementsByClassName("CHGroom");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}

function chkTrRoomchange(){
	var $infoarr = $(".CHGroom");
	var $sinfoarr = $(".sCHGroom");
	for (var i = 0; i < $infoarr.length; i++) {
		if($($infoarr[i]).is(":checked")==true){
		$($sinfoarr[i]).attr("checked",true);
		$($sinfoarr[i]).parent().parent().show();
		}
		else{
			$($sinfoarr[i]).attr("checked",false);
			$($sinfoarr[i]).parent().parent().hide();
		}
	}
}

function fn_FroomTR(){
	if (!confirm("선택 사항대로 호실을 이동하시겠습니까?")){
		
	} else {
		fn_contTrfroomP2();	
	}
}

</script>

