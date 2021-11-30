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
				<div class="page-header-title text-center">
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
					<div style="margin-left: 12%;" class="col-lg-9 col-xl-9">
						<div class="table-responsive">
							<table class="table  table-bordered nowrap">
								<tr>
									<td style="text-align: right;">
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
													<table class="table table-sm bst02" id="basicTable">
														<colgroup>
															<col width="25%" />
															<col width="25%" />
															<col width="25%" />
															<col width="25%" />
														</colgroup>
														<thead>
															<tr>
																<th class="text-center"
																	style="background-color: #CEF6E3;" colspan="2">이전할
																	호실</th>
																<th class="text-center"
																	style="background-color: #CEF6E3;" colspan="2">이전후
																	호실</th>
															</tr>
														</thead>
														<tbody>
															<tr align="center">
																<th
																	style="vertical-align: center; text-align: center; background-color: #CEF6E3">고인명</th>
																<td><input type="text"
																	class="form-control text-right" id="goinName" value=""></td>
																<th
																	style="vertical-align: center; text-align: center; background-color: #CEF6E3">상주명</th>
																<td><input type="text"
																	class="form-control text-right" id="sangjuName" value=""></td>
															</tr>

															<tr>
																<th
																	style="vertical-align: center; text-align: center; background-color: #CEF6E3"
																	rowspan="1">계약호실</th>
																<td><select class="form-control" id="froomtrbf">
																		<c:forEach var="listcont" items="${listcont}">
																			<option value="${listcont.CONTRACT_ID}/${listcont.FROOM_ID}">${listcont.FROOM_TITLE}</option>
																		</c:forEach>
																</select>
																<select style="display:none" class="form-control" id="froomtrbfdp">
																		<c:forEach var="listcont" items="${listcont}">
																			<option value="${listcont.FROOM_DAY_PRICE}">${listcont.FROOM_DAY_PRICE}</option>
																		</c:forEach>
																</select>
																<select style="display:none" class="form-control" id="dperson">
																		<c:forEach var="listcont" items="${listcont}">
																			<option value="${listcont.DPERSON_NAME}">${listcont.DPERSON_NAME}</option>
																		</c:forEach>
																</select>
																</td>
																<th
																	style="vertical-align: center; text-align: center; background-color: #CEF6E3"
																	rowspan="1">이전호실</th>
																<td><select class="form-control" id="froomtraf">
																		<c:forEach var="listemp" items="${listroomemp}">
																			<option value="${listemp.FROOM_ID}">${listemp.FROOM_TITLE}</option>
																		</c:forEach>
																</select>
																<select style="display:none" class="form-control" id="froomtrafdp">
																		<c:forEach var="listemp" items="${listroomemp}">
																			<option value="${listemp.FROOM_DAY_PRICE}">${listemp.FROOM_DAY_PRICE}</option>
																		</c:forEach>
																</select>
																<select style="display:none" class="form-control" id="dsangju">
																		<c:forEach var="listcont" items="${listcont}">
																			<option value="${listcont.SANGJU_NAME}">${listcont.SANGJU_NAME}</option>
																		</c:forEach>
																</select>
																</td>
															</tr>
															<tr>
																<th
																	style="vertical-align: center; text-align: center; background-color: #CEF6E3">사용일</th>
																<td class="text-center"><input type="number"
																	class="form-control text-right" id="bfday" value="0" min="0"></td>
																<th
																	style="vertical-align: center; text-align: center; background-color: #CEF6E3">사용일</th>
																<td class="text-center"><input type="number"
																	class="form-control text-right" id="afday" value="0" min="0"></td>
															</tr>
															<tr align="center">
																<th
																	style="vertical-align: center; text-align: center; background-color: #CEF6E3">부가사용료
																	부과일</th>
																<td><input type="number"
																	class="form-control text-right" id="bfaddday" value="0" min="0"></td>
																<th
																	style="vertical-align: center; text-align: center; background-color: #CEF6E3">부가사용료
																	부과일</th>
																<td><input type="number"
																	class="form-control text-right" id="afaddday" value="0" min="0"></td>
															</tr>
															<tr align="center">
																<th style="vertical-align: center; text-align: center; background-color: #CEF6E3">부가사용료
																	</th>
																<td><input type="text"
																	class="form-control text-right" id="bfaddfee" value="0" readonly></td>
																<th	style="vertical-align: center; text-align: center; background-color: #CEF6E3">부가사용료
																	</th>
																<td><input type="text"
																	class="form-control text-right" id="afaddfee" value="0" readonly></td>
															</tr>
															
															<tr align="center">
																<th
																	style="vertical-align: center; text-align: center; background-color: #CEF6E3">분향실
																	사용료</th>
																<td><input type="text"
																	class="form-control text-right" id="bfrmcharge" value="0" readonly></td>
																<th
																	style="vertical-align: center; text-align: center; background-color: #CEF6E3">분향실 사용료</th>
																<td><input type="text"
																	class="form-control text-right" id="afrmcharge" value="0" readonly></td>
															</tr>
															<tr style="display:none;">
															<td><input type="text" id="bfotexpay" value=""></td>
															<td><input type="text" id="bftmexpay" value=""></td>
															<td><input type="text" id="afotexpay" value=""></td>
															<td><input type="text" id="aftmexpay" value=""></td>
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
										<form name="room2" method="post" onsubmit="return false;">
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
														<td class="text-center align-middle"><input
															type="checkbox" class="form-control" id="tropt01">
														</td>
														<td class="text-left align-middle">변경 전 호실의 매점물품사용</td>
														<td class="text-left align-middle">* 체크시 : 변경 전 호실의
															매점 초도주문을 그대로 가져옵니다.(냉장고 물품 제외) <br>
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;변경
															후 호실을 기준으로 냉장고 초도주문을 생성합니다. <br>
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;변경
															후 호실에 있던 매점 용품을 수거하여 보관합니다. <br>
														</td>
													</tr>
													<tr>
														<td class="text-center align-middle"><input
															type="checkbox" class="form-control" id="tropt02" checked>
														</td>
														<td class="text-left align-middle">변경 후 호실 기준 매점초도주문
														</td>
														<td class="text-left align-middle">* 체크시 : 변경 후
															호실기준으로 매점 초도주문을 생성합니다.(냉장고 물품 포함) <br>
														</td>
													</tr>
													<tr>
														<td class="text-center align-middle"><input
															type="checkbox" class="form-control" id="tropt03">
														</td>
														<td class="text-left align-middle">변경 후 호실기준 식당 초도주문
															생성</td>
														<td class="text-left align-middle">*
															체크시&nbsp;&nbsp;:&nbsp;변경 후 호실의 식당 초도주문을 생성합니다.<br> *
															미체크시&nbsp;:&nbsp;변경 전 호실의 식당 초도주문을 그대로 사용합니다.<br>
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
		var contid = $("#froomtrbf").val().split('/');
		var CONid = contid[0];
		var bfrmid = contid[1];
		if (CONid != "") {
			var frmid = $("#froomtraf").val();
			var contp2upd = {};
			contp2upd.CONTRACT_ID = Number(CONid);
			contp2upd.AFFROOM_ID = Number(frmid);
			contp2upd.BFFROOM_ID = Number(bfrmid);
			contp2upd.BFDAYS = $("#bfday").val();
			contp2upd.BFCHARGE = $("#bfrmcharge").val().replace(/[\D\s\._\-]+/g, "");
			contp2upd.AFDAYS = $("#afday").val();
			contp2upd.AFCHARGE = $("#afrmcharge").val().replace(/[\D\s\._\-]+/g, "");
			console.log(contp2upd);
			$.ajax({
				url : "${path}/cont/updateP2tr.do",
				data : contp2upd,
				method : "POST",
				dataType : "json"
			}).done(function() {
				alert("분향실 이동 완료");
			});
		} else {
			alert("이전할 계약 호실을 선택해 주십시오");
		}
	}

	function chkRoomchange() {
		var $infoarr = $(".CHKroom");
		var $sinfoarr = $(".CHKsrm");
		for (var i = 0; i < $infoarr.length; i++) {
			if ($($infoarr[i]).is(":checked") == true) {
				$($sinfoarr[i]).attr("checked", true);
				$($sinfoarr[i]).parent().parent().show();
			} else {
				$($sinfoarr[i]).attr("checked", false);
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
			RMfee = (t1 * t3) + (t2 * t4);
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
	
	$("#froomtraf, #afday, #afaddday").change(function(){
		calafRoomDayprice();
		getSetlaf();
	});
	
	$("#froomtrbf, #bfday, #bfaddday").change(function(){
		setDSname();
		getSetlbf();
		calbfRoomDayprice();
	});
	
	function calafRoomDayprice(){
		var selindex = $("#froomtraf option").index( $("#froomtraf option:selected") );
		$('#froomtrafdp option').removeAttr('selected');
		$('#froomtrafdp option:eq(' + selindex + ')').attr('selected', 'selected');
		var afrmchg = 0;
		var afexchg = 0;
		var dp = $("#froomtrafdp").val();
		var tp = $("#aftmexpay").val();
		var afday = $("#afday").val();
		var afexc = $("#afaddday").val();
		if (afexc > 0){
			var ep = $("#afotexpay").val();	
		} else {
			var ep = 0;	
		}
		afexchg = Number(tp) * Number(afexc) + Number(ep);
		afrmchg = dp * afday;
		$("#afrmcharge").val(numberWithCommas(afrmchg));
		$("#afaddfee").val(numberWithCommas(afexchg));
	}
	
	function calbfRoomDayprice(){
		var selindex = $("#froomtrbf option").index( $("#froomtrbf option:selected") );
		$('#froomtrbfdp option').removeAttr('selected');
		$('#froomtrbfdp option:eq(' + selindex + ')').attr('selected', 'selected');
		var bfrmchg = 0;
		var bfexchg = 0;

		var tp = $("#bftmexpay").val();
		var dp = $("#froomtrbfdp").val();
		var bfexc = $("#bfaddday").val();
		if (bfexc > 0){
			var ep = $("#bfotexpay").val();	
		}else{
			var ep = 0;
		}
		var bfday = $("#bfday").val();
		bfrmchg = dp * bfday;
		bfexchg = Number(tp) * Number(bfexc) + Number(ep);
		$("#bfrmcharge").val(numberWithCommas(bfrmchg));
		$("#bfaddfee").val(numberWithCommas(bfexchg));
	}
	
	function setDSname() {
		var selindex = $("#froomtrbf option").index( $("#froomtrbf option:selected") );
		$('#dperson option').removeAttr('selected');
		$('#dperson option:eq(' + selindex + ')').attr('selected', 'selected');
		$('#dsangju option').removeAttr('selected');
		$('#dsangju option:eq(' + selindex + ')').attr('selected', 'selected');
		var dpname = $("#dperson").val();
		var sjname = $("#dsangju").val();
		$("#goinName").val(dpname);		
		$("#sangjuName").val(sjname);
	}

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

	function Setdate() {
		let today = new Date();
		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1; // 월
		if (month < 10)
			month = '0' + month;
		let date = today.getDate(); // 날짜
		if (date < 10)
			date = '0' + date;
		let hours = today.getHours(); // 시
		if (hours < 10)
			hours = '0' + hours;
		let minutes = today.getMinutes(); // 분
		let seconds = today.getSeconds(); // 초
		var from = year + '-' + month + '-' + date + 'T' + hours + ':00';
		let today2 = new Date();
		today2.setDate(today2.getDate() + 3);
		let year2 = today2.getFullYear(); // 년도
		let month2 = today2.getMonth() + 1; // 월
		if (month2 < 10)
			month2 = '0' + month2;
		let date2 = today2.getDate(); // 날짜
		if (date2 < 10)
			date2 = '0' + date2;
		let hours2 = today2.getHours(); // 시
		if (hours2 < 10)
			hours2 = '0' + hours2;
		let minutes2 = today2.getMinutes(); // 분
		let seconds2 = today2.getSeconds(); // 초
		var to = year2 + '-' + month2 + '-' + date2 + 'T' + hours2 + ':00';
		$('#contp1-02').val(from);
		$('#contp1-03').val(to);
	}

	$(document).ready(function() {
		$('.timepicker').timepicker({
			timeFormat : 'HH:mm',
			interval : 10,
			minTime : '10',
			maxTime : '23:59',
			defaultTime : '09',
			startTime : '10:00',
			dynamic : false,
			dropdown : false,
			scrollbar : false
		});
		setDSname();
		getSetlbf();
		getSetlaf();
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
			chksum = (b1 * c1) + (b2 * c2);
			$Earr[i].innerText = numberWithCommas(chksum);
		}
	}

	function oneCheck(chk) {
		var obj = document.getElementsByClassName("CHGroom");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != chk) {
				obj[i].checked = false;
			}
		}
	}

	function fn_FroomTR() {
		if (!confirm("선택 사항대로 호실을 이동하시겠습니까?")) {

		} else {
			fn_contTrfroomP2();
		}
	}
	
	function getSetlbf(){
		var frid = $("#froomtrbf option:selected").val().split('/');
		var froomid = frid[1];
		$.ajax({
			url : "${path}/setup/listfrsetl/" + froomid,
			method : "POST",
			dataType : "json"
		}).done(function(data) {
			var sume = 0;
			var sumt = 0;
			for (var i=0; i<data.length; i++){
				if (data[i].PAY_YN == 'Y'){
					if (data[i].SETL_TYPE == 'E'){
						
						sume = Number(sume) + Number(data[i].SETL_PRICE);
					} else if (data[i].SETL_TYPE == 'T'){
						sumt = Number(sumt) + Number(data[i].SETL_PRICE);
					}	
				}
			}
			$("#bfotexpay").val(sume);
			$("#bftmexpay").val(sumt);
		}).fail(function(){
			alert("로드실패");
		});
	}
	
	function getSetlaf(){
		var frid = $("#froomtraf option:selected").val();
		var froomid = frid;
		$.ajax({
			url : "${path}/setup/listfrsetl/" + froomid,
			method : "POST",
			dataType : "json"
		}).done(function(data) {
			var sume = 0;
			var sumt = 0;
			for (var i=0; i<data.length; i++){
				if (data[i].PAY_YN == 'Y'){
					if (data[i].SETL_TYPE == 'E'){
						
						sume = Number(sume) + Number(data[i].SETL_PRICE);
					} else if (data[i].SETL_TYPE == 'T'){
						sumt = Number(sumt) + Number(data[i].SETL_PRICE);
					}	
				}
			}
			$("#afotexpay").val(sume);
			$("#aftmexpay").val(sumt);
		}).fail(function(){
			alert("로드실패");
		});
	}
</script>

