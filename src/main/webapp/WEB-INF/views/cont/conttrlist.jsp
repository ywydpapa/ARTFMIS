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
									<button class="btn btn-md btn-primary" onClick="fn_contUpdate()">호실이동</button>
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
												<c:forEach var="row" items="${contpage2}">
													<tr>
														<td class="text-center">${row.FROOM_TITLE}<c:if
																test="${row.ADD_YN eq 'Y'}">(추가호실)</c:if>
															<c:if test="${not row.ADD_YN eq 'Y'}">(계약호실)</c:if><input
															type="hidden" class="sFRMID" value="${row.FROOM_ID}"></td>
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
															type="checkbox" class="CHKsrm form-control"
															<c:if test="${row.CHKED eq 'Y'}">checked</c:if>></td>
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
											<input type="checkbox" class="form-control" id="tropt02">
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
											변경 전 호실에서 사용한 냉장고 수량 처리 
											</td>
											<td class="text-left align-middle">
											* 반드시 반품처리를 먼저 하여야 합니다. <br>
											* 체크시 : 변경 전 호실의 냉장고 사용수량을 변경 후 호실의 주문수량에 더함
											</td>
											</tr>
											<tr>
											<td class="text-center align-middle">
											<input type="checkbox" class="form-control" id="tropt04">
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
function delRoom(obj,roomid,drid){
		var addrData = {};
		addrData.CONT_FROOM_ID = roomid;
		$.ajax({
			url : "${path}/cont/delRoom.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
			data : addrData, // HTTP 요청과 함께 서버로 보낼 데이터 
			method : "POST", // HTTP 요청 메소드(GET, POST 등) 
			dataType : "json" // 서버에서 보내줄 데이터의 타입 
		}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
		.done(function(data) {
			if (data.code == 10001) {
				var str = $(obj).parent().parent();
				str.remove();
				var srm = drid;
				var $Aarr = $(".FRMID");
				var $Barr = $(".CHKroom");
				for (var i = 0; i < $Aarr.length; i++) {
					if ($Aarr[i].value == srm){
						$($Barr[i]).attr("checked",false);
						$($Barr[i]).parent().parent().hide();	
					}
				}
				var $Carr = $(".sFRMID");
				var $Darr = $(".CHKsrm");
				for (var i = 0; i < $Carr.length; i++) {
					if ($Carr[i].value == srm){
						$($Darr[i]).attr("checked",false);
						$($Darr[i]).parent().parent().hide();	
					}
				}
			} else {
				alert("저장 실패");
			}
		})
		 // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
		.fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
	}
	
function addNewRoom(){
		var addrData = {};
		var CONid = $("#contid").val();
		addrData.CONTRACT_ID = CONid;
		addrData.FROOM_ID = $('#add1').val();
		addrData.DAYS = $('#add2').val();
		addrData.TIMES = $('#add3').val();
		addrData.CLEAN_CHARGE_DAYS = $('#add4').val();
		addrData.STORE_REFG_YN = $('#add5').val();
		addrData.STORE_ITEM_YN = $('#add6').val();
		console.log(addrData);
		$.ajax({
			url : "${path}/cont/addRoom.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
			data : addrData, // HTTP 요청과 함께 서버로 보낼 데이터 
			method : "POST", // HTTP 요청 메소드(GET, POST 등) 
			dataType : "json" // 서버에서 보내줄 데이터의 타입 
		}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
		.done(function(data) {
			if (data.code == 10001) {
				var innerHtml = "";
				innerHtml += '<tr style="text-align:center" name="addroomlist"> <td><input type="checkbox" class="chkAddroom form-control"></td>';
				innerHtml += '<td style="text-align:center">'+$("#add1 option:checked").text()+' </td>';
				innerHtml += '<td style="text-align:right">'+$("#add2").val()+'</td>';
				innerHtml += '<td style="text-align:right">'+$("#add3").val()+'</td>';
				innerHtml += '<td style="text-align:right">'+$("#add4").val()+'</td>';
				innerHtml += '<td style="text-align:center">'+$("#add5 option:checked").text()+'</td>';
				innerHtml += '<td style="text-align:center">'+$("#add6 option:checked").text()+'</td>';
				innerHtml += '<td style="text-align:center">'+$("#add8 option:checked").text()+'</td>';
				innerHtml += '<td style="text-align:center"><button class="btn btn-secondary" onclick="delRoom(this,'+data.froomid+','+ $('#add1').val() +')">삭제</button></td>';
				innerHtml += "</tr>";
				$("#addroomTable > tbody > tr[name=addroomlist]:last").after(innerHtml);
				$("#add2").val("0");
				$("#add3").val("0");
				$("#add4").val("0");
				var srm = $('#add1 option:selected').text();
				$("#add1 option:checked").hide();
				$("#add1").val("");
				var $Aarr = $(".CHKroom");
				var $Barr = $(".CHKroom").closest('tr').find('td:first');
				for (var i = 0; i < $Barr.length; i++) {
					if ($Barr[i].innerText == srm){
						$Aarr[i].checked = true;
						$($Barr[i]).parent().show();
					}
				}

				var $Carr = $(".CHKsrm");
				var $Darr = $(".CHKsrm").closest('tr').find('td:first');
				for (var i = 0; i < $Darr.length; i++) {
					if ($Darr[i].innerText == srm){
						$Carr[i].checked = true;
						$($Darr[i]).parent().show();
					}
				}
				}else {
				alert("저장 실패");
				}
		})
		 // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
		.fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
	}

function fn_contUpdate(){
		fn_contUpdateP1();
		fn_contInsertP2();
	}

function fn_contUpdateP1() {
		var contData = {};
		var chkr = $('#rmchk').val();
		if (chkr != "OK")
			{
			alert ("호실사용에 문제가 있습니다.");
			return;
			}
		var froomid = $('#frid').val();
		var date = new Date();
	    var year = date.getFullYear();
	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);
	    var insDATE = year + "-" + month + "-" + day;
		var CONid = $("#contid").val();
		contData.CONTRACT_ID		= CONid;
		contData.START_DATE			= $('#contp1-02').val();
		contData.END_DATE			= $('#contp1-03').val();
		contData.SANGJO				= $('#contp1-04').val();
		contData.DPERSON_NAME		= $('#contp1-07').val();
		contData.DPERSON_MW			= $('#contp1-09').val();
		contData.DPERSON_AGE		= $('#contp1-15').val();
		contData.DPERSON_JMNO		= $('#contp1-08').val();
		contData.DPERSON_ADDR1		= $('#contp1-10').val();
		contData.DPERSON_ADDR2		= $('#contp1-12').val();
		contData.DPERSON_ORI_NAME	= $('#contp1-11').val();
		contData.REGION				= $('#contp1-13').val();
		contData.DDATE				= $('#contp1-14').val()+" "+$('#contp1-14-1').val();
		contData.DPLACE				= $('#contp1-17').val();
		contData.DTYPE				= $('#contp1-16').val();
		contData.CREMATION_YN		= $('#contp1-19').val();
		contData.SANGJU_NAME		= $('#contp1-20').val();
		contData.SANGJU_JMNO		= $('#contp1-21').val();
		contData.SANGJU_POSTNO		= $('#contp1-01').val();
		contData.SANGJU_ADDR1		= $('#contp1-23').val();
		contData.SANGJU_ADDR2		= $('#contp1-25').val();
		contData.RELATION			= $('#contp1-22').val();
		contData.SANGJU_TEL			= $('#contp1-24').val();
		contData.ANCHI_REALDATE		= $('#contp1-26').val()+" "+$('#contp1-26-1').val();
		contData.ANCHI_DATE			= $('#contp1-27').val()+" "+$('#contp1-27-1').val();
		contData.COFFIN_DATE		= $('#contp1-28').val()+" "+$('#contp1-28-1').val();
		contData.DEPART_DATE		= $('#contp1-29').val()+" "+$('#contp1-29-1').val();
		contData.JANGJI				= $('#contp1-30').val();
		contData.REMARK				= $('#contp1-37').val();
		contData.FROOM_ID			= froomid;
		if(contData.DPERSON_NAME==""){
			alert("고인의 성함을 입력해 주세요. 필수 항목입니다.");
			$("#contp1-07").focus();
			return;
		}
		else if(contData.SANGJU_NAME==""){
			alert("상주 성함을 입력해 주세요. 필수 항목입니다.");
			$("#contp1-20").focus();
			return;
		}
		console.dir(contData);
		$.ajax({
			url : "${path}/cont/updateP1.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
			data : contData, // HTTP 요청과 함께 서버로 보낼 데이터 
			method : "POST", // HTTP 요청 메소드(GET, POST 등) 
			dataType : "json" // 서버에서 보내줄 데이터의 타입 
		}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
		.done(function(data) {
			if (data.code == 10001) {
				$("#contid").val(data.contid);
			} else {
				alert("저장 실패");
			}
		}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
		.fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
	}
	
function fn_contInsertP2() {
		var CONid = $("#contid").val();
		if (CONid != ""){
		var froomid = $('#frid').val();
		var $Chk2arr = $(".CHKsrm");
		var $A2arr =  $(".sRMd");
		var $B2arr =  $(".sRMt");
		var $C2arr =  $(".sRMcharge");
		var contp2upd ={};
		contp2upd.CONTRACT_ID = Number(CONid);
		console.log(contp2upd);
		$.ajax({
			url : "${path}/cont/updateP2.do",  
			data : contp2upd,  
			method : "POST",  
			dataType : "json"  
		})
		.done(function(data) {
		for (var i=0; i<$A2arr.length; i++){
		if($($Chk2arr[i]).is(":checked")==true){
		var contp2data = {};
		contp2data.CONTRACT_ID = CONid;
		contp2data.FROOM_ID = froomid;
		contp2data.DAYS = Number($A2arr[i].value.replace(/[\D\s\._\-]+/g, ""))
		contp2data.TIMES = Number($B2arr[i].value.replace(/[\D\s\._\-]+/g, ""))
		contp2data.RCHARGE = Number($C2arr[i].innerText.replace(/[\D\s\._\-]+/g, ""))
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

	
	$(".CHKroom, .sRMd , .sRMt").change(function() {
		chkRoomchange();
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

function fn_addyujok(){
			var CONid = $("#contid").val();
			if (CONid != ""){
			var froomid = $('#frid').val();
			var contp1addyujok ={};
			contp1addyujok.CONTRACT_ID = Number(CONid);
			contp1addyujok.FROOM_ID = froomid;
			contp1addyujok.RELATION_CODE = $("#contp1-31").val();
			contp1addyujok.RELATION_TITLE = $("#contp1-31 option:checked").text();
			contp1addyujok.SANGJU_NAMEs = $("#contp1-32").val();
			if(contp1addyujok.RELATION_CODE == ""){
				alert("유족 관계를 선택해 주세요.");
				$("#contp1-31").focus();
				return;
			}
			else if(contp1addyujok.SANGJU_NAMEs == ""){
				alert("유족 성명을 입력해 주세요.");
				$("#contp1-32").focus();
				return;
			}
			console.log(contp1addyujok);
			$.ajax({
				url : "${path}/cont/insertYujok.do",  
				data : contp1addyujok,  
				method : "POST",  
				dataType : "json"  
			})
			.done(function(data) {
			var innerHtml = "";
			innerHtml += '<tr id=sj'+data.yjid+'> <td></td>';
			innerHtml += '<td>'+$("#contp1-31 option:checked").text()+' </td>';
			innerHtml += '<td>'+$("#contp1-32").val()+'</td>';
			innerHtml += '<td><button onclick="fn_delyujok('+data.yjid+')">삭제</button></td>';
			innerHtml += "</tr>";
			$("#basicTable > tbody > tr[name=yujoklist]:last").after(innerHtml);
			$("#contp1-31").val("");
			$("#contp1-32").val("");
			});
			}
			else
				{
				alert("계약기본사항을 먼저 저장해 주세요!!");
				}
		}	

	
function fn_delyujok(sangjuid){
		var CONid = $("#contid").val();
		if (CONid != ""){
		var froomid = $('#frid').val();
		var contp1addyujok ={};
		contp1addyujok.CONT_SANGJU_ID = sangjuid; 
		console.log(contp1addyujok);
		$.ajax({
			url : "${path}/cont/updateYujok.do",  
			data : contp1addyujok,  
			method : "POST",  
			dataType : "json"  
		})
		.done(function(data) {
		var trHtml = $("#sj"+sangjuid).remove();
		});
		}
		else
			{
			alert("계약기본사항을 먼저 저장해 주세요!!");
			}
	}	

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
</script>

