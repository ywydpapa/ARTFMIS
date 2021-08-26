<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!--표준주문서등록-->
<div class="cnt_wr">
	<div class="row">
		<div class="col-sm-12">
			<div class="card-block table-border-style">
				<div class="table-responsive">
					<table class="table  table-bordered nowrap">
						<tr>
							<td class="align-middle"
								style="text-align: center; background-color: #E6F8E0"><span>선택된
									항목 : </span>${pagetitle}</td>
							<td class="align-middle"
								style="text-align: right; background-color: #E6F8E0"><span>선택된
									초도주문 총액 :</span><input type="text" id="subtotal"
								style="text-align: right; border: none; background-color: #E6F8E0"
								readonly></td>
							<td class="align-middle"
								style="text-align: right; background-color: #E6F8E0"><button
									class="btn btn-primary form-control" onClick="fn_Dos1insert()">저장</button></td>
						</tr>
					</table>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<colgroup>
							<col width="5%" />
							<col width="15%" />
							<col width="5%" />
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
							<col width="15%" />
						</colgroup>
						<thead>
							<tr>
								<th colspan="2" style="text-align: center; border: 2px">분류</th>
								<th colspan="8" style="text-align: center; border: 2px">상세정보</th>
							</tr>
							<tr class="align-middle"
								style="text-align: center; background-color: #CED8F6">
								<th class="align-middle" style="text-align: center;">종류</th>
								<th class="align-middle" style="text-align: center;">제품명</th>
								<th class="align-middle" style="text-align: center;">단위</th>
								<th class="align-middle" style="text-align: center;">개당단가</th>
								<th class="align-middle" style="text-align: center;">기본금액</th>
								<th class="align-middle" style="text-align: center;">초도주문수량</th>
								<th class="align-middle" style="text-align: center;">초도주문금액</th>
								<th class="align-middle" style="text-align: center;">추가주문수량</th>
								<th class="align-middle" style="text-align: center;">추가주문금액</th>
								<th class="align-middle" style="text-align: center;">표준주문서등록여부(<a
									href="javascript:void(0);" onclick="chkall();">V</a>/<a
									href="javascript:void(0);" onclick="chkun();">X</a>)
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${list}">
								<tr style="vertical-align: middle">
									<td class="first"
										style="vertical-align: middle; text-align: center; background-color: #E6F8E0">${row.CAT_TITLE}</td>
									<td style="vertical-align: middle">${row.GOODS_TITLE}</td>
									<td style="vertical-align: middle; text-align: center">${row.GOODS_UNIT}<input
										type="hidden" class="FRID" value="${frid}"><input
										type="hidden" class="GID" value="${row.GOODS_ID}"></td>
									<td style="text-align: right; vertical-align: middle"><fmt:formatNumber
											value="${row.GOODS_NET_PRICE}" pattern="#,###" /></td>
									<td style="text-align: right; vertical-align: middle"
										class="info"><fmt:formatNumber
											value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></td>
									<td
										<c:if test="${row.GOODS_INIT_ORDER eq 'N'}">onClick="alert('초도주문 불가 품목 입니다.')" class="table-warning"</c:if>
										<c:if test="${row.GOODS_INIT_ORDER eq 'Y'}">class="table-warning"</c:if>
										style="text-align: right; vertical-align: middle"><input
										class="form-control A table-warning " onchange="calculate()"
										oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
										style="border: none; text-align: center; background-color: #FFEEBA"
										type="text" min="0" max="100"
										value="<c:if test="${row.GOODS_INIT_BASIC eq 'N'}">0</c:if><c:if test="${row.GOODS_INIT_BASIC eq 'Y'}"><c:if test="${row.FNRS_GOODS_INIT_QTY eq null }">1</c:if><c:if test="${row.FNRS_GOODS_INIT_QTY ne null }">${row.FNRS_GOODS_INIT_QTY}</c:if></c:if>"
										<c:if test="${row.GOODS_INIT_BASIC eq 'N'}">disabled</c:if>
										required></td>
									<td class="B" style="text-align: right; vertical-align: middle"></td>
									<td
										<c:if test="${row.GOODS_ADD_SALE eq 'N'}">onClick="alert('추가주문 불가 품목 입니다.')" class="table-warning"</c:if>
										<c:if test="${row.GOODS_ADD_SALE eq 'Y'}">class="table-warning"</c:if>
										style="text-align: right;"><input
										class="form-control C <c:if test="${row.GOODS_ADD_SALE eq 'N'}">table-warning</c:if><c:if test="${row.GOODS_ADD_SALE eq 'Y'}">table-warning</c:if>"
										onchange="calculate()"
										oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
										style="border: none; text-align: center; background-color: #FFEEBA"
										type="text"
										value="<c:if test="${row.GOODS_ADD_SALE eq 'N'}">0</c:if><c:if test="${row.GOODS_ADD_SALE eq 'Y'}"><c:if test="${row.FNRS_GOODS_ADD_QTY eq null }">1</c:if><c:if test="${row.FNRS_GOODS_ADD_QTY ne null }">${row.FNRS_GOODS_ADD_QTY}</c:if></c:if>"
										min="0" max="100"
										oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
										<c:if test="${row.GOODS_ADD_SALE eq 'N'}">disabled</c:if>
										required></td>
									<td class="D" style="text-align: right; vertical-align: middle"></td>
									<th style="text-align: center; vertical-align: middle"
										scope="row"><input class="form-control CHK"
										type="checkbox" id="checkbox0"
										<c:if test="${row.FNRS_GOODS_INIT_QTY ne null }">checked</c:if>></th>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	function fn_Dos1insert() {
		var $frid = $(".FRID");
		var froomid = $frid[0].value;
		var frdata = {};
		frdata.FNRS_ORD_FROOM_ID = froomid;
		console.log(frdata);
		$
				.ajax({
					url : "${path}/goods/deleteDos1.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
					data : frdata, // HTTP 요청과 함께 서버로 보낼 데이터 
					method : "POST", // HTTP 요청 메소드(GET, POST 등) 
					dataType : "json" // 서버에서 보내줄 데이터의 타입 
				})
				// HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(
						function(data) {
							if (data.code == 10001) {
								var $frid = $(".FRID");
								var $gid = $(".GID");
								var $infoarr = $(".info");
								var $Aarr = $(".A");
								var $Carr = $(".C");
								var $Chkarr = $(".CHK");
								for (var i = 0; i < $Aarr.length; i++) {
									if ($($Chkarr[i]).is(":checked") == true) {
										var goodsData = {};
										goodsData.FNRS_ORD_FROOM_ID = $frid[i].value;
										goodsData.FNRS_GOODS_ID = Number($gid[i].value);
										goodsData.FNRS_GOODS_SALE_PRICE = Number($infoarr[i].innerText
												.replace(/[\D\s\._\-]+/g, ""));
										goodsData.FNRS_GOODS_INIT_QTY = Number($Aarr[i].value);
										goodsData.FNRS_GOODS_ADD_QTY = Number($Carr[i].value);
										console.log(goodsData);
										$
												.ajax(
														{
															url : "${path}/goods/insertDos1.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
															data : goodsData, // HTTP 요청과 함께 서버로 보낼 데이터 
															method : "POST", // HTTP 요청 메소드(GET, POST 등) 
															dataType : "json" // 서버에서 보내줄 데이터의 타입 
														})
												// HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
												.done(function(data) {
													if (data.code == 10001) {
													} else {
													}
												})
												// HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
												.fail(
														function(xhr, status,
																errorThrown) {
															alert("입력값을 확인해 주십시오!!(insert)");
														});
									}
								}
								alert("저장성공(insert)");
							} else {
								var $frid = $(".FRID");
								var $gid = $(".GID");
								var $infoarr = $(".info");
								var $Aarr = $(".A");
								var $Carr = $(".C");
								var $Chkarr = $(".CHK");
								for (var i = 0; i < $Aarr.length; i++) {
									if ($($Chkarr[i]).is(":checked") == true) {
										var goodsData = {};
										goodsData.FNRS_ORD_FROOM_ID = $frid[i].value;
										goodsData.FNRS_GOODS_ID = Number($gid[i].value);
										goodsData.FNRS_GOODS_SALE_PRICE = Number($infoarr[i].innerText
												.replace(/[\D\s\._\-]+/g, ""));
										goodsData.FNRS_GOODS_INIT_QTY = Number($Aarr[i].value);
										goodsData.FNRS_GOODS_ADD_QTY = Number($Carr[i].value);
										console.log(goodsData);
										$
												.ajax(
														{
															url : "${path}/goods/insertDos1.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
															data : goodsData, // HTTP 요청과 함께 서버로 보낼 데이터 
															method : "POST", // HTTP 요청 메소드(GET, POST 등) 
															dataType : "json" // 서버에서 보내줄 데이터의 타입 
														})
												// HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
												.done(function(data) {
													if (data.code == 10001) {
													} else {
														alert("저장 실패(insert)");
													}
												})
												// HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
												.fail(
														function(xhr, status,
																errorThrown) {
															alert("입력값을 확인해 주십시오!!(insert)");
														});
									}
								}
								alert("저장성공(insert)");
							}
						});
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

	function calculate() {
		var $infoarr = $(".info");
		var $Aarr = $(".A");
		var $Barr = $(".B");
		var $Carr = $(".C");
		var $Darr = $(".D");
		for (var i = 0; i < $infoarr.length; i++) {
			var t1 = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			$Barr[i].innerText = numberWithCommas(Number($Aarr[i].value) * t1);
			$Darr[i].innerText = numberWithCommas(Number($Carr[i].value) * t1);
		}
		chkcal();
	}

	$(".CHK").change(function() {
		chkcal();
	});

	function chkcal() {
		var $Barr = $(".B");
		var $Darr = $(".D");
		var $Chkarr = $(".CHK");
		var chksum = 0;
		var addsum = 0;
		for (var i = 0; i < $Barr.length; i++) {
			if ($($Chkarr[i]).is(":checked") == true) {
				var b1 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
				var d1 = Number($Darr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
				chksum = chksum + b1;
				addsum = addsum + d1;
			}
		}
		$('#subtotal').val(numberWithCommas(chksum));
		$('#addtotal').val(numberWithCommas(addsum));
		$('#grandtotal').val(numberWithCommas(chksum + addsum));
	}

	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	$(document).ready(function() {
		calculate();
	});
</script>
