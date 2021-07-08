<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
  .swcCard {
        width: 100%;
        height: 100%;
        padding : 20px;
        background: white;
      }
}
</style>
<div class="card-block table-border-style swcCard">
						<div class="table-responsive">
							<table class="table  table-bordered nowrap">
								<tr>
									<th scope="row">식당품목 주문현황</th>
									<td style="text-align: right;"><span>주문 총액 :</span><input
										type="text" id="messgrandtotal"
										style="text-align: right; border: none;" readonly></td>
								</tr>
							</table>
						</div>
						<div class="table-responsive">
							<table id="MESS01"
								class="table  table-bordered nowrap">
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
									<th colspan="2" style="text-align: center;">분류</th>
									<th colspan="8" style="text-align: center;">상세정보</th>
								</tr>
								<tr style="text-align: center;">
									<th>종류</th>
									<th>제품명</th>
									<th>단위</th>
									<th>단가</th>
									<th>주문수량</th>
									<th>주문금액</th>
									<th>주문일자</th>
									<th>수령확인</th>
								</tr>
								<tbody>
									<c:forEach var="row" items="${restord}">
										<tr>
											<td class="first">${row.CAT_TITLE}</td>
											<td><input type="hidden" class="GID" value="${row.REST_ORD_ID}"/>${row.GOODS_TITLE}</td>
											<td>${row.GOODS_UNIT}</td>
											<td style="text-align: right;" class="infoM"><fmt:formatNumber
													value="${row.NET_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;"><input
												class="from-control MA" oninput="calculateM()"
												style="border: none; text-align: right;" type="number"
												min="0" max="100"
												value="${row.ORD_QUTY}" required readonly></td>
											<td class="MB" style="text-align: right;"><fmt:formatNumber
													value="${row.ORD_AMOUNT}" pattern="#,###" /></td>
											<td style="text-align:right;">${row.REG_DATE} </td>
											<td style="text-align:center;"><button class="btn btn-info" onclick="cfncheckupdR(${row.REST_ORD_ID})">수령확인</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="btn_wr text-right mt-3">
						</div>
<br>
						<div class="table-responsive">
							<table class="table  table-bordered nowrap">
								<tr>
									<th scope="row">매점품목 주문현황</th>
									<td style="text-align: right;"><span>주문 총액 :</span><input
										type="text" id="storegrandtotal"
										style="text-align: right; border: none;" readonly></td>
								</tr>
							</table>
						</div>
						<div class="table-responsive">
							<table id="MESS01"
								class="table  table-bordered nowrap">
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
									<th colspan="2" style="text-align: center;">분류</th>
									<th colspan="8" style="text-align: center;">상세정보</th>
								</tr>
								<tr style="text-align: center;">
									<th>종류</th>
									<th>제품명</th>
									<th>단위</th>
									<th>단가</th>
									<th>주문수량</th>
									<th>주문금액</th>
									<th>주문일자</th>
									<th>수령확인</th>
								</tr>
								<tbody>
									<c:forEach var="row" items="${storeord}">
										<tr>
											<td class="first">${row.CAT_TITLE}</td>
											<td><input type="hidden" class="GID" value="${row.STORE_ORD_ID}"/>${row.GOODS_TITLE}</td>
											<td>${row.GOODS_UNIT}</td>
											<td style="text-align: right;" class="infoS"><fmt:formatNumber
													value="${row.NET_PRICE}" pattern="#,###" /></td>
											<td style="text-align: right;"><input
												class="from-control SA" oninput="calculateS()"
												style="border: none; text-align: right;" type="number"
												min="0" max="100"
												value="${row.ORD_QUTY}" required readonly></td>
											<td class="SB" style="text-align: right;"><fmt:formatNumber
													value="${row.ORD_AMOUNT}" pattern="#,###" /></td>
											<td style="text-align:right;">${row.REG_DATE} </td>
											<td style="text-align:center;"><button class="btn btn-info" onclick="cfncheckupdS(${row.STORE_ORD_ID})">수령확인</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="btn_wr text-right mt-3">
						</div>
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
	
	function cfncheckupdR(data){
		if(confirm("물품 수령을 확정하시겠습니까?")){
			var rData = {};
			rData.REST_ORD_ID = data;
			$.ajax({
				url : "${path}/room/updRord.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data : rData, // HTTP 요청과 함께 서버로 보낼 데이터 
				method : "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType : "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if (data.code == 10001) {
					alert("저장 성공");
					var cid = $("#contid").val();
					var recal = "${path}/room/confirmord/"+ cid;
					fnSetPage(recal);
				} else {
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		}
	}

	function cfncheckupdS(data){
		if(confirm("물품 수령을 확정하시겠습니까?")){
			var rData = {};
			rData.STORE_ORD_ID = data;
			$.ajax({
				url : "${path}/room/updSord.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data : rData, // HTTP 요청과 함께 서버로 보낼 데이터 
				method : "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType : "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if (data.code == 10001) {
					alert("저장 성공");
					var cid = $("#contid").val();
					var recal = "${path}/room/confirmord/"+ cid;
					fnSetPage(recal);
				} else {
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		}
	}

</script>

