<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
.swcCard {
	width: 100%;
	height: 100%;
	padding: 20px;
	background: white;
}

</style>

<div class="card-block table-border-style swcCard">
	<div class="table-responsive">
		<table class="table table-bordered nowrap">
			<tr>
				<th scope="row">식당품목 주문현황</th>
				<td style="text-align: right;"><span>주문 총액 :</span><input
					type="text" id="messgrandtotal"
					style="text-align: right; border: none;" readonly></td>
			</tr>
		</table>
	</div>
	<div class="table-responsive">
		<table id="MESS01" class="table table-bordered nowrap">
			<colgroup>
				<col width="10%" />
				<col width="15%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="15%" />
				<col width="15%" />
				<col width="15%" />
			</colgroup>

			<tr>
				<th colspan="5" style="text-align: center;">분류</th>
				<th colspan="5" style="text-align: center;">상세정보</th>
			</tr>
			<tr style="text-align: center;">
				<th>종류</th>
				<th>제품명</th>
				<th>주문호실</th>
				<th>단가</th>
				<th>주문수량</th>
				<th>주문금액</th>
				<th>주문일자</th>
				<th>수령일자</th>
			</tr>
			<tbody>
				<c:forEach var="row" items="${restordall}">
					<tr>
						<td class="first">${row.CAT_TITLE}</td>
						<td><input type="hidden" class="GID"
							value="${row.REST_ORD_ID}" />${row.GOODS_TITLE}</td>
						<td>${row.FROOM_TITLE}</td>
						<td style="text-align: right;" class="infoM"><fmt:formatNumber
								value="${row.NET_PRICE}" pattern="#,###" /></td>
						<td style="text-align: right;"><input class="from-control MA"
							oninput="calculateM()" style="border: none; text-align: right;"
							type="number" min="0" max="100" value="${row.ORD_QUTY}" required
							readonly></td>
						<td class="MB" style="text-align: right;"><fmt:formatNumber
								value="${row.ORD_AMOUNT}" pattern="#,###" /></td>
						<td style="text-align: right;">${row.REG_DATE}</td>
						<td style="text-align: right;">${row.CONF_DATE}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="btn_wr text-right mt-3"></div>
	<br>
	<div class="table-responsive">
		<table class="table table-bordered nowrap">
			<tr>
				<th scope="row">매점품목 주문현황</th>
				<td style="text-align: right;"><span>주문 총액 :</span><input
					type="text" id="storegrandtotal"
					style="text-align: right; border: none;" readonly></td>
			</tr>
		</table>
	</div>
	<div class="table-responsive">
		<table id="MESS01" class="table table-bordered nowrap">
			<colgroup>
				<col width="10%" />
				<col width="15%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="15%" />
				<col width="15%" />
				<col width="15%" />
			</colgroup>

			<tr>
				<th colspan="5" style="text-align: center;">분류</th>
				<th colspan="5" style="text-align: center;">상세정보</th>
			</tr>
			<tr style="text-align: center;">
				<th>종류</th>
				<th>제품명</th>
				<th>주문호실</th>
				<th>단가</th>
				<th>주문수량</th>
				<th>주문금액</th>
				<th>주문일자</th>
				<th>수령일자</th>
			</tr>
			<tbody>
				<c:forEach var="row" items="${storeordall}">
					<tr>
						<td class="first">${row.CAT_TITLE}</td>
						<td><input type="hidden" class="GID"
							value="${row.STORE_ORD_ID}" />${row.GOODS_TITLE}</td>
						<td>${row.FROOM_TITLE}</td>
						<td style="text-align: right;" class="infoS"><fmt:formatNumber
								value="${row.NET_PRICE}" pattern="#,###" /></td>
						<td style="text-align: right;"><input class="from-control SA"
							oninput="calculateS()" style="border: none; text-align: right;"
							type="number" min="0" max="100" value="${row.ORD_QUTY}" required
							readonly></td>
						<td class="SB" style="text-align: right;"><fmt:formatNumber
								value="${row.ORD_AMOUNT}" pattern="#,###" /></td>
						<td style="text-align: right;">${row.REG_DATE}</td>
						<td>${row.CONF_DATE}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="btn_wr text-right mt-3"></div>
</div>
<script>					
	var i = 1;
	var str = undefined;
	var element = $(".first");
	var firstElement = undefined;
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
	$(firstElement).attr('rowspan', i);

	function calculateM() {
		var $infoarr = $(".infoM");
		var $Aarr = $(".MA");
		var $Barr = $(".MB");
		for (var i = 0; i < $infoarr.length; i++) {
			var t1 = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			$Barr[i].innerText = numberWithCommas(Number($Aarr[i].value)*t1);
		}
		chkcalM();
	}
	
	function chkcalM() {
		var $Barr = $(".MB");
		var chksum = 0;
		for (var i = 0; i < $Barr.length; i++) {
			var b1 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			chksum = chksum + b1;
		}
		$('#messgrandtotal').val(numberWithCommas(chksum));
	}
	
	function calculateS() {
		var $infoarr = $(".infoS");
		var $Aarr = $(".SA");
		var $Barr = $(".SB");
		for (var i = 0; i < $infoarr.length; i++) {
			var t1 = Number($infoarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			$Barr[i].innerText = numberWithCommas(Number($Aarr[i].value) * t1);
		}
		chkcalS();
	}
	
	function chkcalS() {
		var $Barr = $(".SB");
		var chksum = 0;
		for (var i = 0; i < $Barr.length; i++) {
			var b1 = Number($Barr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
			chksum = chksum + b1;
		}
		$('#storegrandtotal').val(numberWithCommas(chksum));
	}
	
	
	$(document).ready(function(){
		calculateM();
		chkcalM();
		calculateS();
		chkcalS();
	})

	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
</script>

