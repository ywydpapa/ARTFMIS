<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.settle .item {
	float: left;
	width: 15%;
	height: 100%;
	text-align: center;
	background: white;
	border-right: 1px solid #ddd;
}

.settle .item.cont {
	float: left;
	width: 78%;
	padding: 10px;
	border-right: none;
	text-align: center;
}
</style>
	<div class="settle">
		<div class="item">
		<table class="table table-bordered nowrap" id="roomTable">
				<thead>
					<tr>
						<th scope="col" width="200" align="center">정산처리</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td><a href="javascript:tab01active()">반품</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab02active()">조회</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab03active()">정산</a></td>
						</tr>
						<tr>
							<td><a href="javascript:tab04active()">퇴실</a></td>
						</tr>
				</tbody>
			</table>
		</div>
		<div class="item cont">
<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline"></div>
			</div>
		</div>
	</div>
</div>
<!--Page-header end 페이지 타이틀 -->
	<div class="cnt_wr">
	<!-- Row start -->
	<div class="row">
		<div class="col-lg-12 col-xl-12">
		<div class="table-responsive">
				<table class="table table-bordered nowrap">
				<tr>
				<td><input id="frid" type="hidden" value = "${frid}"><input id="contid" type="hidden" value = "${CONTid}">
				<input id="rmchk" type="hidden" value = "OK"><span>선택된 계약번호 : </span>${CONTid}</td>
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
													<th scope="row">반품 처리</th>
												</tr>
											</tbody>
										</table>
										<table class="table table-sm bst02" id="basicTable">
											<colgroup>
											</colgroup>
											<thead>
											<tr>
											<th class="text-center">구분</th>
											<th class="text-center">단위</th>
											<th class="text-center">품명</th>
											<th class="text-center">단위수량</th>
											<th class="text-center">단가</th>
											<th class="text-center">주문량</th>
											<th class="text-center">주문금액</th>
											<th class="text-center">반품수량(개별)</th>
											<th class="text-center">반품금액</th>
											<th class="text-center">청구금액</th>
											</tr>
											</thead>
											<tbody>
											<c:forEach var="row" items="${rtnpage7}">
											<tr>
											<td class="second" style="text-align: center;">${row.CAT_TITLE}</td>
											<td style="text-align: center;">${row.GOODS_UNIT}</td>
											<td style="text-align: center;">${row.GOODS_TITLE}</td>
											<td style="text-align: center;">${row.GOODS_SALE_UNIT}</td>
											<td style="text-align: right;" class="sprice"><fmt:formatNumber value="${row.GOODS_NET_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;">${row.ORD_QUTY}</td>	
											<td style="text-align: right;" class="ordamt"><fmt:formatNumber value="${row.ORD_AMOUNT}" pattern="#,###" /></td>
											<td style="text-align: right;"><input class="rquty" style="text-align:right; border:none" type="number" value="0" min="0"></td>																																
											<td style="text-align: right;" class="ramount"></td>
											<td style="text-align: right;" class="remainT"></td>
											</tr>
											</c:forEach>
											<tr>
											<td style="text-align: center;"colspan="8">합             계</td>
											<td style="text-align: right;"><div><input style="text-align:right; border:none" type="text" id="rtnquty" value=""></div></td>
											<td style="text-align: right;"><div><input style="text-align:right; border:none" type="text" id="tamount" value=""></div></td>
											</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="btn_wr text-right mt-3">
									<button class="btn btn-md btn-primary"
										onClick="fn_UpdateReturn()">반품처리</button>
								</div>
							</div>
						</div>
					</div>
					<!--//계약기본등록-->
				</div>
				<div class="tab-pane" id="tab02" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<table class="table table-sm bst02">
											<tbody>
												<tr>
													<th scope="row">(식당)주문목록</th>
												</tr>
											</tbody>
										</table>
										<table class="table table-sm bst02" id="Table6">
											<colgroup>
											</colgroup>
											<thead>
											<tr>
											<th class="text-center">주문일시</th>
											<th class="text-center">상품구분</th>
											<th class="text-center">단위</th>
											<th class="text-center">품명</th>
											<th class="text-center">단위수량</th>
											<th class="text-center">단가</th>
											<th class="text-center">주문량</th>
											<th class="text-center">주문금액</th>
											<th class="text-center">확인일자</th>
											<th class="text-center">주문구분</th>
											</tr>
											</thead>
											<tbody>
											<c:forEach var="row" items="${spage6}">
											<tr>
											<td style="text-align: center;">${row.ORD_DATE}</td>
											<td class="second" style="text-align: center;">${row.CAT_TITLE}</td>
											<td style="text-align: center;">${row.GOODS_UNIT}</td>
											<td style="text-align: center;">${row.GOODS_TITLE}</td>
											<td style="text-align: center;">${row.GOODS_SALE_UNIT}</td>
											<td style="text-align: right;" class="netprice"><fmt:formatNumber value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;">${row.ORD_QUTY}</td>	
											<td style="text-align: right;" class="ordamount6"><fmt:formatNumber value="${row.ORD_AMOUNT}" pattern="#,###" /></td>
											<td style="text-align: right;">${row.CONF_DATE}</td>
											<td style="text-align: center;"><c:if test="${row.ORD_TYPE eq 1}">초도주문</c:if><c:if test="${row.ORD_TYPE eq 2}">추가주문</c:if></td>
											</tr>
											</c:forEach>
											<tr>
											<td style="text-align: center;"colspan="9">식당 주문 합계</td>
											<td style="text-align: right;"><div><input style="text-align:right; border:none" type="text" id="tsum6" value=""></div></td>
											</tr>
											</tbody>
										</table>
										<br>
										<table class="table table-sm bst02">
											<tbody>
												<tr>
													<th scope="row">(매점)주문목록</th>
												</tr>
											</tbody>
										</table>
										<table class="table table-sm bst02" id="Table7">
											<colgroup>
											</colgroup>
											<thead>
											<tr>
											<th class="text-center">주문일시</th>
											<th class="text-center">상품구분</th>
											<th class="text-center">단위</th>
											<th class="text-center">품명</th>
											<th class="text-center">단위수량</th>
											<th class="text-center">단가</th>
											<th class="text-center">주문량</th>
											<th class="text-center">주문금액</th>
											<th class="text-center">확인일자</th>
											<th class="text-center">주문구분</th>
											</tr>
											</thead>
											<tbody>
											<c:forEach var="row" items="${spage7}">
											<tr>
											<td style="text-align: center;">${row.ORD_DATE}</td>
											<td class="second" style="text-align: center;">${row.CAT_TITLE}</td>
											<td style="text-align: center;">${row.GOODS_UNIT}</td>
											<td style="text-align: center;">${row.GOODS_TITLE}</td>
											<td style="text-align: center;">${row.GOODS_SALE_UNIT}</td>
											<td style="text-align: right;" class="netprice"><fmt:formatNumber value="${row.GOODS_SALE_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;">${row.ORD_QUTY}</td>	
											<td style="text-align: right;" class="ordamount7"><fmt:formatNumber value="${row.ORD_AMOUNT}" pattern="#,###" /></td>
											<td style="text-align: right;">${row.CONF_DATE}</td>
											<td style="text-align: center;"><c:if test="${row.ORD_TYPE eq 1}">초도주문</c:if><c:if test="${row.ORD_TYPE eq 2}">추가주문</c:if></td>
											</tr>
											</c:forEach>
											<tr>
											<td style="text-align: center;"colspan="9">매점 주문 합계</td>
											<td style="text-align: right;"><div><input style="text-align:right; border:none" type="text" id="tsum7" value=""></div></td>
											</tr>
											</tbody>
										</table>
										<table class="table table-sm bst02" id="rtn">
											<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td style="text-align: center;">반품 합계</td>
											<td></td>
											<td></td>
											<td style="text-align: right;"><div><input style="text-align:right; border:none" type="text" id="sumrtn" value=""></div></td>
											</tr>
										</table>
										<table class="table table-sm bst02" id="tot">
											<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td style="text-align: center;">식당/매점 정산 합계</td>
											<td></td>
											<td></td>
											<td style="text-align: right;"><div><input style="text-align:right; border:none" type="text" id="summs" value=""></div></td>
											</tr>
										</table>
										
						</div>
					</div>
					<div class="btn_wr text-right mt-3">
						<button class="btn btn-md btn-primary" onClick="fn_contInsertP2()">등록</button>
					</div>
				</div>
				<div class="tab-pane" id="tab03" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<form name="form3" method="post" onsubmit="return false;">
								<table class="table table-sm bst02">
									<tbody>
									<tr>
									<td><span> 제물상 </span></td>
									<td style="text-align: right;"></td>
									</tr>
									</tbody>
								</table>
								<div class="row">
									<table class="table  table-bordered nowrap"
										id="ftTable">
										<thead>
											<tr>
												<th scope="col" width="10%" align="center">구분</th>
												<th scope="col" width="10%" align="center">선택여부</th>
												<th scope="col" width="20%" align="center">금액</th>
												<th scope="col" width="10%" align="center">단위</th>
												<th scope="col" width="30%" align="center">상품이미지</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="row" items="${contpage3}">
												<tr>
													<td class="second">${row.BCD_TITLE}</td>
													<td><input type="checkbox" <c:if test="${row.FTABLE_CAT eq '24'}">onclick="oneCheckft(this);"</c:if> name = "FT${row.FTABLE_CAT}" class="CHKft form-control" <c:if test="${row.CHKED eq 'Y'}">checked</c:if> /></td>
													<td style="text-align: right" class="TA"><fmt:formatNumber value="${row.FTABLE_AMOUNT}" pattern="#,###" /></td>
													<td style="text-align: right">${row.FTABLE_UNIT}</td>
													<td class="imagebx"><div id="ftImage"></div></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</form>
							<br> <br>
							<form name="form3-1" method="post" onsubmit="return false;">
								<table class="table table-sm bst02">
									<tbody>
										<tr>
											<th scope="row">선택 목록(제물상)</th>
										</tr>
									</tbody>
								</table>
									<table class="table table-bordered nowrap"
										id="sFtable">
										<thead>
											<tr>
												<th scope="col" width="20%" style="text-align:center">구분</th>
												<th scope="col" width="20%" style="text-align:center">금액</th>
												<th scope="col" colspan="2" width="20%" style="text-align:center">단위</th>
												<th scope="col" width="30%" style="text-align:center">금액</th>
												<th style="display :none" scope="col" width="10%" style="text-align:center">선택</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="row" items="${contpage3}">
												<tr>
													<td>${row.BCD_TITLE}<input type="hidden" class = "sTid" value = "${row.FTABLE_ID}"/></td>
													<td style="text-align: right" class="sTA"><fmt:formatNumber value="${row.FTABLE_AMOUNT}" pattern="#,###" /></td>
													<td style="text-align: right; border-right:none"><input style="text-align:right;border:0px" type="number" class="sTB from-control" min="0" value = "1"></td><td style = "border-left:none">${row.FTABLE_UNIT}</td>
													<td style="text-align: right" class="sTC"><fmt:formatNumber value="${row.ORD_AMOUNT}" pattern="#,###" /></td>
													<td style="display :none"><input type="checkbox" class="sCHKft form-control" <c:if test="${row.CHKED eq 'Y'}">checked</c:if> /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
							</form>
							<hr>
							<div style="text-align:right"><span>선택된 제물상 총액 :</span><input type="text" id="P3total" style="text-align: right; border: none;" readonly>
							</div>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-primary" onClick="fn_contInsertP3()">등록</button>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="tab04" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<div style="text-align:right"><span>선택된 장의용품 총액 :</span><input type="text" id="P4total" style="text-align: right; border: none;" readonly></div>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-primary"
									onClick="fn_contInsertP4()">등록</button>
							</div>
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

<!--계약기본등록-->
<script>

	var i = 1;
	var str = undefined;
	var element = $(".second");
	var firstElement = undefined;
	element.each(function() {
		console.dir(i + $(this).text());
		if (str == undefined && firstElement == undefined) {
			str = $(".second")[0].innerText;
			firstElement = $(".second")[0];
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
	
	
	function tab01active(){
		$('.tab-pane').removeClass('active');
		$('#tab01').addClass('active');
	}
	function tab02active(){
		$('.tab-pane').removeClass('active');
		$('#tab02').addClass('active');
	}
	function tab03active(){
		$('.tab-pane').removeClass('active');
		$('#tab03').addClass('active');
	}
	function tab04active(){
		$('.tab-pane').removeClass('active');
		$('#tab04').addClass('active');
	}

	$(document).ready(function(){
		calReturn();
		calsum6();
		calsum7();
		sumsmall();
	})

	function calReturn() {
		var $infoarr = $(".sprice");
		var $Aarr = $(".rquty");
		var $Barr = $(".ramount");
		var $Carr = $(".remainT");
		var $Darr = $(".ordamt");
			var retTotal = 0;
			var sumTotal = 0;
		for (var i = 0; i < $infoarr.length; i++) {
			var Ttotal = 0;
			var Ttotal2 = 0;
			var t1 = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t2 = Number($Darr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			var t3 = Number($Aarr[i].value.replace(/[\D\s\._\-]+/g, ""));
			Ttotal = (t1*t3);
			$Barr[i].innerText = numberWithCommas(Ttotal);
			Ttotal2 = t2-(t1*t3);
			$Carr[i].innerText = numberWithCommas(Ttotal2);
			retTotal = retTotal + Ttotal; 
			sumTotal = sumTotal + Ttotal2;
			}
		$('#rtnquty').val(numberWithCommas(retTotal));
		$('#sumrtn').val(numberWithCommas(retTotal*(-1)));
		$('#tamount').val(numberWithCommas(sumTotal));
	}
	
	
	
	function calsum6() {
		var $infoarr = $(".ordamount6");
			var sumTotal = 0;
		for (var i = 0; i < $infoarr.length; i++) {
			var t1 = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			sumTotal = sumTotal + t1;
			}
		$('#tsum6').val(numberWithCommas(sumTotal));
	}
	
	function calsum7() {
		var $infoarr = $(".ordamount7");
			var sumTotal = 0;
		for (var i = 0; i < $infoarr.length; i++) {
			var t1 = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			sumTotal = sumTotal + t1;
			}
		$('#tsum7').val(numberWithCommas(sumTotal));
	}
	
	function sumsmall() {
		var msum = Number($('#tsum6').val().replace(/[\D\s\._\-]+/g, ""));
		var ssum = Number($('#tsum7').val().replace(/[\D\s\._\-]+/g, ""));
		var rsum = Number($('#sumrtn').val().replace(/[\D\s\._\-]+/g, ""));
		var totsum = msum + ssum + rsum;
		$('#summs').val(numberWithCommas(totsum));
	}


	
	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	$(".rquty").change(function(){
		calReturn();
		sumsmall();
	});

</script>