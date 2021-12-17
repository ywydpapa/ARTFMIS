<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table class="table table-sm bst02">
							<tbody>
								<tr>
									<th scope="row">
										<div>
											<div style="float:left; margin-top:10px;">기본사항</div>
											<div class="btn_wr" style="float:right;">
												<button class="btn btn-md btn-success" id="modalBtn"><i class="icofont icofont-search"></i>불러오기</button>
												<div class="modal" id="consultModal" tabindex="-1"
													role="dialog">
													<div class="modal-dialog modal-lg" role="document">
														<div class="modal-content modal-lg">
															<div class="modal-header">
																<h4 class="modal-title">상담 조회</h4>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<div style="width:100%;">
																	<div>
																		<h6>상담일자</h6>
																	</div>
																	<div style="float:left;">
																		<input type="date" class="form-control" id="searchDateFrom"> 
																	</div>
																	<div style="float:left;">&ensp;~&ensp;</div>
																	<div style="float:left;">
																		<input type="date" class="form-control" id="searchDateEnd">
																	</div>
																</div>
																<div style="width:100%;clear:both; margin-top:60px; margin-bottom: 60px;">
																	<div style="float:left; margin-right:20px;">
																		<h6>환자명</h6>
																		<input type="text" class="form-control" id="searchPatiName">
																	</div>&ensp;&ensp;&ensp;
																	<div style="float:left; margin-right:20px;">
																		<h6>보호자명</h6>
																		<input type="text" class="form-control" id="searchBfamilyName">
																	</div>
																	<div style="float:left; margin-top:27px;">
																		<button type="button" class="btn btn-primary" id="searchBtn">검색</button>
																		<button type="button" class="btn btn-secondary" id="resetBtn">초기화</button>
																	</div>
																</div>
																<table class="table table-hover" id="consultModalTable" style="width:100%; margin-top:20px;">
																	<thead>
																		<tr>
																			<th>상담일자</th>
																			<th>상담호실</th>
																			<th>환자명</th>
																			<th>보호자명</th>
																		</tr>
																	</thead>
																	<tbody></tbody>
																</table>
															</div>
															<div class="modal-footer">
																<button type="button" id="cancelBtn" class="btn btn-default waves-effect" data-dismiss="modal">닫기</button>
															</div>
														</div>
													</div>
												</div>
												<button class="btn btn-md btn-success" value="추가" onClick="fn_NewConsult()">새상담</button>
												<button class="btn btn-md btn-primary" onClick="fn_eventAllClick()">저장</button>
											</div>
										</div>
									</th>
								</tr>
							</tbody>
						</table>
						<table class="table table-sm bst02">
						<colgroup>
							<col width="15%" />
							<col width="35%" />
							<col width="15%" />
							<col width="35%" />
						</colgroup>
							<tbody>
								<tr>
									<td style="vertical-align:middle;text-align:center">상담일자</td>
									<td style="text-align:center"><input type="date" class="form-control" id="consultDate"value="${cst.CONSULT_DATE}"><input type="hidden" value="${cst.CONSULT_ID}" id="consultId"/></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="vertical-align:middle;text-align:center">환자성명</td>
									<td style="text-align:center"><input type="text" class="form-control" id="patiName" value="${cst.PATI_NAME}"></td>
									<td style="vertical-align:middle;text-align:center">병원</td>
									<td style="text-align:center"><input type="text" class="form-control" id="hospital" value="${cst.HOSPITAL}"></td>
								</tr>
								<tr>
									<td style="vertical-align:middle;text-align:center">보호자성명</td>
									<td style="text-align:center"><input type="text" class="form-control" id="bfamilyName" value="${cst.BFAMILY_NAME}"></td>
									<td style="vertical-align:middle;text-align:center">연락처</td>
									<td style="text-align:center"><input type="text" class="form-control phone" id="telNo" value="${cst.TEL_NO}" maxlength="13"></td>
								</tr>
								<tr>
									<td style="vertical-align:middle;text-align:center">종교</td>
									<td style="text-align:center">
										<select class="form-control" id="religion">
											<c:forEach var="regc" items="${regioncode}">
												<option value="${regc.BCD_ID}"<c:if test="${cst.RELIGION eq regc.BCD_ID}">selected</c:if>>${regc.BCD_TITLE}</option>
											</c:forEach>
										</select>
									</td>
									<td style="vertical-align:middle;text-align:center">화장/매장 구분</td>
									<td>
										<select class="form-control" id="buriYn">
											<option value="1" <c:if test="${cst.BURI_YN eq '1'}">selected</c:if>>화장</option>
											<option value="2" <c:if test="${cst.BURI_YN eq '2'}">selected</c:if>>매장</option>
											<option value="9" <c:if test="${cst.BURI_YN eq '9'}">selected</c:if>>기타</option>
										</select>
									</td>
								</tr>
								<tr>
									<td style="vertical-align:middle;text-align:center">메모</td>
									<td colspan="3">
										<textarea id="remark" rows="4" class="form-control">${cst.REMARK}</textarea>
									</td>
								</tr>
								<tr>
									<td style="vertical-align:middle;text-align:center">상담호실</td>
									<td colspan="3">
										<table class="table  table-bordered nowrap" id="SltdroomList">
											<colgroup>
												<col width="10%" />
												<col width="10%" />
												<col width="10%" />
												<col width="12%" />
												<col width="8%" />
												<col width="10%" />
												<col width="10%" />
											</colgroup>
											<thead>
												<tr>
													<th style="vertical-align:middle;text-align:center">호실종류</th>
													<th style="vertical-align:middle;text-align:center">호실명</th>
													<th style="vertical-align:middle;text-align:center">일일사용료</th>
													<th style="vertical-align:middle;text-align:center">시간당사용료</th>
													<th style="vertical-align:middle;text-align:center">사용일</th>
													<th style="vertical-align:middle;text-align:center">사용시간</th>
													<th style="vertical-align:middle;text-align:center">사용요금</th>
													<th style="display:none">선택</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach var="row" items="${listFroom}">
												<tr style="display:none;">
													<td style="vertical-align:middle;text-align:center">분향실</td>
													<td style="vertical-align:middle;text-align:center">${row.FROOM_TITLE}<input type="hidden" class = "FRMID" value = "${row.FROOM_ID}"></td>
													<td class = "qMday CS_qMday" style="vertical-align:middle;text-align: right;"><fmt:formatNumber value="${row.FROOM_DAY_PRICE}" pattern="#,###" /></td>
													<td class = "qMtime CS_qMtime" style="vertical-align:middle;text-align: right;"><fmt:formatNumber value="${row.FROOM_TIME_PRICE}" pattern="#,###" /></td>
													<c:choose>
														<c:when test="${empty consultGet}">
															<td style="text-align: right;">
																<input style="text-align: right" class="form-control CS_aDay" type="number" min="0" value="2"/>
															</td>
															<td style="text-align: right;">
																<input style="text-align: right" class="form-control CS_aTime" type="number" min="0" value="0"/>
															</td>
															<td class="CS_aSum" style="vertical-align:middle;text-align: right;">
																<fmt:formatNumber value="0" pattern="#,###" />
															</td>
														</c:when>
														<c:otherwise>
															<c:forEach var="rowGet" items="${consultGet}">
																<td style="text-align: right;">
																	<c:choose>
																		<c:when test="${rowGet.RENT_DAYS > 0 && row.FROOM_TITLE eq rowGet.RENT_TITLE}">
																			<input style="text-align: right" class="form-control CS_aDay" type="number" min="0" value="${rowGet.RENT_DAYS}"/>
																		</c:when>
																		<c:otherwise>
																			<input style="text-align: right" class="form-control CS_aDay" type="number" min="0" value="0"/>
																		</c:otherwise>
																	</c:choose>
																</td>
																<td style="text-align: right;">
																	<c:choose>
																		<c:when test="${rowGet.RENT_HOURS > 0 && row.FROOM_TITLE eq rowGet.RENT_TITLE}">
																			<input style="text-align: right" class="form-control CS_aTime" type="number" min="0" value="${rowGet.RENT_HOURS}"/>
																		</c:when>
																		<c:otherwise>
																			<input style="text-align: right" class="form-control CS_aTime" type="number" min="0" value="0"/>
																		</c:otherwise>
																	</c:choose>
																</td>
																<td class="CS_aSum" style="vertical-align:middle;text-align: right;">
																	<c:choose>
																		<c:when test="${rowGet.RENT_AMOUNT > 0 && row.FROOM_TITLE eq rowGet.RENT_TITLE}">
																			<fmt:formatNumber value="${rowGet.RENT_AMOUNT}" pattern="#,###" />
																		</c:when>
																		<c:otherwise>
																			<fmt:formatNumber value="0" pattern="#,###" />
																		</c:otherwise>
																	</c:choose>
																</td>
															</c:forEach>
														</c:otherwise>
													</c:choose>
													<td style="text-align: center; display:none"><input type="checkbox"	class="form-control CHKsrm" /></td>
												</tr>
												
											</c:forEach>
											<c:forEach var="row" items="${contpage2fr2}">
												<tr>
													<td class="second" style="vertical-align:middle;text-align:center">부대시설</td>
													<td style="vertical-align:middle;text-align:center">${row.FROOM_TITLE}<input type="hidden" class="etcrid"value="${row.FROOM_ID}"></td>
													<td class = "CS_RMday" style="vertical-align:middle;text-align: right;"><fmt:formatNumber value="${row.FROOM_DAY_PRICE}" pattern="#,###" /></td>
													<td class = "CS_RMtime" style="vertical-align:middle;text-align: right;"><fmt:formatNumber value="${row.FROOM_TIME_PRICE}" pattern="#,###" /></td>
													<td style="text-align: right;"><input style="vertical-align:middle;text-align: right"class="form-control CS_EDay" type="number" min="0" max="30" value="${row.DAYS}"/></td>
													<td style="text-align: right;">
														<c:choose>
															<c:when test="${row.TIMES > 0}">
																<input style="vertical-align:middle;text-align: right"class="form-control CS_ETime" type="number" min="0" max="30" value="${row.TIMES}"/>
															</c:when>
															<c:otherwise>
																<input style="vertical-align:middle;text-align: right"class="form-control CS_ETime" type="number" min="0" max="30" value="0"/>
															</c:otherwise>
														</c:choose>
													</td>
													<td class = "CS_ESum" style="vertical-align:middle;text-align: right;">
														<c:choose>
															<c:when test="${row.RCHARGE > 0}">
																<fmt:formatNumber value="${row.RCHARGE}" pattern="#,###" />
															</c:when>
															<c:otherwise>
																<fmt:formatNumber value="0" pattern="#,###" />
															</c:otherwise>
														</c:choose>
													</td>
												</tr>
											</c:forEach>
												<tr>
													<td colspan="4" style="vertical-align:middle;text-align:center">부가사용료</td>
													<td colspan="3" class="addPay1" style="text-align: right;">0</td>
												</tr>
												<tr>
													<td colspan="4" style="vertical-align:middle;text-align:center">제물상</td>
													<td colspan="3" class="defaultP3total" style="text-align: right;">0</td>
												</tr>
												<tr>
													<td colspan="4" style="vertical-align:middle;text-align:center">장의용품</td>
													<td colspan="3" class="defaultP4total" style="text-align: right;">0</td>
												</tr>
												<tr>
													<td colspan="4" style="vertical-align:middle;text-align:center">제단</td>
													<td colspan="3" class="defaultP5total" style="text-align: right;">0</td>
												</tr>
												<tr>
													<td colspan="4" style="text-align:center;">총합</td>
													<td colspan="3" style="text-align:right;" class="sumTd">0</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<c:forEach var="row" items="${setu}">
								<tr>
									<td style="vertical-align:middle;text-align:center"><button class="btn btn-secondary">${row.SETUP_TITLE}</button></td>
									<td colspan="3"><textarea rows="2" style="border: none"class="form-control">${row.SETUP_CONTENTS}</textarea></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						<c:forEach var="row" items="${listFroom}">
							<c:forEach var="rowGet" items="${consultGet}">
								<c:if test="${row.FROOM_TITLE eq rowGet.RENT_TITLE}">
									<c:set var="aSUM" value="${rowGet.RENT_AMOUNT}" />
								</c:if>							
							</c:forEach>
						</c:forEach>
						<c:forEach var="row" items="${contpage2fr2}">
							<c:set var="eSUM" value="${eSUM + row.RCHARGE}" />
						</c:forEach>
						<c:choose>
							<c:when test="${eSUM > 0}">
								<input type="hidden" id="sumTemp1" value="${eSUM}">
							</c:when>
							<c:otherwise>
								<input type="hidden" id="sumTemp1" value="0">
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${aSUM > 0}">
								<input type="hidden" id="sumTemp2" value="${aSUM}">
							</c:when>
							<c:otherwise>
								<input type="hidden" id="sumTemp2" value="0">
							</c:otherwise>
						</c:choose>
						<input type="hidden" id="sumTemp3" value="0">
						<input type="hidden" id="sumTemp4" value="0">
						<input type="hidden" id="sumTemp5" value="0">
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="${path}/js/onloadScript.js"></script>
<script>
var modal = $(".modal");
var modal_body = $(".modal").find(".modal-body");
var modal_footer = $(".modal").find(".modal-footer");

$(document).on("change", "#searchDateFrom", function(){
	var dateValue = $(this).val();
	var dateValueArr = dateValue.split("-");
	var dateValueCom = new Date(dateValueArr[0], parseInt(dateValueArr[1])-1, dateValueArr[2]);
	var EdateValue = $("#searchDateEnd").val();
	var EdateDateArr = EdateValue.split("-");
	var EdateDateCom = new Date(EdateDateArr[0], parseInt(EdateDateArr[1])-1, EdateDateArr[2]);
	
	if(EdateValue == ""){
		dateValueCom.setDate(dateValueCom.getDate()+1);
	}else if(dateValueCom.getTime() > EdateDateCom.getTime()){
		alert("시작일이 종료일보다 클 수 없습니다.");
		dateValueCom.setDate(dateValueCom.getDate()+1);
	}else{
		return null;
	}
	
	var year = dateValueCom.getFullYear();
	var month = dateValueCom.getMonth()+1;
	var day = dateValueCom.getDate();
	
	if(day < 10){
		day = "0" + day;
	}
	
	$("#searchDateEnd").val(year + "-" + month + "-" + day);
});

$(document).on("change", "#searchDateEnd", function(){
	var SdateValue = $("#searchDateFrom").val();
	var SdateValueArr = SdateValue.split("-");
	var SdateValueCom = new Date(SdateValueArr[0], parseInt(SdateValueArr[1])-1, SdateValueArr[2]);
	var thisDateValue = $(this).val();
	var thisDateArr = thisDateValue.split("-");
	var thisDateCom = new Date(thisDateArr[0], parseInt(thisDateArr[1])-1, thisDateArr[2]);
	
	if(SdateValue == ""){
		thisDateCom.setDate(thisDateCom.getDate()-1);
	}else if(SdateValueCom.getTime() > thisDateCom.getTime()){
		alert("종료일이 시작일보다 작을 수 없습니다.");
		thisDateCom.setDate(thisDateCom.getDate()-1);
	}else{
		return null;
	}
	
	var year = thisDateCom.getFullYear();
	var month = thisDateCom.getMonth()+1;
	var day = thisDateCom.getDate();
	
	if(day < 10){
		day = "0" + day;
	}
	
	$("#searchDateFrom").val(year + "-" + month + "-" + day);
});

$(document).on("click", "#searchBtn", function(){
	var consultData = {};
	modal_body.find("table tbody").html("");
	
	consultData.from = $("#searchDateFrom").val();
	consultData.end = $("#searchDateEnd").val();
	consultData.PATI_NAME = $("#searchPatiName").val();
	console.log($("#searchPatiName").val());
	consultData.BFAMILY_NAME = $("#searchBfamilyName").val();
	
	$.ajax({
		url: "${path}/consult/consultModalSearch.do",
		method: "post",
		data: consultData,
		dataType: "json",
		success:function(data){
			$.each(data, function(index, item){
				modal_body.find("table tbody").append("<tr id='consultSelect' data-id='"+item.CONSULT_ID+"'><td>" + item.CONSULT_DATE + "</td><td>" + item.FROOM_TITLE + "</td><td>" + item.PATI_NAME + "</td><td>" + item.BFAMILY_NAME + "</td></tr>");
			});
		}
	})
})

$(".close").click(function(){
	modal.hide();
});

modal_footer.find("#cancelBtn").click(function(){
	modal.hide();
});

$("#modalBtn, #resetBtn").on("click", function(){
	modal.find("input").val("");
	modal_body.find("table tbody").html("");
	modal.show();
	
	$.ajax({
		url: "${path}/consult/consultModalList.do",
		method: "post",
		async : false,
		dataType: "json",
		success:function(data){
			$.each(data, function(index, item){
				modal_body.find("table tbody").append("<tr id='consultSelect' data-id='"+item.CONSULT_ID+"'><td>" + item.CONSULT_DATE + "</td><td>" + item.FROOM_TITLE + "</td><td>" + item.PATI_NAME + "</td><td>" + item.BFAMILY_NAME + "</td></tr>");
			});
		}
	});
});

$('.phone').keydown(function(event) {
    var key = event.charCode || event.keyCode || 0;
    $text = $(this);
    if (key !== 8 && key !== 9) {
        if ($text.val().length === 3) {
            $text.val($text.val() + '-');
        }
        if ($text.val().length === 8) {
            $text.val($text.val() + '-');
        }
    }
    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));          
});
	/* function chkcalE() {
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
	} */

$(".Eday, .Etime").change(function() {
	chkcalE();
});


$(".CS_aDay, .CS_aTime").change(function() {
	var CS_qMday = $(".CS_qMday");
	var CS_qMtime = $(".CS_qMtime");
	var CS_aDay = $(".CS_aDay");
	var CS_aTime = $(".CS_aTime");
	var CS_aSum = $(".CS_aSum");
	var sumTd = $(".sumTd");
	var sumTemp2 = $("#sumTemp2");
	var temp = 0;
	
	for (var i = 0; i < CS_qMday.length; i++) {
		var chksum = 0;
		var b1 = Number(CS_qMday[i].innerText.replace(/[\D\s\._\-]+/g, ""));
		var b2 = Number(CS_qMtime[i].innerText.replace(/[\D\s\._\-]+/g, ""));
		var c1 = Number(CS_aDay[i].value.replace(/[\D\s\._\-]+/g, ""));
		var c2 = Number(CS_aTime[i].value.replace(/[\D\s\._\-]+/g, ""));
		chksum = (b1*c1)+(b2*c2);
		temp = temp + chksum;
		sumTemp2.val(temp);
		CS_aSum[i].innerText = numberWithCommas(chksum);
	}
	sumT();
});
	

$(".CS_EDay, .CS_ETime").change(function() {
	var CS_RMday = $(".CS_RMday");
	var CS_RMtime = $(".CS_RMtime");
	var CS_EDay = $(".CS_EDay");
	var CS_ETime = $(".CS_ETime");
	var CS_ESum = $(".CS_ESum");
	var sumTd = $(".sumTd");
	var sumTemp1 = $("#sumTemp1");
	var temp = 0;
	
	for (var i = 0; i < CS_RMday.length; i++) {
		var chksum = 0;
		var b1 = Number(CS_RMday[i].innerText.replace(/[\D\s\._\-]+/g, ""));
		var b2 = Number(CS_RMtime[i].innerText.replace(/[\D\s\._\-]+/g, ""));
		var c1 = Number(CS_EDay[i].value.replace(/[\D\s\._\-]+/g, ""));
		var c2 = Number(CS_ETime[i].value.replace(/[\D\s\._\-]+/g, ""));
		chksum = (b1*c1)+(b2*c2);
		temp = temp + chksum;
		sumTemp1.val(temp);
		CS_ESum[i].innerText = numberWithCommas(chksum);
	}
	sumT();
});
	
</script>